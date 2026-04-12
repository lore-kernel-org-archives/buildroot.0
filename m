Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFDEE937E3
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 14:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCE87402D3;
	Sun, 12 Apr 2026 14:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iZnndYWm_55G; Sun, 12 Apr 2026 14:09:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA650403B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776002997;
	bh=Qk7ET1T6Psay9jJFXSTXXPLDM4cbH8j1Hwnwryq716s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fgjF/+FF8rfrNFWqYSO7uJ8tU+4EUbXtG0zRu7zhh8ou8f4qU3r6x8OTszgq5iBNL
	 K2woofaRaYaDEdF4K3YppVkGGIku7WoZpoFeJEoqpXXBZBar9/Sl0V1QptoZ8IOehJ
	 2jzr21+6qn9jeWtx4PvDxeDIEDNgls2jOuAxPxkcDvIfi4O/53ZYQi04PJgLVDr0Gq
	 4M8fsl44F5TdQKr9n+XBcXCXqCJbc+jNLSsR0MfZXK5+UwiqqyOe6vdNcJz+rxO1Y4
	 dzKeTDfiWqUCmkPkTvQSfe/6bXRSOiCB36H9KlEqeJmqpXNyVw8dRy1BoO8eww2atD
	 KyYEkxqvCROjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA650403B4;
	Sun, 12 Apr 2026 14:09:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C5ABC237
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 14:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B74FA60758
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 14:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Brdegoe7vtWb for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 14:09:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D51D560717
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D51D560717
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 14:09:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6703B81057; Sun, 12 Apr 2026 14:09:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Apr 2026 15:53:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2078ff1c32d13d8177dce96d4f3be4e116ff82a5
X-Git-Newrev: c672b9499ec8d125495831d693650c304a64cd86
X-Patchwork-Hint: ignore
Message-Id: <20260412140955.6703B81057@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/edk2: bump to version
 edk2-stable202602
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
Content-Type: multipart/mixed; boundary="===============3055144555971171638=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3055144555971171638==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c672b9499ec8d125495831d693650c304a64cd86
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release notes since edk2-stable202511, see:
https://github.com/tianocore/edk2/releases/tag/edk2-stable202602

This commit also updates the edk2-platforms packages with the last
commit merged at the edk2 release date (2026-02-13), which corresponds
to commit [1].
The edk2-non-osi package is not updated because it did not received
any commit since the last edk2 bump.

The commit removes the package patch 0001 which is included in
this new version. It also adds a new patch to fix parallel build
failures with a large number (>16) of processors. See:
https://github.com/tianocore/edk2/pull/12199

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

[1] https://github.com/tianocore/edk2-platforms/commit/23625e812490e6cf66ab9e74972c6a5129bf3e2a

Cc: Dick Olsson <hi@senzilla.io>
Cc: Romain Naour <romain.naour@smile.fr>
Cc: Vincent Stehlé <vincent.stehle@arm.com>
Tested-by: Julien Olivain <ju.o@free.fr>
Tested-by: Vincent Stehlé <vincent.stehle@arm.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...001-BaseTools-EfiRom-fix-compiler-warning.patch | 46 ---------------------
 ...ource-C-VfrCompile-Fix-parallel-make-fail.patch | 48 ++++++++++++++++++++++
 boot/edk2/edk2.hash                                |  2 +-
 boot/edk2/edk2.mk                                  |  2 +-
 package/edk2-platforms/edk2-platforms.hash         |  2 +-
 package/edk2-platforms/edk2-platforms.mk           |  2 +-
 6 files changed, 52 insertions(+), 50 deletions(-)

