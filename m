Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2467C77B7C
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 17:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA1DD840E9;
	Wed, 25 Jun 2025 17:34:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N34JOwxMaDI3; Wed, 25 Jun 2025 17:34:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EF1D840EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EF1D840EA;
	Wed, 25 Jun 2025 17:34:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 04A8F154
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFD3040109
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q5ophw6ps8mQ for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 17:34:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6D5540010
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6D5540010
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:34:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2883844A5; Wed, 25 Jun 2025 17:34:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 25 Jun 2025 19:30:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14d07d1914766314afb5d7f9fbdeae10bb459bde
X-Git-Newrev: 5ddba9702a310f3d08e6c05c2d3178b0c5576ebc
X-Patchwork-Hint: ignore
Message-Id: <20250625173422.A2883844A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/edk2: bump to version
 edk2-stable202505
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
Content-Type: multipart/mixed; boundary="===============4600600951078625150=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4600600951078625150==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5ddba9702a310f3d08e6c05c2d3178b0c5576ebc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes since edk2-stable202411, see:
https://github.com/tianocore/edk2/releases/tag/edk2-stable202502
https://github.com/tianocore/edk2/releases/tag/edk2-stable202505

Note: the edk2-stable202505 release note mention a security fix.
This fix was already backported in Buildroot in a previous commit.
For that reason, this bump is not marked as securiy, and also
removes the backported patch and its associated _IGNORE_CVES entry.

Those versions include fixes when using gcc 15 (host and target).

This commit also updates the edk2-platforms and edk2-non-osi packages
with the last commit merged at the edk2 release date (2025-05-23).
In the case of edk2-platforms, the commit id used in this update
is few days later, to include a fix for the Arm Sgi575 platform.
Exact commit should have been [1] (to be exactly aligned to the edk2
tag date), but commit [2] is used instead. The package edk2-non-osi is
updated to commit [3].

Also, the SocioNext SynQuacer platforms (including the DeveloperBox)
were removed upstream in edk2-platforms commit [4]. This commit
reflect that change by removing those platforms choices and associated
runtime tests.

This commit has been runtime tested with tests using EDK2 package,
with commands:

    support/testing/run-tests \
        -d dl -o output_folder \
            tests.boot.test_edk2 \
            tests.boot.test_grub.TestGrubAArch64EFI \
            tests.boot.test_grub.TestGrubi386EFI \
            tests.boot.test_grub.TestGrubRiscV64EFI \
            tests.boot.test_grub.TestGrubX8664EFI \
            tests.fs.test_iso9660.TestIso9660Grub2EFI \
            tests.fs.test_iso9660.TestIso9660Grub2Hybrid \
            tests.package.test_fwts

It has also been runtime tested (by booting in qemu) with defconfigs
using EDK2 package:
qemu_aarch64_sbsa_defconfig
qemu_riscv64_virt_efi_defconfig

[1] https://github.com/tianocore/edk2-platforms/commit/2bfe3fa99e21b00492f31aa8969db1f6c0ff1a80
[2] https://github.com/tianocore/edk2-platforms/commit/92f7d69e8aa31e0ae06d4dabbcee12f4ebdb78ed
[3] https://github.com/tianocore/edk2-non-osi/commit/ea2040c2d4e2200557e87b9f9fbd4f8fb7a2b6e8
[4] https://github.com/tianocore/edk2-platforms/commit/aaba5807f13b91029bcd32fc0f92dbb42c79dc1e

Cc: Dick Olsson <hi@senzilla.io>
Cc: Romain Naour <romain.naour@smile.fr>
Cc: Vincent Stehlé <vincent.stehle@arm.com>
Tested-by: Vincent Stehlé <vincent.stehle@arm.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                                   |  7 ++
 ...IScsiDxe-Fix-for-out-of-bound-memory-acce.patch | 75 ----------------------
 boot/edk2/Config.in                                | 15 -----
 boot/edk2/edk2.hash                                |  2 +-
 boot/edk2/edk2.mk                                  | 32 ++-------
 package/edk2-non-osi/edk2-non-osi.hash             |  2 +-
 package/edk2-non-osi/edk2-non-osi.mk               |  2 +-
 package/edk2-platforms/edk2-platforms.hash         |  2 +-
 package/edk2-platforms/edk2-platforms.mk           |  2 +-
 support/testing/tests/boot/test_edk2.py            | 15 -----
 10 files changed, 17 insertions(+), 137 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c94bc1a226..e7895e3ef8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_TARGET_EDK2_PLATFORM_SOCIONEXT_DEVELOPERBOX
