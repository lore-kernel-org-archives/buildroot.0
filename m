Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B887C25B77
	for <buildroot@archiver.kernel.org>; Sun, 19 May 2024 10:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97D43403C1;
	Sun, 19 May 2024 10:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hj0k5luF0EoY; Sun, 19 May 2024 10:14:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACE334052B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACE334052B;
	Sun, 19 May 2024 10:14:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CAA161C3CA7
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 10:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B696B80EB5
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 10:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87JiGl2QbXRh for <buildroot@lists.busybox.net>;
 Sun, 19 May 2024 10:14:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 57E3680EAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57E3680EAC
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 57E3680EAC
 for <buildroot@buildroot.org>; Sun, 19 May 2024 10:14:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEAD71C0003;
 Sun, 19 May 2024 10:14:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1s8dYP-000254-17;
 Sun, 19 May 2024 12:14:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 May 2024 12:13:55 +0200
Message-Id: <20240519101355.7792-5-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240519101355.7792-1-peter@korsgaard.com>
References: <20240519101355.7792-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 5/5] configs/orangepi_r1_defconfig: add hashes
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
 .../orangepi-r1/patches/linux-headers/linux-headers.hash        | 1 +
 board/orangepi/orangepi-r1/patches/linux/linux.hash             | 2 ++
 board/orangepi/orangepi-r1/patches/uboot/uboot.hash             | 2 ++
 configs/orangepi_r1_defconfig                                   | 2 ++
 5 files changed, 7 insertions(+), 1 deletion(-)
 create mode 120000 board/orangepi/orangepi-r1/patches/linux-headers/linux-headers.hash
 create mode 100644 board/orangepi/orangepi-r1/patches/linux/linux.hash
 create mode 100644 board/orangepi/orangepi-r1/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 070b97116a..3821d4bc16 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -272,7 +272,6 @@ configs/orangepi_one_plus_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc_plus_defconfig lib_defconfig.ForceCheckHash
-configs/orangepi_r1_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero3_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_plus2_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/orangepi/orangepi-r1/patches/linux-headers/linux-headers.hash b/board/orangepi/orangepi-r1/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/orangepi/orangepi-r1/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/orangepi/orangepi-r1/patches/linux/linux.hash b/board/orangepi/orangepi-r1/patches/linux/linux.hash
new file mode 100644
index 0000000000..2ec07fd81b
--- /dev/null
+++ b/board/orangepi/orangepi-r1/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  d6ecff966f8c95ec4cb3bb303904f757b7de6a6bcfef0d0771cb852158e61c20  linux-6.6.31.tar.xz
diff --git a/board/orangepi/orangepi-r1/patches/uboot/uboot.hash b/board/orangepi/orangepi-r1/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..bc999536af
--- /dev/null
+++ b/board/orangepi/orangepi-r1/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
diff --git a/configs/orangepi_r1_defconfig b/configs/orangepi_r1_defconfig
index 80f88a168f..b48e6d0015 100644
--- a/configs/orangepi_r1_defconfig
+++ b/configs/orangepi_r1_defconfig
@@ -2,6 +2,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-r1/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_R1"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi R1"
 BR2_SYSTEM_DHCP="eth0"
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
