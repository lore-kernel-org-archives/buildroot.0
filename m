Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1836606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 10:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Zim11fw0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=ZK3S1tp+
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA41980E8E;
	Tue, 20 Oct 2026 10:29:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7CDVE8339_oc; Tue, 20 Oct 2026 10:29:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AFB6A80CCC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792492160;
	b=TGjSvjTrYmyeeobcZc01RHTdnGfTWBfADkssHq+VawenV86OHesczt5LRyJ3GwlMAaUF
	 /xte9pDynob9/JaKMRoDh4RYlSPuEeUikCD1Iq/26hhtvleR3lJZbnC/S3u8JppFwy8KO
	 Cin/vI9LNJTGEUDlTi/uGs3APOVtgjgkeeQyYJZR2o/c4vUj27C+LOGyl7TgdXQ15psBt
	 MfTUIWjml4oE0HArd368w1lssD2y9xTRldVYLremsUsha23DqRkO/8Sl2U/rfTohREufB
	 4raH7mEx94SvgDTOgPMCEbSkJy6pA7HqRKcU20p8buL7srnPVTtZl6dKro7Q7sbfb/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792492160;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-MIME-Autoconverted:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=D03+F2kM450nhybUD3/qmo/W404ecXRPA/MoxqLmcbM=;
	b=IJo6GdQ7/ipoqORCLBKNH7Wmbr+fHYKHTwmScAFh6u+0uWm3Ex+LWefMsqujzvHEowjy
	 Sn/iWEUnVIG4UNrNWZQt0w6IERxn7RdfjT8UZGn/E7KtWSYDVq1Y17ChllOEAxogs1TKi
	 XqixOGJ/T15MJhNK6SFfL57b/iTNCGTvDUHWfa4oyp22CHMw6f61lHaScxj21499Tn3pt
	 G5g8oxleMghFJVrpdvY176mqKM/A3SQVqN4jmNMoAtJhyn3+FG8pSSUmBQgxemGkpc8x2
	 dBpJdzuiyEi5HPFRRok7BAUmugsZ6oTEAaiL79e8FrWA+lXBowaSLDYxAB2X5P0Dy3w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792492160;
	bh=D03+F2kM450nhybUD3/qmo/W404ecXRPA/MoxqLmcbM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Zim11fw0akL0bvOmsxFvWJ3oZcQeRpdn5uV08/3tOyrzAHMIOxWV+L6qCM6l6sgxy
	 2bFBobZwYaPynxsQUky674Qhk+lkC1XMMO/nD3TiIJ5U3kId1Y81U+4Z4ugxFuXkBe
	 VqEnxXCWc72WrL19xXw8XDdTTX82TXQsPN2patyS9BBKq0ldJzuh1149wcEuxnTtGu
	 4QmXkZcpCqNWSYntXFx4xt14UYP089yrDCFxkLwe6jYGcq8wlcg8a7w1fjYFY+QXT5
	 OVEbVfWsAd2vqSg3waSz5A8cOt29BwaoVRnuz+10doq//+htQulkQssT/5zGD/Ikb8
	 3Wqi1UQ9l6SyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFB6A80CCC;
	Tue, 20 Oct 2026 10:29:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FE331E9
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D8DC6083C
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKt2QXGXtrfI for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 10:29:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D4A7760822
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792492155;
 b=r+DLLYAJq9hnvYTKmt5ij0Ch6oslbRtW+r8BNUPDpjge1OIWlINbr4MjlK4eOtDycMNC
 8gF9BalwCiA1YV10tMtCVuSXGA/vWvmXRPnbbwk9CCmDWv8wqIU+KSJG7o4tFqOyUklVO
 bVEzEkn/r8IXKJtnu7ep7tN/1MPeY7P0hXfHjJqZcFdsqHwNcqqMVXsUQ985c7XUZ4FbI
 G/rZwC79IE635/w8TuBFkUXDFtPRf9PCdgwHWgdI/K5cr3IYLXo6iCWx2eUMtPhimGmE1
 vbcfWCu5O/o3QZJt7qBRpJDtHzmCXFbMIHz8nNPsLfZkn/PIEy/4CDGcoCGx9o9GWVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792492155;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:
 X-MIME-Autoconverted:Content-Type;
 bh=t8ALBZm2BHKwz8L0jVU+7zxUs6nIcnziilr5XnKSOVE=;
 b=tNCuV3Terp/UjObpubgwKaGLmeGuQpI82te2xO3CgX8rKhYalq+HPqQ/P9EqW/h2jth/
 mfTtp2pO6OZXgnflwEvNWVeittJUMbBSiI4n0JySF9RLCmpMW4PFnlEZv9lSBlFapETpZ
 QuV62h9+Zdkwos3c6OigsOVcFKSkPD1KgsurZB9UvspHeeTKnsvoUfauA5LOk4+pYt5qg
 GfSz3hZGfosCzgUp6aks9EstLA5O9VUPSH1msV9aCb4m7thRgWujo92pD8IYfQcJcLxhB
 AvKyC0WQa/FDDiu6Z9sX1iEiUz2NmW25MccoFh9Ik1Rcr99mXxyq8Hyli/XbdRzFksw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=ZK3S1tp+; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=ZK3S1tp+
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4A7760822
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:29:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=ZK3S1tp+aVm2R4cJjYAMXUC9W8EQHef41o7gtB9pn7CYe4wwK6XJRtqTYL+xee9Jq7PEx1pTRM8l917BEUjCS9mL3fXukLNvb/FoOlNmfMFlgDxlpbry9ywJxp//TPauP8/fyKSEIs5pNNl/xCXKLB5925hGKapdpOjInkTVJqJrVvwZszzcqzfj7uIejbh127sPDOPY+RZZlZIrxXi1U9U74fBDj4HscFCGOigOqwr6u2NbQo1S/PID0yUXdhaVhG42j4Y41lem1N4Q4PzoBLcLcEknGlKgDGGL2TNa1CvZe0WK3uH7G+GuxH1eLvz+16+QhvLChCMXFbZ0ydQRUA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=2TPah+0rqQGo5gDKCL7tkG2yKNxMB9QFaEphbPIoe2A=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -711812548; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 10:29:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xJ75i-0000000833J-2XZn;
 Tue, 20 Oct 2026 12:29:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 12:28:58 +0200
