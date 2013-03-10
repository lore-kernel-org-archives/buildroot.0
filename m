From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sun, 10 Mar 2013 19:32:46 +0100
Subject: [Buildroot] [PATCH 05/10] Config.in.legacy: adding renamed BR2
	Options
In-Reply-To: <1362940371-25899-1-git-send-email-c.schoenert@gmail.com>
References: <1362940371-25899-1-git-send-email-c.schoenert@gmail.com>
Message-ID: <1362940371-25899-6-git-send-email-c.schoenert@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carsten Schoenert <c.schoenert@gmail.com>

Related to the changed directfb variables for
BR2_PACKAGE_DIRECTFB_DITHER_RGB16 and
BR2_PACKAGE_DIRECTFB_TESTS
adding a legacy check.

Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
---
 Config.in.legacy |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index d90132c..838e7fc 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -40,6 +40,24 @@ comment "As long as these options stay selected, the build   "
 comment "will fail.                                          "
 endif
 
+#
+# Legacy options since 2013.02
+#
+config BR2_PACKAGE_DIRECTB_DITHER_RGB16
+	bool "DirectFB RGB16 dithering option has been renamed"
+	select BR2_PACKAGE_DIRECTFB_DITHER_RGB16
+	select BR2_LEGACY
+	help
+	  The option has been renamed
+	  BR2_PACKAGE_DIRECTFB_DITHER_RGB16.
+
+config BR2_PACKAGE_DIRECTFB_TESTS
+	bool "DirectFB Tests option has been renamed"
+	select BR2_PACKAGE_DIRECTFB_TESTS
+	select BR2_LEGACY
+	help
+	  The option has been renamed
+	  BR2_PACKAGE_DIRECTFB_TESTS.
 
 #
 # Legacy options since 2012.11
-- 
1.7.10.4
