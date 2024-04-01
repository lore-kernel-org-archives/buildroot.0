Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC90DCD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 09:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CA0181E19;
	Mon,  1 Apr 2024 09:31:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVNtJve-Z0GQ; Mon,  1 Apr 2024 09:31:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C622181E33
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C622181E33;
	Mon,  1 Apr 2024 09:31:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 622F61BF38A
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 09:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EFE540337
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 09:31:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7t-RTs9tGtFJ for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 09:31:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFDEF4057A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFDEF4057A
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 09:31:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9F8C844B7; Mon,  1 Apr 2024 09:31:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 1 Apr 2024 11:25:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8910b71bc81b47a074f316e3e83735184ff371c
X-Git-Newrev: b5680f53d60acf8ff6010082f873438a39bd5d97
X-Patchwork-Hint: ignore
Message-Id: <20240401093114.C9F8C844B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: bump to 2.39
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5680f53d60acf8ff6010082f873438a39bd5d97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 3 patches we had have all been merged upstream as of 2.39, so they
can be dropped.

The libcrypt library is gone from glibc, and therefore the
--enable-crypt option is also gone.

The LICENSES file has changed with the addition of a copyright notice
from IBM (some files contributed by IBM have been relicensed), and the
license is MIT, which is already listed in GLIBC_LICENSES, so no
changes are needed on our side.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr:
  - also update localedef
  - rebase localedef patches
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-build-with-mcpu-68040-or-higher-BZ-30740.patch | 57 -------------
 ...mpn_lshift-and-__mpn_rshift-for-non-68020.patch | 47 -----------
 ...8K_SCALE_AVAILABLE-on-__mpn_lshift-and-__.patch | 93 ----------------------
 package/glibc/glibc.hash                           |  4 +-
 package/glibc/glibc.mk                             |  5 +-
 ...001-HACK-only-build-and-install-localedef.patch | 47 ++++++-----
 ...ndency-on-GCC-to-4.8-and-binutils-to-2.24.patch | 12 +--
 package/localedef/localedef.mk                     |  2 +-
 8 files changed, 39 insertions(+), 228 deletions(-)

