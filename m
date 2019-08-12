From: Victor Huesca <victor.huesca@bootlin.com>
Date: Mon, 12 Aug 2019 16:43:45 +0200
Subject: [Buildroot] [PATCH buildroot-test 2/2] web/index.php: reword the
 'format_duration' function
In-Reply-To: <20190812144345.26794-1-victor.huesca@bootlin.com>
References: <20190812144345.26794-1-victor.huesca@bootlin.com>
Message-ID: <20190812144345.26794-3-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The format_duration manually compute everything when it could just use
the build-in date format function and trim the beginning for the same
result.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 web/index.php | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/web/index.php b/web/index.php
index f3af62d..939cac5 100644
--- a/web/index.php
+++ b/web/index.php
@@ -1,26 +1,8 @@
 <?php
 include("funcs.inc.php");
 
-function format_duration($seconds_count)
-{
-        $delimiter  = ':';
-        $seconds = $seconds_count % 60;
-        $minutes = floor($seconds_count/60) % 60;
-        $hours   = floor($seconds_count/3600);
-
-        $seconds = str_pad($seconds, 2, "0", STR_PAD_LEFT);
-        $minutes = str_pad($minutes, 2, "0", STR_PAD_LEFT).$delimiter;
-
-        if($hours > 0)
-        {
-		$hours = str_pad($hours, 2, "0", STR_PAD_LEFT).$delimiter;
-        }
-        else
-        {
-		$hours = '';
-        }
-
-        return "$hours$minutes$seconds";
+function format_duration($seconds_count) {
+  return ltrim(gmdate('H:i:s', $seconds_count), '0:');
 }
 
 function format_url_args($args)
-- 
2.21.0
