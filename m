From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 May 2016 15:58:06 +0200
Subject: [Buildroot] [git commit] uboot-tools: install libubootenv to staging
Message-ID: <20160507071254.09D8C817FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e0ea8cf5e2c57d6b3db0b6a3b36a324d678d7f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libubootenv is required by swupdate.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
[Thomas: do the installation directly in <pkg>_INSTALL_STAGING_CMDS.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uboot-tools/uboot-tools.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index f47b3db..d1ebd6f 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -9,6 +9,7 @@ UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
 UBOOT_TOOLS_LICENSE_FILES = Licenses/gpl-2.0.txt
+UBOOT_TOOLS_INSTALL_STAGING = YES
 
 define UBOOT_TOOLS_CONFIGURE_CMDS
 	mkdir -p $(@D)/include/config
@@ -58,6 +59,14 @@ define UBOOT_TOOLS_INSTALL_DUMPIMAGE
 endef
 endif
 
+define UBOOT_TOOLS_INSTALL_LIBUBOOTENV
+endef
+
+define UBOOT_TOOLS_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/tools/env/lib.a $(STAGING_DIR)/usr/lib/libubootenv.a
+	$(INSTALL) -D -m 0644 $(@D)/tools/env/fw_env.h $(STAGING_DIR)/usr/include/fw_env.h
+endef
+
 define UBOOT_TOOLS_INSTALL_TARGET_CMDS
 	$(UBOOT_TOOLS_INSTALL_MKIMAGE)
 	$(UBOOT_TOOLS_INSTALL_MKENVIMAGE)
