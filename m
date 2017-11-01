From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Wed, 1 Nov 2017 16:53:18 -0200
Subject: [Buildroot] [PATCH v2] uboot-tools: bump to version 2017.09
Message-ID: <1509562398-20833-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 'env' target has been renamed to 'envtools' so change it
accordingly.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- Take the 'env' target rename into account

 package/uboot-tools/uboot-tools.hash | 2 +-
 package/uboot-tools/uboot-tools.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
index 3ba8e34..82efc79 100644
--- a/package/uboot-tools/uboot-tools.hash
+++ b/package/uboot-tools/uboot-tools.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  5374bfdc8acb9a38c025371b1ff20f45e7533668e84e685d0df5d9e7c0e4feff  u-boot-2017.07.tar.bz2
+sha256  b2d15f2cf5f72e706025cde73d67247c6da8cd35f7e10891eefe7d9095089744  u-boot-2017.09.tar.bz2
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 4f39f4a..c936575 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2017.07
+UBOOT_TOOLS_VERSION = 2017.09
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPL-2.0+
@@ -35,7 +35,7 @@ define UBOOT_TOOLS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(UBOOT_TOOLS_MAKE_OPTS) \
 		CROSS_BUILD_TOOLS=y tools-only
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(UBOOT_TOOLS_MAKE_OPTS) \
-		env no-dot-config-targets=env
+		envtools no-dot-config-targets=envtools
 endef
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE),y)
-- 
2.7.4
