From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 May 2013 15:27:11 +0200
Subject: [Buildroot] [git commit branch/next] imx-lib: move to the
	freescale-imx directory
Message-ID: <20130529141135.B27F89A622@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d0fb7b8f817dc35359de011e72b8236ff349494a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit moves the imx-lib package to the newly introduced
freescale-imx/ directory, and uses the new variables provided by
freescale-imx/freescale-imx.mk.

Signed-off-by: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                              |    1 -
 package/freescale-imx/Config.in                |    2 ++
 package/{ => freescale-imx}/imx-lib/Config.in  |    0
 package/{ => freescale-imx}/imx-lib/imx-lib.mk |    5 ++---
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index dee1180..6e7335b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -465,7 +465,6 @@ endmenu
 menu "Hardware handling"
 source "package/ccid/Config.in"
 source "package/dtc/Config.in"
-source "package/imx-lib/Config.in"
 source "package/lcdapi/Config.in"
 source "package/libaio/Config.in"
 source "package/libatasmart/Config.in"
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 389bcc6..edc9ab5 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -1,4 +1,6 @@
 menu "Freescale i.MX libraries"
 	depends on BR2_arm
 
+source "package/freescale-imx/imx-lib/Config.in"
+
 endmenu
diff --git a/package/imx-lib/Config.in b/package/freescale-imx/imx-lib/Config.in
similarity index 100%
rename from package/imx-lib/Config.in
rename to package/freescale-imx/imx-lib/Config.in
diff --git a/package/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
similarity index 86%
rename from package/imx-lib/imx-lib.mk
rename to package/freescale-imx/imx-lib/imx-lib.mk
index c168c80..67e8db3 100644
--- a/package/imx-lib/imx-lib.mk
+++ b/package/freescale-imx/imx-lib/imx-lib.mk
@@ -4,9 +4,8 @@
 #
 #############################################################
 
-IMX_LIB_VERSION = 12.09.01
-# No official download site from freescale, just this mirror
-IMX_LIB_SITE    = http://download.ossystems.com.br/bsp/freescale/source
+IMX_LIB_VERSION = $(FREESCALE_IMX_VERSION)
+IMX_LIB_SITE    = $(FREESCALE_IMX_MIRROR_SITE)
 IMX_LIB_LICENSE = LGPLv2.1+
 # No license file included
 
