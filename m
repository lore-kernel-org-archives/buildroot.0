Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CCBC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F74B84B08;
	Fri, 28 Feb 2025 16:50:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4c_D1Ps-MdMH; Fri, 28 Feb 2025 16:50:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C512A84934
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C512A84934;
	Fri, 28 Feb 2025 16:50:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 091501DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E20642ED0
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jUX7e1yvGkmG for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A264642945
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A264642945
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B7B687C2C; Fri, 28 Feb 2025 16:29:57 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Jan 2025 21:32:03 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2ec27b763bc4e640637fe017b4b94c8da2063f09
X-Git-Newrev: 0919d98e832ae092d868b118e8fc986f1c9485a7
X-Patchwork-Hint: ignore
Message-Id: <20250228162957.9B7B687C2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/edk2: bump to version
 edk2-stable202411
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0919d98e832ae092d868b118e8fc986f1c9485a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Sync edk2-platforms with the last commit merged at the edk2 release
date (2024-11-22).

See:
https://github.com/tianocore/edk2/releases/tag/edk2-stable202411

Runtime tested with tests using EDK2 package: TestFwts, TestEdk2,
TestIso9660Grub2EFI, TestIso9660Grub2Hybrid, TestGrubi386EFI,
TestGrubX8664EFI, TestGrubAArch64EFI, TestGrubRiscV64EFI.

Runtime tested with defconfig using EDK2 package:
qemu_aarch64_sbsa_defconfig, qemu_riscv64_virt_efi_defconfig.

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...uVideoDxe-add-feature-PCD-to-remap-frameb.patch | 129 ---------------------
 boot/edk2/edk2.hash                                |   2 +-
 boot/edk2/edk2.mk                                  |   2 +-
 package/edk2-platforms/edk2-platforms.hash         |   2 +-
 package/edk2-platforms/edk2-platforms.mk           |   2 +-
 5 files changed, 4 insertions(+), 133 deletions(-)