diff --git a/package/glibc/0001-m68k-Fix-build-with-mcpu-68040-or-higher-BZ-30740.patch b/package/glibc/0001-m68k-Fix-build-with-mcpu-68040-or-higher-BZ-30740.patch
deleted file mode 100644
index 61f48e5893..0000000000
--- a/package/glibc/0001-m68k-Fix-build-with-mcpu-68040-or-higher-BZ-30740.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From b85880633f69b737050c22eede858f8c13bb2248 Mon Sep 17 00:00:00 2001
-From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
-Date: Fri, 18 Aug 2023 14:59:51 -0300
-Subject: [PATCH] m68k: Fix build with -mcpu=68040 or higher (BZ 30740)
-
-GCC currently does not define __mc68020__ for -mcpu=68040 or higher,
-which memcpy/memmove assumptions.  Since this memory copy optimization
-seems only intended for m68020, disable for other m680X0 variants.
-
-Checked on a build for m68k-linux-gnu target mc68020 and mc68040.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=b85880633f69b737050c22eede858f8c13bb2248
----
- sysdeps/m68k/m680x0/m68020/wordcopy.S |  1 -
- sysdeps/m68k/wordcopy.c               | 21 +++++++++++++++++++++
- 2 files changed, 21 insertions(+), 1 deletion(-)
- delete mode 100644 sysdeps/m68k/m680x0/m68020/wordcopy.S
- create mode 100644 sysdeps/m68k/wordcopy.c
-
-diff --git a/sysdeps/m68k/m680x0/m68020/wordcopy.S b/sysdeps/m68k/m680x0/m68020/wordcopy.S
-deleted file mode 100644
-index 4fb1a4518f..0000000000
---- a/sysdeps/m68k/m680x0/m68020/wordcopy.S
-+++ /dev/null
-@@ -1 +0,0 @@
--/* Empty, not needed.  */
-diff --git a/sysdeps/m68k/wordcopy.c b/sysdeps/m68k/wordcopy.c
-new file mode 100644
-index 0000000000..f12d5b7803
---- /dev/null
-+++ b/sysdeps/m68k/wordcopy.c
-@@ -0,0 +1,21 @@
-+/* Definitions for memory copy functions.  Motorola 680X0 version
-+   Copyright (C) 2023 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library.  If not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+#ifndef __mc68020__
-+# include <string/wordcopy.c>
-+#endif
--- 
-2.39.2
-
diff --git a/package/glibc/0002-m68k-fix-__mpn_lshift-and-__mpn_rshift-for-non-68020.patch b/package/glibc/0002-m68k-fix-__mpn_lshift-and-__mpn_rshift-for-non-68020.patch
deleted file mode 100644
index 256da58d66..0000000000
--- a/package/glibc/0002-m68k-fix-__mpn_lshift-and-__mpn_rshift-for-non-68020.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 464fd8249e8b791248cab7b0e0cd91757435fa9e Mon Sep 17 00:00:00 2001
-From: Andreas Schwab <schwab@linux-m68k.org>
-Date: Thu, 17 Aug 2023 17:15:34 +0200
-Subject: [PATCH] m68k: fix __mpn_lshift and __mpn_rshift for non-68020
-
-From revision 03f3d275d0d6 in the gmp repository.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=464fd8249e8b791248cab7b0e0cd91757435fa9e
----
- sysdeps/m68k/m680x0/lshift.S | 4 ++--
- sysdeps/m68k/m680x0/rshift.S | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/sysdeps/m68k/m680x0/lshift.S b/sysdeps/m68k/m680x0/lshift.S
-index 2aee10348e..4240738959 100644
---- a/sysdeps/m68k/m680x0/lshift.S
-+++ b/sysdeps/m68k/m680x0/lshift.S
-@@ -77,8 +77,8 @@ L(Lnormal:)
- #else /* not mc68000 */
- 	movel	R(s_size),R(d0)
- 	asll	#2,R(d0)
--	addl	R(s_size),R(s_ptr)
--	addl	R(s_size),R(res_ptr)
-+	addl	R(d0),R(s_ptr)
-+	addl	R(d0),R(res_ptr)
- #endif
- 	movel	MEM_PREDEC(s_ptr),R(d2)
- 	movel	R(d2),R(d0)
-diff --git a/sysdeps/m68k/m680x0/rshift.S b/sysdeps/m68k/m680x0/rshift.S
-index d16bca9307..d56a2b4a44 100644
---- a/sysdeps/m68k/m680x0/rshift.S
-+++ b/sysdeps/m68k/m680x0/rshift.S
-@@ -127,8 +127,8 @@ L(Lspecial:)
- #else /* not mc68000 */
- 	movel	R(s_size),R(d0)
- 	asll	#2,R(d0)
--	addl	R(s_size),R(s_ptr)
--	addl	R(s_size),R(res_ptr)
-+	addl	R(d0),R(s_ptr)
-+	addl	R(d0),R(res_ptr)
- #endif
- 
- 	clrl	R(d0)			/* initialize carry */
--- 
-2.39.2
-
diff --git a/package/glibc/0003-m68k-Use-M68K_SCALE_AVAILABLE-on-__mpn_lshift-and-__.patch b/package/glibc/0003-m68k-Use-M68K_SCALE_AVAILABLE-on-__mpn_lshift-and-__.patch
deleted file mode 100644
index 2ea190eb5a..0000000000
--- a/package/glibc/0003-m68k-Use-M68K_SCALE_AVAILABLE-on-__mpn_lshift-and-__.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 87ced255bdf2681f5bf6c89d7121e59f6f342161 Mon Sep 17 00:00:00 2001
-From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
-Date: Fri, 18 Aug 2023 14:49:31 -0300
-Subject: [PATCH] m68k: Use M68K_SCALE_AVAILABLE on __mpn_lshift and
- __mpn_rshift
-
-This patch adds a new macro, M68K_SCALE_AVAILABLE, similar to gmp
-scale_available_p (mpn/m68k/m68k-defs.m4) that expand to 1 if a
-scale factor can be used in addressing modes.  This is used
-instead of __mc68020__ for some optimization decisions.
-
-Checked on a build for m68k-linux-gnu target mc68020 and mc68040.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=87ced255bdf2681f5bf6c89d7121e59f6f342161
----
- sysdeps/m68k/m680x0/lshift.S | 6 +++---
- sysdeps/m68k/m680x0/rshift.S | 8 ++++----
- sysdeps/m68k/m680x0/sysdep.h | 7 +++++++
- 3 files changed, 14 insertions(+), 7 deletions(-)
-
-diff --git a/sysdeps/m68k/m680x0/lshift.S b/sysdeps/m68k/m680x0/lshift.S
-index 4240738959..74de90380b 100644
---- a/sysdeps/m68k/m680x0/lshift.S
-+++ b/sysdeps/m68k/m680x0/lshift.S
-@@ -57,9 +57,9 @@ ENTRY(__mpn_lshift)
- 	bne	L(Lnormal)
- 	cmpl	R(s_ptr),R(res_ptr)
- 	bls	L(Lspecial)		/* jump if s_ptr >= res_ptr */
--#if (defined (__mc68020__) || defined (__NeXT__) || defined(mc68020))
-+#if M68K_SCALE_AVAILABLE
- 	lea	MEM_INDX1(s_ptr,s_size,l,4),R(a2)
--#else /* not mc68020 */
-+#else
- 	movel	R(s_size),R(d0)
- 	asll	#2,R(d0)
- 	lea	MEM_INDX(s_ptr,d0,l),R(a2)
-@@ -71,7 +71,7 @@ L(Lnormal:)
- 	moveql	#32,R(d5)
- 	subl	R(cnt),R(d5)
- 
--#if (defined (__mc68020__) || defined (__NeXT__) || defined(mc68020))
-+#if M68K_SCALE_AVAILABLE
- 	lea	MEM_INDX1(s_ptr,s_size,l,4),R(s_ptr)
- 	lea	MEM_INDX1(res_ptr,s_size,l,4),R(res_ptr)
- #else /* not mc68000 */
-diff --git a/sysdeps/m68k/m680x0/rshift.S b/sysdeps/m68k/m680x0/rshift.S
-index d56a2b4a44..d398d0287e 100644
---- a/sysdeps/m68k/m680x0/rshift.S
-+++ b/sysdeps/m68k/m680x0/rshift.S
-@@ -56,9 +56,9 @@ ENTRY(__mpn_rshift)
- 	bne	L(Lnormal)
- 	cmpl	R(res_ptr),R(s_ptr)
- 	bls	L(Lspecial)		/* jump if res_ptr >= s_ptr */
--#if (defined (__mc68020__) || defined (__NeXT__) || defined(mc68020))
-+#if M68K_SCALE_AVAILABLE
- 	lea	MEM_INDX1(res_ptr,s_size,l,4),R(a2)
--#else /* not mc68020 */
-+#else
- 	movel	R(s_size),R(d0)
- 	asll	#2,R(d0)
- 	lea	MEM_INDX(res_ptr,d0,l),R(a2)
-@@ -121,10 +121,10 @@ L(Lend:)
- 
- 	cfi_restore_state
- L(Lspecial:)
--#if (defined (__mc68020__) || defined (__NeXT__) || defined(mc68020))
-+#if M68K_SCALE_AVAILABLE
- 	lea	MEM_INDX1(s_ptr,s_size,l,4),R(s_ptr)
- 	lea	MEM_INDX1(res_ptr,s_size,l,4),R(res_ptr)
--#else /* not mc68000 */
-+#else
- 	movel	R(s_size),R(d0)
- 	asll	#2,R(d0)
- 	addl	R(d0),R(s_ptr)
-diff --git a/sysdeps/m68k/m680x0/sysdep.h b/sysdeps/m68k/m680x0/sysdep.h
-index b31e101273..bee5b3391c 100644
---- a/sysdeps/m68k/m680x0/sysdep.h
-+++ b/sysdeps/m68k/m680x0/sysdep.h
-@@ -37,3 +37,10 @@
-   OP " " SRC "(" PC "), " DST
- 
- #endif	/* __ASSEMBLER__ */
-+
-+# if defined __mc68020__ || defined __mc68030__ || defined __mc68040__	      \
-+     || defined __mc68060__
-+#  define M68K_SCALE_AVAILABLE 1
-+# else
-+#  define M68K_SCALE_AVAILABLE 0
-+# endif
--- 
-2.39.2
-
diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 15ae55b9e6..94b7819a30 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,7 +1,7 @@
 # Locally calculated (fetched from Github)
