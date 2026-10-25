Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B058606A31D
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 17:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=e6CfQgLe
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72303605F9;
	Sun, 25 Oct 2026 17:14:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8tBo0sJDJl4c; Sun, 25 Oct 2026 17:14:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8DD85605FD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792948444;
	b=V00mN4eLRyDGJOBype/mhkNluBVPfbP958gPA3sNnfoVzvOX+/T3HIziIi21kAqfAAYz
	 UuYnTOx/k8JDRtpWEJJtiCpiO9bADBeK3Sd8g8gCCi2dcffixrZyVM9vkXTOwfe1UEeYk
	 acGssqe5X3NVoR8seURznmOspn+a4Bc3VD93bhuNA0KVh25LTUrbYVc1kV0KB2qiZmnZw
	 fRgv0aeTtAnRotzCG9aRH/8e1zIl7g8yHCG+yb5kjabzzuLhw4RAIv4doISShJLLWHOHy
	 jFOi1n8w54BZah3EKgbkdGQ1ynOFfhfjwZ1OvnFbVBFugk6TeU/ZN2V3UW/KocWGn4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792948444;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tgQBIvVu6rkACgqlBXAxBaWdLUqTxHwWvFcqP7WYJwg=;
	b=DJ6hxsH+ldLYeSQzp3+piOk+d863HPKkEvxTmDf5V8aAGNKEU5MdqlURAFcRtWPP4TOl
	 2J5kb6bUvCd0oOW3196HicqVt6VnMO8cnY8F1cqw6bzdIZrMShU0Hl3gLEEKkO8R5b7L9
	 faOzIy/9+bZhbdcssK9G9TAuoeYCHQn3FymHtsu325V2uiqMWIkHcDu5+kryGVxWK0r/Z
	 egVtxtxlzM3KJ5gi2pd05BD+e+MRovTKMqHweAXxGRyVW2WtrEUzfsSVHBareYk5QKLy2
	 ENVORMrTHO00SPLLmNUKnMNGnSY4k0lawX++IasFnFQr1TAqxHXQVegcoMc5DPl3Obg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792948444;
	bh=tgQBIvVu6rkACgqlBXAxBaWdLUqTxHwWvFcqP7WYJwg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e6CfQgLeQPU165DMz3Kpa9QNIkzhc5zvOXlOlseCgD5ZcKeSX8rICu0mjQFHKl451
	 CKUWLNAleUDmNu6r82DoeQbWJvREb73XLFzZd4vvtruKQgFYvKn+YNKqivbvv4sPzH
	 qXZMgazddBgm2o3opyD01CddYNrZnftMT2BzjnUVH0o5HU9a5USV3kqZ6yabqIa7WD
	 UO/073shtRIrCHfPO9zAQNM/g9uucgyLtxDUDLNaDjuBOaCH8JjTOHBCihjBLPPP/v
	 hiUB3luBDQhLPoIRwLHCvYzSHTxDxLunEKQpTcbne0L284I+SQ0o9Q1XzVlOl9eTXY
	 k+ww99y4Z3zeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DD85605FD;
	Sun, 25 Oct 2026 17:14:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 461834D1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36C3B40513
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:14:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1_PlnxZJwRv for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 17:14:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 480B4404EC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792948441;
 b=gEJRXtP4dvDO5ZhB7zsA7HGzX4i682ZZJLMA6DuPvnJP1StTDDtb8b8zFXQa5NVklZ/F
 DyfQn+B6u1upZafWboZElFVm4K8fzQ/h4cEusxJXIrbcx9hybClq8NBAYni2+qhRIB2IX
 Qq1VtyjR+4nSLGBnEeXHEdJX90+Vzz0Jgm6gvRHxJ5NlI0RBrawa/J1V6F4uMHxxXoH6b
 /McSSKDsln6GNuRWSylfxLIKogPfThJ2qdGZoNgoHW8OArQg4XwyZSZbkHfb8Ad+4jIJ/
 ltLErBinWblvetVP8RAFUbTbf/QtIydIlxVJvM2vqMu0D/HLK+wdDFvxNA1aBFCyS6Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792948441;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=opTRJDftKY7MZLxO9svyaoTDNjU6Ap984NSRrUvnchE=;
 b=lNQHazDfH5WNd+MF2WxTgjIMUA7eDlJqq/KETLiR4TIVW/BUlOcEnvI6vmCu1EoD7n4C
 K87R+dG33KDfVMw0bo0AaHQNBvDm3y07LFmZLrDC+1YyXn/rVzu27lp5DdPBjaW2GnUEm
 rCGTiDep7gA+TXDSsr8jthLhir0SVhAI/phwhl9FUqVS5QLLTTStE8dEIQ+Zs5dSTQgd6
 zIdkF9JErwbQLmyah1Aax4px5s5Ih+tIVQNRL4u+JaTleRCo+Vxh7kpn3rR3bHdr9QN2T
 SzfSigZGYIe1OwSH2F6JvmUdH6MRpKhIZG5iSj6tMY3gJrFDuh3/q4jbYONSpN4Sp+g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 480B4404EC
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:14:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF29C94E7F; Sun, 25 Oct 2026 17:12:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 18:13:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8a9e3872196fb5b1d8866271651002cfa16c2a5
X-Git-Newrev: d1db2000b18ab08c801a426628dffb2f93a6c70c
X-Patchwork-Hint: ignore
Message-Id: <20261025171235.BF29C94E7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx91frdm_defconfig: new defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d1db2000b18ab08c801a426628dffb2f93a6c70c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The i.MX91 FRDM board is quite nicely supported in mainline Linux/U-Boot, so
add a defconfig using the latest mainline U-Boot/Linux releases as an
alternative to the vendor BSP used by freescale_imx91frdm_defconfig.

