Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFE9C43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 11:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 052DF813A6;
	Sun, 12 Jul 2026 11:23:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zcqiaEIPKaL6; Sun, 12 Jul 2026 11:23:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D187814C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783855431;
	bh=LDCYg1UZh76AnqHlhO7oHVIar5xhDUVvF/JjueJGHak=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KiwnJSXy6LWEUbD0HMj2QsAJPBzPVE/ruZVIAPydWeoHG/9WR+ENVsvn03v+8jxSn
	 yOL/ZGneACWFrJMO/IBQLEtjPqeEcoM5l+o7OEiDB/xgfNaZN1mfMwsSGVTE5muiju
	 iIY3UQtcHuoHwMhRDvD0YkngyNc47GC0RJm8EXxXpijyQJVBDZNPEJ5gRDS6jEycRI
	 oC+jTdkuijxPimQmHj0bv2rQK3pCOCQxZvtt+gwjE3OlrjmmRbithSqtigpg3NYio0
	 gDx3dD0W6RTMO2NAHSxSgQdSZIFF7bjqFg5mmTv31V2Nigq6g5tCa4frujAfK/g4PF
	 s4OOReF7nD3Mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D187814C0;
	Sun, 12 Jul 2026 11:23:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FEE02EE
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 464AD606BA
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11dqLowuu_D7 for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 11:23:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B7026062A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B7026062A
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:23:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54EE1886DC; Sun, 12 Jul 2026 11:23:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Jul 2026 12:59:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1dfcb841f9021310bc81a2d0bb3c52c90050a325
X-Git-Newrev: fe8221fb4e003bf020b6817b7f33764209ed0b59
X-Patchwork-Hint: ignore
Message-Id: <20260712112314.54EE1886DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32mp1*_dk*: bump OP-TEE to
 4.9.0 and TF-A to LTS 2.12
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4177240462506813397=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4177240462506813397==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fe8221fb4e003bf020b6817b7f33764209ed0b59
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bump TF-A LTS LTS version to 2.12 for:

- stm32mp135f_dk_defconfig
- stm32mp157a_dk1_defconfig
- stm32mp157c_dk2_defconfig

Bump the OP-TEE version to 4.9.0 for:

- stm32mp135f_dk_defconfig

Tested on STM32MP135F-DK and STM32MP157C-DK2 boards.

While at it, fix the below U-Boot build error by adding
BR2_TARGET_UBOOT_NEEDS_DTC=y

Adding host-dtc avoid the following build error, when the host has
libyaml:

/usr/bin/ld.bfd: scripts/dtc/yamltree.o: in function `yaml_propval_int':
yamltree.c:(.text+0x130): undefined reference to `yaml_sequence_start_event_initialize'
/usr/bin/ld.bfd: yamltree.c:(.text+0x13d): undefined reference to `yaml_emitter_emit'
/usr/bin/ld.bfd: yamltree.c:(.text+0x19f): undefined reference to `yaml_scalar_event_initialize'
/usr/bin/ld.bfd: yamltree.c:(.text+0x1ae): undefined reference to `yaml_emitter_emit'
/usr/bin/ld.bfd: yamltree.c:(.text+0x22d): undefined reference to `yaml_scalar_event_initialize'
/usr/bin/ld.bfd: yamltree.c:(.text+0x286): undefined reference to `yaml_sequence_end_event_initialize'
/usr/bin/ld.bfd: yamltree.c:(.text+0x293): undefined reference to `yaml_emitter_emit'
/usr/bin/ld.bfd: scripts/dtc/yamltree.o: in function `yaml_tree':
yamltree.c:(.text+0x380): undefined reference to `yaml_mapping_start_event_initialize'
/usr/bin/ld.bfd: yamltree.c:(.text+0x38b): undefined reference to `yaml_emitter_emit'
/usr/bin/ld.bfd: yamltree.c:(.text+0x417): undefined reference to `yaml_scalar_event_initialize'
/usr/bin/ld.bfd: yamltree.c:(.text+0x427): undefined reference to `yaml_emitter_emit'
/usr/bin/ld.bfd: yamltree.c:(.text+0x461): undefined reference to `yaml_sequence_start_event_initialize'
/usr/bin/ld.bfd: yamltree.c:(.text+0x46e): undefined reference to `yaml_emitter_emit'
/usr/bin/ld.bfd: yamltree.c:(.text+0x513): undefined reference to `yaml_sequence_end_event_initialize'
/usr/bin/ld.bfd: yamltree.c:(.text+0x520): undefined reference to `yaml_emitter_emit'
/usr/bin/ld.bfd: yamltree.c:(.text+0x5b0): undefined reference to `yaml_scalar_event_initialize'
/usr/bin/ld.bfd: yamltree.c:(.text+0x5c0): undefined reference to `yaml_emitter_emit'
/usr/bin/ld.bfd: yamltree.c:(.text+0x6a7): undefined reference to `yaml_scalar_event_initialize'
/usr/bin/ld.bfd: yamltree.c:(.text+0x6b4): undefined reference to `yaml_emitter_emit'
/usr/bin/ld.bfd: yamltree.c:(.text+0x6da): undefined reference to `yaml_mapping_end_event_initialize'
/usr/bin/ld.bfd: yamltree.c:(.text+0x6e5): undefined reference to `yaml_emitter_emit'
/usr/bin/ld.bfd: yamltree.c:(.text+0x74d): undefined reference to `yaml_scalar_event_initialize'
/usr/bin/ld.bfd: yamltree.c:(.text+0x75d): undefined reference to `yaml_emitter_emit'
/usr/bin/ld.bfd: scripts/dtc/yamltree.o: in function `dt_to_yaml':
yamltree.c:(.text+0x8a5): undefined reference to `yaml_emitter_initialize'
/usr/bin/ld.bfd: yamltree.c:(.text+0x8b2): undefined reference to `yaml_emitter_set_output_file'
/usr/bin/ld.bfd: yamltree.c:(.text+0x8bf): undefined reference to `yaml_stream_start_event_initialize'
/usr/bin/ld.bfd: yamltree.c:(.text+0x8cc): undefined reference to `yaml_emitter_emit'
/usr/bin/ld.bfd: yamltree.c:(.text+0x8e5): undefined reference to `yaml_document_start_event_initialize'
/usr/bin/ld.bfd: yamltree.c:(.text+0x8f2): undefined reference to `yaml_emitter_emit'
/usr/bin/ld.bfd: yamltree.c:(.text+0x911): undefined reference to `yaml_sequence_start_event_initialize'
/usr/bin/ld.bfd: yamltree.c:(.text+0x91e): undefined reference to `yaml_emitter_emit'
/usr/bin/ld.bfd: yamltree.c:(.text+0x93c): undefined reference to `yaml_sequence_end_event_initialize'
/usr/bin/ld.bfd: yamltree.c:(.text+0x949): undefined reference to `yaml_emitter_emit'
/usr/bin/ld.bfd: yamltree.c:(.text+0x95b): undefined reference to `yaml_document_end_event_initialize'
/usr/bin/ld.bfd: yamltree.c:(.text+0x968): undefined reference to `yaml_emitter_emit'
/usr/bin/ld.bfd: yamltree.c:(.text+0x974): undefined reference to `yaml_stream_end_event_initialize'
/usr/bin/ld.bfd: yamltree.c:(.text+0x981): undefined reference to `yaml_emitter_emit'
/usr/bin/ld.bfd: yamltree.c:(.text+0x98f): undefined reference to `yaml_emitter_delete'

Signed-off-by: Raphaël Gallais-Pou <rgallaispou@gmail.com>
[Julien:
 - change error log to english locale in commit log
 - also add BR2_TARGET_UBOOT_NEEDS_DTC=y in stm32mp157c_dk2_defconfig
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../common/stm32mp1xx/patches/optee-client/optee-client.hash         | 2 +-
 .../common/stm32mp1xx/patches/optee-os/optee-os.hash                 | 2 +-
 configs/stm32mp135f_dk_defconfig                                     | 5 +++--
 configs/stm32mp157a_dk1_defconfig                                    | 3 ++-
 configs/stm32mp157c_dk2_defconfig                                    | 3 ++-
 5 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/optee-client/optee-client.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/optee-client/optee-client.hash
index 5423bf93a5..379bbfea65 100644
--- a/board/stmicroelectronics/common/stm32mp1xx/patches/optee-client/optee-client.hash
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/optee-client/optee-client.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a9a91bdb433df795c87a6d15198effbd648e3671ae611f2a3f8b41229d61cce0  optee-client-4.3.0.tar.gz
+sha256  2ef152f25b682e59c3684d6d73d7c5a138495615f6b045e95266eb3d0bc0d04e  optee-client-4.9.0.tar.gz
diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash
index 2e12a5cdea..3f5c58fcff 100644
--- a/board/stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  390b271905c828d6def9fa6a77bbaa425f3b434d733c8eb18f582ccbc6896096  optee-os-4.3.0.tar.gz
+sha256  9400e16c45bfa45f15585b2c933b86c449e7de05def0ecaaa62a4f38973a3a45  optee-os-4.9.0.tar.gz
diff --git a/configs/stm32mp135f_dk_defconfig b/configs/stm32mp135f_dk_defconfig
index 7aa3f8c752..a39bf0658b 100644
--- a/configs/stm32mp135f_dk_defconfig
+++ b/configs/stm32mp135f_dk_defconfig
@@ -23,7 +23,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
@@ -35,7 +35,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin *.stm32"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_CUSTOM_VERSION=y
-BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE="4.3.0"
+BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE="4.9.0"
 BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
 BR2_TARGET_OPTEE_OS_PLATFORM="stm32mp1"
 BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="135F_DK"
@@ -44,6 +44,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp13"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index a11f0e65e2..77f77aa580 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -20,7 +20,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
@@ -34,6 +34,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index beb7d81d30..a487a87f50 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -20,7 +20,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
@@ -34,6 +34,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y

--===============4177240462506813397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4177240462506813397==--