-sha256  e38f4284d6909c6b5db7d79c6e450daeaf136a67e547290eec0b063a55eaaa42  glibc-2.38-44-gd37c2b20a4787463d192b32041c3406c2bd91de0.tar.gz
+sha256  2ba018b344e0e8330dcadd6130f4174f0fc2502b2e032210345e0e5a2f7ed12e  glibc-2.39-5-ge0910f1d3278f05439fb434ee528fc9be1b6bd5e.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  b33d0bd9f685b46853548814893a6135e74430d12f6d94ab3eba42fc591f83bc  LICENSES
+sha256  bba29819a3e938fae92674d6a88533e10605e389da8b51cdcba0a94f6221c5bc  LICENSES
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index d198d6f04c..96a850516f 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.38-44-gd37c2b20a4787463d192b32041c3406c2bd91de0
+GLIBC_VERSION = 2.39-5-ge0910f1d3278f05439fb434ee528fc9be1b6bd5e
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
@@ -195,7 +195,6 @@ define GLIBC_CONFIGURE_CMDS
 		--without-gd \
 		--with-headers=$(STAGING_DIR)/usr/include \
 		$(if $(BR2_aarch64)$(BR2_aarch64_be),--enable-mathvec) \
-		--enable-crypt \
 		$(GLIBC_CONF_OPTS))
 	$(GLIBC_ADD_MISSING_STUB_H)
 endef
