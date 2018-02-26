From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Feb 2018 20:54:00 +0100
Subject: [Buildroot] [git commit branch/next] scanpypi: fix Py2/3 conversion
 leftover
Message-ID: <20180226195533.8899A882BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cfafcfa9af4ee04c563d3c682d2001a8516a866c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Use urlparse from six package.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/scanpypi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 12bfc24e10..1720c0c051 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -188,7 +188,7 @@ class BuildrootPackage():
                 'md5_digest': None}]
             # In this case, we can't get the name of the downloaded file
             # from the pypi api, so we need to find it, this should work
-            urlpath = urllib2.urlparse.urlparse(
+            urlpath = six.moves.urllib.parse.urlparse(
                 self.metadata['info']['download_url']).path
             # urlparse().path give something like
             # /path/to/file-version.tar.gz
