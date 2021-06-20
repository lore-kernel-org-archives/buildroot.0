Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1AAC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:11:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39E9A60EC0
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39E9A60EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 174E283D2F;
	Tue,  3 Aug 2021 23:11:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dT1fGDVhfuwr; Tue,  3 Aug 2021 23:11:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 521BE83D16;
	Tue,  3 Aug 2021 23:11:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B5C9C1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5312B4067A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Olh7JJBEXcj for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31477404DC
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7367E866AF; Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 20 Jun 2021 15:49:14 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4d85defa7103aadc74223868fb83ed0bed144f4d
X-Git-Newrev: c42a9f19fac4596d9db89e489fd176894de29df5
X-Patchwork-Hint: ignore
Message-Id: <20210803210953.7367E866AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qemu: remove upstream
 patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=c42a9f19fac4596d9db89e489fd176894de29df5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch is already merged in qemu 6.0.0.

Fixes:
http://autobuild.buildroot.net/results/aaa/aaabd63d0903819fb55d08852cef34c497cb57e6

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...build-no-pie-is-no-functional-linker-flag.patch | 79 ----------------------
 1 file changed, 79 deletions(-)

diff --git a/package/qemu/0005-build-no-pie-is-no-functional-linker-flag.patch b/package/qemu/0005-build-no-pie-is-no-functional-linker-flag.patch
deleted file mode 100644
index 6a21949157..0000000000
--- a/package/qemu/0005-build-no-pie-is-no-functional-linker-flag.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From bbd2d5a8120771ec59b86a80a1f51884e0a26e53 Mon Sep 17 00:00:00 2001
-From: Christian Ehrhardt <christian.ehrhardt@canonical.com>
-Date: Mon, 14 Dec 2020 16:09:38 +0100
-Subject: [PATCH] build: -no-pie is no functional linker flag
-
-Recent binutils changes dropping unsupported options [1] caused a build
-issue in regard to the optionroms.
-
-  ld -m elf_i386 -T /<<PKGBUILDDIR>>/pc-bios/optionrom//flat.lds -no-pie \
-    -s -o multiboot.img multiboot.o
-  ld.bfd: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
-
-This isn't really a regression in ld.bfd, filing the bug upstream
-revealed that this never worked as a ld flag [2] - in fact it seems we
-were by accident setting --nmagic).
-
-Since it never had the wanted effect this usage of LDFLAGS_NOPIE, should be
-droppable without any effect. This also is the only use-case of LDFLAGS_NOPIE
-in .mak, therefore we can also remove it from being added there.
-
-[1]: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=983d925d
-[2]: https://sourceware.org/bugzilla/show_bug.cgi?id=27050#c5
-
-Signed-off-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
-Message-Id: <20201214150938.1297512-1-christian.ehrhardt@canonical.com>
-Cc: qemu-stable@nongnu.org
-Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
-
-[Retrieved from:
-https://gitlab.com/qemu-project/qemu/-/commit/bbd2d5a8120771ec59b86a80a1f51884e0a26e53]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure                  | 3 ---
- pc-bios/optionrom/Makefile | 1 -
- 2 files changed, 4 deletions(-)
-
-diff --git a/configure b/configure
-index cb21108d34..c228f7c21e 100755
---- a/configure
-+++ b/configure
-@@ -2137,7 +2137,6 @@ EOF
- # Check we support --no-pie first; we will need this for building ROMs.
- if compile_prog "-Werror -fno-pie" "-no-pie"; then
-   CFLAGS_NOPIE="-fno-pie"
--  LDFLAGS_NOPIE="-no-pie"
- fi
- 
- if test "$static" = "yes"; then
-@@ -2153,7 +2152,6 @@ if test "$static" = "yes"; then
-   fi
- elif test "$pie" = "no"; then
-   CONFIGURE_CFLAGS="$CFLAGS_NOPIE $CONFIGURE_CFLAGS"
--  CONFIGURE_LDFLAGS="$LDFLAGS_NOPIE $CONFIGURE_LDFLAGS"
- elif compile_prog "-Werror -fPIE -DPIE" "-pie"; then
-   CONFIGURE_CFLAGS="-fPIE -DPIE $CONFIGURE_CFLAGS"
-   CONFIGURE_LDFLAGS="-pie $CONFIGURE_LDFLAGS"
-@@ -6714,7 +6712,6 @@ echo "QEMU_CXXFLAGS=$QEMU_CXXFLAGS" >> $config_host_mak
- echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
- echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
- echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
--echo "LDFLAGS_NOPIE=$LDFLAGS_NOPIE" >> $config_host_mak
- echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_host_mak
- echo "EXESUF=$EXESUF" >> $config_host_mak
- echo "HOST_DSOSUF=$HOST_DSOSUF" >> $config_host_mak
-diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
-index 084fc10f05..30771f8d17 100644
---- a/pc-bios/optionrom/Makefile
-+++ b/pc-bios/optionrom/Makefile
-@@ -41,7 +41,6 @@ override CFLAGS += $(call cc-option, $(Wa)-32)
- 
- LD_I386_EMULATION ?= elf_i386
- override LDFLAGS = -m $(LD_I386_EMULATION) -T $(SRC_DIR)/flat.lds
--override LDFLAGS += $(LDFLAGS_NOPIE)
- 
- all: multiboot.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bin pvh.bin
- 
--- 
-GitLab
-
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
