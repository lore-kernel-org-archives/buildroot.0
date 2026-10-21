Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31080606A31E
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hZkwdGWH
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09C2F80BFE;
	Wed, 21 Oct 2026 19:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NkyCKTPz-Rw8; Wed, 21 Oct 2026 19:29:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 802AB82080
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792610995;
	b=hmaWJGSjVAE/JKbzWvBErq3Ab97kwJBWt9kToAT/jII1RKD774A9xsc/cRytKJPQZ3s/
	 qgxD4mriL+UDSnjbAJbS7iPN9eM+cr624C/HuMmnvAeyTS42E9lawPqEfHW/0u8sHKhVV
	 lJVSJfnZPInBfi6r0GAXiIk8L8XJYrf6cM0rtB7Dtcv5kPX7eRkbzuvo9B/386w1kMYZG
	 3be2ycL+5W1L2eArnXjzsRM3hzd3iPtedAkkqLm+MtKIFd4xhcUKKhMk0yEaxaE4Nn5BG
	 4tDzLpB4iMjrHTeGqthotH7+DHb75QcIiRKyd4Hbg+mbytBRZUJ34MoaMqyN/OOMU1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792610995;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=O1xwQg4zINcryzbG7FAgJfJy1HKh7nDdtJ40QZwEt8w=;
	b=tMtUA0tyZPlzooHduh+jjtlHZIq0qnDZ0Ccv4m3PZHqEoQjh7r6KUybRF41x5AlBZvDb
	 A2hly+F9UoLwjmE3XjNTWpNe3cc85RtmEj1g5MdCB/CGpR0nAat5LtNf+hAn3iA+ZD6sc
	 rtza/6VOFvLB8FrHcZUiGx6EYFUPIOw8L3geTLKaBkKokuLfuwtfTZ/XrpHn13pfReaH+
	 F8GcNcRUwEbfGxIOugR4opRPbQ6a7lHLRXRtb/4xAX5kx0w95O7fet6v6vytVZPDU8uDd
	 jkGSzf6wKDc0PUBlRdO14oaHutikUQqxXsXv4UYP8Watm4cifYXmodOC6Amcf1SQeKw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792610995;
	bh=O1xwQg4zINcryzbG7FAgJfJy1HKh7nDdtJ40QZwEt8w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hZkwdGWHlfcJKdmTld2qSQekkB6+TuJ3mywJuBjGjnZ8ReqFbj6tSy2qQmS5X+JQn
	 EctcALBM2TQ/j0tEDe7oZFaJja2HVPLHZXKK/40McSe92YxFIO3iPgj6ZDkSTbKF40
	 aobB2CywLLdf2QEbsbJPReX8ONIbc/b9xKTS6O3aiOV8/9QriZrBGOzvUMtON/GdMB
	 z2nvZIv1LUI2i/ixTjQxOklOEnxf4cWcM7NRsEMe/C+FS/Y1ESX5AX1n9qBwYJCF1x
	 PrHp99CsLE2qAHJEh6pBl/xnzO5cvpXuxv+0AVWv48j5Vx5xJBthTc3mcfBK5IkBD9
	 W0Kcfh23cnfQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 802AB82080;
	Wed, 21 Oct 2026 19:29:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E2FD695C
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4CBD60FDD
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aAywawPl-CJB for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:29:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B28FB60B15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792610991;
 b=kTY6w+I6kWvFKGDToXDRsIt8UV/fIfEU0TvnfFjJ6EenvHUbnD4Z6jr9md35BbkI1CuH
 /jxcg2Y0A0QVMObCbtkvJ6QMIc4gtPZc5PEqjQS1XXlaf5vipRZ7J3+A4AtCyytQz5T3u
 Li04RmKedGK2wabtPRdv7xxByEPuDLPUmQXWWZ0Pp5BPnfxg15Lsg+J0WtZlr2kpo9w4w
 dAD3PlqtlmeiDOE81QHc+KLPSZ9MNAzsI8+/CKi28gF74jFZAXwYMv8yNdPT7v4OR0AqN
 4sKAjJPazarhsuy10khMinBG4uzW/95ZiJJHg4ROsLL02GM+Q50xK/qNYukqG/RgS7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792610991;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=anmAdod5Sn9EbW4+b0F/1aPTtWYnq52TFpaHAOQ+DnQ=;
 b=fkzOZvDKdq8mW6k1R9Uz9Ux3xo5KdjexTKRiZGBpqZByuUsm8SlApwBB0UkuWoYEgP9n
 y3sCLc/+SpHrEUVoHAIIj5fYywQIdhJsuU3mk3oe8PBb9oHLW71YfIGHY0vKgdr6Jwwbo
 d9h4Y60ldB0sZz60aFpFGT2XSMJX+QP+KT7cjhw2g7T1Y2IxchpUOtUqQN/+VMCU8EAF0
 p9b4keU9iXpsRZ+gm3NKHpbc9NRCc7LMlZF7FGHKPh/kQwSEB2RjuVDswYPsWF156fxTJ
 mHN8ijRFgqnr7kL6IS1pMiyORUfD/Cf+Fef9p/zJPkYXPRknrenwcbL+ga6N1izVOXQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B28FB60B15
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:29:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DACE99AEF; Wed, 21 Oct 2026 19:28:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 21:29:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2121608f627a4886833610c29ebabd6fa95a0869
X-Git-Newrev: 2260627613cb7b49518f94ea2657c44b0ed535c7
X-Patchwork-Hint: ignore
Message-Id: <20261021192828.0DACE99AEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/edk2: bump to version
 edk2-stable202608
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4161340968329343903=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4161340968329343903==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2260627613cb7b49518f94ea2657c44b0ed535c7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release notes since edk-stable202602, see [1] and [2].

