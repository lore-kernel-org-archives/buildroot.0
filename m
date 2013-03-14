From: Carlo Caione <carlo.caione@gmail.com>
Date: Thu, 14 Mar 2013 20:31:37 +0100
Subject: [Buildroot] [PATCH 2/3] sunxi-boards: new package
In-Reply-To: <1363289498-20993-1-git-send-email-carlo.caione@gmail.com>
References: <1363289498-20993-1-git-send-email-carlo.caione@gmail.com>
Message-ID: <1363289498-20993-2-git-send-email-carlo.caione@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sunxi-boards requires a compiled .fex files for hardware description, used by
kernel during boot for hardware initialization.

Signed-off-by: Carlo Caione <carlo.caione@gmail.com>
---
 package/Config.in                    |   1 +
 package/sunxi-boards/Config.in       | 170 +++++++++++++++++++++++++++++++++++
 package/sunxi-boards/sunxi-boards.mk |  17 ++++
 3 files changed, 188 insertions(+)
 create mode 100644 package/sunxi-boards/Config.in
 create mode 100644 package/sunxi-boards/sunxi-boards.mk

diff --git a/package/Config.in b/package/Config.in
index 4bb8c77..72db358 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -214,6 +214,7 @@ source "package/b43-firmware/Config.in"
 source "package/firmware-imx/Config.in"
 source "package/linux-firmware/Config.in"
 source "package/rpi-firmware/Config.in"
+source "package/sunxi-boards/Config.in"
 source "package/ux500-firmware/Config.in"
 source "package/zd1211-firmware/Config.in"
 endmenu
