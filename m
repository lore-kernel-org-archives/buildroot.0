Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2828A606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 06:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qHMMAoaP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=KsQmmE1U
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4627607F6;
	Thu, 22 Oct 2026 06:15:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J9invveif3e6; Thu, 22 Oct 2026 06:15:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 71965605EC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792649735;
	b=A6lECKZt2/XG+QOa4kmN+aM4Sh9beTru2SPXdzLAWF53bhSoIrxbyUeg0iXKgoRCmdYe
	 zGAeNl1HYUTa4uGn+GM3q7M0EJJx8adZgOm8DLP3/UelZuTl/R6d8DNF6pl+s5mm7myis
	 9Yffi7taTuxXd90KOA7wAhdr/lHd4qQXSmEHKiwIXmtaoQ4IZGh/0rDsrvICrNFNsy2/A
	 Dd8qlvB81kY/clSv+XJIK8VJsGPUhP7ntqS4MG+0RtoUOaKjKQwVcThP6sGN4eJfIj926
	 VubhPfwaCZDFXxRAqcM5s4ZHMv2EGM4Hq+Hi5cLWJqRlWVHkjNDNjOhGMgQ9v/nJpEQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792649735;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-MIME-Autoconverted:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ck8j4ySlWWS0m1wpa8lNzYyu1RMBV66zcwjQ7QCLAeQ=;
	b=PReCRiACMJ5h/Z3JqFofyVSVyTA9ob1A7/8+H1yLR0vuUm5f2H/5P65B0G8kIs6gw5Z5
	 unapZVP68iw53e772jrAtrOQkU3ye9lrIaKt0ZC89m6Cp8Q3NPMLj4Lxx9QDa9bu0IqXG
	 MQxSOlXHs0pFdInj7s9vVT05apl8WIjSq70IlnZhH3eS8coZnGBxsq1S/12C1INIQEUzk
	 cEgzPmnJBsEeZVjF2QlxtbB+FiNMPWxviBwkWrgwk+h2zLYnr7AiDBRzJm6pg3hNkcH7e
	 Hfexj7GaUjL6scTqAbh35BrHPd5hk4HmeZGVNRWELOBgJtBFbSO4PIN4Q5+J329hJCQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792649735;
	bh=ck8j4ySlWWS0m1wpa8lNzYyu1RMBV66zcwjQ7QCLAeQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=qHMMAoaPxCDBpWcbHJlMa1l/L846eR2+DdGUzJdZvawxqz1XAKJOfflOQelSoz1N5
	 WDYBGm2O97/H8ZcaNGJA3Fku/aqm38Y8ljdJBr+dQBSu+rZvQ/mRZlWy1qoVZs45Nk
	 mR92c39axwNmh2PQKTD6qjYN4anWLZK3mWSadpz+YbU7eii3Zs8Ld7+LYAcsZkwEgh
	 L208Q2lzhnY57i5a2I4CspivRTtXCCHcBM/NTz8Ukjp/fMCsZB9r3Io3XZu4amYDOh
	 IGQZq4ImJgYFEydZh/+p1a1XEMQ7pIItV4LbNwR4t0q8h5IKtwu4wyL7UGjoA4DT7A
	 K+SSEO3or1Vcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71965605EC;
	Thu, 22 Oct 2026 06:15:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3087A356
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 06:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2255D40075
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 06:15:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4e95HqWxpLbg for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 06:15:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 60C8740042
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792649731;
 b=m4UkB5/tGboKoAt9jJ1kZPegQu1J8V96mBbVagWjoItWz68/KHqWvY1EPUJTCqWvwZ9M
 Dy5T5Cq6zBmRJUC6AL1TdvusUJgMHHoO2f956gcZlQMiL6VN/tAJY6dmx2Wh4gAlQpiUv
 AuCCOW6G0LeKa3VwAUY3UaGlXPP2iBPg3yFT3It8xhQaceX/daFAxRUqwRYwlLQwAbD7P
 Lb0EQQyxDNc+kqDZl5xuTe72bj/DMC+QQAUsmhdbJZAzoWMSlbgv+txaP4TWEDNyoAUtK
 OctQ8BM0YSWSenrMW8dI3JtbyDKUyzvDDxtWhAaiRwf8LpKzRSOFICAIwYANpCCWlRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792649731;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-MIME-Autoconverted:Content-Type;
 bh=JWbb+KulwTqDqKGRIEtOeoGJOUqBU7qzLwgFNcDz/1I=;
 b=GooWXv+bjkStd9IR5GQ+bWXgBdAao0/lNHibGI08wPpdpjCtJSsBBAmfJ9LOWIs6preg
 fx5fmIY2NzL2CXhSX3adbArENixbVxHPxiqnXKtm5jiRCV+9DCQrHRABK6pe6vcw4Ui/7
 saWBBYuilCJ7/I+xl20haI2KNAxapENI1tODzFNABbMWZpYKiJuMqW+GpuzCRMdrgTtgB
 Pw7K3uQ961SZ2xrUyn3GNb/D8f4wE+dmiQnabqzpLjY2mKt8/5QhU8BNw2k4eE0dXdujj
 kN9inkF2Xp7b9lbwKVMUh78DDI6WlY6GRLrqLqKxjoID44+5NdgSpI6ESHbwMEjmVAw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=KsQmmE1U; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=KsQmmE1U
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60C8740042
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 06:15:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=KsQmmE1U0XJMRYxz3MG9Z6RdeI5ESsKflO/0C5HRz6Bb/vnjckyKhSxmg22PQbD7OU9X5t2jP1k5kHwe3uzTQJ6Is65QXXwgGdT4DH7iuPCqToinuxYBq7y5Z6BU0yIUy0s0xNaP5ulMZfVRYMas3Zu/H94OpBeeH59ZSmjvHrJO+Oa/k1iP1w4a8l/DFyijdRrCycl32wGexG2MNkl+x5QQy2tZC1zL2kouBaIZluz+f7BFzbJbtR6q6CFvC4CvdQe7OEkaoOdXf8rF7FenUeBlZnZtrWY6Scp4pV9qjM2voOor95+ggPyyEDgDYP1IjjJ9m/sJpFEy+InR9ha7fA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=8aT4UsBH4lJAaCHaDB63WcWzjF6OQDSAZ048amXNle0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1933442053; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 22 Oct 2026 06:15:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xJm5D-0000000ABiZ-3XFe;
 Thu, 22 Oct 2026 08:15:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 08:15:19 +0200
