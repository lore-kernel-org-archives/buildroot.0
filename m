Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22080606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 10:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=n4WcZeIw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=jm/9q7CI
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E854060AA2;
	Sun, 25 Oct 2026 10:38:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JRdXHl1nmgFt; Sun, 25 Oct 2026 10:38:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0538760AB1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792924727;
	b=FS/SamqQOajwxLITJowZiI5xh3Mz4zRHlUSxx8KWse2EIdb/ervWgTbfio7iAacTYbOc
	 JR+WD3brOUuzqKvB9hNefzMtmXAav69aUFDCW+8sYSAbhxN8IydkMa3FogzfAxEKpt0Wi
	 ACVSL0NH6y5IOVq635P50GcQGQUsLWWT0fRxGfsY0Zy3FJQK5FpZBFLYjD1zqDIODiXiP
	 g8FrYgyl6b+5WJ3GUmdaMjTqLFjxAvd3gZbqHvNlooAexKwNmqE9D2Cg190krr8Br20/e
	 mjVb/qtpeSwXL6BQIht502ngWyTZKfhdxOXENCGVOmXSClYjQx5q/uSHkmXsl6Jw2Ow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792924727;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-MIME-Autoconverted:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=oEX7kDj06bgiaXTNzcUvm20ZXMOrmTjYHQBEUjthk1g=;
	b=X40GbBt9Dk78mZlKy31HJheb3xmVxGFW1lwKmM7ao3vIeYLqraqWGK4BXmAbstJmqyYB
	 QEjSx+LZkbMIwmR/Te3Kr+m+JROW0yNKZKnK94OBzD/233xEGRxcvyJSzwQnvGaL094yv
	 8PvTPmzb+GKQL0HVeakRKAJNARq/61JQDC6RrfVjFJYIifC+V6EqmFLJj2SY8WH8lFhrD
	 MXZnXW2scSQlV9hq201dUE3AxGUADCNCMFBmK7+V0RCWX0SHupXE9hhR6bZS5VshOZBTJ
	 90jB74n3SPvfErDSYDoeXrssXFstnXVeZAUiIc5w7EwRelU3G2MNVALvmOVmxio9umQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792924727;
	bh=oEX7kDj06bgiaXTNzcUvm20ZXMOrmTjYHQBEUjthk1g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=n4WcZeIw+34Puh/y5TtEzPh7JYfRt691l4EE6rrp8BVP7jHtID2gcZ3Tp9obaGcAD
	 4mKFlPxnoaBjSPsEPFvfRq0Szey84Xkf7vH+zDspUJbseNqyUEG2U/0TOaflKm6W8k
	 XHCFOq9V8g/b6pHtFF3HAjQMKYajQDE75Hxzxe71UOVl3ZQEa5CHlz9vAcss57FP79
	 Zut1GIvgHz87MXAoMp2zDFqxhesGOqaF/2V/xUj7NfndCsdlo0pDqsIVBSGfgaFZJK
	 2UhUZth5bz7eoy7uzEAjF21DcBQPTRofOWJfA2d5HB0W3AGUyRNre4nfEo0n6TTIFp
	 ba6mhc7adU+WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0538760AB1;
	Sun, 25 Oct 2026 10:38:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CF1013AF
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0C84402B3
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AGdybSFa1TjL for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 10:38:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 59AF5406AB
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792924724;
 b=MHsYzN+BSMaNeLFZjmP3HpgsAbEttR3g6CDkFYAbdAULOC1FWu9XTrHGXL4No4iTMCqq
 tM4OPoV0Rv95ettNa9GJnDEM5BsyOt8V31s/j+kMNU5sIImjtSPYhVXANUIfAb7dLb6UO
 NC2/coKllb5Frrd3HoBKi2LI65uMmZrLJw/xOToWFLpY9tsDzA5Be/1mvZiykKjTILcIU
 BUtWfSEQD2yWNSHQ+eVQSFZ6+1NXh9xwQlVnW6CG+625L3NM608BLQOENsLsApvjnR9HD
 5Y2qP905ISIn8lJ6K8++Faro4ZmZoUNxwzd1oYqZRs+/jeNkXkHZy9pPoRf6Dge/B0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792924724;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-MIME-Autoconverted:Content-Type;
 bh=Kr2y22hTTXn2pNC6LgBI8xfttiSMJhG/GDJAzz9ofQk=;
 b=kCo+h3DgzrUgftPDhDVBIglks01tIK0qjH/P6t2YjYNFJW2dDckeryT7mdeJjUtrIaKB
 tJ0uvmslzxzz8frspyYXoqLCzQzSJFgWXX0lOKmrv+2EY+pfhZuUtCuCqcbtbapGWSGnt
 Q5sFxPRvw44kMKzIOtaelvSGLoXKlDuHAnJuoeeA2Yr27gPGIM8RYjl9RYh0MUO9VKhyK
 Ptu5+enL43C0osBfVUka1DdhEScWxM7KZvK0m0VAD3AkfFKatNouY4rPt+70160hc5tkn
 sNPPkIjbYFA4TAUXo+N5FtCbVAo5CBrfH21aZoUiUxzrUKwo2lkQDVneSSl7JkdTSpw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b="jm/9q7CI"; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=jm/9q7CI
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59AF5406AB
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:38:42 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=jm/9q7CIMIrwTMe1TEUxeJmR2myaLurDAhydQiMGvy57psNHhnP+mjxNN/p4jvHuIPUhjA7XcnAUA94smeyy0/x0yKTT6PHr+MOraw8GwOMxAvZSwDTTHYlGacxjFaQL3/VW60HGEGKgZJYJBTpV9UTs1xeHQXLS67Oxpq2SSQFkubBlN70/dtngJILfNJNqB20MZqD1knN9S43xwxbFTadZ1l87zML/82uzpMfA09kmuQK4NBejCR1QRVTAcVbuNglfAQ5x9E9zBlX56SFsTq6Cjs/D0tDDz5JrMkRVxY1tXtCKFRKwKhIYXLt53gU/949nIsr6qbOBxj41AlYwrQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=uO/X/so0URe7Kp9LE6lXnrTHp6NA5gCy6ebdkQqATLg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 94564450;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 25 Oct 2026 10:38:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xKvca-00000007KsH-1jZC;
 Sun, 25 Oct 2026 11:38:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 11:38:32 +0100
