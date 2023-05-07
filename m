Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A60FC77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 19:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6BAD81C40;
	Sun,  7 May 2023 19:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6BAD81C40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ynWRY6bg18KF; Sun,  7 May 2023 19:33:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9487C81B6D;
	Sun,  7 May 2023 19:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9487C81B6D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA21A1BF2CD
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 19:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF28D4177A
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 19:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF28D4177A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ub_txXxHIQ5T for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 19:33:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E90EB41755
 for <buildroot@buildroot.org>; Sun,  7 May 2023 19:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E90EB41755
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D65B38603C; Sun,  7 May 2023 19:33:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 21:31:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9e0b980b5ebe34100d0dc723b2bd945f75615e6
X-Git-Newrev: 64f1f82385b2af1c690d64ae3d72856a707b177e
X-Patchwork-Hint: ignore
Message-Id: <20230507193342.D65B38603C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/opensbi: Bump to version 1.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=64f1f82385b2af1c690d64ae3d72856a707b177e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  2 -
 ...0001-Makefile-Don-t-specify-mabi-or-march.patch | 37 ---------------
 ...0002-Makefile-unconditionally-disable-SSP.patch | 53 ----------------------
 boot/opensbi/Config.in                             |  4 +-
 boot/opensbi/opensbi.hash                          |  2 +-
 5 files changed, 3 insertions(+), 95 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index d42179bc3c..d5bd3cd4ab 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -121,8 +121,6 @@ boot/lpc32xxcdl/0002-delete_redundant_files.patch Upstream
 boot/lpc32xxcdl/0003-libnosys_gnu.patch Upstream
 boot/lpc32xxcdl/0004-slashes.patch Upstream
 boot/mv-ddr-marvell/0001-Makefile-disable-stack-protection.patch Upstream
-boot/opensbi/0.9/0001-Makefile-Don-t-specify-mabi-or-march.patch Upstream
-boot/opensbi/0.9/0002-Makefile-unconditionally-disable-SSP.patch Upstream
 boot/optee-os/3.13.0/0001-core-zlib-fix-build-warning-when-_LFS64_LARGEFILE-is.patch Upstream
 boot/syslinux/0001-bios-Fix-alignment-change-with-gcc-5.patch Upstream
 boot/syslinux/0002-Disable-PIE-to-avoid-FTBFS-on-amd64.patch Upstream