@@ -206,7 +205,7 @@ endef
 #
 
 GLIBC_LIBS_LIB = \
-	ld*.so.* libanl.so.* libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* \
+	ld*.so.* libanl.so.* libc.so.* libdl.so.* libgcc_s.so.* \
 	libm.so.* libpthread.so.* libresolv.so.* librt.so.* \
 	libutil.so.* libnss_files.so.* libnss_dns.so.* libmvec.so.*
 
diff --git a/package/localedef/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/0001-HACK-only-build-and-install-localedef.patch
index 49bbfd227c..a65c896eb7 100644
--- a/package/localedef/0001-HACK-only-build-and-install-localedef.patch
+++ b/package/localedef/0001-HACK-only-build-and-install-localedef.patch
@@ -9,6 +9,8 @@ Upstream: https://git.pengutronix.de/cgit/ptxdist/plain/patches/localedef-glibc-
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 [Romain: rebase on 2.38]
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[yann.morin.1998@free.fr: rebase for 2.39]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 ---
  Rules           | 14 ++++++++++----
  locale/Makefile |  6 +++---
@@ -20,7 +22,7 @@ index 279ae490ac..1321956be6 100644
 +++ b/Rules
 @@ -221,10 +221,16 @@ binaries-shared-notests = $(filter-out $(binaries-pie) $(binaries-static), \
  				       $(binaries-all-notests))