The "GCC5" toolchain was marked as deprecated in upstream commit [3]
(first included in release edk2-stable202305), and then removed in
upstream commit [4] (first included in release edk2-stable202605).
The toolchain is now simply named "GCC". This commit reflects that
change.

This commit removes the edk2 package patch, which is included in
this new version.

This commit also updates the edk2-platforms packages with the last
commit merged at the edk2 release date (2026-08-12), which
corresponds to commit [5]. The edk2-non-osi package is also updated
the same way, which corresponds to commit [6].

This commit also removes the ARM SGI-575 platform support, which was
removed upstream in commit [7].

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

[1] https://github.com/tianocore/edk2/releases/tag/edk2-stable202605
[2] https://github.com/tianocore/edk2/releases/tag/edk2-stable202608
[3] https://github.com/tianocore/edk2/commit/0fc07b1c6a491fa1e81daed6cfc2ec33c8cac973
[4] https://github.com/tianocore/edk2/commit/bdadb269e379cb32281fb7434ebb8f8d1b9e0b60
[5] https://github.com/tianocore/edk2-platforms/commit/f8dbb5c603302dc661f572b560bdb34f7db6edb5
[6] https://github.com/tianocore/edk2-non-osi/commit/7ac12d81e02b323bffdf1ef3c188ea33c2185c91
[7] https://github.com/tianocore/edk2-platforms/commit/6e1048980f44252fc61ec7bb4899488c1494c6cc

Cc: Dick Olsson <hi@senzilla.io>
Cc: Romain Naour <romain.naour@smile.fr>
Cc: Vincent Stehlé <vincent.stehle@arm.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   |  7 ++++
 ...ource-C-VfrCompile-Fix-parallel-make-fail.patch | 48 ----------------------
 boot/edk2/Config.in                                |  8 ----
 boot/edk2/edk2.hash                                |  2 +-
 boot/edk2/edk2.mk                                  | 14 ++-----
 package/edk2-non-osi/edk2-non-osi.hash             |  2 +-
 package/edk2-non-osi/edk2-non-osi.mk               |  2 +-
 package/edk2-platforms/edk2-platforms.hash         |  2 +-
 package/edk2-platforms/edk2-platforms.mk           |  2 +-
 support/testing/tests/boot/test_edk2.py            | 11 -----
 10 files changed, 16 insertions(+), 82 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index db320ea981..d94041edd4 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_TARGET_EDK2_PLATFORM_ARM_SGI575
