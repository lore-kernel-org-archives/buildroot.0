Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A2FC25B78
	for <buildroot@archiver.kernel.org>; Mon, 20 May 2024 11:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A211411A1;
	Mon, 20 May 2024 11:17:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jaoCjrELDQCC; Mon, 20 May 2024 11:17:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9DA44114F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9DA44114F;
	Mon, 20 May 2024 11:17:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03FAD1BF41B
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 11:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3FC881F50
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 11:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QT-B5ubi-itw for <buildroot@lists.busybox.net>;
 Mon, 20 May 2024 11:17:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0C28081F1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C28081F1E
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C28081F1E
 for <buildroot@buildroot.org>; Mon, 20 May 2024 11:17:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A90E8E0003;
 Mon, 20 May 2024 11:17:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1s911I-005AUA-2l;
 Mon, 20 May 2024 13:17:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 20 May 2024 13:17:29 +0200
Message-Id: <20240520111730.1231889-5-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240520111730.1231889-1-peter@korsgaard.com>
References: <20240520111730.1231889-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 5/5] configs/orangepi_pc_defconfig: add hashes
 for Linux/headers/u-boot
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

And enable BR2_DOWNLOAD_FORCE_CHECK_HASHES.  With this, we can now drop the
defconfig from .checkpackageignore.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                             | 1 -
 .../orangepi-pc/patches/linux-headers/linux-headers.hash        | 1 +
 board/orangepi/orangepi-pc/patches/linux/linux.hash             | 2 ++
 board/orangepi/orangepi-pc/patches/uboot/uboot.hash             | 2 ++
 configs/orangepi_pc_defconfig                                   | 2 ++
 5 files changed, 7 insertions(+), 1 deletion(-)
 create mode 120000 board/orangepi/orangepi-pc/patches/linux-headers/linux-headers.hash
 create mode 100644 board/orangepi/orangepi-pc/patches/linux/linux.hash
 create mode 100644 board/orangepi/orangepi-pc/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 070b97116a..fd46182d4c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -270,7 +270,6 @@ configs/orangepi_lite_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_one_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_one_plus_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc2_defconfig lib_defconfig.ForceCheckHash
-configs/orangepi_pc_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc_plus_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_r1_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero3_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/orangepi/orangepi-pc/patches/linux-headers/linux-headers.hash b/board/orangepi/orangepi-pc/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/orangepi/orangepi-pc/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/orangepi/orangepi-pc/patches/linux/linux.hash b/board/orangepi/orangepi-pc/patches/linux/linux.hash
new file mode 100644
index 0000000000..b763fc947a
--- /dev/null
+++ b/board/orangepi/orangepi-pc/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  880ace63ca2291b8b639e9bd862cc828649d3e1e00ccfee5861473debd2e4dec  linux-6.1.91.tar.xz
diff --git a/board/orangepi/orangepi-pc/patches/uboot/uboot.hash b/board/orangepi/orangepi-pc/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..bc999536af
--- /dev/null
+++ b/board/orangepi/orangepi-pc/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
diff --git a/configs/orangepi_pc_defconfig b/configs/orangepi_pc_defconfig
index 731f5fdfcc..1713fc609f 100644
--- a/configs/orangepi_pc_defconfig
+++ b/configs/orangepi_pc_defconfig
@@ -2,6 +2,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-pc/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC"
 BR2_SYSTEM_DHCP="eth0"
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
