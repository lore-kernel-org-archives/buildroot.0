From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  8 Oct 2015 16:00:59 -0300
Subject: [Buildroot] [PATCH 1/2] collectd: drop rrdtool selects
Message-ID: <1444330860-31735-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop indirect rrdtool selects, they're already selected by rrdtool
itself so there's no need.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/collectd/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 2054978..5cdb24e 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -504,11 +504,7 @@ config BR2_PACKAGE_COLLECTD_NETWORK
 config BR2_PACKAGE_COLLECTD_RRDTOOL
 	bool "rrdtool"
 	depends on BR2_USE_WCHAR # rrdtool
-	select BR2_PACKAGE_FREETYPE
-	select BR2_PACKAGE_LIBART
-	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_RRDTOOL
-	select BR2_PACKAGE_ZLIB
 	help
 	  Writes values to RRD-files.
 
-- 
2.4.9
