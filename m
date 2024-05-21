Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8C6C25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 06:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7E01400E4;
	Tue, 21 May 2024 06:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G4Tq-BZndXpv; Tue, 21 May 2024 06:40:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CED1414BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CED1414BC;
	Tue, 21 May 2024 06:40:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 619421BF328
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 06:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E340414B5
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 06:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8LztNTMKA-aC for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 06:40:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 286D0414C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 286D0414C7
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 286D0414C7
 for <buildroot@buildroot.org>; Tue, 21 May 2024 06:40:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 008DD2000B;
 Tue, 21 May 2024 06:40:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1s9JB1-008vBi-0w;
 Tue, 21 May 2024 08:40:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 21 May 2024 08:40:45 +0200
Message-Id: <20240521064045.2126436-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240521064045.2126436-1-peter@korsgaard.com>
References: <20240521064045.2126436-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 2/2] configs/beagleboneai_defconfig: add hashes
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
 .checkpackageignore                                         | 1 -
 board/beagleboneai/patches/linux-headers/linux-headers.hash | 1 +
 board/beagleboneai/patches/linux/linux.hash                 | 2 ++
 board/beagleboneai/patches/uboot/uboot.hash                 | 2 ++
 configs/beagleboneai_defconfig                              | 1 +
 5 files changed, 6 insertions(+), 1 deletion(-)
 create mode 120000 board/beagleboneai/patches/linux-headers/linux-headers.hash
 create mode 100644 board/beagleboneai/patches/linux/linux.hash
 create mode 100644 board/beagleboneai/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 070b97116a..0ddf9effda 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -160,7 +160,6 @@ configs/bananapro_defconfig lib_defconfig.ForceCheckHash
 configs/beagleboardx15_defconfig lib_defconfig.ForceCheckHash
 configs/beaglebone_defconfig lib_defconfig.ForceCheckHash
 configs/beaglebone_qt5_defconfig lib_defconfig.ForceCheckHash
-configs/beagleboneai_defconfig lib_defconfig.ForceCheckHash
 configs/beaglev_defconfig lib_defconfig.ForceCheckHash
 configs/beelink_gs1_defconfig lib_defconfig.ForceCheckHash
 configs/broadcom_northstar_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/beagleboneai/patches/linux-headers/linux-headers.hash b/board/beagleboneai/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/beagleboneai/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/beagleboneai/patches/linux/linux.hash b/board/beagleboneai/patches/linux/linux.hash
new file mode 100644
index 0000000000..ec1a3601b7
--- /dev/null
+++ b/board/beagleboneai/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c52bc1ffc396c11bce335c9ee5cd55fe4213cbc1fb4026ff62bb90c864c61f62  linux-5.10.217.tar.xz
diff --git a/board/beagleboneai/patches/uboot/uboot.hash b/board/beagleboneai/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..4b82872f31
--- /dev/null
+++ b/board/beagleboneai/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0d438b1bb5cceb57a18ea2de4a0d51f7be5b05b98717df05938636e0aadfe11a  u-boot-2021.04.tar.bz2
diff --git a/configs/beagleboneai_defconfig b/configs/beagleboneai_defconfig
index 1373ba662e..a002869984 100644
--- a/configs/beagleboneai_defconfig
+++ b/configs/beagleboneai_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_a15=y
 BR2_GLOBAL_PATCH_DIR="board/beagleboneai/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboneai/post-build.sh"
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
