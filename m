From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 26 Feb 2018 14:01:17 +0100
Subject: [Buildroot] [PATCH 1/2] scanpypi: fix Py2/3 conversion leftover
Message-ID: <20180226130118.3621-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Use urlparse from six package.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
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
-- 
2.11.0
