Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F4CDC433F5
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 17:30:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E34E56103B
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 17:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E34E56103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FD2140153;
	Sat,  6 Nov 2021 17:30:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VMa5W0TkBgn6; Sat,  6 Nov 2021 17:30:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69E5E40182;
	Sat,  6 Nov 2021 17:30:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0BFC21BF391
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 17:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEE0C8254D
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 17:30:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fKA2jRxUe57g for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 17:30:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F9A081C19
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 17:30:25 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4519120007;
 Sat,  6 Nov 2021 17:30:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1mjPWF-0002Pp-Se; Sat, 06 Nov 2021 18:30:19 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 18:29:54 +0100
Message-Id: <20211106172956.9193-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] boot/sun20i-d1-spl: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, samuel@sholland.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U-Boot does not yet have SPL code to initialize the DDR controller on the
Allwinner D1 - So instead package the sun20i-d1-spl bootloader, which is
based on boot0 from the Allwinner BSP with some modifications to build it
separately from the BSP and boot mainline U-Boot as explained on the
linux-sunxi wiki:

https://linux-sunxi.org/Allwinner_Nezha

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Changes since v1:
 - None

DEVELOPERS                            |  1 +
 boot/Config.in                        |  1 +
 boot/sun20i-d1-spl/Config.in          |  8 ++++++++
 boot/sun20i-d1-spl/sun20i-d1-spl.hash |  2 ++
 boot/sun20i-d1-spl/sun20i-d1-spl.mk   | 23 +++++++++++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 boot/sun20i-d1-spl/Config.in
 create mode 100644 boot/sun20i-d1-spl/sun20i-d1-spl.hash
 create mode 100644 boot/sun20i-d1-spl/sun20i-d1-spl.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a2d34fdcc7..19d527b396 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2112,6 +2112,7 @@ F:	board/orangepi/
 F:	board/pandaboard/
 F:	board/roseapplepi/
 F:	boot/shim/
+F:	boot/sun20i-d1-spl/
 F:	configs/avenger96_defconfig
 F:	configs/beagleboneai_defconfig
 F:	configs/lafrite_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index ff98a49796..40472ae07d 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -20,6 +20,7 @@ source "boot/optee-os/Config.in"
 source "boot/opensbi/Config.in"
 source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
+source "boot/sun20i-d1-spl/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
diff --git a/boot/sun20i-d1-spl/Config.in b/boot/sun20i-d1-spl/Config.in
new file mode 100644
index 0000000000..9d94d87b1c
--- /dev/null
+++ b/boot/sun20i-d1-spl/Config.in
@@ -0,0 +1,8 @@
+config BR2_TARGET_SUN20I_D1_SPL
+	bool "sun20-d1-spl"
+	depends on BR2_RISCV_64
+	help
+	  Allwinner D1 boot0 code with modifications to use as U-Boot
+	  SPL.
+
+	  https://github.com/smaeul/sun20i_d1_spl
diff --git a/boot/sun20i-d1-spl/sun20i-d1-spl.hash b/boot/sun20i-d1-spl/sun20i-d1-spl.hash
new file mode 100644
index 0000000000..6ca60e5278
--- /dev/null
+++ b/boot/sun20i-d1-spl/sun20i-d1-spl.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  69063601239a7254fb72e486b138d88a6f2b5c645b24cdfe9792123f975d4a8f  sun20i-d1-spl-771192d0b3737798d7feca87263c8fa74a449787.tar.gz
diff --git a/boot/sun20i-d1-spl/sun20i-d1-spl.mk b/boot/sun20i-d1-spl/sun20i-d1-spl.mk
new file mode 100644
index 0000000000..2462ce2322
--- /dev/null
+++ b/boot/sun20i-d1-spl/sun20i-d1-spl.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# sun20i-d1-spl
+#
+################################################################################
+
+# Commit on the 'mainline' branch
+SUN20I_D1_SPL_VERSION = 771192d0b3737798d7feca87263c8fa74a449787
+SUN20I_D1_SPL_SITE = $(call github,smaeul,sun20i_d1_spl,$(SUN20I_D1_SPL_VERSION))
+SUN20I_D1_SPL_INSTALL_TARGET = NO
+SUN20I_D1_SPL_INSTALL_IMAGES = YES
+SUN20I_D1_SPL_LICENSE = GPL-2.0+
+
+define SUN20I_D1_SPL_BUILD_CMDS
+	$(MAKE) -C $(@D) CROSS_COMPILE="$(TARGET_CROSS)" p=sun20iw1p1 mmc
+endef
+
+define SUN20I_D1_SPL_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/nboot/boot0_sdcard_sun20iw1p1.bin \
+		$(BINARIES_DIR)/boot0_sdcard_sun20iw1p1.bin
+endef
+
+$(eval $(generic-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
