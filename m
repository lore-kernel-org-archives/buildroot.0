Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC93C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:28:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F6E360E93
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F6E360E93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4214D82F87;
	Thu, 26 Aug 2021 22:28:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NWH_4b2_Slqh; Thu, 26 Aug 2021 22:28:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DED283032;
	Thu, 26 Aug 2021 22:28:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA2E21BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34958407AC
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oa-v1RSYxGLB for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DF5E40765
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0A5E58DC50; Thu, 26 Aug 2021 22:01:31 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 23:11:44 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8581151d515af5f9ddc0a96236431de1abeca3e2
X-Git-Newrev: 137225cef423ccbebc31d0c562bf3f37192739ac
X-Patchwork-Hint: ignore
Message-Id: <20210826220131.0A5E58DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gcc: add OpenRisc
 patches for gcc version 11.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=137225cef423ccbebc31d0c562bf3f37192739ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

At the moment of gcc 11.1.0 release the OpenRisc patches for -mcmodel=large
were still pending. They have been upstreamed yesterday as pointed in gcc
bugzilla[1]. So they will be part of gcc 11.3.0 or maybe before on 11.2.
2. Anyway at the moment if we try to build packages libgeos and protobuf
with OpenRisc gcc 11.1.0 it fails due to missing -mcmodel=large. So let's
add OpenRisc patches for it as done for all the previous versions.

Fixes:
still not appeared on autobuilers

