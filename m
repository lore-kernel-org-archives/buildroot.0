Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551C2C3601E
	for <buildroot@archiver.kernel.org>; Sun, 13 Apr 2025 14:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED13181EEA;
	Sun, 13 Apr 2025 14:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ro5ItkRZiG9; Sun, 13 Apr 2025 14:03:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A83681E9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A83681E9E;
	Sun, 13 Apr 2025 14:03:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 648D4DE
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 14:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A78D40588
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 14:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WtGT9KdkIxRI for <buildroot@buildroot.org>;
 Sun, 13 Apr 2025 14:03:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69B0A40420
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69B0A40420
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 14:03:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58151839BC; Sun, 13 Apr 2025 14:03:34 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Apr 2025 15:11:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 637eead755ebb1b89aafd9345f2c6dee8412fb19
X-Git-Newrev: a9fe5ac03c0bd215beb286ceca389a95fb99c6e0
X-Patchwork-Hint: ignore
Message-Id: <20250413140334.58151839BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-ddr-phy-binary: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9fe5ac03c0bd215beb286ceca389a95fb99c6e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The DDR PHY on the NXP LX2160A SoC needs firmware. This is distributed
as prebuilt binaries by NXP through GitHub.

There have been discussions and other opinions on previous revisions of
the patch on how it should be integrated:
https://lore.kernel.org/buildroot/20250318163228.9989-1-vjardin@free.fr/

But I haven't integrated any of that feedback. It is a simple package
which copies the pre-built FIP image containing DDR PHY firmware files
to the images/ folder, to be used by post-image scripts.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                             |  3 +++
 package/Config.in                                      |  1 +
 package/qoriq-ddr-phy-binary/Config.in                 |  6 ++++++
 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash |  3 +++
 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk   | 18 ++++++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0d7841eb94..5ac9a477ec 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3375,6 +3375,9 @@ N:	Vivien Didelot <vivien.didelot@gmail.com>
 F:	board/technologic/ts5500/
 F:	configs/ts5500_defconfig
 
+N:	Vladimir Oltean <olteanv@gmail.com>
+F:	package/qoriq-ddr-phy-binary/
+
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
 F:	package/zbar/
diff --git a/package/Config.in b/package/Config.in
index 291e784f26..46e8a5c8e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -449,6 +449,7 @@ menu "Firmware"
 	source "package/odroidc2-firmware/Config.in"
 	source "package/panel-mipi-dbi-firmware/Config.in"
 	source "package/qcom-db410c-firmware/Config.in"
+	source "package/qoriq-ddr-phy-binary/Config.in"
 	source "package/qoriq-fm-ucode/Config.in"
 	source "package/rcw-smarc-sal28/Config.in"
 	source "package/rpi-firmware/Config.in"
diff --git a/package/qoriq-ddr-phy-binary/Config.in b/package/qoriq-ddr-phy-binary/Config.in
new file mode 100644
index 0000000000..301a2c1974
--- /dev/null
+++ b/package/qoriq-ddr-phy-binary/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_QORIQ_DDR_PHY_BINARY
+	bool "qoriq-ddr-phy-binary"
+	help
+	  Firmware binary for DDR PHY of NXP LX2160A family of SoCs.
+
+	  https://github.com/nxp-qoriq/ddr-phy-binary
diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
new file mode 100644
index 0000000000..7a689d42a5
--- /dev/null
+++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  475bca55d8b05463e75f6d47a8ea7e3def8505a614170b0a3976bd342ca3d759  qoriq-ddr-phy-binary-lf-6.12.3-1.0.0.tar.gz
+sha256  e7e5f4949f7ac9f9a5d4d68b8f835f3ddc93ad47b594a11de699d90b9175413f  NXP-Binary-EULA.txt
diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
new file mode 100644
index 0000000000..5ce990b75b
--- /dev/null
+++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# qoriq-ddr-phy-binary
+#
+################################################################################
+
+QORIQ_DDR_PHY_BINARY_VERSION = lf-6.12.3-1.0.0
+QORIQ_DDR_PHY_BINARY_SITE = $(call github,nxp-qoriq,ddr-phy-binary,$(QORIQ_DDR_PHY_BINARY_VERSION))
+QORIQ_DDR_PHY_BINARY_LICENSE = NXP Binary EULA
+QORIQ_DDR_PHY_BINARY_LICENSE_FILES = NXP-Binary-EULA.txt
+QORIQ_DDR_PHY_BINARY_INSTALL_IMAGES = YES
+QORIQ_DDR_PHY_BINARY_INSTALL_TARGET = NO
+
+define QORIQ_DDR_PHY_BINARY_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D $(@D)/lx2160a/fip_ddr.bin $(BINARIES_DIR)/fip_ddr.bin
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
