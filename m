Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3F7CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98C1F85754;
	Tue,  9 Jun 2026 13:02:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fvtTgkyGTqhf; Tue,  9 Jun 2026 13:02:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AC058572A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010136;
	bh=Z0kLivdG5xFDLG2FEv3MRqmKBzNQUTfxywJ74qu/WJU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O1cCNnCxRijEBHmUBe4rerJMg8G1t7Z8YggFOw3GDl6p2kJ/rDR9Kba/AQtprGCiC
	 KLtmJy4b2/mVTbK5Yuk8vhvypERCt1iU0liNIn10oYDYpxde5E2vxNCek1lfCVtK16
	 RIav0Yie6AByJMkADGvEX0idZ+SRFLYc/C3bFXpOI6ZJu8sbjFOeFYiRlrT4MVQ0Sa
	 mYW0Sh15ZbDV6yS0ksnHm4EBjqzopnu7eRcK9ZGxw/LYAM5BiAO1c7G2Kbt+td/iHI
	 bjFSkCrdGp2ud8yrLEIR5guanKnWf8ZZ9PzBX4QaAuc14DFNQ1vWoJsSSJR+mBGNrk
	 Wn6STA0tIClmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AC058572A;
	Tue,  9 Jun 2026 13:02:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 216A6324
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 747836F690
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O9iaJYmDQ2A8 for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 310A06F694
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 310A06F694
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F82287E7E; Tue,  9 Jun 2026 13:01:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 May 2026 10:53:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d78ca8ad60e0988762f9b91e5102fae978c4de8
X-Git-Newrev: c7fef3704c704e6337b4f8f6ff467c6c70991443
X-Patchwork-Hint: ignore
Message-Id: <20260609130118.5F82287E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: bump to 1.0.58
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
Content-Type: multipart/mixed; boundary="===============2379351355234396690=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2379351355234396690==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c7fef3704c704e6337b4f8f6ff467c6c70991443
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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

--===============2379351355234396690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2379351355234396690==--
