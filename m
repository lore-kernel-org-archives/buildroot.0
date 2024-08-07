Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DFDC52D71
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 06:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37BE581215;
	Wed,  7 Aug 2024 06:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bPWWFm-mtWE7; Wed,  7 Aug 2024 06:17:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 238B581216
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 238B581216;
	Wed,  7 Aug 2024 06:17:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69B7C1BF368
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 06:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56B1081216
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 06:17:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uLbyxr6jHK7m for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 06:17:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E170881215
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E170881215
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E170881215
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 06:17:06 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id C2747352117F; Wed,  7 Aug 2024 08:17:03 +0200 (CEST)
Date: Wed, 7 Aug 2024 08:17:03 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrMRX7l9ma6LPT3I@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723011423; bh=p1C4HNfk9EQkMiP+cv1IvX7YPBet55sL7nn39ofm0EQ=;
 h=Date:From:To:Subject:From;
 b=wdnkpcxr2a0ii0ZbqY8gpO3QKuYQsy7TI89mYD59kUyBnA5Bkp2HVHWOx0qVq0Gx3
 FdF7+Gt8q9cPYHZVDB4q23F3ptb1ZNUciQ6tC834CHZBRURqIpCtOXSsqPt1Gllatv
 qYtLmhjXr8D2u6C9Ee664aiU7n03TVWC3QgvWfC6BhyCo2E13+lJ/vXvEqbQAVlxYX
 1bYYof0dK9lk3kl0kCSNylmyR1AWmsh8c2Qspwb/BTQ52/NjKi4lv4G/XbhSX03kWR
 jg7j3rI4NmbA+ECOwF6Dt17l+pWbmxyNgduenQs8e+y2uPL/FTyJHqSZ1OCRe1PYwy
 rCXsHlvQtFr6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=wdnkpcxr
Subject: [Buildroot] [PATCH] package/elf2flt: update to 2024.05
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Patch 0001 is upstream, this is also the only change
in this release.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...r-new-style-ctors-when-using-riscv64.patch | 34 -------------------
 package/elf2flt/elf2flt.hash                  |  2 +-
 package/elf2flt/elf2flt.mk                    |  2 +-
 3 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 package/elf2flt/0001-fix-alignment-for-new-style-ctors-when-using-riscv64.patch

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
index 077e661b96..344ae97018 100644
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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
