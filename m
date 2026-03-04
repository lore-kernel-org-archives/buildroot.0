Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2936EFCE47
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 21:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88F1981A4E;
	Wed,  4 Mar 2026 21:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQy8cVMxSsVI; Wed,  4 Mar 2026 21:50:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 102C5817ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772661031;
	bh=wnApxgHTgGfXtcPzEkP/7/LoqXx7X5FL7A0HN53xqqA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QMXUcoxgzN5jK86rS71W2wN7unwFH2EOMWR7/AsHdkPaAUoPkhdjBfHFItdjxQ1Jv
	 bRqBBvXQM2UZwiajMpGaVLYndHszQDEID3dBI3L/PPkF505JbjYu7QiM284+/9k6of
	 TXxMNuRTmQ1kLhO0/cqQGB7/ROK4urgU4VnvAx3rsVWy6olO6tg3/RXDQIpBUV3Qaa
	 mZ0AUaSBabQxLqqYhhHT05qIciG0hWRNE+sErn3ePNDnz0YRBxTT3TYjqIqSQx/qr/
	 7ti352+oOM0odlQg7kp+afDbhxjsO79Z6Qa9Bb6opqNEAnpJRLPXfMUhbaU1DmL3VD
	 8ySh8kd+6wPPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 102C5817ED;
	Wed,  4 Mar 2026 21:50:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D41D5223
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9DDE40656
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YrE7VmXsahEn for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 21:50:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9D1240129
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9D1240129
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:50:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6B95863A4; Wed,  4 Mar 2026 21:50:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Mar 2026 22:48:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd06eace372761d7ced25d73579122db8d643058
X-Git-Newrev: 21baec5ef57077cc7b4ce98dbd863c5f5a6d8380
X-Patchwork-Hint: ignore
Message-Id: <20260304215027.B6B95863A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/edk2: bump to version
 edk2-stable202511
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2604039395874492325=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2604039395874492325==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/21baec5ef57077cc7b4ce98dbd863c5f5a6d8380
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release notes since edk2-stable202508, see:
https://github.com/tianocore/edk2/releases/tag/edk2-stable202511

This commit also updates the edk2-platforms packages with the last
commit merged at the edk2 release date (2025-11-19), which corresponds
to commit [1].
The edk2-non-osi package is also updated the same way, which
corresponds to commit [2].

This commit also adds an edk2-platforms package patch to fix a Marvell
build failure seen with the SolidRun MacchiatoBin platform.

This commit has been runtime tested with tests using EDK2 package,
with commands:

    support/testing/run-tests \
        -d dl -o output_folder \
            tests.boot.test_edk2 \
            tests.boot.test_grub.TestGrubAArch64EFI \
            tests.boot.test_grub.TestGrubRiscV64EFI \
            tests.boot.test_grub.TestGrubX8664EFI \
            tests.package.test_fwts

It has also been runtime tested (by booting in qemu) with defconfigs
using EDK2 package:
qemu_aarch64_sbsa_defconfig
qemu_loongarch64_virt_efi_defconfig
qemu_riscv64_virt_efi_defconfig
qemu_x86_64_efi_defconfig

[1] https://github.com/tianocore/edk2-platforms/commit/1e64c1109ae2ac0185351e8d0c19732970d4fecf
[2] https://github.com/tianocore/edk2-non-osi/commit/94d048981116e2e3eda52dad1a89958ee404098d

Cc: Dick Olsson <hi@senzilla.io>
Cc: Romain Naour <romain.naour@smile.fr>
Cc: Vincent Stehlé <vincent.stehle@arm.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Config.in.legacy                                   |  9 +++
 boot/edk2/Config.in                                | 12 +---
 boot/edk2/edk2.hash                                |  2 +-
 boot/edk2/edk2.mk                                  | 15 ++--
 package/edk2-non-osi/edk2-non-osi.hash             |  2 +-
 package/edk2-non-osi/edk2-non-osi.mk               |  2 +-
 ...icon-Marvell-fix-SMBIOS-type-7-structures.patch | 80 ++++++++++++++++++++++
 package/edk2-platforms/edk2-platforms.hash         |  2 +-
 package/edk2-platforms/edk2-platforms.mk           |  2 +-
 9 files changed, 99 insertions(+), 27 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a2a7b06a6d..a612203f74 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,15 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2026.05"