diff --git a/package/sunxi-boards/Config.in b/package/sunxi-boards/Config.in
new file mode 100644
index 0000000..7d5db53
--- /dev/null
+++ b/package/sunxi-boards/Config.in
@@ -0,0 +1,170 @@
+config BR2_PACKAGE_SUNXI_BOARDS
+	bool "sunxi script.bin board file"
+	select BR2_PACKAGE_HOST_SUNXI_TOOLS
+	help
+	  Compiled '.fex' file used by the sun4i kernel
+
+	  https://github.com/linux-sunxi/sunxi-boards
+
+choice
+	prompt "sunxi board"
+	default BR2_PACKAGE_SUNXI_BOARDS_CUBIEBOARD
+	depends on BR2_PACKAGE_SUNXI_BOARDS
+	help
+	  Select the sunxi board
+
+config BR2_PACKAGE_SUNXI_BOARDS_CUBIEBOARD
+	bool "Cubieboard"
+	help
+	  Cubieboard
+
+config BR2_PACKAGE_SUNXI_BOARDS_A10_MID_1GB
+	bool "A10_mid_1GB"
+	help
+	  A10_mid_1GB
+
+config BR2_PACKAGE_SUNXI_BOARDS_BA10_TV_BOX
+	bool "A10_tv_box"
+	help
+	  A10_tv_box
+
+config BR2_PACKAGE_SUNXI_BOARDS_COBY_MID7042
+	bool "coby_mid7042"
+	help
+	  coby_mid7042
+
+config BR2_PACKAGE_SUNXI_BOARDS_COBY_MID8042
+	bool "coby_mid8042"
+	help
+	  coby_mid8042
+
+config BR2_PACKAGE_SUNXI_BOARDS_COBY_MID9742
+	bool "coby_mid9742"
+	help
+	  coby_mid9742
+
+config BR2_PACKAGE_SUNXI_BOARDS_CUBIEBOARD_512
+	bool "Cubieboard_512"
+	help
+	  Cubieboard_512
+
+config BR2_PACKAGE_SUNXI_BOARDS_GOOSEBERRY_A721
+	bool "Gooseberry_a721"
+	help
+	  Gooseberry_a721
+
+config BR2_PACKAGE_SUNXI_BOARDS_H6
+	bool "h6"
+	help
+	  h6
+
+config BR2_PACKAGE_SUNXI_BOARDS_HACKBERRY
+	bool "Hackberry"
+	help
+	  Hackberry
+
+config BR2_PACKAGE_SUNXI_BOARDS_HYUNDAI_A7HD
+	bool "hyundai_a7hd"
+	help
+	  hyundai_a7hd
+
+config BR2_PACKAGE_SUNXI_BOARDS_INET97F_II
+	bool "inet97f-ii"
+	help
+	  inet97f-ii
+
+config BR2_PACKAGE_SUNXI_BOARDS_MELE_A1000
+	bool "mele_a1000"
+	help
+	  mele_a1000
+
+config BR2_PACKAGE_SUNXI_BOARDS_MELE_A1000G
+	bool "mele_a1000G"
+	help
+	  mele_a1000g
+
+config BR2_PACKAGE_SUNXI_BOARDS_MINI_X_1GB
+	bool "mini-x-1gb"
+	help
+	  mini-x-1gb
+
+config BR2_PACKAGE_SUNXI_BOARDS_MINI_X
+	bool "mini-x"
+	help
+	  mini-x
+
+config BR2_PACKAGE_SUNXI_BOARDS_MK802_1GB
+	bool "mk802-1gb"
+	help
+	  mk802-1gb
+
+config BR2_PACKAGE_SUNXI_BOARDS_MK802
+	bool "mk802"
+	help
+	  mk802
+
+config BR2_PACKAGE_SUNXI_BOARDS_MK802II
+	bool "mk802ii"
+	help
+	  mk802ii
+
+config BR2_PACKAGE_SUNXI_BOARDS_POV_PROTAB2_IPS_3G
+	bool "pov_protab2_ips_3g"
+	help
+	  pov_protab2_ips_3g
+
+config BR2_PACKAGE_SUNXI_BOARDS_POV_PROTAB2_IPS9
+	bool "pov_protab2_ips9"
+	help
+	  pov_protab2_ips9
+
+config BR2_PACKAGE_SUNXI_BOARDS_UHOST_U1A
+	bool "uhost_u1a"
+	help
+	  uhost_u1a
+
+config BR2_PACKAGE_SUNXI_BOARDS_ZATAB
+	bool "zatab"
+	help
+	  zatab
+
+endchoice
+
+config BR2_PACKAGE_SUNXI_BOARDS_FILE
+	string
+	default "cubieboard"		if BR2_PACKAGE_SUNXI_BOARDS_CUBIEBOARD
+	default "a10_mid_1gb"		if BR2_PACKAGE_SUNXI_BOARDS_A10_MID_1GB
+	default "ba10_tv_box"		if BR2_PACKAGE_SUNXI_BOARDS_BA10_TV_BOX
+	default "coby_mid7042"		if BR2_PACKAGE_SUNXI_BOARDS_COBY_MID7042
+	default "coby_mid8042"		if BR2_PACKAGE_SUNXI_BOARDS_COBY_MID8042
+	default "coby_mid9742"		if BR2_PACKAGE_SUNXI_BOARDS_COBY_MID9742
+	default "cubieboard_512"	if BR2_PACKAGE_SUNXI_BOARDS_CUBIEBOARD_512
+	default "gooseberry_a721"	if BR2_PACKAGE_SUNXI_BOARDS_GOOSEBERRY_A721
+	default "h6"			if BR2_PACKAGE_SUNXI_BOARDS_H6
+	default "hackberry"		if BR2_PACKAGE_SUNXI_BOARDS_HACKBERRY
+	default "hyundai_a7hd"		if BR2_PACKAGE_SUNXI_BOARDS_HYUNDAI_A7HD
+	default "inet97f-ii"		if BR2_PACKAGE_SUNXI_BOARDS_INET97F_II
+	default "mele_a1000"		if BR2_PACKAGE_SUNXI_BOARDS_MELE_A1000
+	default "mele_a1000g"		if BR2_PACKAGE_SUNXI_BOARDS_MELE_A1000G
+	default "mini-x-1gb"		if BR2_PACKAGE_SUNXI_BOARDS_MINI_X_1GB
+	default "mini-x"		if BR2_PACKAGE_SUNXI_BOARDS_MINI_X
+	default "mk802-1gb"		if BR2_PACKAGE_SUNXI_BOARDS_MK802_1GB
+	default "mk802"			if BR2_PACKAGE_SUNXI_BOARDS_MK802
+	default "mk802ii"		if BR2_PACKAGE_SUNXI_BOARDS_MK802II
+	default "pov_protab2_ips_3g"	if BR2_PACKAGE_SUNXI_BOARDS_POV_PROTAB2_IPS_3g
+	default "pov_protab2_ips9"	if BR2_PACKAGE_SUNXI_BOARDS_POV_PROTAB2_IPS9
+	default "uhost_u1a"		if BR2_PACKAGE_SUNXI_BOARDS_UHOST_U1A
+	default "zatab"			if BR2_PACKAGE_SUNXI_BOARDS_ZATAB
+
+
+
+
+
+
+
+
+
+	
+
+
+
diff --git a/package/sunxi-boards/sunxi-boards.mk b/package/sunxi-boards/sunxi-boards.mk
new file mode 100644
index 0000000..dbbc063
--- /dev/null
+++ b/package/sunxi-boards/sunxi-boards.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# sunxi-boards
+#
+#############################################################
+
+SUNXI_BOARDS_VERSION = 88d663db44f65b73ef65c4148a28c6fa3665d2b6
+SUNXI_BOARDS_SITE = https://github.com/linux-sunxi/sunxi-boards/tarball/master
+SUNXI_BOARDS_DEPENDENCIES = host-sunxi-tools
+
+FEX2BIN = $(HOST_DIR)/usr/bin/fex2bin
+
+define SUNXI_BOARDS_INSTALL_TARGET_CMDS
+	$(FEX2BIN) $(@D)/sys_config/a10/$(BR2_PACKAGE_SUNXI_BOARDS_FILE).fex $(BINARIES_DIR)/script.bin
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.5