Message-ID: <20261022061520.2428309-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH v2] configs/imx93frdm_defconfig: new defconfig
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The i.MX93 FRDM board is quite nicely supported in mainline, so add a
defconfig using the latest mainline U-Boot/TF-A/Linux releases as an
alternative to the vendor BSP used by freescale_imx93frdm_defconfig.

Mainline U-Boot uses binman to assemble the flash.bin boot image, so we do
not need the imx9-bootloader-prepare.sh post-image script.

The existing imx93frdm readme.txt applies to this as well, so add a note
about the choice of defconfig.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                    |  1 +
 .../arm-trusted-firmware.hash                 |  1 +
 .../imx93frdm/patches/linux/linux.hash        |  2 +
 .../imx93frdm/patches/uboot/uboot.hash        |  1 +
 board/freescale/imx93frdm/readme.txt          |  4 +-
 configs/imx93frdm_defconfig                   | 46 +++++++++++++++++++
 6 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 configs/imx93frdm_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 19575d5207..4339b37f11 100644
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
diff --git a/board/freescale/imx93frdm/readme.txt b/board/freescale/imx93frdm/readme.txt
index 3e5f404029..81e46658ba 100644
--- a/board/freescale/imx93frdm/readme.txt
+++ b/board/freescale/imx93frdm/readme.txt
@@ -11,7 +11,9 @@ Build
 
 First, configure Buildroot for the i.MX 93 FRDM board:
 
-    make freescale_imx93frdm_defconfig
+    make imx93frdm_defconfig (mainline)
+Or:
+    make freescale_imx93frdm_defconfig (vendor BSP)
 
 Build all components:
 
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