+	bool "EDK2 platform ARM SGI-575 has been removed"
+	select BR2_LEGACY
+	help
+	  The EDK2 platform configuration for ARM SGI-575 has been
+	  removed.
+
 config BR2_PACKAGE_IFENSLAVE
 	bool "ifenslave"
 	select BR2_LEGACY
diff --git a/boot/edk2/0001-BaseTools-Source-C-VfrCompile-Fix-parallel-make-fail.patch b/boot/edk2/0001-BaseTools-Source-C-VfrCompile-Fix-parallel-make-fail.patch
deleted file mode 100644
index 020d3d7467..0000000000
--- a/boot/edk2/0001-BaseTools-Source-C-VfrCompile-Fix-parallel-make-fail.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 3d3af4812d29c5527e5a701d2cb7aff671fdc182 Mon Sep 17 00:00:00 2001
-From: Michael D Kinney <michael.d.kinney@intel.com>
-Date: Tue, 24 Feb 2026 21:50:20 -0800
-Subject: [PATCH] BaseTools/Source/C/VfrCompile: Fix parallel make failures
-
-Update makefile rules to run antlr and dlg to completion
-before compiling any of the generated cpp files.
-
-Without this change, parallel make may start compiling some
-of the cpp files before both antlr and dlg have finished
-which produces syntax errors from compilation with partially
-generated files.
-
-Also use &: so the targets are treated as a group and the
-rule is only executed once for the entire group. Without
-this change, parallel make may run the rule actions more
-than once and modify the output while it is being used by
-another rule.
-
-Upstream: https://github.com/tianocore/edk2/commit/9fc0aca51e83afda703963ea177feeb78a125cbc
-Signed-off-by: Michael D Kinney <michael.d.kinney@intel.com>
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- BaseTools/Source/C/VfrCompile/GNUmakefile | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/BaseTools/Source/C/VfrCompile/GNUmakefile b/BaseTools/Source/C/VfrCompile/GNUmakefile
-index b469bd3f30..4f10b1d933 100644
---- a/BaseTools/Source/C/VfrCompile/GNUmakefile
-+++ b/BaseTools/Source/C/VfrCompile/GNUmakefile
-@@ -54,10 +54,11 @@ VfrCompiler.o: ../Include/Common/BuildVersion.h
- 
- include $(MAKEROOT)/Makefiles/footer.makefile
- 
--VfrSyntax.cpp EfiVfrParser.cpp EfiVfrParser.h VfrParser.dlg VfrTokens.h: Pccts/antlr/antlr VfrSyntax.g
--	Pccts/antlr/antlr -CC -e3 -ck 3 -k 2 -fl VfrParser.dlg -ft VfrTokens.h -o . VfrSyntax.g
-+ANTLR_GEN = VfrSyntax.cpp EfiVfrParser.cpp EfiVfrParser.h VfrParser.dlg VfrTokens.h
-+DLG_GEN = VfrLexer.cpp VfrLexer.h
- 
--VfrLexer.cpp VfrLexer.h: Pccts/dlg/dlg VfrParser.dlg
-+$(ANTLR_GEN) $(DLG_GEN) &: Pccts/antlr/antlr Pccts/dlg/dlg VfrSyntax.g
-+	Pccts/antlr/antlr -CC -e3 -ck 3 -k 2 -fl VfrParser.dlg -ft VfrTokens.h -o . VfrSyntax.g
- 	Pccts/dlg/dlg -C2 -i -CC -cl VfrLexer -o . VfrParser.dlg
- 
- Pccts/antlr/antlr:
--- 
-2.53.0
-
diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
index 92dbb34a06..2f4737fab9 100644
--- a/boot/edk2/Config.in
+++ b/boot/edk2/Config.in
@@ -71,13 +71,6 @@ config BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU_KERNEL
 	  the Linux boot protocol. It can therefore be loaded by a
 	  previous bootloader like ARM Trusted Firmware or OP-TEE.
 
-config BR2_TARGET_EDK2_PLATFORM_ARM_SGI575
-	bool "ARM SGI-575"
-	depends on BR2_aarch64
-	help
-	  Platform configuration for ARM SGI-575 on ARM's
-	  Fixed Virtual Platform (FVP).
-
 config BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64
 	bool "ARM VExpress FVP Aarch64"
 	depends on BR2_aarch64
