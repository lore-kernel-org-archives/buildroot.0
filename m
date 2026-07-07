Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CF6C43458
	for <buildroot@archiver.kernel.org>; Tue,  7 Jul 2026 04:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B080F4069A;
	Tue,  7 Jul 2026 04:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3mo5Zg45a15O; Tue,  7 Jul 2026 04:08:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0E3C406D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783397337;
	bh=HxYEa3UqL2J3B0IJmnmhjo7EQZo/Pg4fW1LmWQrynn4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U1sZHxF6muR8PO6tf/ouurUrCeQekSOddfGa9bCF8JQ3v6W1bkkePx1n49ccKl6Yv
	 iZK/SWPYAVW/x+PNUlwITyfZUhHC9tZhxSSNBD84FO7sbvDdneXLQptfPwOWU81CC8
	 zF5D9cXSJ/hW9USJzUA8CKw3zdLz6tt/oTSQIBKll8uawglHSESmBadZaw5bswurL+
	 B2W06qCbA3qG/tmAgs/kTPWRu5WFytPnNM14hJJ0Jx+DPpXgxmvnBd0aWoCTOG5r20
	 gG40l3aZWTzzfJ4xstUoRfA6pQpidjEN46Rx/2c+x4cIJ0iVV8dn6qfbd0b+k3GYSt
	 hdmW2dShJO4sQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0E3C406D5;
	Tue,  7 Jul 2026 04:08:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C9FA315
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A9C44009E
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:08:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ykp9pvDzfEeM for <buildroot@buildroot.org>;
 Tue,  7 Jul 2026 04:08:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6C8994018F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C8994018F
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C8994018F
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:08:55 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-c96b08cdd1cso2664115a12.0
 for <buildroot@buildroot.org>; Mon, 06 Jul 2026 21:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783397335; x=1784002135;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sFBW7WPEDxeDUgU/DELo1Y/fwgy8INJ2eLNOvRH9lB0=;
 b=blpua9rAJUMqCQxtYyl3jVfqokPC2w57Hxv0ytH92NQ8rca82iOBMbckN9QcnIx22d
 BOR8qO7makIacCAcXSygJdrzRwty4aE/1nWho/4b3MQpk20rAfC8Qy8itmCR6lVM0ZOa
 xt/8y0Uka+N2wdUwgSMsnLHN6pQC3DZnmBnVOBZY1OyrY2JMtE0AVMrayzdx4ZyQ1gEb
 25NYc6SLITGINma3g0sSC6nB9rhNDPf44XyCdkISFIdYzbVBbSQw74roX2ZAeuvmnZwB
 Ah3m/h9c3H2r9HaoU6rHBafHVVSBoZMTUJ8ohtK/FnFovXlm+mqXt4Qxlns3cYLtHXFs
 eYYg==
X-Gm-Message-State: AOJu0YyBhpCRpU1Oz3uu4AMQzTxl1aVITLJSn2DnZ0nmnlPq/09TEbmC
 riEgrEB+eEdEbG2hmHSlW9/eab/WekIeizGQNUmpX5J/uH9CrFdS0GsUBBvd6A9y
X-Gm-Gg: AfdE7ckcIvek9QUw8EMxR2oD0HKIWX4Z26/+6/VSRtf6EuvmjnF5Wkrlko40mHOOLHt
 Q6dLdoGmCBqPwutAJekdM9geCJ0roh5J10JDnp9fwPjidyeoakWH8UvbHdWLYKdQ9F1Lx1tKIQa
 HGeoo0blyK0zYUt2WHXdBftouNTwadbjb5nxkpvchaZO2vdr3MyeyieInFdT+XziIx531ztCP48
 pq7X9rQ6uqc8hnQA46ReNgl30WiY1/+DeG0AaOZdHoYvA1G3sd3X4DZVeEF4aUYxxvSTrxc68cv
 TvruNQuUsbmRSRpZstZ8E9Sv2EOAo93hPciZar4KXlXVHxVcDg1mmCppUIAVP/obo7reSkUFxyl
 EerNQN72SBRm43+uvIyDiotmiIcX4PL3Xlq7582IwY2s1Zcx082nAGIX8ZIjI1KMfUbiWh8a5d1
 OSFHk1AH9n/c46gFn5TFuoMv+KxOhDZrxzBon3zeOIKlToNs3wmB4laCsadIhD7o5hlvGnp59pY
 w==
X-Received: by 2002:a05:6a21:50f:b0:3bf:c126:baf7 with SMTP id
 adf61e73a8af0-3c08ef51a7fmr4296215637.47.1783397334530; 
 Mon, 06 Jul 2026 21:08:54 -0700 (PDT)
Received: from kadvm.. (ip72-203-121-181.oc.oc.cox.net. [72.203.121.181])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-311747f598dsm3372636eec.6.2026.07.06.21.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 21:08:53 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Vladimir Oltean <olteanv@gmail.com>
Date: Mon,  6 Jul 2026 21:05:41 -0700
Message-Id: <20260707040544.108052-6-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707040544.108052-1-nemaakhilesh@gmail.com>
References: <20260707040544.108052-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783397335; x=1784002135; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sFBW7WPEDxeDUgU/DELo1Y/fwgy8INJ2eLNOvRH9lB0=;
 b=SFZtY2oxy+wUwp87tz5dI+IL/1g5ajXhPSPtvjUcuo45xKxL027n1RtJyawC/DJ2Jy
 Geq4/l7XtWnZhNTpr5kIeA8q5rXktOA8KatC9cKvGCdF0/xMGKf5yQJWwEJE4/QYi0XM
 Gl75ymbWpKZ/4LBb918ziIDyKHCYbNpYG41f24hoP5L4iw2KtoZnG5g7qtZQDFrpdhNi
 dHl9LdgV1dqPgL0ERHDHnOvUFo+P3kxo0S2Td5VGdH9qFfymQN3L8yIFmV0kUx8JjtLS
 XInF1p5G2JxNoivbliUiwaSXQ2/2YFgqWNmsXkhOfNzsTgG1Sly7IHyaJRhzb4F6A2hg
 4gHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=SFZtY2ox