+
+config BR2_TARGET_EDK2_PLATFORM_OVMF_I386
+	bool "EDK2 OVMF IA32 removed"
+	select BR2_LEGACY
+	help
+	  EDK2 OVMF IA32 support was removed in upstream version
+	  202511, so it has been dropped.
+
 comment "Legacy options removed in 2026.02"
 
 config BR2_PACKAGE_QEMU_TARGET_CRIS
diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
index 168fc296a2..2620c79076 100644
--- a/boot/edk2/Config.in
+++ b/boot/edk2/Config.in
@@ -21,20 +21,12 @@ if BR2_TARGET_EDK2
 
 choice
 	prompt "Platform"
-	default BR2_TARGET_EDK2_PLATFORM_OVMF_I386 if BR2_i386
 	default BR2_TARGET_EDK2_PLATFORM_OVMF_LOONGARCH64 if \
 		BR2_loongarch64
 	default BR2_TARGET_EDK2_PLATFORM_OVMF_RISCV if BR2_RISCV_64
 	default BR2_TARGET_EDK2_PLATFORM_OVMF_X64 if BR2_x86_64
 	default BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU if BR2_aarch64
 
-config BR2_TARGET_EDK2_PLATFORM_OVMF_I386
-	bool "i386"
-	depends on BR2_i386 || BR2_x86_64
-	help
-	  Platform configuration for a generic i386 target.
-	  This platform will boot from flash address 0x0.
-
 config BR2_TARGET_EDK2_PLATFORM_OVMF_LOONGARCH64
 	bool "LoongArch64"
 	depends on BR2_loongarch64
@@ -118,8 +110,7 @@ endchoice
 config BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL
 	bool "OVMF Debug on Serial"
 	depends on BR2_ENABLE_DEBUG
-	depends on BR2_TARGET_EDK2_PLATFORM_OVMF_I386 || \
-		BR2_TARGET_EDK2_PLATFORM_OVMF_X64
+	depends on BR2_TARGET_EDK2_PLATFORM_OVMF_X64
 	help
 	  When EDK2 OVMF is built with debug, messages are printed to
 	  IO port 0x402. Those messages are not shown in the normal
@@ -147,7 +138,6 @@ config BR2_TARGET_EDK2_EXTRA_BUILD_OPTS
 
 config BR2_TARGET_EDK2_FD_NAME
 	string
-	default "OVMF" if BR2_TARGET_EDK2_PLATFORM_OVMF_I386
 	default "OVMF" if BR2_TARGET_EDK2_PLATFORM_OVMF_X64
 	default "QEMU_EFI" if BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU
 	default "QEMU_EFI" if BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU_KERNEL
diff --git a/boot/edk2/edk2.hash b/boot/edk2/edk2.hash
index a7170a67cc..8aa19bf545 100644
--- a/boot/edk2/edk2.hash
+++ b/boot/edk2/edk2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1e675a98f6bcf81fbae1141779b9e72ec28773d0e5ec77bdcc890f14502615a4  edk2-edk2-stable202508-git4.tar.gz
+sha256  a8378e83060d621806b4237f6b2b9ead89d51f888d41e46e78d42b76d6594329  edk2-edk2-stable202511-git4.tar.gz
 sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index 2c089aefca..dba4aed513 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EDK2_VERSION = edk2-stable202508
+EDK2_VERSION = edk2-stable202511
 EDK2_SITE = https://github.com/tianocore/edk2
 EDK2_SITE_METHOD = git
 EDK2_LICENSE = BSD-2-Clause-Patent
@@ -56,14 +56,7 @@ EDK2_GIT_SUBMODULES = YES
 EDK2_BUILD_PACKAGES = $(@D)/Build/Buildroot
 EDK2_PACKAGES_PATHS = $(@D) $(EDK2_BUILD_PACKAGES) $(STAGING_DIR)/usr/share/edk2-platforms
 
-ifeq ($(BR2_TARGET_EDK2_PLATFORM_OVMF_I386),y)
-EDK2_ARCH = IA32
-EDK2_DEPENDENCIES += host-nasm
-EDK2_PACKAGE_NAME = OvmfPkg
-EDK2_PLATFORM_NAME = OvmfPkgIa32
-EDK2_BUILD_DIR = OvmfIa32
-
-else ifeq ($(BR2_TARGET_EDK2_PLATFORM_OVMF_X64),y)
+ifeq ($(BR2_TARGET_EDK2_PLATFORM_OVMF_X64),y)
 EDK2_ARCH = X64
 EDK2_DEPENDENCIES += host-nasm
 EDK2_PACKAGE_NAME = OvmfPkg
