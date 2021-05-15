Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA69DC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:16:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9830660F41
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9830660F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 673A94059E;
	Tue,  3 Aug 2021 21:16:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qlFsMn5VunP6; Tue,  3 Aug 2021 21:16:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 614EA4056E;
	Tue,  3 Aug 2021 21:16:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25E551BF9C2
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AACA605E0
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LhTj1HZFGdbb for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 745BD6063A
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CC70787BB7; Tue,  3 Aug 2021 21:09:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 May 2021 16:48:18 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bcff1166d43a4cfef135edd91992558eb1044d37
X-Git-Newrev: 8a86b50092be19dcc55c4f20c35138d6e378c56b
X-Patchwork-Hint: ignore
Message-Id: <20210803210937.CC70787BB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/qemu/s390x: disable SSP
 when needed
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=8a86b50092be19dcc55c4f20c35138d6e378c56b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix build failure raised since commit
810ba387bec3c5b6904e8893fb4cb6f9d3717466 by disabling SSP when needed

Fixes:
 - https://gitlab.com/kubu93/buildroot/-/jobs/1247043361

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Reviewed-by: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-arch-s390-disable-SSP-when-needed.patch   | 47 ++++++++++++++++++++++
 configs/qemu_s390x_defconfig                       |  1 +
 2 files changed, 48 insertions(+)

diff --git a/board/qemu/s390x/patches/linux/0001-arch-s390-disable-SSP-when-needed.patch b/board/qemu/s390x/patches/linux/0001-arch-s390-disable-SSP-when-needed.patch
new file mode 100644
index 0000000000..c8199d4fd6
--- /dev/null
+++ b/board/qemu/s390x/patches/linux/0001-arch-s390-disable-SSP-when-needed.patch
@@ -0,0 +1,47 @@
+From 8a054081678ed0b0e56f829bac0a4656e3a198b9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 8 May 2021 22:03:11 +0200
+Subject: [PATCH] arch/s390: disable SSP when needed
+
+Though -nostdlib is passed in PURGATORY_LDFLAGS and -ffreestanding in
+KBUILD_CFLAGS_DECOMPRESSOR, -fno-stack-protector must also be passed to
+avoid linking errors related to undefined references to
+'__stack_chk_guard' and '__stack_chk_fail' if toolchain enforces
+-fstack-protector.
+
+Fixes:
+ - https://gitlab.com/kubu93/buildroot/-/jobs/1247043361
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ arch/s390/Makefile           | 1 +
+ arch/s390/purgatory/Makefile | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/arch/s390/Makefile b/arch/s390/Makefile
+index e443ed9947bd..098abe3a56f3 100644
+--- a/arch/s390/Makefile
++++ b/arch/s390/Makefile
+@@ -28,6 +28,7 @@ KBUILD_CFLAGS_DECOMPRESSOR += -DDISABLE_BRANCH_PROFILING -D__NO_FORTIFY
+ KBUILD_CFLAGS_DECOMPRESSOR += -fno-delete-null-pointer-checks -msoft-float -mbackchain
+ KBUILD_CFLAGS_DECOMPRESSOR += -fno-asynchronous-unwind-tables
+ KBUILD_CFLAGS_DECOMPRESSOR += -ffreestanding
++KBUILD_CFLAGS_DECOMPRESSOR += -fno-stack-protector
+ KBUILD_CFLAGS_DECOMPRESSOR += $(call cc-disable-warning, address-of-packed-member)
+ KBUILD_CFLAGS_DECOMPRESSOR += $(if $(CONFIG_DEBUG_INFO),-g)
+ KBUILD_CFLAGS_DECOMPRESSOR += $(if $(CONFIG_DEBUG_INFO_DWARF4), $(call cc-option, -gdwarf-4,))
+diff --git a/arch/s390/purgatory/Makefile b/arch/s390/purgatory/Makefile
+index c57f8c40e992..21c4ebe29b9a 100644
+--- a/arch/s390/purgatory/Makefile
++++ b/arch/s390/purgatory/Makefile
+@@ -24,6 +24,7 @@ KBUILD_CFLAGS := -fno-strict-aliasing -Wall -Wstrict-prototypes
+ KBUILD_CFLAGS += -Wno-pointer-sign -Wno-sign-compare
+ KBUILD_CFLAGS += -fno-zero-initialized-in-bss -fno-builtin -ffreestanding
+ KBUILD_CFLAGS += -c -MD -Os -m64 -msoft-float -fno-common
++KBUILD_CFLAGS += -fno-stack-protector
+ KBUILD_CFLAGS += $(CLANG_FLAGS)
+ KBUILD_CFLAGS += $(call cc-option,-fno-PIE)
+ KBUILD_AFLAGS := $(filter-out -DCC_USING_EXPOLINE,$(KBUILD_AFLAGS))
+-- 
+2.30.2
+
diff --git a/configs/qemu_s390x_defconfig b/configs/qemu_s390x_defconfig
index 9b3821f043..4aed9d9ae5 100644
--- a/configs/qemu_s390x_defconfig
+++ b/configs/qemu_s390x_defconfig
@@ -20,6 +20,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_GLOBAL_PATCH_DIR="board/qemu/s390x/patches"
 
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