Subject: [Buildroot] [PATCH 6/9] configs/ls1028a-rdb: bump BSP tag to
 lf-6.18.20-2.0.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update the kernel, U-Boot, ATF tags and readme.txt.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 .../arm-trusted-firmware/arm-trusted-firmware.hash     |  2 +-
 board/freescale/ls1028ardb/patches/linux/linux.hash    |  2 +-
 board/freescale/ls1028ardb/patches/uboot/uboot.hash    |  2 +-
 board/freescale/ls1028ardb/readme.txt                  | 10 +++++-----
 configs/ls1028ardb_defconfig                           |  8 ++++----
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 7981c74137..4a62068d29 100644
--- a/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2d3f9c52e16766c290bdc0bc130d634e4c326a5b236dfb2f2ca3f0fa457e82d4  atf-lf-6.12.34-2.1.0.tar.gz
+sha256  658af40a90fd8e2460d364775a0c37e0507201e49de7f69c8a22d61e179f81e1  atf-lf-6.18.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1028ardb/patches/linux/linux.hash b/board/freescale/ls1028ardb/patches/linux/linux.hash
index f30030c86a..85d5173aa7 100644
--- a/board/freescale/ls1028ardb/patches/linux/linux.hash
+++ b/board/freescale/ls1028ardb/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  27a1987ca0a5802d3ebb296b8134ec66d813ad86cf2a60779b45092735bbb23b  linux-lf-6.12.34-2.1.0.tar.gz
+sha256  206f997d41bb958099bf7a89a02a6889942b118984f81f9a45bec9907f60708f  linux-lf-6.18.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1028ardb/patches/uboot/uboot.hash b/board/freescale/ls1028ardb/patches/uboot/uboot.hash
index 38d54d9922..80bbe7d219 100644
--- a/board/freescale/ls1028ardb/patches/uboot/uboot.hash
+++ b/board/freescale/ls1028ardb/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  2f25cde388b2f83ff7a8e3afe25aafb1db48dafb0fa3bf1e4f9fef603f3b4785  u-boot-lf-6.12.34-2.1.0.tar.gz
+sha256  04aed627132db7b656117c7a35fb29d314172319fa3a297ea6748eebac2b5ce3  u-boot-lf-6.18.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1028ardb/readme.txt b/board/freescale/ls1028ardb/readme.txt
index 6411baf6ec..d2bcee0ac2 100644
--- a/board/freescale/ls1028ardb/readme.txt
+++ b/board/freescale/ls1028ardb/readme.txt
@@ -11,7 +11,7 @@ For more details about the board and the QorIQ Layerscape SoC, see the following
 Layerscape platforms are officially supported by NXP under the Layerscape
 Debian Linux SDK (LDLSDK). This uses components from Linux Factory (project
 common with i.MX), but has a slower release cadence than LF. The currently used
-tag is lf-6.12.34-2.1.0, which is in line with the latest LF tag. Generally, in
+tag is lf-6.18.20-2.0.0, which is in line with the latest LF tag. Generally, in
 Buildroot, the latest Linux Factory release tag is always used, which may be
 considered pre-release software, as it may contain features which are not yet
 documented, and it generally undergoes less testing.
@@ -21,11 +21,11 @@ For the software Layerscape Debian Linux SDK User Guide, see:
   - https://www.nxp.com/docs/en/user-guide/UG10143.pdf
 
 The components from NXP are:
-  - rcw, lf-6.12.34-2.1.0
-  - atf (fork), lf-6.12.34-2.1.0
-  - uboot (fork), lf-6.12.34-2.1.0
+  - rcw, lf-6.18.20-2.0.0
+  - atf (fork), lf-6.18.20-2.0.0
+  - uboot (fork), lf-6.18.20-2.0.0
   - cadence-dp-firmware (blob), 8.16
-  - linux (fork), lf-6.12.34-2.1.0
+  - linux (fork), lf-6.18.20-2.0.0
 
 Build
 =====
diff --git a/configs/ls1028ardb_defconfig b/configs/ls1028ardb_defconfig
index d39c452963..ec3828e74a 100644
--- a/configs/ls1028ardb_defconfig
+++ b/configs/ls1028ardb_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/ls1028ardb/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="ls1028a"
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1028ardb/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.12.34-2.1.0)/linux-lf-6.12.34-2.1.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.18.20-2.0.0)/linux-lf-6.18.20-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -26,7 +26,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.12.34-2.1.0)/atf-lf-6.12.34-2.1.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.18.20-2.0.0)/atf-lf-6.18.20-2.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1028ardb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -36,7 +36,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.34-2.1.0)/u-boot-lf-6.12.34-2.1.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.18.20-2.0.0)/u-boot-lf-6.18.20-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1028ardb_tfa"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