There is so far no i.MX91 support in upstream TF-A, so use the vendor variant.

Mainline U-Boot uses binman to assemble the flash.bin boot image, so we do
not need the imx9-bootloader-prepare.sh post-image script.

The existing imx91frdm readme.txt applies to this as well, so add a note
about the choice of defconfig.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Tested-by: Julien Olivain <ju.o@free.fr>
[Julien: Tested on board 700-94610 Rev A1]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  1 +
 board/freescale/imx91frdm/patches/linux/linux.hash |  2 +
 board/freescale/imx91frdm/patches/uboot/uboot.hash |  1 +
 board/freescale/imx91frdm/readme.txt               |  4 +-
 configs/imx91frdm_defconfig                        | 46 ++++++++++++++++++++++
 5 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 352308b082..0da286107e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2703,6 +2703,7 @@ F:	board/visionfive/
 F:	boot/shim/
 F:	configs/avenger96_defconfig
 F:	configs/beagleboneai_defconfig
+F:	configs/imx91frdm_defconfig
 F:	configs/imx93frdm_defconfig
 F:	configs/lafrite_defconfig
 F:	configs/minnowboard_max_defconfig
diff --git a/board/freescale/imx91frdm/patches/linux/linux.hash b/board/freescale/imx91frdm/patches/linux/linux.hash
index df7905fa4e..b6cbf6be1f 100644
--- a/board/freescale/imx91frdm/patches/linux/linux.hash
+++ b/board/freescale/imx91frdm/patches/linux/linux.hash
@@ -1,2 +1,4 @@
 # Locally calculated
 sha256  352273c5098d73762074997a89537f06994d6a1c2e9d291dd8431dfe4fa0be27  linux-imx-lf-6.18.37-2.1.0.tar.gz
+# From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
+sha256  87363c24f10e06321eb362765521094e94471f6bff8bce2d6b3e40f39f004953  linux-7.3.tar.xz
diff --git a/board/freescale/imx91frdm/patches/uboot/uboot.hash b/board/freescale/imx91frdm/patches/uboot/uboot.hash
index 1baa3185cf..b6058cb3c0 100644
--- a/board/freescale/imx91frdm/patches/uboot/uboot.hash
+++ b/board/freescale/imx91frdm/patches/uboot/uboot.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  b9aa6a73f670f02a0903e3298923c3aa802ba3ffb7a53f6c397d28998c3ee8d8  uboot-imx-lf-6.18.37-2.1.0.tar.gz
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
diff --git a/board/freescale/imx91frdm/readme.txt b/board/freescale/imx91frdm/readme.txt
index ec839b1dca..4f304a491a 100644
--- a/board/freescale/imx91frdm/readme.txt
+++ b/board/freescale/imx91frdm/readme.txt
@@ -11,7 +11,9 @@ Build
 
 First, configure Buildroot for the i.MX 91 FRDM board:
 
-    make freescale_imx91frdm_defconfig
+    make imx91frdm_defconfig (mainline)
+Or:
+    make freescale_imx91frdm_defconfig (vendor BSP)
 
 Build all components:
 
diff --git a/configs/imx91frdm_defconfig b/configs/imx91frdm_defconfig
new file mode 100644
index 0000000000..e77d6bfd03
--- /dev/null
+++ b/configs/imx91frdm_defconfig
@@ -0,0 +1,46 @@
+BR2_aarch64=y
+BR2_cortex_a55=y
+BR2_ARM_FPU_VFPV4D16=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx91frdm/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="7.3"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx91-11x11-frdm"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91=y
+BR2_PACKAGE_FIRMWARE_ELE_IMX=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.18.37-2.1.0)/imx-atf-lf-6.18.37-2.1.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx91"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx91_11x11_frdm"
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