@@ -74,13 +67,13 @@ else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU),y)
 EDK2_ARCH = AARCH64
 EDK2_PACKAGE_NAME = ArmVirtPkg
 EDK2_PLATFORM_NAME = ArmVirtQemu
-EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)-$(EDK2_ARCH)
+EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)-AArch64
 
 else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU_KERNEL),y)
 EDK2_ARCH = AARCH64
 EDK2_PACKAGE_NAME = ArmVirtPkg
 EDK2_PLATFORM_NAME = ArmVirtQemuKernel
-EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)-$(EDK2_ARCH)
+EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)-AArch64
 
 else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_SGI575),y)
 EDK2_ARCH = AARCH64
diff --git a/package/edk2-non-osi/edk2-non-osi.hash b/package/edk2-non-osi/edk2-non-osi.hash
index 27c8ee632e..b80937256a 100644
--- a/package/edk2-non-osi/edk2-non-osi.hash
+++ b/package/edk2-non-osi/edk2-non-osi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a726656c45dd1e1698cc2ffd838b143197f6c574725a5c9bf42d1b01ea7f0719  edk2-non-osi-ea2040c2d4e2200557e87b9f9fbd4f8fb7a2b6e8.tar.gz
+sha256  922e72db9e3930907d27ca49dc762e6cb9236d4fba8a90b0f3a321bee9efed52  edk2-non-osi-94d048981116e2e3eda52dad1a89958ee404098d.tar.gz
 sha256  38d73db2f9dfb32e1666d898cb9d7c1ccd78302dd9922d5fac4a9cf61fa872d9  Silicon/Marvell/Armada7k8k/DeviceTree/Armada80x0McBin.inf
diff --git a/package/edk2-non-osi/edk2-non-osi.mk b/package/edk2-non-osi/edk2-non-osi.mk
index 42b45f2475..57c8fca821 100644
--- a/package/edk2-non-osi/edk2-non-osi.mk
+++ b/package/edk2-non-osi/edk2-non-osi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with latest commit as of the release date for boot/edk2
-EDK2_NON_OSI_VERSION = ea2040c2d4e2200557e87b9f9fbd4f8fb7a2b6e8
+EDK2_NON_OSI_VERSION = 94d048981116e2e3eda52dad1a89958ee404098d
 EDK2_NON_OSI_SITE = $(call github,tianocore,edk2-non-osi,$(EDK2_NON_OSI_VERSION))
 EDK2_NON_OSI_INSTALL_TARGET = NO
 EDK2_NON_OSI_INSTALL_STAGING = YES
