Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A68C5CFDB
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEC1440CE7;
	Fri, 14 Aug 2026 13:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7h1pdHayPDhQ; Fri, 14 Aug 2026 13:20:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBF6B40CBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713600;
	bh=rwEQ2+LxV1bIXrjnRhrlEOVt4gGNwH7v4/3U5Bbi1Ug=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Af3QOUzr79uHgi0WDx/j4YsA02l0xqObIc806cX44NvZ/e7jcOyeWGBgju9GwgQPH
	 m2p9N9V+VcsB6VW5ieXZhQn79CMu+a2kG7pAuZ+rMkPfhW8UvTSSQWx42cF7eUs/q/
	 Cs97J0UY7eIWXyvKyJVK6bq6kZ3AaXSN3qBPp4bBtrP894n2+aMO9Ag9WPnkP5Ta0m
	 3Jk5rMHGb7H7uYdUY+jb6epYQp3j0HId2AC3W3U0derL/FjiPpZrzLQD/76KyjZ/Xz
	 7goJWdqBABh45IqfoiRC3OZ7tTAdIfiR/eugR/e7gYUCwpDemm6jvEtpQ1xFOMOsAD
	 nZvYsGuPEnV5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBF6B40CBD;
	Fri, 14 Aug 2026 13:20:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C5E633B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E13D40C34
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YmBK3SHUp7Qs for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1815740C38
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1815740C38
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CBAF8D66A; Fri, 14 Aug 2026 13:18:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Aug 2026 14:42:01 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b8230dfa8a20482fc7014359036d7c591dfc48fe
X-Git-Newrev: c42c90ef48eed438c9dcbbf6135f61e35c582d8d
X-Patchwork-Hint: ignore
Message-Id: <20260814131856.1CBAF8D66A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/uclibc: bump to
 1.0.58
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4051198517644590718=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4051198517644590718==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c42c90ef48eed438c9dcbbf6135f61e35c582d8d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

New release with following changes:

Adam Lackorzynski (1):
      termios.h: Add IBSHIFT

Charles Mirabile (11):
      riscv: add defconfigs
      riscv: add support for static pie binaries
      riscv: add support for ucontext functions
      pipe: directly invoke pipe2 from kernel when !UCLIBC_LINUX_SPECIFIC
      Fix {g,s}ettimeofday when !UCLIBC_HAS_REALTIME
      Fix build with static-pie but without nptl threads
      do not remove bits/uClibc_ctype.h when !UCLIBC_HAS_CTYPE_TABLES
      getopt-susv3: remove call to gettext `_` macro
      readdir{,_r}: remove loop to skip files with d_ino == 0
      spawn: allow file actions on no-mmu targets
      getopt-susv3: add support for reseting the scan by setting optind to zero

Marcus Haehnel (1):
      aarch64/fpu_control.h: Don't use gcc-internal types

Jan Klötzke (1):
      elf/dl-support.c: remove unnecessary memset

Ramin Moussavi (9):
      libsanitizer: arm/ucontext: fix VFP save/restore to use uc_regspace area
      libsanitizer: arm/ucontext.h: add glibc-style REG_R0..REG_R15 aliases
      libsanitizer: link.h/dl-iterate-phdr: expose dl_phdr_info TLS fields
      libsanitizer: ldso: track _dl_load_adds/_dl_load_subs counters
      libsanitizer: ldso: implement _dl_tls_get_addr_soft for dl_phdr_info::dlpi_tls_data
      libsanitizer: drop __pagesize, make _dl_pagesize the single source of truth
      libsanitizer: sys/user.h: remove obsolete BFD trad-core NBPG/UPAGES defines
      libsanitizer: features.h: hard-wire _FILE_OFFSET_BITS=64 to match library's 64-bit off_t/ino_t
      libsanitizer: fts.h: drop the bogus _FILE_OFFSET_BITS==64 #error

Waldemar Brodkorb (7):
      bits/statx.h: add some missing defines
      bits/statx.h: sync struct with glibc
      sys/fanotify.h: sync with musl
      libiconv: fix typedef of iconv_t
      misc: add unicode character functions (c11)
      netinet/tcp.h: sync with glibc
      bump version for 1.0.58 release

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c7fef3704c704e6337b4f8f6ff467c6c70991443)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/uclibc/uclibc.hash | 4 ++--
 package/uclibc/uclibc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index e0dba1b6b4..4c2a579ddf 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.57/uClibc-ng-1.0.57.tar.xz.sha256
-sha256  8bc734b584e23ff6ae3d0ebb4c0fb1d1d814c58c82822b93130d436afa7ace8b  uClibc-ng-1.0.57.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.58/uClibc-ng-1.0.58.tar.xz.sha256
+sha256  9e8100a442f7079b9728ca286e3035f67df0578606166ea2d1ef865a4a12ddb9  uClibc-ng-1.0.58.tar.xz
 # Locally calculated
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 0c91a176fa..6f3668715b 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.57
+UCLIBC_VERSION = 1.0.58
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+

--===============4051198517644590718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4051198517644590718==--