diff --git a/boot/edk2/0001-OvmfPkg-QemuVideoDxe-add-feature-PCD-to-remap-frameb.patch b/boot/edk2/0001-OvmfPkg-QemuVideoDxe-add-feature-PCD-to-remap-frameb.patch
deleted file mode 100644
index 5f6ceb289d..0000000000
--- a/boot/edk2/0001-OvmfPkg-QemuVideoDxe-add-feature-PCD-to-remap-frameb.patch
+++ /dev/null
@@ -1,129 +0,0 @@
-From 921c78f57a16b00debd58899a48e7045015c374b Mon Sep 17 00:00:00 2001
-From: Ard Biesheuvel <ardb@kernel.org>
-Date: Mon, 17 Jun 2024 17:07:41 +0200
-Subject: [PATCH] OvmfPkg/QemuVideoDxe: add feature PCD to remap framebuffer
- W/C
-
-Some platforms (such as SBSA-QEMU on recent builds of the emulator) only
-tolerate misaligned accesses to normal memory, and raise alignment
-faults on such accesses to device memory, which is the default for PCIe
-MMIO BARs.
-
-When emulating a PCIe graphics controller, the framebuffer is typically
-exposed via a MMIO BAR, while the disposition of the region is closer to
-memory (no side effects on reads or writes, except for the changing
-picture on the screen; direct random access to any pixel in the image).
-
-In order to permit the use of such controllers on platforms that only
-tolerate these types of accesses for normal memory, it is necessary to
-remap the memory. Use the DXE services to set the desired capabilities
-and attributes.
-
-Hide this behavior under a feature PCD so only platforms that really
-need it can enable it. (OVMF on x86 has no need for this)
-
-Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
-Upstream: https://github.com/tianocore/edk2/commit/c1d1910be6e04a8b1a73090cf2881fb698947a6e
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- OvmfPkg/OvmfPkg.dec                   |  5 +++++
- OvmfPkg/QemuVideoDxe/Gop.c            | 19 +++++++++++++++++++
- OvmfPkg/QemuVideoDxe/Qemu.h           |  2 +-
- OvmfPkg/QemuVideoDxe/QemuVideoDxe.inf |  4 ++++
- 4 files changed, 29 insertions(+), 1 deletion(-)
-
-diff --git a/OvmfPkg/OvmfPkg.dec b/OvmfPkg/OvmfPkg.dec
-index 51be9a5959..2c40de8a13 100644
---- a/OvmfPkg/OvmfPkg.dec
-+++ b/OvmfPkg/OvmfPkg.dec
-@@ -444,3 +444,8 @@
- 
-   ## This feature flag indicates the firmware build supports secure boot.
-   gUefiOvmfPkgTokenSpaceGuid.PcdSecureBootSupported|FALSE|BOOLEAN|0x6d
-+
-+  ## Whether QemuVideoDxe should perform a EFI_MEMORY_WC remap of the PCI
-+  #  framebuffer. This might be required on platforms that do not tolerate
-+  #  misaligned accesses otherwise.
-+  gUefiOvmfPkgTokenSpaceGuid.PcdRemapFrameBufferWriteCombine|FALSE|BOOLEAN|0x75
-diff --git a/OvmfPkg/QemuVideoDxe/Gop.c b/OvmfPkg/QemuVideoDxe/Gop.c
-index b11eed7558..a29c025afd 100644
---- a/OvmfPkg/QemuVideoDxe/Gop.c
-+++ b/OvmfPkg/QemuVideoDxe/Gop.c
-@@ -9,6 +9,8 @@
- 
- #include "Qemu.h"
- 
-+#include <Library/DxeServicesTableLib.h>
-+
- STATIC
- VOID
- QemuVideoCompleteModeInfo (
-@@ -54,6 +56,7 @@ QemuVideoCompleteModeData (
-   EFI_GRAPHICS_OUTPUT_MODE_INFORMATION  *Info;
-   EFI_ACPI_ADDRESS_SPACE_DESCRIPTOR     *FrameBufDesc;
-   QEMU_VIDEO_MODE_DATA                  *ModeData;
-+  EFI_STATUS                            Status;
- 
-   ModeData = &Private->ModeData[Mode->Mode];
-   Info     = Mode->Info;
-@@ -79,6 +82,22 @@ QemuVideoCompleteModeData (
-     (UINT64)Mode->FrameBufferSize
-     ));
- 
-+  if (FeaturePcdGet (PcdRemapFrameBufferWriteCombine)) {
-+    Status = gDS->SetMemorySpaceCapabilities (
-+                    FrameBufDesc->AddrRangeMin,
-+                    FrameBufDesc->AddrLen,
-+                    EFI_MEMORY_UC | EFI_MEMORY_WC | EFI_MEMORY_XP
-+                    );
-+    ASSERT_EFI_ERROR (Status);
-+
-+    Status = gDS->SetMemorySpaceAttributes (
-+                    FrameBufDesc->AddrRangeMin,
-+                    FrameBufDesc->AddrLen,
-+                    EFI_MEMORY_WC | EFI_MEMORY_XP
-+                    );
-+    ASSERT_EFI_ERROR (Status);
-+  }
-+
-   FreePool (FrameBufDesc);
-   return EFI_SUCCESS;
- }
-diff --git a/OvmfPkg/QemuVideoDxe/Qemu.h b/OvmfPkg/QemuVideoDxe/Qemu.h
-index 57341a0bbf..a3da725fbf 100644
---- a/OvmfPkg/QemuVideoDxe/Qemu.h
-+++ b/OvmfPkg/QemuVideoDxe/Qemu.h
-@@ -13,7 +13,7 @@
- #ifndef _QEMU_H_
- #define _QEMU_H_
- 
--#include <Uefi.h>
-+#include <PiDxe.h>
- #include <Protocol/GraphicsOutput.h>
- #include <Protocol/PciIo.h>
- #include <Protocol/DriverSupportedEfiVersion.h>
-diff --git a/OvmfPkg/QemuVideoDxe/QemuVideoDxe.inf b/OvmfPkg/QemuVideoDxe/QemuVideoDxe.inf
-index 43a6e07faa..4c0870171b 100644
---- a/OvmfPkg/QemuVideoDxe/QemuVideoDxe.inf
-+++ b/OvmfPkg/QemuVideoDxe/QemuVideoDxe.inf
-@@ -44,6 +44,7 @@
- 
- [LibraryClasses]
-   BaseMemoryLib
-+  DxeServicesTableLib
-   FrameBufferBltLib
-   DebugLib
-   DevicePathLib
-@@ -61,6 +62,9 @@
-   gEfiDevicePathProtocolGuid                    # PROTOCOL BY_START
-   gEfiPciIoProtocolGuid                         # PROTOCOL TO_START
- 
-+[FeaturePcd]
-+  gUefiOvmfPkgTokenSpaceGuid.PcdRemapFrameBufferWriteCombine
-+
- [Pcd]
-   gUefiOvmfPkgTokenSpaceGuid.PcdOvmfHostBridgePciDevId
-   gUefiOvmfPkgTokenSpaceGuid.PcdVideoResolutionSource
--- 
-2.45.0
-
diff --git a/boot/edk2/edk2.hash b/boot/edk2/edk2.hash
index abcf3c6b8e..3410b6edce 100644
--- a/boot/edk2/edk2.hash
+++ b/boot/edk2/edk2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4595b9d9d14c06bd03f575e4b7623574a4a874ef465652ecdc224099a5b14fc7  edk2-edk2-stable202405-git4.tar.gz
+sha256  e3e9ee3662335fac5df1f30f2027cf3c8d776bf2c52a77795a6d80766522e044  edk2-edk2-stable202411-git4.tar.gz
 sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index 145a9a80ae..3941d01883 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EDK2_VERSION = edk2-stable202405