diff --git a/package/edk2-platforms/0001-Silicon-Marvell-fix-SMBIOS-type-7-structures.patch b/package/edk2-platforms/0001-Silicon-Marvell-fix-SMBIOS-type-7-structures.patch
new file mode 100644
index 0000000000..9a12580a69
--- /dev/null
+++ b/package/edk2-platforms/0001-Silicon-Marvell-fix-SMBIOS-type-7-structures.patch
@@ -0,0 +1,80 @@
+From cb5129ba29c1851b452d54d5312bd6b3a27a1f34 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Fri, 23 Jan 2026 19:02:45 +0100
+Subject: [PATCH] Silicon/Marvell: fix SMBIOS type 7 structures
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Commit [1] updated the uses of SMBIOS type 4 and 7 structures for
+Silicon/Marvell but forgot to actually use SMBIOS_CACHE_SIZE_2
+structures (introduced in commit [2]).
+
+Compiling this platform fails with error:
+
+    edk2-platforms/Silicon/Marvell/Drivers/SmbiosPlatformDxe/SmbiosPlatformDxe.c:231:3: error: unsigned conversion from ‘int’ to ‘unsigned char:1’ changes value from ‘48’ to ‘0’ [-Werror=overflow]
+      231 |   48,    //48k installed
+          |   ^~
+
+This commit fixes this issue.
+
+[1] https://github.com/tianocore/edk2-platforms/commit/8390e51f56c416465a1ebb81e320a89b539cca30
+[2] https://github.com/tianocore/edk2/commit/dfac150bdfc059e486f14072c5249d4d7c200c38
+
+Upstream: https://github.com/tianocore/edk2-platforms/pull/935
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ .../SmbiosPlatformDxe/SmbiosPlatformDxe.c        | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/Silicon/Marvell/Drivers/SmbiosPlatformDxe/SmbiosPlatformDxe.c b/Silicon/Marvell/Drivers/SmbiosPlatformDxe/SmbiosPlatformDxe.c
+index 16fe05a46c..d348bbb458 100644
+--- a/Silicon/Marvell/Drivers/SmbiosPlatformDxe/SmbiosPlatformDxe.c
++++ b/Silicon/Marvell/Drivers/SmbiosPlatformDxe/SmbiosPlatformDxe.c
+@@ -227,8 +227,8 @@ STATIC SMBIOS_TABLE_TYPE7 mArmadaDefaultType7_a72_l1i = {
+   CacheTypeInstruction,    //instruction cache
+   CacheAssociativityOther, //three way
+   // SMBIOS 3.1.0 fields
+-  48,    //48k I-cache max
+-  48,    //48k installed
++  {48,0},//48k I-cache max
++  {48,0},//48k installed
+ };
+ 
+ STATIC SMBIOS_TABLE_TYPE7 mArmadaDefaultType7_a72_l1d = {
+@@ -248,8 +248,8 @@ STATIC SMBIOS_TABLE_TYPE7 mArmadaDefaultType7_a72_l1d = {
+   CacheTypeData,           //data cache
+   CacheAssociativity2Way,  //two way
+   // SMBIOS 3.1.0 fields
+-  32,    //32k D-cache max
+-  32,    //32k installed
++  {32,0},//32k D-cache max
++  {32,0},//32k installed
+ };
+ 
+ STATIC SMBIOS_TABLE_TYPE7 mArmadaDefaultType7_a72_l2 = {
+@@ -269,8 +269,8 @@ STATIC SMBIOS_TABLE_TYPE7 mArmadaDefaultType7_a72_l2 = {
+   CacheTypeUnified,        //instruction cache
+   CacheAssociativity16Way, //16 way associative
+   // SMBIOS 3.1.0 fields
+-  512,   //512k D-cache max
+-  512,   //512k installed
++  {512,0},//512k D-cache max
++  {512,0},//512k installed
+ };
+ 
+ STATIC SMBIOS_TABLE_TYPE7 mArmadaDefaultType7_l3 = {
+@@ -290,8 +290,8 @@ STATIC SMBIOS_TABLE_TYPE7 mArmadaDefaultType7_l3 = {
+   CacheTypeUnified,        //instruction cache
+   CacheAssociativity8Way,  //8 way associative
+   // SMBIOS 3.1.0 fields
+-  1024,  //1M cache max
+-  1024,  //1M installed
++  {1024,0},//1M cache max
++  {1024,0},//1M installed
+ };
+ 
+ STATIC CONST CHAR8 *mArmadaDefaultType7Strings[] = {
+-- 
+2.52.0
+
diff --git a/package/edk2-platforms/edk2-platforms.hash b/package/edk2-platforms/edk2-platforms.hash
index d088bcc342..b3fa5d8424 100644
--- a/package/edk2-platforms/edk2-platforms.hash
+++ b/package/edk2-platforms/edk2-platforms.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4417db79bfb8a9bf601e94e295fec270f99eac3447a6d418ff28ea7dd374d8d6  edk2-platforms-d1b297b2aa693fc723ac883866c925e9d04260c9.tar.gz
+sha256  96bb0d16d76285190663e15367d0c022a3a47230e5361d80b8549f546ad93fbe  edk2-platforms-1e64c1109ae2ac0185351e8d0c19732970d4fecf.tar.gz
 sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/package/edk2-platforms/edk2-platforms.mk b/package/edk2-platforms/edk2-platforms.mk
index 86b9fea960..7c46d9ed9f 100644
--- a/package/edk2-platforms/edk2-platforms.mk
+++ b/package/edk2-platforms/edk2-platforms.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with latest commit as of the release date for boot/edk2
-EDK2_PLATFORMS_VERSION = d1b297b2aa693fc723ac883866c925e9d04260c9
+EDK2_PLATFORMS_VERSION = 1e64c1109ae2ac0185351e8d0c19732970d4fecf
 EDK2_PLATFORMS_SITE = $(call github,tianocore,edk2-platforms,$(EDK2_PLATFORMS_VERSION))
 EDK2_PLATFORMS_LICENSE = BSD-2-Clause-Patent
 EDK2_PLATFORMS_LICENSE_FILES = License.txt

--===============2604039395874492325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2604039395874492325==--