@@ -144,7 +137,6 @@ config BR2_TARGET_EDK2_FD_NAME
 	default "QEMU_EFI" if BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU
 	default "QEMU_EFI" if BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU_KERNEL
 	default "QEMU_EFI" if BR2_TARGET_EDK2_PLATFORM_OVMF_LOONGARCH64
-	default "BL33_AP_UEFI" if BR2_TARGET_EDK2_PLATFORM_ARM_SGI575
 	default "FVP_AARCH64_EFI" if BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64
 	default "ARMADA_EFI" if BR2_TARGET_EDK2_PLATFORM_SOLIDRUN_ARMADA80X0MCBIN
 
diff --git a/boot/edk2/edk2.hash b/boot/edk2/edk2.hash
index ab9bbcf7ef..6bbad3164c 100644
--- a/boot/edk2/edk2.hash
+++ b/boot/edk2/edk2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a44b47f2d233213cdb848206bda8d475b264ed1a2cf097ae9cd82581e4aa2090  edk2-edk2-stable202602-git4.tar.gz
+sha256  f0f0ee66d147c408194f406f65d62cc6be490a9403909cd7b6e7082fbc2bbc84  edk2-edk2-stable202608-git4.tar.gz
 sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index 11d9b90e7f..81a9dfddd3 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EDK2_VERSION = edk2-stable202602
+EDK2_VERSION = edk2-stable202608
 EDK2_SITE = https://github.com/tianocore/edk2
 EDK2_SITE_METHOD = git
 EDK2_LICENSE = BSD-2-Clause-Patent
@@ -75,12 +75,6 @@ EDK2_PACKAGE_NAME = ArmVirtPkg
 EDK2_PLATFORM_NAME = ArmVirtQemuKernel
 EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)-AArch64
 
-else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_SGI575),y)
-EDK2_ARCH = AARCH64
-EDK2_PACKAGE_NAME = Platform/ARM/SgiPkg/Sgi575
-EDK2_PLATFORM_NAME = Sgi575
-EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
-
 else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64),y)
 EDK2_ARCH = AARCH64
 EDK2_PACKAGE_NAME = Platform/ARM/VExpressPkg
@@ -142,10 +136,10 @@ EDK2_BUILD_ENV += \
 	PYTHON_COMMAND=$(HOST_DIR)/bin/python3 \
 	IASL_PREFIX=$(HOST_DIR)/bin/ \
 	NASM_PREFIX=$(HOST_DIR)/bin/ \
-	GCC5_$(EDK2_ARCH)_PREFIX=$(TARGET_CROSS)
+	GCC_$(EDK2_ARCH)_PREFIX=$(TARGET_CROSS)
 
 EDK2_BUILD_OPTS += \
-	-t GCC5 \
+	-t GCC \
 	-n $(BR2_JLEVEL) \
 	-a $(EDK2_ARCH) \
 	-b $(EDK2_BUILD_TYPE) \
@@ -162,7 +156,7 @@ define EDK2_BUILD_CMDS
 endef
 
 define EDK2_INSTALL_IMAGES_CMDS