diff --git a/boot/opensbi/0.9/0001-Makefile-Don-t-specify-mabi-or-march.patch b/boot/opensbi/0.9/0001-Makefile-Don-t-specify-mabi-or-march.patch
deleted file mode 100644
index 5f554a6c24..0000000000
--- a/boot/opensbi/0.9/0001-Makefile-Don-t-specify-mabi-or-march.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f5871e1f3650d6c8a032928cb5d8ca00c275c377 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Fri, 15 Feb 2019 14:57:41 -0800
-Subject: [PATCH] Makefile: Don't specify mabi or march
-
-To avoid
-    can't link double-float modules with soft-float modules
-errors when building 32-bit openSBI don't specify mabi or march.
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
----
- Makefile | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index ae68f55..10851fc 100644
---- a/Makefile
-+++ b/Makefile
-@@ -145,7 +145,6 @@ GENFLAGS	+=	$(firmware-genflags-y)
- CFLAGS		=	-g -Wall -Werror -nostdlib -fno-strict-aliasing -O2
- CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
- CFLAGS		+=	-mno-save-restore -mstrict-align
--CFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
- CFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
- CFLAGS		+=	$(GENFLAGS)
- CFLAGS		+=	$(platform-cflags-y)
-@@ -158,7 +157,6 @@ CPPFLAGS	+=	$(firmware-cppflags-y)
- ASFLAGS		=	-g -Wall -nostdlib -D__ASSEMBLY__
- ASFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
- ASFLAGS		+=	-mno-save-restore -mstrict-align
--ASFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
- ASFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
- ASFLAGS		+=	$(GENFLAGS)
- ASFLAGS		+=	$(platform-asflags-y)
--- 
-2.20.1
-
diff --git a/boot/opensbi/0.9/0002-Makefile-unconditionally-disable-SSP.patch b/boot/opensbi/0.9/0002-Makefile-unconditionally-disable-SSP.patch
deleted file mode 100644
index c4edd37f1a..0000000000
--- a/boot/opensbi/0.9/0002-Makefile-unconditionally-disable-SSP.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From e389d5fbc296e496db15368b2b621e0f178f7f34 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 8 May 2021 21:28:10 +0200
-Subject: [PATCH] Makefile: unconditionally disable SSP
-
-Though -nostdlib is passed in {C,+AS,DTSCPP}FLAGS, -fno-stack-protector
-must also be passed to avoid linking errors related to undefined
-references to '__stack_chk_guard' and '__stack_chk_fail' if toolchain
-enforces -fstack-protector.
-
-Fixes:
- - https://gitlab.com/kubu93/buildroot/-/jobs/1247043359
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/riscv/opensbi/pull/211]
----
- Makefile | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index eeffe6b..1419360 100644
---- a/Makefile
-+++ b/Makefile
-@@ -203,7 +203,7 @@ GENFLAGS	+=	$(libsbiutils-genflags-y)
- GENFLAGS	+=	$(platform-genflags-y)
- GENFLAGS	+=	$(firmware-genflags-y)
- 
--CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-strict-aliasing -O2
-+CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -O2
- CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
- CFLAGS		+=	-mno-save-restore -mstrict-align
- CFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
-@@ -217,7 +217,7 @@ CPPFLAGS	+=	$(GENFLAGS)
- CPPFLAGS	+=	$(platform-cppflags-y)
- CPPFLAGS	+=	$(firmware-cppflags-y)
- 
--ASFLAGS		=	-g -Wall -nostdlib -D__ASSEMBLY__
-+ASFLAGS		=	-g -Wall -nostdlib -fno-stack-protector -D__ASSEMBLY__
- ASFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
- ASFLAGS		+=	-mno-save-restore -mstrict-align
- ASFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
-@@ -236,7 +236,7 @@ MERGEFLAGS	+=	-r
- MERGEFLAGS	+=	-b elf$(PLATFORM_RISCV_XLEN)-littleriscv
- MERGEFLAGS	+=	-m elf$(PLATFORM_RISCV_XLEN)lriscv
- 
--DTSCPPFLAGS	=	$(CPPFLAGS) -nostdinc -nostdlib -fno-builtin -D__DTS__ -x assembler-with-cpp
-+DTSCPPFLAGS	=	$(CPPFLAGS) -nostdinc -nostdlib -fno-stack-protector -fno-builtin -D__DTS__ -x assembler-with-cpp
- 
- # Setup functions for compilation
- define dynamic_flags
--- 
-2.30.2
-
diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index 86f848f177..5e6b8d158e 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -19,7 +19,7 @@ choice
 	  Select the specific OpenSBI version you want to use
 
 config BR2_TARGET_OPENSBI_LATEST_VERSION
-	bool "0.9"
+	bool "1.2"
 
 config BR2_TARGET_OPENSBI_CUSTOM_VERSION
 	bool "Custom version"
@@ -57,7 +57,7 @@ endif
 
 config BR2_TARGET_OPENSBI_VERSION
 	string
-	default "0.9"	if BR2_TARGET_OPENSBI_LATEST_VERSION
+	default "1.2"	if BR2_TARGET_OPENSBI_LATEST_VERSION
 	default BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_OPENSBI_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_OPENSBI_CUSTOM_TARBALL
diff --git a/boot/opensbi/opensbi.hash b/boot/opensbi/opensbi.hash
index 3b6d97c42d..dbc77e856f 100644
--- a/boot/opensbi/opensbi.hash
+++ b/boot/opensbi/opensbi.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  60f995cb3cd03e3cf5e649194d3395d0fe67499fd960a36cf7058a4efde686f0  opensbi-0.9.tar.gz
+sha256  8fcbce598a73acc2c7f7d5607d46b9d5107d3ecbede8f68f42631dcfc25ef2b2  opensbi-1.2.tar.gz
 sha256  82d13fb1bf6bb162629deeea9eb9c117e74548d3b707e478967691fe79a68e21  COPYING.BSD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