+EDK2_VERSION = edk2-stable202411
 EDK2_SITE = https://github.com/tianocore/edk2
 EDK2_SITE_METHOD = git
 EDK2_LICENSE = BSD-2-Clause-Patent
diff --git a/package/edk2-platforms/edk2-platforms.hash b/package/edk2-platforms/edk2-platforms.hash
index 0095d4298d..4a717a04d4 100644
--- a/package/edk2-platforms/edk2-platforms.hash
+++ b/package/edk2-platforms/edk2-platforms.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  41fa720ac644ec0523c576ff28eba5e0308c9649111ce42f7d408b8d8b30eaf5  edk2-platforms-3f08401365d67e10924c774e6c3f64be56bc15b6.tar.gz
+sha256  6185750107616c263ed43157094e6fe2c1bfc1b55a2c9d98b322418784264e73  edk2-platforms-f10cc760cf3f7eb693822de1347e71173944e44a.tar.gz
 sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/package/edk2-platforms/edk2-platforms.mk b/package/edk2-platforms/edk2-platforms.mk
index 23d9221649..65fcf81a3c 100644
--- a/package/edk2-platforms/edk2-platforms.mk
+++ b/package/edk2-platforms/edk2-platforms.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with latest commit as of the release date for boot/edk2
-EDK2_PLATFORMS_VERSION = 3f08401365d67e10924c774e6c3f64be56bc15b6
+EDK2_PLATFORMS_VERSION = f10cc760cf3f7eb693822de1347e71173944e44a
 EDK2_PLATFORMS_SITE = $(call github,tianocore,edk2-platforms,$(EDK2_PLATFORMS_VERSION))
 EDK2_PLATFORMS_LICENSE = BSD-2-Clause-Patent
 EDK2_PLATFORMS_LICENSE_FILES = License.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
