Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2923FCD6E51
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 06:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7B1461BDA;
	Sun, 31 May 2026 06:13:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7i13zJ3Yjjw; Sun, 31 May 2026 06:13:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E488561747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780208027;
	bh=A3hKrGgQRkR0PJ42oH5R2IeBx0VnMdHYSg0x33QTYo0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BDH8WtPnpLV8gMJgyhHq2V1Knclz17NmfQ9y4Y/nTvjsiWowNVmH+c0LY2vGIm/HK
	 v5V+JmucP7FhyJed8CEB23WJeK7ZZSVtc2And3F4ZMVwUzyz7D29YSPoIxZ4FaaUGz
	 C28LC6LtXSHilZYRmRppcX/uWb1Pbw/8UDhSKPwtYtBm9pErinEjOPeCvW6hUkuyh/
	 /bV5cWQGp26lK8+ESxE1kRU2hkBOcGvlf8vTuwooXCLqJxFrYSBuCXZ9tRf1E09wpM
	 qtji8HS6PP7+9pAjEbL5vn8Uc0UzagWuQTaQ3RYxuM7XXliVAMkab1jCpIxTO3wbEl
	 z4TaLdEDGyKnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E488561747;
	Sun, 31 May 2026 06:13:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 25977257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16ED484F2F
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gr5BIfPToQjI for <buildroot@buildroot.org>;
 Sun, 31 May 2026 06:13:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74A5D80E2A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74A5D80E2A
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:13:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1507B8769D; Sun, 31 May 2026 06:13:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 08:12:33 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 573ca408f766f5c98aaf684cb34145ddf96e8711
X-Git-Newrev: a61f01a75a6dc88cfcc5cd259e83c19aca061c24
X-Patchwork-Hint: ignore
Message-Id: <20260531061331.1507B8769D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/pine64_pinecube: bump
 to Linux 6.18.33 and U-Boot 2026.04
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a61f01a75a6dc88cfcc5cd259e83c19aca061c24
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

-kernel dts moved to vendor sub-directory
-U-Boot needs GnuTLS for the mkeficapsule tool

Signed-off-by: Jan Havran <havran.jan@email.cz>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/pine64_pinecube_defconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/configs/pine64_pinecube_defconfig b/configs/pine64_pinecube_defconfig
index 3f88ca0822..8fc55d80a5 100644
--- a/configs/pine64_pinecube_defconfig
+++ b/configs/pine64_pinecube_defconfig
@@ -1,7 +1,7 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_TARGET_GENERIC_HOSTNAME="pinecube"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Pine64 Pinecube"
 BR2_SYSTEM_DHCP="eth0"
@@ -10,21 +10,22 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/pinecube/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.60"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.33"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-s3-pinecube"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-s3-pinecube"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pinecube"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
