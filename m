Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EDCCCFA1A
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 07:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78825408AB;
	Wed, 12 Nov 2025 07:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OSh3hw4HE_3; Wed, 12 Nov 2025 07:56:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BD14404C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BD14404C3;
	Wed, 12 Nov 2025 07:56:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B253FA
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 07:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D36360D8C
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 07:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2hRwNQlH991z for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 07:56:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A136E60D8A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A136E60D8A
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 07:56:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90B4F842A1; Wed, 12 Nov 2025 07:56:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 12 Nov 2025 08:55:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 235e365059af5f251abee95f88fa1ae16bf8e3d4
X-Git-Newrev: a675057bdab0a981813861d4c9da37d0b259aa55
X-Patchwork-Hint: ignore
Message-Id: <20251112075621.90B4F842A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/edk2: bump to version
 edk2-stable202508
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
Content-Type: multipart/mixed; boundary="===============1811067643013311554=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1811067643013311554==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a675057bdab0a981813861d4c9da37d0b259aa55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes since edk2-stable202505, see:
https://github.com/tianocore/edk2/releases/tag/edk2-stable202508

This commit also updates the edk2-platforms packages with the last
commit merged at the edk2 release date (2025-08-12), which corresponds
to commit [1].
The edk2-non-osi package is not updated because it did not received
any commit since the last edk2 bump.

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
qemu_loongarch64_virt_efi_defconfig
qemu_riscv64_virt_efi_defconfig

[1] https://github.com/tianocore/edk2-platforms/commit/d1b297b2aa693fc723ac883866c925e9d04260c9

Cc: Dick Olsson <hi@senzilla.io>
Cc: Romain Naour <romain.naour@smile.fr>
Cc: Vincent Stehlé <vincent.stehle@arm.com>
Tested-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/edk2/edk2.hash                        | 2 +-
 boot/edk2/edk2.mk                          | 2 +-
 package/edk2-platforms/edk2-platforms.hash | 2 +-
 package/edk2-platforms/edk2-platforms.mk   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/edk2/edk2.hash b/boot/edk2/edk2.hash
index 68fae47afc..a7170a67cc 100644
--- a/boot/edk2/edk2.hash
+++ b/boot/edk2/edk2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e05130e107d476cdec0846f55f22e00fb2cc0030b60fafce464a6cf10134d18d  edk2-edk2-stable202505-git4.tar.gz
+sha256  1e675a98f6bcf81fbae1141779b9e72ec28773d0e5ec77bdcc890f14502615a4  edk2-edk2-stable202508-git4.tar.gz
 sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index 3612c86fb1..05e44c711b 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EDK2_VERSION = edk2-stable202505
+EDK2_VERSION = edk2-stable202508
 EDK2_SITE = https://github.com/tianocore/edk2
 EDK2_SITE_METHOD = git
 EDK2_LICENSE = BSD-2-Clause-Patent
diff --git a/package/edk2-platforms/edk2-platforms.hash b/package/edk2-platforms/edk2-platforms.hash
index f98fa8b647..d088bcc342 100644
--- a/package/edk2-platforms/edk2-platforms.hash
+++ b/package/edk2-platforms/edk2-platforms.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  41ce6307a1477e2c9a8f81f3b8f876a48df8d4fa5a13f59eedb4767323475a07  edk2-platforms-92f7d69e8aa31e0ae06d4dabbcee12f4ebdb78ed.tar.gz
+sha256  4417db79bfb8a9bf601e94e295fec270f99eac3447a6d418ff28ea7dd374d8d6  edk2-platforms-d1b297b2aa693fc723ac883866c925e9d04260c9.tar.gz
 sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/package/edk2-platforms/edk2-platforms.mk b/package/edk2-platforms/edk2-platforms.mk
index 7c5094fdd3..86b9fea960 100644
--- a/package/edk2-platforms/edk2-platforms.mk
+++ b/package/edk2-platforms/edk2-platforms.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with latest commit as of the release date for boot/edk2
-EDK2_PLATFORMS_VERSION = 92f7d69e8aa31e0ae06d4dabbcee12f4ebdb78ed
+EDK2_PLATFORMS_VERSION = d1b297b2aa693fc723ac883866c925e9d04260c9
 EDK2_PLATFORMS_SITE = $(call github,tianocore,edk2-platforms,$(EDK2_PLATFORMS_VERSION))
 EDK2_PLATFORMS_LICENSE = BSD-2-Clause-Patent
 EDK2_PLATFORMS_LICENSE_FILES = License.txt

--===============1811067643013311554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1811067643013311554==--
