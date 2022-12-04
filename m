Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B07C4332F
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 13:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6BBC8176C;
	Sun,  4 Dec 2022 13:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6BBC8176C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5j3g5FKcR8LZ; Sun,  4 Dec 2022 13:03:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA9EA8174C;
	Sun,  4 Dec 2022 13:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA9EA8174C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B8E81BF3B0
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 13:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52E2C403E5
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 13:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52E2C403E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4yqGv350kbHE for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 13:03:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4438F40012
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 13:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4438F40012
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 318B485481; Sun,  4 Dec 2022 13:03:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Dec 2022 13:51:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 95f72fb61aae6a64ea822b535cf9d2c2e01e6fc9
X-Git-Newrev: 17cb635a8a2dde2fbd7b21ba8639862e282027dd
X-Patchwork-Hint: ignore
Message-Id: <20221204130303.318B485481@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/edk2: bump version to
 edk2-stable202208
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8480941207808665544=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8480941207808665544==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=17cb635a8a2dde2fbd7b21ba8639862e282027dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The Marvell Armada Devicetree files have been moved out of edk2-platforms
by commit 4b53da6b12a8 ("Marvell/Armada7k8k: Remove device tree sources
from edk2-platforms") and they are now in edk2-non-osi.
Therefore update the MACCHIATObin recipe to depend on the new edk2-non-osi
package and rework a bit the packages path to support that.

Also, drop the backported patch as it is not necessary anymore.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Dick Olsson <hi@senzilla.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ModulePkg-UsbBusDxe-fix-NOOPT-build-error.patch | 48 ----------------------
 boot/edk2/Config.in                                |  1 +
 boot/edk2/edk2.hash                                |  2 +-
 boot/edk2/edk2.mk                                  |  9 ++--
 4 files changed, 8 insertions(+), 52 deletions(-)

diff --git a/boot/edk2/0001-MdeModulePkg-UsbBusDxe-fix-NOOPT-build-error.patch b/boot/edk2/0001-MdeModulePkg-UsbBusDxe-fix-NOOPT-build-error.patch
deleted file mode 100644
index f4f1b1565a..0000000000
--- a/boot/edk2/0001-MdeModulePkg-UsbBusDxe-fix-NOOPT-build-error.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 59aa67f7a4d8efc564b46fe467aaf6eccec17183 Mon Sep 17 00:00:00 2001
-From: Gerd Hoffmann <kraxel@redhat.com>
-Date: Mon, 20 Dec 2021 22:32:38 +0800
-Subject: [PATCH] MdeModulePkg/UsbBusDxe: fix NOOPT build error
-
-gcc-11 (fedora 35):
-
-/home/kraxel/projects/edk2/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbBus.c: In function ?UsbIoBulkTransfer?:
-/home/kraxel/projects/edk2/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbBus.c:277:12: error: ?UsbHcBulkTransfer? accessing 80 bytes in a region of size 8 [-Werror=stringop-overflow=]
-
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-Reviewed-by: Hao A Wu <hao.a.wu@intel.com>
-(cherry picked from commit ae8272ef787d80950803c521a13a308651bdc62e)
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.c | 2 +-
- MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.h | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.c b/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.c
-index 7529e03e85..b2ce97ca37 100644
---- a/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.c
-+++ b/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.c
-@@ -285,7 +285,7 @@ UsbHcBulkTransfer (
-   IN  UINT8                               DevSpeed,
-   IN  UINTN                               MaxPacket,
-   IN  UINT8                               BufferNum,
--  IN  OUT VOID                            *Data[EFI_USB_MAX_BULK_BUFFER_NUM],
-+  IN  OUT VOID                            *Data[],
-   IN  OUT UINTN                           *DataLength,
-   IN  OUT UINT8                           *DataToggle,
-   IN  UINTN                               TimeOut,
-diff --git a/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.h b/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.h
-index 1d2b8a6174..1316a5981f 100644
---- a/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.h
-+++ b/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.h
-@@ -149,7 +149,7 @@ UsbHcBulkTransfer (
-   IN  UINT8                               DevSpeed,
-   IN  UINTN                               MaxPacket,
-   IN  UINT8                               BufferNum,
--  IN  OUT VOID                            *Data[EFI_USB_MAX_BULK_BUFFER_NUM],
-+  IN  OUT VOID                            *Data[],
-   IN  OUT UINTN                           *DataLength,
-   IN  OUT UINT8                           *DataToggle,
-   IN  UINTN                               TimeOut,
--- 
-2.35.3
-
diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
index df723122ee..855a62f70b 100644
--- a/boot/edk2/Config.in
+++ b/boot/edk2/Config.in
@@ -88,6 +88,7 @@ config BR2_TARGET_EDK2_PLATFORM_SOLIDRUN_ARMADA80X0MCBIN
 	bool "SolidRun MacchiatoBin"
 	depends on BR2_aarch64
 	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
+	select BR2_PACKAGE_EDK2_NON_OSI
 	select BR2_PACKAGE_HOST_DTC
 	select BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP
 	help
diff --git a/boot/edk2/edk2.hash b/boot/edk2/edk2.hash
index f28e9ce841..94ee22ddc4 100644
--- a/boot/edk2/edk2.hash
+++ b/boot/edk2/edk2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  04791c13b414a6d1877182a6d565cb762c30aa63e49bb4d495fca68ef4dd209d  edk2-edk2-stable202102-br1.tar.gz
+sha256  c10520f269557d566e35fe8104141aa2865f9085ad2b3a30aae8a7e78a3ca5aa  edk2-edk2-stable202208-br1.tar.gz
 sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index 5cbd9d152e..c377b49877 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EDK2_VERSION = edk2-stable202102
+EDK2_VERSION = edk2-stable202208
 EDK2_SITE = https://github.com/tianocore/edk2
 EDK2_SITE_METHOD = git
 EDK2_LICENSE = BSD-2-Clause
@@ -47,7 +47,7 @@ endif
 
 EDK2_GIT_SUBMODULES = YES
 EDK2_BUILD_PACKAGES = $(@D)/Build/Buildroot
-EDK2_PACKAGES_PATH = $(@D):$(EDK2_BUILD_PACKAGES):$(STAGING_DIR)/usr/share/edk2-platforms
+EDK2_PACKAGES_PATHS = $(@D) $(EDK2_BUILD_PACKAGES) $(STAGING_DIR)/usr/share/edk2-platforms
 
 ifeq ($(BR2_TARGET_EDK2_PLATFORM_OVMF_I386),y)
 EDK2_ARCH = IA32
@@ -102,12 +102,13 @@ endef
 
 else ifeq ($(BR2_TARGET_EDK2_PLATFORM_SOLIDRUN_ARMADA80X0MCBIN),y)
 EDK2_ARCH = AARCH64
-EDK2_DEPENDENCIES += host-dtc arm-trusted-firmware
+EDK2_DEPENDENCIES += host-dtc arm-trusted-firmware edk2-non-osi
 EDK2_PACKAGE_NAME = Platform/SolidRun/Armada80x0McBin
 EDK2_PLATFORM_NAME = Armada80x0McBin
 EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)-$(EDK2_ARCH)
 EDK2_BUILD_ENV += DTC_PREFIX=$(HOST_DIR)/bin/
 EDK2_BUILD_OPTS += -D INCLUDE_TFTP_COMMAND
+EDK2_PACKAGES_PATHS += $(STAGING_DIR)/usr/share/edk2-non-osi
 
 else ifeq ($(BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA),y)
 EDK2_ARCH = AARCH64
@@ -128,6 +129,8 @@ EDK2_BASETOOLS_OPTS = \
 	EXTRA_LDFLAGS="$(HOST_LDFLAGS)" \
 	EXTRA_OPTFLAGS="$(HOST_CPPFLAGS)"
 
+EDK2_PACKAGES_PATH = $(subst $(space),:,$(strip $(EDK2_PACKAGES_PATHS)))
+
 EDK2_BUILD_ENV += \
 	WORKSPACE=$(@D) \
 	PACKAGES_PATH=$(EDK2_PACKAGES_PATH) \

--===============8480941207808665544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8480941207808665544==--