+	bool "EDK2 Socionext DeveloperBox support has been removed"
+	select BR2_LEGACY
+	help
+	  The Socionext DeveloperBox support has been removed upstream
+	  in EDK2 version edk2-stable202505.
+
 config BR2_PACKAGE_LIBEBUR128
 	bool "libebur128 has been removed"
 	select BR2_LEGACY
diff --git a/boot/edk2/0001-NetworkPkg-IScsiDxe-Fix-for-out-of-bound-memory-acce.patch b/boot/edk2/0001-NetworkPkg-IScsiDxe-Fix-for-out-of-bound-memory-acce.patch
deleted file mode 100644
index 4cc66eb0fe..0000000000
--- a/boot/edk2/0001-NetworkPkg-IScsiDxe-Fix-for-out-of-bound-memory-acce.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 0a3b2a29b96b11fb858974044359c806c6b0a111 Mon Sep 17 00:00:00 2001
-From: Santhosh Kumar V <santhoshkumarv@ami.com>
-Date: Wed, 7 May 2025 18:53:30 +0530
-Subject: [PATCH] NetworkPkg/IScsiDxe:Fix for out of bound memory access for
- bz4207 (CVE-2024-38805)
-
-In IScsiBuildKeyValueList, check if we have any data left (Len > 0) before advancing the Data pointer and reducing Len.
-Avoids wrapping Len. Also Used SafeUint32SubSafeUint32Sub call to reduce the Len .
-
-Upstream: https://github.com/tianocore/edk2/commit/b3a2f7ff24e156e8c4d694fffff01e95a048c536
-Signed-off-by: santhosh kumar V <santhoshkumarv@ami.com>
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- NetworkPkg/IScsiDxe/IScsiProto.c | 29 ++++++++++++++++++++++++-----
- 1 file changed, 24 insertions(+), 5 deletions(-)
-
-diff --git a/NetworkPkg/IScsiDxe/IScsiProto.c b/NetworkPkg/IScsiDxe/IScsiProto.c
-index ef587649a0..53a0ff801d 100644
---- a/NetworkPkg/IScsiDxe/IScsiProto.c
-+++ b/NetworkPkg/IScsiDxe/IScsiProto.c
-@@ -1880,6 +1880,8 @@ IScsiBuildKeyValueList (
- {
-   LIST_ENTRY            *ListHead;
-   ISCSI_KEY_VALUE_PAIR  *KeyValuePair;
-+  EFI_STATUS            Status;
-+  UINT32                Result;
- 
-   ListHead = AllocatePool (sizeof (LIST_ENTRY));
-   if (ListHead == NULL) {
-@@ -1903,9 +1905,14 @@ IScsiBuildKeyValueList (
-       Data++;
-     }
- 
--    if (*Data == '=') {
-+    // Here Len must not be zero.
-+    // The value of Len is size of data buffer. Actually, Data is make up of strings.
-+    // AuthMethod=None\0TargetAlias=LIO Target\0 TargetPortalGroupTag=1\0
-+    // (1) Len == 0, *Data != '=' goto ON_ERROR
-+    // (2) *Data == '=', Len != 0 normal case.
-+    // (3) *Data == '=', Len == 0, Between Data and Len are mismatch, Len isn't all size of data, as error.
-+    if ((Len > 0) && (*Data == '=')) {
-       *Data = '\0';
--
-       Data++;
-       Len--;
-     } else {
-@@ -1915,10 +1922,22 @@ IScsiBuildKeyValueList (
- 
-     KeyValuePair->Value = Data;
- 
--    InsertTailList (ListHead, &KeyValuePair->List);
-+    Status = SafeUint32Add ((UINT32)AsciiStrLen (KeyValuePair->Value), 1, &Result);
-+    if (EFI_ERROR (Status)) {
-+      DEBUG ((DEBUG_ERROR, "%a Memory Overflow is Detected.\n", __func__));
-+      FreePool (KeyValuePair);
-+      goto ON_ERROR;
-+    }
- 
--    Data += AsciiStrLen (KeyValuePair->Value) + 1;
--    Len  -= (UINT32)AsciiStrLen (KeyValuePair->Value) + 1;
-+    Status = SafeUint32Sub (Len, Result, &Len);
-+    if (EFI_ERROR (Status)) {
-+      DEBUG ((DEBUG_ERROR, "%a Out of bound memory access Detected.\n", __func__));
-+      FreePool (KeyValuePair);
-+      goto ON_ERROR;
-+    }
-+
-+    InsertTailList (ListHead, &KeyValuePair->List);
-+    Data += Result;
-   }
- 
-   return ListHead;
--- 
-2.49.0
-
diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
index 4e6e7d122c..635bb0100a 100644
--- a/boot/edk2/Config.in
+++ b/boot/edk2/Config.in
@@ -80,20 +80,6 @@ config BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64
 	  Platform configuration for ARM Versatile Express targeting
 	  the Aarch64 Fixed Virtual Platform (FVP).
 
-config BR2_TARGET_EDK2_PLATFORM_SOCIONEXT_DEVELOPERBOX
-	bool "Socionext DeveloperBox"
-	depends on BR2_aarch64
-	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
-	depends on !BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
-	select BR2_PACKAGE_HOST_DTC
-	select BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP
-	help
-	  Platform configuration for Socionext SynQuacer DeveloperBox
-	  (SC2A11).
-
-comment "Socionext DeveloperBox depends on ATF not using EDK2 as BL33"
-	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
-
 config BR2_TARGET_EDK2_PLATFORM_SOLIDRUN_ARMADA80X0MCBIN
 	bool "SolidRun MacchiatoBin"
 	depends on BR2_aarch64
@@ -141,7 +127,6 @@ config BR2_TARGET_EDK2_FD_NAME
 	default "QEMU_EFI" if BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU_KERNEL
 	default "BL33_AP_UEFI" if BR2_TARGET_EDK2_PLATFORM_ARM_SGI575
 	default "FVP_AARCH64_EFI" if BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64
-	default "FVP_AARCH64_EFI" if BR2_TARGET_EDK2_PLATFORM_SOCIONEXT_DEVELOPERBOX
 	default "ARMADA_EFI" if BR2_TARGET_EDK2_PLATFORM_SOLIDRUN_ARMADA80X0MCBIN
 
 endif
diff --git a/boot/edk2/edk2.hash b/boot/edk2/edk2.hash
index 3410b6edce..68fae47afc 100644
--- a/boot/edk2/edk2.hash
+++ b/boot/edk2/edk2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e3e9ee3662335fac5df1f30f2027cf3c8d776bf2c52a77795a6d80766522e044  edk2-edk2-stable202411-git4.tar.gz
+sha256  e05130e107d476cdec0846f55f22e00fb2cc0030b60fafce464a6cf10134d18d  edk2-edk2-stable202505-git4.tar.gz
 sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index ad88835f8f..36bcbfc88b 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EDK2_VERSION = edk2-stable202411
+EDK2_VERSION = edk2-stable202505
 EDK2_SITE = https://github.com/tianocore/edk2
 EDK2_SITE_METHOD = git
 EDK2_LICENSE = BSD-2-Clause-Patent
@@ -14,9 +14,6 @@ EDK2_DEPENDENCIES = edk2-platforms host-python3 host-acpica host-util-linux
 EDK2_INSTALL_TARGET = NO
 EDK2_INSTALL_IMAGES = YES
 
-# 0001-NetworkPkg-IScsiDxe-Fix-for-out-of-bound-memory-acce.patch
-EDK2_IGNORE_CVES += CVE-2024-38805
-
 ifeq ($(BR2_ENABLE_DEBUG),y)
 EDK2_BUILD_TYPE = DEBUG
 ifeq ($(BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL),y)
@@ -47,10 +44,10 @@ endif
 # Third, where applicable, the dependency direction between EDK2 and
 # ARM Trusted Firmware (ATF) will go in different direction for different
 # platforms. Most commonly, ATF will depend on EDK2 via the BL33 payload.
-# But for some platforms (e.g. QEMU SBSA or DeveloperBox) EDK2 will package
-# the ATF images within its own build system. In such cases, intermediary
-# "EDK2 packages" will be built in $(EDK2_BUILD_PACKAGES) in order for EDK2
-# to be able to use them in subsequent build stages.
+# But for some platforms (e.g. QEMU SBSA) EDK2 will package the ATF
+# images within its own build system. In such cases, intermediary
+# "EDK2 packages" will be built in $(EDK2_BUILD_PACKAGES) in order for
+# EDK2 to be able to use them in subsequent build stages.
 #
 # For more information about the build setup:
 # https://edk2-docs.gitbook.io/edk-ii-build-specification/4_edk_ii_build_process_overview
@@ -97,25 +94,6 @@ EDK2_PACKAGE_NAME = Platform/ARM/VExpressPkg
 EDK2_PLATFORM_NAME = ArmVExpress-FVP-AArch64
 EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
 
-else ifeq ($(BR2_TARGET_EDK2_PLATFORM_SOCIONEXT_DEVELOPERBOX),y)
-EDK2_ARCH = AARCH64
-EDK2_DEPENDENCIES += host-dtc arm-trusted-firmware
-EDK2_PACKAGE_NAME = Platform/Socionext/DeveloperBox
-EDK2_PLATFORM_NAME = DeveloperBox
-EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
-EDK2_BUILD_ENV += DTC_PREFIX=$(HOST_DIR)/bin/
-EDK2_BUILD_OPTS += -D DO_X86EMU=TRUE
-EDK2_PRE_BUILD_HOOKS += EDK2_PRE_BUILD_SOCIONEXT_DEVELOPERBOX
-
-define EDK2_PRE_BUILD_SOCIONEXT_DEVELOPERBOX
-	mkdir -p $(EDK2_BUILD_PACKAGES)/Platform/Socionext/DeveloperBox
-	$(ARM_TRUSTED_FIRMWARE_DIR)/tools/fiptool/fiptool create \
-		--tb-fw $(BINARIES_DIR)/bl31.bin \
-		--soc-fw $(BINARIES_DIR)/bl31.bin \
-		--scp-fw $(BINARIES_DIR)/bl31.bin \
-		$(EDK2_BUILD_PACKAGES)/Platform/Socionext/DeveloperBox/fip_all_arm_tf.bin
-endef
-
 else ifeq ($(BR2_TARGET_EDK2_PLATFORM_SOLIDRUN_ARMADA80X0MCBIN),y)
 EDK2_ARCH = AARCH64
 EDK2_DEPENDENCIES += host-dtc edk2-non-osi
diff --git a/package/edk2-non-osi/edk2-non-osi.hash b/package/edk2-non-osi/edk2-non-osi.hash
index e4e84f1cef..27c8ee632e 100644
--- a/package/edk2-non-osi/edk2-non-osi.hash
+++ b/package/edk2-non-osi/edk2-non-osi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6fe059c4ee5d4fad6245a6eb53ed6b62b8890e9481cfb52c9fbdb83a5b2e0edb  edk2-non-osi-8c09bd0955338db38813e0d8ae1faa634f545f73.tar.gz
+sha256  a726656c45dd1e1698cc2ffd838b143197f6c574725a5c9bf42d1b01ea7f0719  edk2-non-osi-ea2040c2d4e2200557e87b9f9fbd4f8fb7a2b6e8.tar.gz
 sha256  38d73db2f9dfb32e1666d898cb9d7c1ccd78302dd9922d5fac4a9cf61fa872d9  Silicon/Marvell/Armada7k8k/DeviceTree/Armada80x0McBin.inf
diff --git a/package/edk2-non-osi/edk2-non-osi.mk b/package/edk2-non-osi/edk2-non-osi.mk
index d787c882b3..42b45f2475 100644
--- a/package/edk2-non-osi/edk2-non-osi.mk
+++ b/package/edk2-non-osi/edk2-non-osi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with latest commit as of the release date for boot/edk2
-EDK2_NON_OSI_VERSION = 8c09bd0955338db38813e0d8ae1faa634f545f73
+EDK2_NON_OSI_VERSION = ea2040c2d4e2200557e87b9f9fbd4f8fb7a2b6e8
 EDK2_NON_OSI_SITE = $(call github,tianocore,edk2-non-osi,$(EDK2_NON_OSI_VERSION))
 EDK2_NON_OSI_INSTALL_TARGET = NO
 EDK2_NON_OSI_INSTALL_STAGING = YES
diff --git a/package/edk2-platforms/edk2-platforms.hash b/package/edk2-platforms/edk2-platforms.hash
index 4a717a04d4..f98fa8b647 100644
--- a/package/edk2-platforms/edk2-platforms.hash
+++ b/package/edk2-platforms/edk2-platforms.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6185750107616c263ed43157094e6fe2c1bfc1b55a2c9d98b322418784264e73  edk2-platforms-f10cc760cf3f7eb693822de1347e71173944e44a.tar.gz
+sha256  41ce6307a1477e2c9a8f81f3b8f876a48df8d4fa5a13f59eedb4767323475a07  edk2-platforms-92f7d69e8aa31e0ae06d4dabbcee12f4ebdb78ed.tar.gz
 sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/package/edk2-platforms/edk2-platforms.mk b/package/edk2-platforms/edk2-platforms.mk
index 65fcf81a3c..7c5094fdd3 100644
--- a/package/edk2-platforms/edk2-platforms.mk
+++ b/package/edk2-platforms/edk2-platforms.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with latest commit as of the release date for boot/edk2
-EDK2_PLATFORMS_VERSION = f10cc760cf3f7eb693822de1347e71173944e44a
+EDK2_PLATFORMS_VERSION = 92f7d69e8aa31e0ae06d4dabbcee12f4ebdb78ed
 EDK2_PLATFORMS_SITE = $(call github,tianocore,edk2-platforms,$(EDK2_PLATFORMS_VERSION))
 EDK2_PLATFORMS_LICENSE = BSD-2-Clause-Patent
 EDK2_PLATFORMS_LICENSE_FILES = License.txt
diff --git a/support/testing/tests/boot/test_edk2.py b/support/testing/tests/boot/test_edk2.py
index 19c6d9c482..a12c7a6f2b 100644
--- a/support/testing/tests/boot/test_edk2.py
+++ b/support/testing/tests/boot/test_edk2.py
@@ -119,21 +119,6 @@ class TestEdk2BuildArmVexpressFvpAarch64(TestEdk2BuildBase):
         self.assertBinariesExist("FVP_AARCH64_EFI.fd")
 
 
-class TestEdk2BuildSocionextDeveloperbox(TestEdk2BuildBase):
-    config = TestEdk2BuildBase.base_config + \
-        """
-        BR2_aarch64=y
-        BR2_TARGET_EDK2_PLATFORM_SOCIONEXT_DEVELOPERBOX=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="synquacer"
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS="PRELOADED_BL33_BASE=0x8200000"
-        """
-
-    def test_run(self) -> None:
-        self.assertBinariesExist("SPI_NOR_IMAGE.fd", "fip.bin")
-
-
 class TestEdk2BuildQemuSbsa(TestEdk2BuildBase):
     # This configuration is not exactly identical to the configuration built
     # during TestEdk2, as we use the latest arm-trusted-firmware version, among

--===============4600600951078625150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4600600951078625150==--
