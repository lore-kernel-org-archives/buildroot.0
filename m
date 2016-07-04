From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon,  4 Jul 2016 16:24:03 +0200
Subject: [Buildroot] [PATCH] scanpypi: change hash file comments
Message-ID: <1467642243-23832-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

sha256 checksum will be computed locally either by scanpypi at package
creation or by hand by package updates. Define this checksum as
'computed locally' so that one doesn't need to change this comment by
package updates. Also put comments for both md5 and sha256 in one line.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 support/scripts/scanpypi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/support/scripts/scanpypi b/support/scripts/scanpypi
index f0d584a..7546cf1 100755
--- a/support/scripts/scanpypi
+++ b/support/scripts/scanpypi
@@ -482,15 +482,14 @@ class BuildrootPackage():
         print('Creating {filename}...'.format(filename=path_to_hash))
         lines = []
         if self.used_url['md5_digest']:
-            md5_comment = '# md5 from {url}\n'.format(url=self.metadata_url)
+            md5_comment = '# md5 from {url}, sha256 locally computed\n'.format(
+		url=self.metadata_url)
             lines.append(md5_comment)
             hash_line = '{method}\t{digest}  {filename}\n'.format(
                 method='md5',
                 digest=self.used_url['md5_digest'],
                 filename=self.filename)
             lines.append(hash_line)
-        sha256_comment = '# sha256 calculated by scanpypi\n'
-        lines.append(sha256_comment)
         digest = hashlib.sha256(self.as_string).hexdigest()
         hash_line = '{method}\t{digest}  {filename}\n'.format(
             method='sha256',
-- 
2.8.1