diff --git a/boot/edk2/0001-BaseTools-EfiRom-fix-compiler-warning.patch b/boot/edk2/0001-BaseTools-EfiRom-fix-compiler-warning.patch
deleted file mode 100644
index c1e688cfe0..0000000000
--- a/boot/edk2/0001-BaseTools-EfiRom-fix-compiler-warning.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 9af06ef3cbb052b142f9660c2c01e7aeb401300c Mon Sep 17 00:00:00 2001
-From: Gerd Hoffmann <kraxel@redhat.com>
-Date: Mon, 8 Dec 2025 10:28:50 +0100
-Subject: [PATCH] BaseTools/EfiRom: fix compiler warning
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-New warning after updating gcc:
-
-EfiRom.c: In function ‘main’:
-EfiRom.c:78:17: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
-
-The assigned value is not used, so fix the warning by just removing it.
-
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-Upstream: https://github.com/tianocore/edk2/commit/9af06ef3cbb052b142f9660c2c01e7aeb401300c
-Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
----
- BaseTools/Source/C/EfiRom/EfiRom.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/BaseTools/Source/C/EfiRom/EfiRom.c b/BaseTools/Source/C/EfiRom/EfiRom.c
-index fa7bf0e62e..6e903b3504 100644
---- a/BaseTools/Source/C/EfiRom/EfiRom.c
-+++ b/BaseTools/Source/C/EfiRom/EfiRom.c
-@@ -44,7 +44,6 @@ Returns:
-   FILE_LIST *FList;
-   UINT32    TotalSize;
-   UINT32    Size;
--  CHAR8     *Ptr0;
- 
-   SetUtilityName(UTILITY_NAME);
- 
-@@ -75,7 +74,7 @@ Returns:
-   //
-   if (mOptions.DumpOption == 1) {
-     if (mOptions.FileList != NULL) {
--      if ((Ptr0 = strstr ((CONST CHAR8 *) mOptions.FileList->FileName, DEFAULT_OUTPUT_EXTENSION)) != NULL) {
-+      if (strstr ((CONST CHAR8 *) mOptions.FileList->FileName, DEFAULT_OUTPUT_EXTENSION) != NULL) {
-         DumpImage (mOptions.FileList);
-         goto BailOut;
-       } else {
--- 
-2.53.0
-
diff --git a/boot/edk2/0001-BaseTools-Source-C-VfrCompile-Fix-parallel-make-fail.patch b/boot/edk2/0001-BaseTools-Source-C-VfrCompile-Fix-parallel-make-fail.patch
new file mode 100644
index 0000000000..020d3d7467
--- /dev/null
+++ b/boot/edk2/0001-BaseTools-Source-C-VfrCompile-Fix-parallel-make-fail.patch
@@ -0,0 +1,48 @@
+From 3d3af4812d29c5527e5a701d2cb7aff671fdc182 Mon Sep 17 00:00:00 2001
+From: Michael D Kinney <michael.d.kinney@intel.com>
+Date: Tue, 24 Feb 2026 21:50:20 -0800
+Subject: [PATCH] BaseTools/Source/C/VfrCompile: Fix parallel make failures
+
+Update makefile rules to run antlr and dlg to completion
+before compiling any of the generated cpp files.
+
+Without this change, parallel make may start compiling some
+of the cpp files before both antlr and dlg have finished
+which produces syntax errors from compilation with partially
+generated files.
+
+Also use &: so the targets are treated as a group and the
+rule is only executed once for the entire group. Without
+this change, parallel make may run the rule actions more
+than once and modify the output while it is being used by
+another rule.
+
+Upstream: https://github.com/tianocore/edk2/commit/9fc0aca51e83afda703963ea177feeb78a125cbc
+Signed-off-by: Michael D Kinney <michael.d.kinney@intel.com>
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ BaseTools/Source/C/VfrCompile/GNUmakefile | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/BaseTools/Source/C/VfrCompile/GNUmakefile b/BaseTools/Source/C/VfrCompile/GNUmakefile
+index b469bd3f30..4f10b1d933 100644
+--- a/BaseTools/Source/C/VfrCompile/GNUmakefile
++++ b/BaseTools/Source/C/VfrCompile/GNUmakefile
+@@ -54,10 +54,11 @@ VfrCompiler.o: ../Include/Common/BuildVersion.h
+ 
+ include $(MAKEROOT)/Makefiles/footer.makefile
+ 
+-VfrSyntax.cpp EfiVfrParser.cpp EfiVfrParser.h VfrParser.dlg VfrTokens.h: Pccts/antlr/antlr VfrSyntax.g
+-	Pccts/antlr/antlr -CC -e3 -ck 3 -k 2 -fl VfrParser.dlg -ft VfrTokens.h -o . VfrSyntax.g
++ANTLR_GEN = VfrSyntax.cpp EfiVfrParser.cpp EfiVfrParser.h VfrParser.dlg VfrTokens.h
++DLG_GEN = VfrLexer.cpp VfrLexer.h
+ 
+-VfrLexer.cpp VfrLexer.h: Pccts/dlg/dlg VfrParser.dlg
++$(ANTLR_GEN) $(DLG_GEN) &: Pccts/antlr/antlr Pccts/dlg/dlg VfrSyntax.g
++	Pccts/antlr/antlr -CC -e3 -ck 3 -k 2 -fl VfrParser.dlg -ft VfrTokens.h -o . VfrSyntax.g
+ 	Pccts/dlg/dlg -C2 -i -CC -cl VfrLexer -o . VfrParser.dlg
+ 
+ Pccts/antlr/antlr:
+-- 
+2.53.0
+
diff --git a/boot/edk2/edk2.hash b/boot/edk2/edk2.hash
index 8aa19bf545..ab9bbcf7ef 100644
--- a/boot/edk2/edk2.hash
+++ b/boot/edk2/edk2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a8378e83060d621806b4237f6b2b9ead89d51f888d41e46e78d42b76d6594329  edk2-edk2-stable202511-git4.tar.gz
+sha256  a44b47f2d233213cdb848206bda8d475b264ed1a2cf097ae9cd82581e4aa2090  edk2-edk2-stable202602-git4.tar.gz
 sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index dba4aed513..11d9b90e7f 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EDK2_VERSION = edk2-stable202511
+EDK2_VERSION = edk2-stable202602
 EDK2_SITE = https://github.com/tianocore/edk2
 EDK2_SITE_METHOD = git
 EDK2_LICENSE = BSD-2-Clause-Patent
diff --git a/package/edk2-platforms/edk2-platforms.hash b/package/edk2-platforms/edk2-platforms.hash
index b3fa5d8424..31b84cf05a 100644
--- a/package/edk2-platforms/edk2-platforms.hash
+++ b/package/edk2-platforms/edk2-platforms.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  96bb0d16d76285190663e15367d0c022a3a47230e5361d80b8549f546ad93fbe  edk2-platforms-1e64c1109ae2ac0185351e8d0c19732970d4fecf.tar.gz
+sha256  f06674ea8cebd2547acbff0245226bf97159d52df930b6161c4169ef0fa41215  edk2-platforms-23625e812490e6cf66ab9e74972c6a5129bf3e2a.tar.gz
 sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/package/edk2-platforms/edk2-platforms.mk b/package/edk2-platforms/edk2-platforms.mk
index 7c46d9ed9f..cad3ccc5d2 100644
--- a/package/edk2-platforms/edk2-platforms.mk
+++ b/package/edk2-platforms/edk2-platforms.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with latest commit as of the release date for boot/edk2
-EDK2_PLATFORMS_VERSION = 1e64c1109ae2ac0185351e8d0c19732970d4fecf
+EDK2_PLATFORMS_VERSION = 23625e812490e6cf66ab9e74972c6a5129bf3e2a
 EDK2_PLATFORMS_SITE = $(call github,tianocore,edk2-platforms,$(EDK2_PLATFORMS_VERSION))
 EDK2_PLATFORMS_LICENSE = BSD-2-Clause-Patent
 EDK2_PLATFORMS_LICENSE_FILES = License.txt

--===============3055144555971171638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3055144555971171638==--