-	cp -f $(@D)/Build/$(EDK2_BUILD_DIR)/$(EDK2_BUILD_TYPE)_GCC5/FV/*.fd $(BINARIES_DIR)
+	cp -f $(@D)/Build/$(EDK2_BUILD_DIR)/$(EDK2_BUILD_TYPE)_GCC/FV/*.fd $(BINARIES_DIR)
 endef
 
 $(eval $(generic-package))
diff --git a/package/edk2-non-osi/edk2-non-osi.hash b/package/edk2-non-osi/edk2-non-osi.hash
index b80937256a..9903a79aea 100644
--- a/package/edk2-non-osi/edk2-non-osi.hash
+++ b/package/edk2-non-osi/edk2-non-osi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  922e72db9e3930907d27ca49dc762e6cb9236d4fba8a90b0f3a321bee9efed52  edk2-non-osi-94d048981116e2e3eda52dad1a89958ee404098d.tar.gz
+sha256  dd60de74cc47c1dd408b106e1403116ef10cc29102b01a2dec364abe107874ed  edk2-non-osi-7ac12d81e02b323bffdf1ef3c188ea33c2185c91.tar.gz
 sha256  38d73db2f9dfb32e1666d898cb9d7c1ccd78302dd9922d5fac4a9cf61fa872d9  Silicon/Marvell/Armada7k8k/DeviceTree/Armada80x0McBin.inf
diff --git a/package/edk2-non-osi/edk2-non-osi.mk b/package/edk2-non-osi/edk2-non-osi.mk
index 57c8fca821..48b34bcdcd 100644
--- a/package/edk2-non-osi/edk2-non-osi.mk
+++ b/package/edk2-non-osi/edk2-non-osi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with latest commit as of the release date for boot/edk2
-EDK2_NON_OSI_VERSION = 94d048981116e2e3eda52dad1a89958ee404098d
+EDK2_NON_OSI_VERSION = 7ac12d81e02b323bffdf1ef3c188ea33c2185c91
 EDK2_NON_OSI_SITE = $(call github,tianocore,edk2-non-osi,$(EDK2_NON_OSI_VERSION))
 EDK2_NON_OSI_INSTALL_TARGET = NO
 EDK2_NON_OSI_INSTALL_STAGING = YES
diff --git a/package/edk2-platforms/edk2-platforms.hash b/package/edk2-platforms/edk2-platforms.hash
index 31b84cf05a..e2b2bf887e 100644
--- a/package/edk2-platforms/edk2-platforms.hash
+++ b/package/edk2-platforms/edk2-platforms.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f06674ea8cebd2547acbff0245226bf97159d52df930b6161c4169ef0fa41215  edk2-platforms-23625e812490e6cf66ab9e74972c6a5129bf3e2a.tar.gz
+sha256  c58167ae3f2c1787c781b74777d2084276b982ea8ad0f517a46a05f31925ccf7  edk2-platforms-f8dbb5c603302dc661f572b560bdb34f7db6edb5.tar.gz
 sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/package/edk2-platforms/edk2-platforms.mk b/package/edk2-platforms/edk2-platforms.mk
index cad3ccc5d2..b7cd29784a 100644
--- a/package/edk2-platforms/edk2-platforms.mk
+++ b/package/edk2-platforms/edk2-platforms.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with latest commit as of the release date for boot/edk2
-EDK2_PLATFORMS_VERSION = 23625e812490e6cf66ab9e74972c6a5129bf3e2a
+EDK2_PLATFORMS_VERSION = f8dbb5c603302dc661f572b560bdb34f7db6edb5
 EDK2_PLATFORMS_SITE = $(call github,tianocore,edk2-platforms,$(EDK2_PLATFORMS_VERSION))
 EDK2_PLATFORMS_LICENSE = BSD-2-Clause-Patent
 EDK2_PLATFORMS_LICENSE_FILES = License.txt
diff --git a/support/testing/tests/boot/test_edk2.py b/support/testing/tests/boot/test_edk2.py
index 452697e085..7b6b2b66f6 100644
--- a/support/testing/tests/boot/test_edk2.py
+++ b/support/testing/tests/boot/test_edk2.py
@@ -98,17 +98,6 @@ class TestEdk2BuildArmVirtQemuKernel(TestEdk2BuildBase):
         self.assertBinariesExist("QEMU_EFI.fd", "QEMU_VARS.fd")
 
 
-class TestEdk2BuildArmSgi575(TestEdk2BuildBase):
-    config = TestEdk2BuildBase.base_config + \
-        """
-        BR2_aarch64=y
-        BR2_TARGET_EDK2_PLATFORM_ARM_SGI575=y
-        """
-
-    def test_run(self) -> None:
-        self.assertBinariesExist("BL33_AP_UEFI.fd")
-
-
 class TestEdk2BuildArmVexpressFvpAarch64(TestEdk2BuildBase):
     config = TestEdk2BuildBase.base_config + \
         """

--===============4161340968329343903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4161340968329343903==--
