From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 15:50:27 +0200
Subject: [Buildroot] [git commit] boot/uboot: don't specify .config to munge
Message-ID: <20200501133530.9870690D04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1dff5aa64d4f2558cf2c778bf3fc7e1056cebad4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/uboot.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 2bfa50779b..7bd9cbae52 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -347,8 +347,7 @@ UBOOT_ZYNQMP_PMUFW_PATH = $(shell readlink -f $(UBOOT_ZYNQMP_PMUFW))
 endif
 
 define UBOOT_ZYNQMP_KCONFIG_PMUFW
-	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_PATH)", \
-	       $(@D)/.config)
+	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_PATH)")
 endef
 
 UBOOT_ZYNQMP_PSU_INIT = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE))
@@ -356,8 +355,7 @@ UBOOT_ZYNQMP_PSU_INIT_PATH = $(shell readlink -f $(UBOOT_ZYNQMP_PSU_INIT))
 
 ifneq ($(UBOOT_ZYNQMP_PSU_INIT),)
 define UBOOT_ZYNQMP_KCONFIG_PSU_INIT
-	$(call KCONFIG_SET_OPT,CONFIG_XILINX_PS_INIT_FILE,"$(UBOOT_ZYNQMP_PSU_INIT_PATH)", \
-		$(@D)/.config)
+	$(call KCONFIG_SET_OPT,CONFIG_XILINX_PS_INIT_FILE,"$(UBOOT_ZYNQMP_PSU_INIT_PATH)")
 endef
 endif
 
