Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F17C54791
	for <buildroot@archiver.kernel.org>; Sun, 10 Mar 2024 19:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F005A608D6;
	Sun, 10 Mar 2024 19:26:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mdW-t82pkEPf; Sun, 10 Mar 2024 19:26:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB12E608E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB12E608E2;
	Sun, 10 Mar 2024 19:26:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F21311BF86B
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 19:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF7408176D
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 19:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ODMCnPLWh88A for <buildroot@lists.busybox.net>;
 Sun, 10 Mar 2024 19:26:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6A33D8176B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A33D8176B
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A33D8176B
 for <buildroot@buildroot.org>; Sun, 10 Mar 2024 19:26:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA97440003;
 Sun, 10 Mar 2024 19:26:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1rjOoP-0089fV-02;
 Sun, 10 Mar 2024 20:26:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Mar 2024 20:26:17 +0100
Message-Id: <20240310192619.1943776-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 1/3] configs/ci20_defconfig: bump Linux to
 version 6.1.81
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
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The kernel build now requires FIT support in mkimage:

  ITB     arch/mips/boot/vmlinux.gz.itb
/home/peko/source/buildroot/output-ci20/host/bin/mkimage: unsupported type Flat Device Tree

So enable that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/ci20_defconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
index 7e119376e1..f9070d5098 100644
--- a/configs/ci20_defconfig
+++ b/configs/ci20_defconfig
@@ -3,7 +3,7 @@ BR2_mipsel=y
 BR2_mips_xburst=y
 # BR2_MIPS_SOFT_FLOAT is not set
 BR2_KERNEL_HEADERS_AS_KERNEL=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS4"
@@ -15,7 +15,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ci20/genimage.cfg"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.254"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.81"
 BR2_LINUX_KERNEL_DEFCONFIG="ci20"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
@@ -29,6 +29,7 @@ BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin"
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE="board/ci20/uboot-env.txt"
 BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE="32768"
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