Message-ID: <20261020102906.1918308-4-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020102906.1918308-1-peter@korsgaard.com>
References: <20261020102906.1918308-1-peter@korsgaard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH 4/7] configs/imx93frdm_defconfig: new defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The i.MX93 FRDM board is quite nicely supported in mainline, so add a
defconfig using the latest mainline U-Boot/TF-A/Linux releases as an
alternative to the vendor BSP used by freescale_imx93frdm_defconfig.

Mainline U-Boot uses binman to assemble the flash.bin boot image, so we do
not need the imx9-bootloader-prepare.sh post-image script.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                    |  1 +
 .../arm-trusted-firmware.hash                 |  1 +
 .../imx93frdm/patches/linux/linux.hash        |  2 +
 .../imx93frdm/patches/uboot/uboot.hash        |  1 +
 configs/imx93frdm_defconfig                   | 46 +++++++++++++++++++
 5 files changed, 51 insertions(+)
 create mode 100644 configs/imx93frdm_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 0f52ba2267..2f467d5c68 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2701,6 +2701,7 @@ F:	board/visionfive/
 F:	boot/shim/
 F:	configs/avenger96_defconfig
 F:	configs/beagleboneai_defconfig
+F:	configs/imx93frdm_defconfig
 F:	configs/lafrite_defconfig
 F:	configs/minnowboard_max_defconfig
 F:	configs/nexbox_a95x_defconfig
diff --git a/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 54ee264ade..92b3645fb7 100644
--- a/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  c7b92f0da1a154ebabd4425a1627a726d8e0206e8b417d8c87b5a9636b52a3e5  imx-atf-lf-6.18.37-2.1.0.tar.gz
+sha256  b807d8bf190b7c46b4260729b4bbe2f7df83cd1086edcb181d66595ae6598d23  arm-trusted-firmware-v2.15.0-git4.tar.gz
diff --git a/board/freescale/imx93frdm/patches/linux/linux.hash b/board/freescale/imx93frdm/patches/linux/linux.hash
index df7905fa4e..b6cbf6be1f 100644
--- a/board/freescale/imx93frdm/patches/linux/linux.hash
+++ b/board/freescale/imx93frdm/patches/linux/linux.hash
@@ -1,2 +1,4 @@
 # Locally calculated
 sha256  352273c5098d73762074997a89537f06994d6a1c2e9d291dd8431dfe4fa0be27  linux-imx-lf-6.18.37-2.1.0.tar.gz
+# From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
+sha256  87363c24f10e06321eb362765521094e94471f6bff8bce2d6b3e40f39f004953  linux-7.3.tar.xz
diff --git a/board/freescale/imx93frdm/patches/uboot/uboot.hash b/board/freescale/imx93frdm/patches/uboot/uboot.hash
index 1baa3185cf..b6058cb3c0 100644
--- a/board/freescale/imx93frdm/patches/uboot/uboot.hash
+++ b/board/freescale/imx93frdm/patches/uboot/uboot.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  b9aa6a73f670f02a0903e3298923c3aa802ba3ffb7a53f6c397d28998c3ee8d8  uboot-imx-lf-6.18.37-2.1.0.tar.gz
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
diff --git a/configs/imx93frdm_defconfig b/configs/imx93frdm_defconfig
new file mode 100644
index 0000000000..f5a5f973a0
--- /dev/null
+++ b/configs/imx93frdm_defconfig
@@ -0,0 +1,46 @@
+BR2_aarch64=y
+BR2_cortex_a55=y
+BR2_ARM_FPU_VFPV4D16=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx93frdm/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="7.3"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx93-11x11-frdm"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93=y
+BR2_PACKAGE_FIRMWARE_ELE_IMX=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.15.0"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx93"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx93_frdm"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
+BR2_TARGET_UBOOT_NEEDS_IMX_ELE_FIRMWARE=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
+BR2_TARGET_UBOOT_SPL=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
