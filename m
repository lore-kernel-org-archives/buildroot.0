From: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
Date: Fri, 10 May 2013 10:30:12 +0200
Subject: [Buildroot] [PATCH 2/3] Move and refactor package imx-lib to the
	freescale-imx directory
In-Reply-To: <1368174613-3427-1-git-send-email-h.fijnvandraat@inter.nl.net>
References: <1368174613-3427-1-git-send-email-h.fijnvandraat@inter.nl.net>
Message-ID: <1368174613-3427-3-git-send-email-h.fijnvandraat@inter.nl.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When moved, the version and download site are set to those specified in the
freescale-imx.mk file.
This means that the version is bumped from 12.09.01 to 1.1.0

Signed-off-by: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
---
 package/Config.in                              |    1 -
 package/freescale-imx/Config.in                |    1 +
 package/{ => freescale-imx}/imx-lib/Config.in  |    0
 package/{ => freescale-imx}/imx-lib/imx-lib.mk |    5 ++---
 4 files changed, 3 insertions(+), 4 deletions(-)
 rename package/{ => freescale-imx}/imx-lib/Config.in (100%)
 rename package/{ => freescale-imx}/imx-lib/imx-lib.mk (86%)

diff --git a/package/Config.in b/package/Config.in
index 368be44..da422fb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -460,7 +460,6 @@ endmenu
 
 menu "Hardware handling"
 source "package/ccid/Config.in"
-source "package/imx-lib/Config.in"
 source "package/lcdapi/Config.in"
 source "package/libaio/Config.in"
 source "package/libatasmart/Config.in"
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 4f09ec7..a391014 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -11,4 +11,5 @@ menuconfig BR2_PACKAGE_IMX
 
 
 if BR2_PACKAGE_IMX
+source "package/imx-lib/Config.in"
 endif
diff --git a/package/imx-lib/Config.in b/package/freescale-imx/imx-lib/Config.in
similarity index 100%
rename from package/imx-lib/Config.in
rename to package/freescale-imx/imx-lib/Config.in
diff --git a/package/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
similarity index 86%
rename from package/imx-lib/imx-lib.mk
rename to package/freescale-imx/imx-lib/imx-lib.mk
index c168c80..f87ef0d 100644
--- a/package/imx-lib/imx-lib.mk
+++ b/package/freescale-imx/imx-lib/imx-lib.mk
@@ -4,9 +4,8 @@
 #
 #############################################################
 
-IMX_LIB_VERSION = 12.09.01
-# No official download site from freescale, just this mirror
-IMX_LIB_SITE    = http://download.ossystems.com.br/bsp/freescale/source
+FIRMWARE_IMX_VERSION = $(IMX_VERSION_LEVEL)
+FIRMWARE_IMX_SITE    = $(IMX_MIRROR_SITE)
 IMX_LIB_LICENSE = LGPLv2.1+
 # No license file included
 
-- 
1.7.10.4