[1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99783

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...k-Add-mcmodel-option-to-handle-large-GOTs.patch | 200 +++++++++++++++++++++
 ...k-Use-cmodel-large-when-building-crtstuff.patch |  60 +++++++
 2 files changed, 260 insertions(+)

diff --git a/package/gcc/11.1.0/0002-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch b/package/gcc/11.1.0/0002-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
new file mode 100644
index 0000000000..6e32f953a3
--- /dev/null
+++ b/package/gcc/11.1.0/0002-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
@@ -0,0 +1,200 @@
+From eff8110674ef193481d3657456a262beeb9951ff Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Tue, 6 Apr 2021 05:47:17 +0900
+Subject: [PATCH] or1k: Add mcmodel option to handle large GOTs
+
+When building libgeos we get an error with:
+
+    linux-uclibc/9.3.0/crtbeginS.o: in function `__do_global_dtors_aux':
+    crtstuff.c:(.text+0x118): relocation truncated to fit: R_OR1K_GOT16 against symbol `__cxa_finalize' defined in .text section in
+    /home/shorne/work/openrisc/3eb9f9d0f6d8274b2d19753c006bd83f7d536e3c/output/host/or1k-buildroot-linux-uclibc/sysroot/lib/libc.so.
+
+This is caused by GOT code having a limit of 64k.  In OpenRISC this
+looks to be the only relocation code pattern to be limited to 64k.
+
+This patch allows specifying a new option -mcmodel=large which can be
+used to generate 2 more instructions to construct 32-bit addresses for
+up to 4G GOTs.
+
+gcc/ChangeLog:
+
+	PR target/99783
+	* config/or1k/or1k-opts.h: New file.
+	* config/or1k/or1k.c (or1k_legitimize_address_1, print_reloc):
+	Support generating gotha relocations if -mcmodel=large is
+	specified.
+	* config/or1k/or1k.h (TARGET_CMODEL_SMALL, TARGET_CMODEL_LARGE):
+	New macros.
+	* config/or1k/or1k.opt (mcmodel=): New option.
+	* doc/invoke.texi (OpenRISC Options): Document mcmodel.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ gcc/config/or1k/or1k-opts.h | 30 ++++++++++++++++++++++++++++++
+ gcc/config/or1k/or1k.c      | 11 +++++++++--
+ gcc/config/or1k/or1k.h      |  7 +++++++
+ gcc/config/or1k/or1k.opt    | 19 +++++++++++++++++++
+ gcc/doc/invoke.texi         | 12 +++++++++++-
+ 5 files changed, 76 insertions(+), 3 deletions(-)
+ create mode 100644 gcc/config/or1k/or1k-opts.h
+
+diff --git a/gcc/config/or1k/or1k-opts.h b/gcc/config/or1k/or1k-opts.h
+new file mode 100644
+index 00000000000..f791b894fdd
+--- /dev/null
++++ b/gcc/config/or1k/or1k-opts.h
+@@ -0,0 +1,30 @@
++/* Definitions for option handling for OpenRISC.
++   Copyright (C) 2021 Free Software Foundation, Inc.
++   Contributed by Stafford Horne.
++
++   This file is part of GCC.
++
++   GCC is free software; you can redistribute it and/or modify it
++   under the terms of the GNU General Public License as published
++   by the Free Software Foundation; either version 3, or (at your
++   option) any later version.
++
++   GCC is distributed in the hope that it will be useful, but WITHOUT
++   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
++   or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
++   License for more details.
++
++   You should have received a copy of the GNU General Public License
++   along with GCC; see the file COPYING3.  If not see
++   <http://www.gnu.org/licenses/>.  */
++
++#ifndef GCC_OR1K_OPTS_H
++#define GCC_OR1K_OPTS_H
++
++/* The OpenRISC code generation models available.  */
++enum or1k_cmodel_type {
++  CMODEL_SMALL,
++  CMODEL_LARGE
++};
++
++#endif /* GCC_OR1K_OPTS_H */
+diff --git a/gcc/config/or1k/or1k.c b/gcc/config/or1k/or1k.c
+index e772a7addea..27d3fa17995 100644
+--- a/gcc/config/or1k/or1k.c
++++ b/gcc/config/or1k/or1k.c
+@@ -750,7 +750,14 @@ or1k_legitimize_address_1 (rtx x, rtx scratch)
+ 	    {
+ 	      base = gen_sym_unspec (base, UNSPEC_GOT);
+ 	      crtl->uses_pic_offset_table = 1;
+-	      t2 = gen_rtx_LO_SUM (Pmode, pic_offset_table_rtx, base);
++	      if (TARGET_CMODEL_LARGE)
++		{
++	          emit_insn (gen_rtx_SET (t1, gen_rtx_HIGH (Pmode, base)));
++	          emit_insn (gen_add3_insn (t1, t1, pic_offset_table_rtx));
++	          t2 = gen_rtx_LO_SUM (Pmode, t1, base);
++		}
++	      else
++	        t2 = gen_rtx_LO_SUM (Pmode, pic_offset_table_rtx, base);
+ 	      t2 = gen_const_mem (Pmode, t2);
+ 	      emit_insn (gen_rtx_SET (t1, t2));
+ 	      base = t1;
+@@ -1089,7 +1096,7 @@ print_reloc (FILE *stream, rtx x, HOST_WIDE_INT add, reloc_kind kind)
+      no special markup.  */
+   static const char * const relocs[RKIND_MAX][RTYPE_MAX] = {
+     { "lo", "got", "gotofflo", "tpofflo", "gottpofflo", "tlsgdlo" },
+-    { "ha", NULL,  "gotoffha", "tpoffha", "gottpoffha", "tlsgdhi" },
++    { "ha", "gotha", "gotoffha", "tpoffha", "gottpoffha", "tlsgdhi" },
+   };
+   reloc_type type = RTYPE_DIRECT;
+ 
+diff --git a/gcc/config/or1k/or1k.h b/gcc/config/or1k/or1k.h
+index fe01ab81ead..669907e7e74 100644
+--- a/gcc/config/or1k/or1k.h
++++ b/gcc/config/or1k/or1k.h
+@@ -21,6 +21,8 @@
+ #ifndef GCC_OR1K_H
+ #define GCC_OR1K_H
+ 
++#include "config/or1k/or1k-opts.h"
++
+ /* Names to predefine in the preprocessor for this target machine.  */
+ #define TARGET_CPU_CPP_BUILTINS()		\
+   do						\
+@@ -37,6 +39,11 @@
+     }						\
+   while (0)
+ 
++#define TARGET_CMODEL_SMALL \
++  (or1k_code_model == CMODEL_SMALL)
++#define TARGET_CMODEL_LARGE \
++  (or1k_code_model == CMODEL_LARGE)
++
+ /* Storage layout.  */
+ 
+ #define DEFAULT_SIGNED_CHAR 1
+diff --git a/gcc/config/or1k/or1k.opt b/gcc/config/or1k/or1k.opt
+index 6bd0f3eee6d..cc23e3b8856 100644
+--- a/gcc/config/or1k/or1k.opt
++++ b/gcc/config/or1k/or1k.opt
+@@ -21,6 +21,9 @@
+ ; See the GCC internals manual (options.texi) for a description of
+ ; this file's format.
+ 
++HeaderInclude
++config/or1k/or1k-opts.h
++
+ mhard-div
+ Target RejectNegative InverseMask(SOFT_DIV)
+ Enable generation of hardware divide (l.div, l.divu) instructions.  This is the
+@@ -63,6 +66,22 @@ When -mhard-float is selected, enables generation of unordered floating point
+ compare and set flag (lf.sfun*) instructions.  By default functions from libgcc
+ are used to perform unordered floating point compare and set flag operations.
+ 
++mcmodel=
++Target RejectNegative Joined Enum(or1k_cmodel_type) Var(or1k_code_model) Init(CMODEL_SMALL)
++Specify the code model used for accessing memory addresses.  Specifying large
++enables generating binaries with large global offset tables.  By default the
++value is small.
++
++Enum
++Name(or1k_cmodel_type) Type(enum or1k_cmodel_type)
++Known code model types (for use with the -mcmodel= option):
++
++EnumValue
++Enum(or1k_cmodel_type) String(small) Value(CMODEL_SMALL)
++
++EnumValue
++Enum(or1k_cmodel_type) String(large) Value(CMODEL_LARGE)
++
+ mcmov
+ Target RejectNegative Mask(CMOV)
+ Enable generation of conditional move (l.cmov) instructions.  By default the
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+index 57b97a0838c..d8a6b0b60c9 100644
+--- a/gcc/doc/invoke.texi
++++ b/gcc/doc/invoke.texi
+@@ -1141,7 +1141,8 @@ Objective-C and Objective-C++ Dialects}.
+ @gccoptlist{-mboard=@var{name}  -mnewlib  -mhard-mul  -mhard-div @gol
+ -msoft-mul  -msoft-div @gol
+ -msoft-float  -mhard-float  -mdouble-float -munordered-float @gol
+--mcmov  -mror  -mrori  -msext  -msfimm  -mshftimm}
++-mcmov  -mror  -mrori  -msext  -msfimm  -mshftimm @gol
++-mcmodel=@var{code-model}}
+ 
+ @emph{PDP-11 Options}
+ @gccoptlist{-mfpu  -msoft-float  -mac0  -mno-ac0  -m40  -m45  -m10 @gol
+@@ -26684,6 +26685,15 @@ Enable generation of shift with immediate (@code{l.srai}, @code{l.srli},
+ @code{l.slli}) instructions.  By default extra instructions will be generated
+ to store the immediate to a register first.
+ 
++@item -mcmodel=small
++@opindex mcmodel=small
++Generate OpenRISC code for the small model: The GOT is limited to 64k. This is
++the default model.
++
++@item -mcmodel=large
++@opindex mcmodel=large
++Generate OpenRISC code for the large model: The GOT may grow up to 4G in size.
++
+ 
+ @end table
+ 
+-- 
+2.25.1
+
diff --git a/package/gcc/11.1.0/0003-or1k-Use-cmodel-large-when-building-crtstuff.patch b/package/gcc/11.1.0/0003-or1k-Use-cmodel-large-when-building-crtstuff.patch
new file mode 100644
index 0000000000..00dd5de2a3
--- /dev/null
+++ b/package/gcc/11.1.0/0003-or1k-Use-cmodel-large-when-building-crtstuff.patch
@@ -0,0 +1,60 @@
+From da8a9d695b3c4b9397b5d9a27660bfa48af8d707 Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Wed, 21 Apr 2021 05:33:15 +0900
+Subject: [PATCH] or1k: Use cmodel=large when building crtstuff
+
+When linking gcc runtime objects into large binaries the link may fail
+with the below errors.  This will happen even if we are building with
+-mcmodel=large.
+
+    /home/shorne/work/openrisc/output/host/lib/gcc/or1k-buildroot-linux-uclibc/10.3.0/crtbeginS.o: in function `deregister_tm_clones':
+    crtstuff.c:(.text+0x3c): relocation truncated to fit: R_OR1K_GOT16 against undefined symbol `_ITM_deregisterTMCloneTable'
+    /home/shorne/work/openrisc/output/host/lib/gcc/or1k-buildroot-linux-uclibc/10.3.0/crtbeginS.o: in function `register_tm_clones':
+    crtstuff.c:(.text+0xc0): relocation truncated to fit: R_OR1K_GOT16 against undefined symbol `_ITM_registerTMCloneTable'
+
+This patch builds the gcc crtstuff binaries always with the
+-mcmodel=large option to ensure they can be linked into large binaries.
+
+libgcc/ChangeLog:
+
+	PR target/99783
+	* config.host (or1k-*, tmake_file): Add or1k/t-crtstuff.
+	* config/or1k/t-crtstuff: New file.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ libgcc/config.host            | 4 ++--
+ libgcc/config/or1k/t-crtstuff | 2 ++
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+ create mode 100644 libgcc/config/or1k/t-crtstuff
+
+diff --git a/libgcc/config.host b/libgcc/config.host
+index 50f00062232..8ca7a00082a 100644
+--- a/libgcc/config.host
++++ b/libgcc/config.host
+@@ -1119,12 +1119,12 @@ nios2-*-*)
+ 	extra_parts="$extra_parts crti.o crtn.o"
+ 	;;
+ or1k-*-linux*)
+-	tmake_file="$tmake_file or1k/t-or1k"
++	tmake_file="$tmake_file or1k/t-or1k or1k/t-crtstuff"
+ 	tmake_file="$tmake_file t-softfp-sfdf t-softfp"
+ 	md_unwind_header=or1k/linux-unwind.h
+ 	;;
+ or1k-*-*)
+-	tmake_file="$tmake_file or1k/t-or1k"
++	tmake_file="$tmake_file or1k/t-or1k or1k/t-crtstuff"
+ 	tmake_file="$tmake_file t-softfp-sfdf t-softfp"
+ 	;;
+ pdp11-*-*)
+diff --git a/libgcc/config/or1k/t-crtstuff b/libgcc/config/or1k/t-crtstuff
+new file mode 100644
+index 00000000000..dcae7f3498e
+--- /dev/null
++++ b/libgcc/config/or1k/t-crtstuff
+@@ -0,0 +1,2 @@
++# Compile crtbeginS.o and crtendS.o with -mcmodel=large
++CRTSTUFF_T_CFLAGS_S += -mcmodel=large
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
