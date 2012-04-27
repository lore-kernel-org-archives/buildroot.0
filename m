From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 27 Apr 2012 12:05:08 -0300
Subject: [Buildroot] [PATCH 1/2] uboot-tools: bump to version 2012.04.01
Message-ID: <1335539109-6447-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../uboot-tools-2011.03-drop-configh.patch         |   27 --------------------
 ...tools-2012.04.01-hostcflags-override-fix.patch} |    0
 package/uboot-tools/uboot-tools.mk                 |    2 +-
 3 files changed, 1 insertions(+), 28 deletions(-)
 delete mode 100644 package/uboot-tools/uboot-tools-2011.03-drop-configh.patch
 rename package/uboot-tools/{uboot-tools-2011.03-hostcflags-override-fix.patch => uboot-tools-2012.04.01-hostcflags-override-fix.patch} (100%)

diff --git a/package/uboot-tools/uboot-tools-2011.03-drop-configh.patch b/package/uboot-tools/uboot-tools-2011.03-drop-configh.patch
deleted file mode 100644
index bf524c9..0000000
--- a/package/uboot-tools/uboot-tools-2011.03-drop-configh.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-"make tools-all" should allow building tools such as mkimage and the new
-imximage without any config, but imximage.c currently fails to build
-with:
-imximage.h:27:20: error: config.h: No such file or directory
-
-config.h is not needed in imximage.h nor in imximage.c, and imximage.h
-is only included from imximage.c, so drop this include to fix the build.
-
-Signed-off-by: Lo?c Minier <loic.minier@linaro.org>
----
- tools/imximage.h |    2 --
- 1 files changed, 0 insertions(+), 2 deletions(-)
-
-diff --git a/tools/imximage.h b/tools/imximage.h
-index 38ca6be..d126a46 100644
---- a/tools/imximage.h
-+++ b/tools/imximage.h
-@@ -24,8 +24,6 @@
- #ifndef _IMXIMAGE_H_
- #define _IMXIMAGE_H_
- 
--#include <config.h>
--
- #define MAX_HW_CFG_SIZE_V2 121 /* Max number of registers imx can set for v2 */
- #define MAX_HW_CFG_SIZE_V1 60  /* Max number of registers imx can set for v1 */
- #define APP_CODE_BARKER	0xB1
--- 1.7.2.3
diff --git a/package/uboot-tools/uboot-tools-2011.03-hostcflags-override-fix.patch b/package/uboot-tools/uboot-tools-2012.04.01-hostcflags-override-fix.patch
similarity index 100%
rename from package/uboot-tools/uboot-tools-2011.03-hostcflags-override-fix.patch
rename to package/uboot-tools/uboot-tools-2012.04.01-hostcflags-override-fix.patch
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 00592d6..d757ade 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -1,4 +1,4 @@
-UBOOT_TOOLS_VERSION = 2011.03
+UBOOT_TOOLS_VERSION = 2012.04.01
 UBOOT_TOOLS_SOURCE  = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
 
-- 
1.7.3.4
