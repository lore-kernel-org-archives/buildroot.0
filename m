From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 20:53:33 +0100
Subject: [Buildroot] [git commit] utils/scanpypi: update hash file
 indentation formatting
Message-ID: <20200309140905.911287F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9fbbf4fd2a26c839863acc10aee7622821ed0ad9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new .hash convention is to use 2 spaces between fields.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scanpypi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 387755bbb8..212dbea85e 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -568,12 +568,12 @@ class BuildrootPackage():
             hash_header = '# md5, sha256 from {url}\n'.format(
                 url=self.metadata_url)
             lines.append(hash_header)
-            hash_line = '{method}\t{digest}  {filename}\n'.format(
+            hash_line = '{method}  {digest}  {filename}\n'.format(
                 method='md5',
                 digest=self.used_url['digests']['md5'],
                 filename=self.filename)
             lines.append(hash_line)
-            hash_line = '{method}\t{digest}  {filename}\n'.format(
+            hash_line = '{method}  {digest}  {filename}\n'.format(
                 method='sha256',
                 digest=self.used_url['digests']['sha256'],
                 filename=self.filename)
@@ -589,7 +589,7 @@ class BuildrootPackage():
                     if not data:
                         break
                     sha256.update(data)
-            hash_line = '{method}\t{digest}  {filename}\n'.format(
+            hash_line = '{method}  {digest}  {filename}\n'.format(
                 method='sha256',
                 digest=sha256.hexdigest(),
                 filename=license_file.replace(self.tmp_extract, '')[1:])