- 
+
  ifneq "$(strip $(binaries-shared-notests))" ""
 -$(addprefix $(objpfx),$(binaries-shared-notests)): %: %.o \
 -  $(sort $(filter $(common-objpfx)lib%,$(link-libc))) \
@@ -37,31 +39,36 @@ index 279ae490ac..1321956be6 100644
 +			   $(common-objpfx)libc% $(+postinit),$^) \
 +	      $(link-extra-libs)
  endif
- 
+
  ifneq "$(strip $(binaries-shared-tests))" ""
 diff --git a/locale/Makefile b/locale/Makefile
 index d7036b0855..68afdddc7f 100644
 --- a/locale/Makefile
 +++ b/locale/Makefile
-@@ -33,15 +33,15 @@ categories	= ctype messages monetary numeric time paper name \
- 		  address telephone measurement identification collate
- aux		= $(categories:%=lc-%) $(categories:%=C-%) SYS_libc C_name \
- 		  xlocale localename global-locale coll-lookup
--others		= localedef locale
-+others		= localedef
- #others-static	= localedef locale
--install-bin	= localedef locale
-+install-bin	= localedef
- extra-objs	= $(localedef-modules:=.o) $(localedef-aux:=.o) \
- 		  $(locale-modules:=.o) $(lib-modules:=.o)
- generated 	+= C-translit.h
- before-compile	+= $(objpfx)C-translit.h
- 
--extra-libs	= libBrokenLocale
-+#extra-libs	= libBrokenLocale
+@@ -76,7 +76,6 @@
+   xlocale \
+   # aux
+ others = \
+-  locale \
+   localedef \
+   # others
+ #others-static = \
+@@ -84,7 +83,6 @@
+ # locale \
+ # # others-static
+ install-bin = \
+-  locale \
+   localedef \
+   # install-bin
+ extra-objs = \
+@@ -96,7 +94,6 @@
+ generated += C-translit.h
+ before-compile += $(objpfx)C-translit.h
+
+-extra-libs = libBrokenLocale
  extra-libs-others = $(extra-libs)
- 
+
  libBrokenLocale-routines = broken_cur_max
--- 
+--
 2.41.0
 
diff --git a/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
index 70d2b34bc1..1aecc24405 100644
--- a/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
+++ b/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
@@ -28,6 +28,8 @@ Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 [Romain: rebase on 2.38]
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[yann.morin.1998@free.fr: rebase for 2.39]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 ---
  configure | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -36,7 +38,7 @@ diff --git a/configure b/configure
 index 4ef387146d..4c6f91117d 100755
 --- a/configure
 +++ b/configure
-@@ -5293,7 +5293,7 @@ printf %s "checking version of $LD... " >&6; }
+@@ -5157,7 +5157,7 @@ printf %s "checking version of $LD... " >&6; }
    ac_prog_version=`$LD --version 2>&1 | sed -n 's/^.*GNU ld.* \([0-9][0-9]*\.[0-9.]*\).*$/\1/p'`
    case $ac_prog_version in
      '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
@@ -44,16 +46,16 @@ index 4ef387146d..4c6f91117d 100755
 +    2.1[0-9][0-9]*|2.2[4-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*)
         ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
      *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
- 
-@@ -5735,7 +5735,7 @@ int
+
+@@ -5599,7 +5599,7 @@ int
  main (void)
  {
- 
+
 -#if !defined __GNUC__ || __GNUC__ < 6 || (__GNUC__ == 6 && __GNUC_MINOR__ < 2)
 +#if !defined __GNUC__ || __GNUC__ < 4 || (__GNUC__ == 4 && __GNUC_MINOR__ < 8)
  #error insufficient compiler
  #endif
    ;
--- 
+--
 2.41.0
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index c017c0e00e..f304ba8021 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.38-44-gd37c2b20a4787463d192b32041c3406c2bd91de0
+LOCALEDEF_VERSION = 2.39-5-ge0910f1d3278f05439fb434ee528fc9be1b6bd5e
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
