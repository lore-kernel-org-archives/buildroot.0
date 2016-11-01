From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 14:51:15 +0100
Subject: [Buildroot] [git commit] package/uboot: define help commands when
	using Kconfig
Message-ID: <20161101135228.DFBE8817FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e29db7d979b58a72d0d7fc5eefb652abba971da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Expose the Kconfig-related help commands when U-Boot uses the Kconfig
configuration. Like others (like Linux, barebox, busybox), only expose
menuconfig, not all the configurators.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/uboot.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index ae7539d..3e347c1 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -181,6 +181,12 @@ endif # BR2_TARGET_UBOOT_USE_DEFCONFIG
 
 UBOOT_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 UBOOT_KCONFIG_OPTS = $(UBOOT_MAKE_OPTS)
+define UBOOT_HELP_CMDS
+	@echo '  uboot-menuconfig       - Run U-Boot menuconfig'
+	@echo '  uboot-savedefconfig    - Run U-Boot savedefconfig'
+	@echo '  uboot-update-defconfig - Save the U-Boot configuration to the path specified'
+	@echo '                             by BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE'
+endef
 endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
 
 define UBOOT_BUILD_CMDS
