Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD34606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 10:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=g+SAONfO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=DKKhxLNH
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49C744051D;
	Sun, 25 Oct 2026 10:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-ABW8Ii_hxI; Sun, 25 Oct 2026 10:38:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4395C40396
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792924728;
	b=RJcSeQon49vLyq4lGZ828d3m/6I3KVuB/aGrL+kjt1LIcvagTWIaOhzYVKL17wpQaHEO
	 0lQb7w7q9b3nZVDeQ8F6RNBdEO046kOuWCQxo9kBt9xcINnihwAcdzzlQLXVe0vGriAAC
	 7ZBkglUFjBLagQzzOSBpLiquzbJmEZS+gsMdqqE8gCmGngzbOwJoebf5QAKZHna0KWJMN
	 RNXoJsjO4KnMM949VQ4y8i0pn+sBK3MJsjokQY0t52AUPElXPoJqeL5m1WPNnn4ObTDAm
	 qPna+/4HbnkYclo6QfabadYs/iEfTRa0l/oM3sqjyTppkGw1lSAhypc3znIKTgwNSig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792924728;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-MIME-Autoconverted:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=yQXoCe6kf+PYjacF9Mf5fowRdClT6/jeJDF40MPRTDg=;
	b=apKmQo2axzYnARHrZxBEs0PEoc6GVkcT+S73P7sQyQfcp6TXvp3Qngi6ORcRuJNYRMug
	 zRUQsLu9f3RNYrNnZtlA5WtcRJUSiG/VFz4giQo1jcSbzT+RpIpXDXnN+KVPcDcddgdxC
	 Njp+x+Rar8MrqBYosZDTZl03C02aLWBQC3SzgzTehN33bBURoZv2nP03wbLqg+zfVCA4l
	 TJte5l0xTtaOHQcyPWOXQD9MSX4uuoWEu+hNbwQeIgZJWB9joWAj2SvYvxxtDC+li6Kb8
	 SQAyICKYhzMZ3XaNYVQ9234KIfskVdNhp4lXuPbfwxwZR9p3DVmjgbyYUQ+bzfqJpng==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792924728;
	bh=yQXoCe6kf+PYjacF9Mf5fowRdClT6/jeJDF40MPRTDg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g+SAONfOJgqBbIECD9w7V76KNt0eDIG/KVP8978II3lEH/U1oNwRSwQjYa0//+AL2
	 PvD3Zf4xDmabtjnyPPS8c0btFO9au6UyYnJgUSER85ABv9YiXw2nKIF4+k9ta3EGbS
	 m55g/s/lbD4uMtliIV4NrAE6IelfS9dWJDFis6K+zOAASjcz8qK7/LV8nPwU8eSJ0O
	 l7pGSlGj8wI5AQf4iQkLxPYl4bLqK82ZrKPmGTHH7Smcxca3VlNfGqziMTTwBxEQjZ
	 7AedQg4w3S0I3TsLI9Yc8qmI61xGbfF9dElmjPq1rBMOXKGtontuUVxCZOcoYj7ylu
	 BbvKEWl+f/rgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4395C40396;
	Sun, 25 Oct 2026 10:38:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E72723AF
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D902B60A75
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 71Q5YdXmfSr9 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 10:38:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 59BB460AA2
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792924724;
 b=Sgf++eB5z20cKv15IFIrk61T5+0auCqMvdsyTIXNG+4Sm7pj1h4l5PhSteD2AeYf832M
 JWv3KeWKzwpaYeL6B68nRddYeV4+arn5bMCurq+4KFaOhfcBZ2seLlBb4rsnystEeu8E4
 eK9dQsnHC0lBf07SAw3JNDEBNdL6Zz4MdkfmB3OJi6NS8Xfsrd2eXJyiH8cFNOieCGeDh
 jeP5kPJhK5RYTXGpxgc1lX8D5Rt+o1FQYQX97vfGc8TrI6qsCl7gRdIxtdBZnhIBUIpkT
 phpc9xdHH8LMuO3gEeNgdDwluhKbbSax0omwsR2eRbwPaShV7fKKO1DJp4NGz4/HuTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792924724;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:
 X-MIME-Autoconverted:Content-Type;
 bh=2+WBVJ2EkjCgyn3fthNM+Pmmf5vNpv2ukGwoF+buLOw=;
 b=O/BeaQzBZiSx5WvAqJKz0ykuEHzDBwwE9jXZSFn2fEHZMebWRJ5ayQ12APq8YQxT4y0X
 57mpQM+WhSJRxrsSrSJgSI/Ykpmz4QvOqQpDhbuFWMGVspRF+AthJHbF5TB+VBjVY3Ji1
 AYIvLmVKYpL+hrZ5A5OjzGgnzyn+iwRQSpZab1LRT9y7JuFOlKQD8bS1gECF8m3JFzbMX
 FH5WF6+SwQ4io3/apx/k+4FELvgd7y1NX7JlCqrPinJq655j0iSHsz23wHrmx6fgyCxmW
 3BmQMJaKSdMCDYHNjChoqOBPCFV73kJQ+FIY+s0lI209nE1NW660BkLjVvXyqICMCzw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=DKKhxLNH; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=DKKhxLNH
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59BB460AA2
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:38:42 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=DKKhxLNHd665SG9o1V/2x8K6lMm22Y8W5yfaXudOE2v/fhO45owtH10hK3u5odNH93GE1/UePOjZM9ZthtNc/GJ+bdn0/s6Fz8/l77OTUk0FIVXvg8VOrR5Q2gP+I1BqNbmpLMX6i/QpOlJSBMyi1Mtap0gj5Mhb32EQOGcbCuCAHyYY/bd7qNvPaczWQNVULVJQuuCIxLDYdfZ2gj9uitC3XgKtzTmTqCtSzyG9Fj4TCXC4wwKCUJ3QEljr84jpDQalksfK0FDh6KoRpumog1zUfKIH5HxOV2FYBFbYv5dTwkasNe4FreGBGevdp2zi4pPfhGPkFpDok9uxvpeXYA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=apGBB+aU41fq70FkTtjrSn7uk2QXBUMA+qH/688S51E=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -146340670; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 25 Oct 2026 10:38:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xKvcb-00000007KsN-0Oo1;
 Sun, 25 Oct 2026 11:38:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 11:38:33 +0100
Message-ID: <20261025103835.1748520-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025103835.1748520-1-peter@korsgaard.com>
References: <20261025103835.1748520-1-peter@korsgaard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH 2/2] configs/imx91frdm_defconfig: new defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The i.MX91 FRDM board is quite nicely supported in mainline Linux/U-Boot, so
add a defconfig using the latest mainline U-Boot/Linux releases as an
alternative to the vendor BSP used by freescale_imx91frdm_defconfig.

There is so far no i.MX91 support in upstream TF-A, so use the vendor variant.

Mainline U-Boot uses binman to assemble the flash.bin boot image, so we do
not need the imx9-bootloader-prepare.sh post-image script.

The existing imx91frdm readme.txt applies to this as well, so add a note
about the choice of defconfig.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                    |  1 +
 .../imx91frdm/patches/linux/linux.hash        |  2 +
 .../imx91frdm/patches/uboot/uboot.hash        |  1 +
 board/freescale/imx91frdm/readme.txt          |  4 +-
 configs/imx91frdm_defconfig                   | 46 +++++++++++++++++++
 5 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 configs/imx91frdm_defconfig

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
