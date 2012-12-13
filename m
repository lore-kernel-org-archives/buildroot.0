From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 12 Dec 2012 21:37:35 -0500
Subject: [Buildroot] [PATCH] uboot-tools: do not override busybox uninstall
	commands
Message-ID: <1355366255-7358-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The uboot-tools.mk has a copy of BUSYBOX_UNINSTALL_TARGET_CMDS
in it, presumably due to a copy/paste error.  This definition
is overriding the (identical) definition in busybox.mk.

Also, add license info.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/uboot-tools/uboot-tools.mk |   12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 7628b77..75cda8e 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -1,6 +1,13 @@
+#############################################################
+#
+# uboot-tools
+#
+#############################################################
 UBOOT_TOOLS_VERSION = 2012.07
 UBOOT_TOOLS_SOURCE  = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
+UBOOT_TOOLS_LICENSE = GPLv2+
+UBOOT_TOOLS_LICENSE_FILES = COPYING
 
 define UBOOT_TOOLS_BUILD_CMDS
 	$(MAKE) -C $(@D) 			\
@@ -34,11 +41,6 @@ define UBOOT_TOOLS_UNINSTALL_TARGET_CMDS
 		usr/bin/mkimage usr/sbin/fw_printenv usr/sbin/fw_setenv)
 endef
 
-
-define BUSYBOX_UNINSTALL_TARGET_CMDS
-	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) uninstall
-endef
-
 define HOST_UBOOT_TOOLS_BUILD_CMDS
 	$(MAKE1) -C $(@D) 			\
 		HOSTCC="$(HOSTCC)"		\
-- 
1.7.9.5