Message-ID: <20261025103835.1748520-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH 1/2] configs/freescale_imx91frdm: bump U-Boot,
 TF-A and Linux to LF6.18.37-2.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Which is based on U-boot 2026.04, TF-A 14.1, Linux 6.18.37.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 2 +-
 board/freescale/imx91frdm/patches/linux/linux.hash          | 2 +-
 board/freescale/imx91frdm/patches/uboot/uboot.hash          | 2 +-
 configs/freescale_imx91frdm_defconfig                       | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/freescale/imx91frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx91frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index bf39f1e9c7..54ee264ade 100644
--- a/board/freescale/imx91frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/imx91frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  d7813f4ad5431edb162d6be2775bc021f9007b9c6934e977330291168523a507  imx-atf-lf-6.18.20-2.0.0.tar.gz
+sha256  c7b92f0da1a154ebabd4425a1627a726d8e0206e8b417d8c87b5a9636b52a3e5  imx-atf-lf-6.18.37-2.1.0.tar.gz
diff --git a/board/freescale/imx91frdm/patches/linux/linux.hash b/board/freescale/imx91frdm/patches/linux/linux.hash
index 222ec55328..df7905fa4e 100644
--- a/board/freescale/imx91frdm/patches/linux/linux.hash
+++ b/board/freescale/imx91frdm/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a8f55764fd1418db8adfd2711c0abb7d5464a8ee1cbfd0f6878f1059ecfa1316  linux-imx-lf-6.18.20-2.0.0.tar.gz
+sha256  352273c5098d73762074997a89537f06994d6a1c2e9d291dd8431dfe4fa0be27  linux-imx-lf-6.18.37-2.1.0.tar.gz
diff --git a/board/freescale/imx91frdm/patches/uboot/uboot.hash b/board/freescale/imx91frdm/patches/uboot/uboot.hash
index 01e860b59e..1baa3185cf 100644
--- a/board/freescale/imx91frdm/patches/uboot/uboot.hash
+++ b/board/freescale/imx91frdm/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  96942f8c49736b7d40277891bf0a34cfdd0afb59390f79b65b2b33b3bbd19f61  uboot-imx-lf-6.18.20-2.0.0.tar.gz
+sha256  b9aa6a73f670f02a0903e3298923c3aa802ba3ffb7a53f6c397d28998c3ee8d8  uboot-imx-lf-6.18.37-2.1.0.tar.gz
diff --git a/configs/freescale_imx91frdm_defconfig b/configs/freescale_imx91frdm_defconfig
index 7fc2fd5959..4e94b29075 100644
--- a/configs/freescale_imx91frdm_defconfig
+++ b/configs/freescale_imx91frdm_defconfig
@@ -10,7 +10,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx9-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.18.20-2.0.0)/linux-imx-lf-6.18.20-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.18.37-2.1.0)/linux-imx-lf-6.18.37-2.1.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx91-11x11-frdm"
@@ -24,13 +24,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.18.20-2.0.0)/imx-atf-lf-6.18.20-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.18.37-2.1.0)/imx-atf-lf-6.18.37-2.1.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx91"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.18.20-2.0.0)/uboot-imx-lf-6.18.20-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.18.37-2.1.0)/uboot-imx-lf-6.18.37-2.1.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx91_11x11_frdm"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imx91frdm/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
