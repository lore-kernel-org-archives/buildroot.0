Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E86C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 10:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9291A4060B;
	Wed,  7 Aug 2024 10:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLDgDp9bFOko; Wed,  7 Aug 2024 10:22:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E34040619
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E34040619;
	Wed,  7 Aug 2024 10:22:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50EB01BF97F
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E15540120
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ojKPbeqIenDj for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 10:22:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 002F6400A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 002F6400A4
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 10:22:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB70084543; Wed,  7 Aug 2024 10:22:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 12:06:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f66a80bf0482346262194eff163b2cc00aae760
X-Git-Newrev: 1fc2baa098dd6b0ee16a651199a59bb040721b4f
X-Patchwork-Hint: ignore
Message-Id: <20240807102226.EB70084543@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elf2flt: update to 2024.05
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1fc2baa098dd6b0ee16a651199a59bb040721b4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch 0001 is upstream, this is also the only change
in this release.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...nt-for-new-style-ctors-when-using-riscv64.patch | 34 ----------------------
 package/elf2flt/elf2flt.hash                       |  2 +-
 package/elf2flt/elf2flt.mk                         |  2 +-
 3 files changed, 2 insertions(+), 36 deletions(-)

diff --git a/package/elf2flt/0001-fix-alignment-for-new-style-ctors-when-using-riscv64.patch b/package/elf2flt/0001-fix-alignment-for-new-style-ctors-when-using-riscv64.patch
deleted file mode 100644
index fea726dab2..0000000000
--- a/package/elf2flt/0001-fix-alignment-for-new-style-ctors-when-using-riscv64.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From eead8d5e9f3911243182311f16178c25c6ea03c4 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Sat, 23 Mar 2024 07:23:45 +0100
-Subject: [PATCH] fix alignment for new-style ctors when using riscv64
-
-Recently uClibc-ng enabled UCLIBC_CTOR_DTOR for riscv64, so
-that f.e. C++ applications are running fine. As a side effect
-this breaks noMMU support. The problem is the alignment for
-the ctors in elf2flt. This patch fixes it.
-
-Tested with Qemu for ARM, M68k and Xtensa with no regressions.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://github.com/uclinux-dev/elf2flt/commit/eead8d5e9f3911243182311f16178c25c6ea03c4
----
- elf2flt.ld.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/elf2flt.ld.in b/elf2flt.ld.in
-index a99c69e..230c382 100644
---- a/elf2flt.ld.in
-+++ b/elf2flt.ld.in
-@@ -139,7 +139,7 @@ R_RODAT:	*(.gnu.linkonce.r*)
- 		@SYMBOL_PREFIX@_ssro_size = @SYMBOL_PREFIX@_essro - @SYMBOL_PREFIX@_ssro;
- 		PROVIDE(@SYMBOL_PREFIX@_SDA2_BASE_ = @SYMBOL_PREFIX@_ssro + (@SYMBOL_PREFIX@_ssro_size / 2));
- 
--		. = ALIGN(4) ;
-+		. = ALIGN(8) ;
- TOR:		@SYMBOL_PREFIX@__CTOR_LIST__ = .;
- TOR:		LONG((@SYMBOL_PREFIX@__CTOR_END__ - @SYMBOL_PREFIX@__CTOR_LIST__) / 4 - 2)
- SINGLE_LINK:	/* gcc uses crtbegin.o to find the start of
--- 
-2.30.2
-
diff --git a/package/elf2flt/elf2flt.hash b/package/elf2flt/elf2flt.hash
index e338ff6780..1e9c7cbedc 100644
--- a/package/elf2flt/elf2flt.hash
+++ b/package/elf2flt/elf2flt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e1d419c463431ff1af7fdc76a402f628744ad10dff063bea76a386942255119c  elf2flt-2024.02.tar.gz
+sha256  9fd899d0c66552ecb175ff6764e5af810aa1bb78db38a64768a1b97c3c62199d  elf2flt-2024.05.tar.gz
 sha256  f20bc5007904094e3a4e9fbcc3526cdd40893f91d458c3139b308e5c4c0899c6  LICENSE.TXT
diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index d5a7b9b5fd..a15c64d041 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELF2FLT_VERSION = 2024.02
+ELF2FLT_VERSION = 2024.05
 ELF2FLT_SITE = $(call github,uclinux-dev,elf2flt,v$(ELF2FLT_VERSION))
 ELF2FLT_LICENSE = GPL-2.0+
 ELF2FLT_LICENSE_FILES = LICENSE.TXT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
