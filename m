Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B512C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C858B504A1;
	Fri, 28 Feb 2025 17:02:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GPXN1t8HYzw8; Fri, 28 Feb 2025 17:02:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 449A6504D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 449A6504D9;
	Fri, 28 Feb 2025 17:02:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 090841DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC967424BB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yfVe2w3MzkCN for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22CB2424C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22CB2424C0
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 116747F87E; Fri, 28 Feb 2025 16:30:18 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Jan 2025 12:23:17 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 92945909f10175000c4e4f8d1425cb823cdf6336
X-Git-Newrev: 52521e4ec463e72df8786c9f0ee42eb961b03d4f
X-Patchwork-Hint: ignore
Message-Id: <20250228163018.116747F87E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/panel-mipi-dbi-firmware: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=52521e4ec463e72df8786c9f0ee42eb961b03d4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This package supports building and installing initialization command
firmware files for use with the panel-mipi-dbi DRM driver. To use the
package, initialization commands for the specific display(s) must be
provided in text form.

See:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/tiny/Kconfig?id=7004a2e46d1693848370809aa3d9c340a209edbb#n70
https://github.com/notro/panel-mipi-dbi/wiki

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/panel-mipi-dbi-firmware/Config.in          | 29 ++++++++++++++++++
 .../panel-mipi-dbi-firmware.hash                   |  3 ++
 .../panel-mipi-dbi-firmware.mk                     | 35 ++++++++++++++++++++++
 5 files changed, 69 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bb8866e8c5..5ca66b2f28 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1091,6 +1091,7 @@ F:	package/python-pymodbus/
 
 N:	Fiona Klute <fiona.klute@gmx.de>
 F:	package/*/S*
+F:	package/panel-mipi-dbi-firmware/
 F:	package/python-aiomqtt/
 F:	package/python-dunamai/
 F:	package/python-poetry-dynamic-versioning/
diff --git a/package/Config.in b/package/Config.in
index 400183516e..3f4dd42cbe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -449,6 +449,7 @@ menu "Firmware"
 	source "package/linux-firmware/Config.in"
 	source "package/murata-cyw-fw/Config.in"
 	source "package/odroidc2-firmware/Config.in"
+	source "package/panel-mipi-dbi-firmware/Config.in"
 	source "package/qcom-db410c-firmware/Config.in"
 	source "package/qoriq-fm-ucode/Config.in"
 	source "package/rcw-smarc-sal28/Config.in"
diff --git a/package/panel-mipi-dbi-firmware/Config.in b/package/panel-mipi-dbi-firmware/Config.in
new file mode 100644
index 0000000000..08ed51f594
--- /dev/null
+++ b/package/panel-mipi-dbi-firmware/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_PANEL_MIPI_DBI_FIRMWARE
+	bool "panel-mipi-dbi firmware"
+	help
+	  Build and install firmware files for the panel-mipi-dbi DRM
+	  driver. The driver requires firmware file(s) to provide
+	  initialization commands for the specific display(s) in
+	  use. The initialization commands are written in text form
+	  and converted to the binary format during the build.
+
+	  If you select this package you will be prompted for the
+	  initialization command file(s) to build firmware from.
+
+	  https://github.com/notro/panel-mipi-dbi
+
+if BR2_PACKAGE_PANEL_MIPI_DBI_FIRMWARE
+
+config BR2_PACKAGE_PANEL_MIPI_DBI_FIRMWARE_SOURCE
+	string "Source files for panel-mipi-dbi firmware"
+	default ""
+	help
+	  Space separated list of initialization command files for
+	  displays used with the panel-mipi-dbi driver. The files will
+	  be converted to binary format and installed to /lib/firmware
+	  in the rootfs. The binary files will use the basenames of
+	  the input files, plus a .bin ending. The basename of each
+	  file must match the first element of the "compatible" device
+	  tree property of the display the file is for.
+
+endif # BR2_PACKAGE_PANEL_MIPI_DBI_FIRMWARE
diff --git a/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.hash b/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.hash
new file mode 100644
index 0000000000..cb06ae66ee
--- /dev/null
+++ b/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  6d57b140dca0241079b186027e72a9168843bd1b6427536dcd422b7a9b6dc53f  panel-mipi-dbi-firmware-1cbd40135a8c7f25d7b444a7fac77fd3c3ad471e-git4.tar.gz
+sha256  e3f98ddc0b15dae65c5661d6c8403a007f30e2f04bcb6170526da609e3fcfd05  mipi-dbi-cmd
diff --git a/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.mk b/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.mk
new file mode 100644
index 0000000000..c3a9fa7afc
--- /dev/null
+++ b/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# panel-mipi-dbi-firmware
+#
+################################################################################
+
+PANEL_MIPI_DBI_FIRMWARE_VERSION = 1cbd40135a8c7f25d7b444a7fac77fd3c3ad471e
+PANEL_MIPI_DBI_FIRMWARE_SITE = https://github.com/notro/panel-mipi-dbi.git
+PANEL_MIPI_DBI_FIRMWARE_SITE_METHOD = git
+PANEL_MIPI_DBI_FIRMWARE_LICENSE = CC0-1.0
+# license info is directly in the only source file
+PANEL_MIPI_DBI_FIRMWARE_LICENSE_FILES = mipi-dbi-cmd
+
+PANEL_MIPI_DBI_FIRMWARE_DEPENDENCIES = host-python3
+
+BR2_PACKAGE_PANEL_MIPI_DBI_FIRMWARE_BIN = $(addsuffix .bin,$(basename $(notdir $(shell echo $(BR2_PACKAGE_PANEL_MIPI_DBI_FIRMWARE_SOURCE)))))
+
+define PANEL_MIPI_DBI_FIRMWARE_BUILD_CMDS
+	for source in $(shell echo $(BR2_PACKAGE_PANEL_MIPI_DBI_FIRMWARE_SOURCE)) ; do \
+		$(HOST_DIR)/bin/python $(@D)/mipi-dbi-cmd "$(@D)/$$(basename $${source%.*}).bin" "$${source}" ; \
+	done
+endef
+
+define PANEL_MIPI_DBI_FIRMWARE_INSTALL_TARGET_CMDS
+	for bin in $(shell echo $(BR2_PACKAGE_PANEL_MIPI_DBI_FIRMWARE_BIN)); do \
+		$(INSTALL) -m 0644 -D "$(@D)/$${bin}" "$(TARGET_DIR)/lib/firmware/$${bin}" ; \
+	done
+endef
+
+# installing firmware requires source, give a clear error message if missing
+ifeq ($(BR2_PACKAGE_PANEL_MIPI_DBI_FIRMWARE)$(call qstrip,$(BR2_PACKAGE_PANEL_MIPI_DBI_FIRMWARE_SOURCE)),y)
+$(error No panel-mipi-dbi firmware source selected, check your BR2_PACKAGE_PANEL_MIPI_DBI_FIRMWARE_SOURCE setting)
+endif
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
