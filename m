Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFB1C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 20:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF65040B1A;
	Sat, 11 May 2024 20:50:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mb85GxT_yyT5; Sat, 11 May 2024 20:50:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F59C40BD3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F59C40BD3;
	Sat, 11 May 2024 20:50:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F1D061BF867
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D487B60677
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g9t28N5mNbXU for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 20:50:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEF9D60627
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEF9D60627
 for <buildroot@buildroot.org>; Sat, 11 May 2024 20:50:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5FBE386FF7; Sat, 11 May 2024 20:50:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 May 2024 22:50:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc0f7215c604e845009e03784a221332867bf35a
X-Git-Newrev: 1680e491d8aea0ba0d294873ff3722390b9923af
X-Patchwork-Hint: ignore
Message-Id: <20240511205019.5FBE386FF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: remove version 11.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=1680e491d8aea0ba0d294873ff3722390b9923af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that gcc 14 was added, we can remove the oldest version of gcc.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |   2 -
 Config.in.legacy                                   |   7 +
 ...k-Add-mcmodel-option-to-handle-large-GOTs.patch | 204 ---------------------
 ...k-Use-cmodel-large-when-building-crtstuff.patch |  64 -------
 ..._REENTRANT-for-OpenRISC-when-pthread-is-p.patch |  35 ----
 ...disable-split-stack-for-non-thread-builds.patch |  26 ---
 ...t-fix-machine-names-in-__has_include-.-PR.patch | 124 -------------
 ...y-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch |  49 -----
 ...ensa-add-.note.GNU-stack-section-on-linux.patch | 105 -----------
 ...008-Remove-crypt-and-crypt_r-interceptors.patch | 140 --------------
 ...0009-libiberty-Darwin-Fix-a-build-warning.patch |  37 ----
 package/gcc/Config.in.host                         |  11 --
 package/gcc/gcc.hash                               |   2 -
 13 files changed, 7 insertions(+), 799 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 38b6edd70f..f145e0bd11 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -697,8 +697,6 @@ package/fxload/0001-fix-static-build.patch lib_patch.Upstream
 package/gamin/0001-no-abstract-sockets.patch lib_patch.Upstream
 package/gamin/0002-no-const-return.patch lib_patch.Sob lib_patch.Upstream
 package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch lib_patch.Upstream
-package/gcc/11.4.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch lib_patch.Upstream
-package/gcc/11.4.0/0004-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/12.3.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/13.2.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/14.1.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 04b62ffd32..46f7a304cb 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.05"
 
+config BR2_GCC_VERSION_11_X
+	bool "gcc 11.x support removed"
+	select BR2_LEGACY
+	help
+	  Support for gcc version 11.x has been removed. The current
+	  default version (13.x or later) has been selected instead.
+
 config BR2_BINFMT_FLAT_SHARED
 	bool "FLAT shared binary format removed"
 	select BR2_LEGACY
diff --git a/package/gcc/11.4.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch b/package/gcc/11.4.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
deleted file mode 100644
index f927cd007d..0000000000
--- a/package/gcc/11.4.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
+++ /dev/null
@@ -1,204 +0,0 @@
-From 35c0801efa26bf248d278b5711b77a19e95b2f57 Mon Sep 17 00:00:00 2001
-From: Stafford Horne <shorne@gmail.com>
-Date: Tue, 6 Apr 2021 05:47:17 +0900
-Subject: [PATCH] or1k: Add mcmodel option to handle large GOTs
-
-When building libgeos we get an error with:
-
-    linux-uclibc/9.3.0/crtbeginS.o: in function `__do_global_dtors_aux':
-    crtstuff.c:(.text+0x118): relocation truncated to fit: R_OR1K_GOT16 against symbol `__cxa_finalize' defined in .text section in
-    /home/shorne/work/openrisc/3eb9f9d0f6d8274b2d19753c006bd83f7d536e3c/output/host/or1k-buildroot-linux-uclibc/sysroot/lib/libc.so.
-
-This is caused by GOT code having a limit of 64k.  In OpenRISC this
-looks to be the only relocation code pattern to be limited to 64k.
-
-This patch allows specifying a new option -mcmodel=large which can be
-used to generate 2 more instructions to construct 32-bit addresses for
-up to 4G GOTs.
-
-gcc/ChangeLog:
-
-	PR target/99783
-	* config/or1k/or1k-opts.h: New file.
-	* config/or1k/or1k.c (or1k_legitimize_address_1, print_reloc):
-	Support generating gotha relocations if -mcmodel=large is
-	specified.
-	* config/or1k/or1k.h (TARGET_CMODEL_SMALL, TARGET_CMODEL_LARGE):
-	New macros.
-	* config/or1k/or1k.opt (mcmodel=): New option.
-	* doc/invoke.texi (OpenRISC Options): Document mcmodel.
-
-Uptream: eff8110674ef193481d3657456a262beeb9951ff
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-[Romain: add Upstream tag]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gcc/config/or1k/or1k-opts.h | 30 ++++++++++++++++++++++++++++++
- gcc/config/or1k/or1k.c      | 11 +++++++++--
- gcc/config/or1k/or1k.h      |  7 +++++++
- gcc/config/or1k/or1k.opt    | 19 +++++++++++++++++++
- gcc/doc/invoke.texi         | 12 +++++++++++-
- 5 files changed, 76 insertions(+), 3 deletions(-)
- create mode 100644 gcc/config/or1k/or1k-opts.h
-
-diff --git a/gcc/config/or1k/or1k-opts.h b/gcc/config/or1k/or1k-opts.h
-new file mode 100644
-index 00000000000..f791b894fdd
---- /dev/null
-+++ b/gcc/config/or1k/or1k-opts.h
-@@ -0,0 +1,30 @@
-+/* Definitions for option handling for OpenRISC.
-+   Copyright (C) 2021 Free Software Foundation, Inc.
-+   Contributed by Stafford Horne.
-+
-+   This file is part of GCC.
-+
-+   GCC is free software; you can redistribute it and/or modify it
-+   under the terms of the GNU General Public License as published
-+   by the Free Software Foundation; either version 3, or (at your
-+   option) any later version.
-+
-+   GCC is distributed in the hope that it will be useful, but WITHOUT
-+   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-+   or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
-+   License for more details.
-+
-+   You should have received a copy of the GNU General Public License
-+   along with GCC; see the file COPYING3.  If not see
-+   <http://www.gnu.org/licenses/>.  */
-+
-+#ifndef GCC_OR1K_OPTS_H
-+#define GCC_OR1K_OPTS_H
-+
-+/* The OpenRISC code generation models available.  */
-+enum or1k_cmodel_type {
-+  CMODEL_SMALL,
-+  CMODEL_LARGE
-+};
-+
-+#endif /* GCC_OR1K_OPTS_H */
-diff --git a/gcc/config/or1k/or1k.c b/gcc/config/or1k/or1k.c
-index e772a7addea..27d3fa17995 100644
---- a/gcc/config/or1k/or1k.c
-+++ b/gcc/config/or1k/or1k.c
-@@ -750,7 +750,14 @@ or1k_legitimize_address_1 (rtx x, rtx scratch)
- 	    {
- 	      base = gen_sym_unspec (base, UNSPEC_GOT);
- 	      crtl->uses_pic_offset_table = 1;
--	      t2 = gen_rtx_LO_SUM (Pmode, pic_offset_table_rtx, base);
-+	      if (TARGET_CMODEL_LARGE)
-+		{
-+	          emit_insn (gen_rtx_SET (t1, gen_rtx_HIGH (Pmode, base)));
-+	          emit_insn (gen_add3_insn (t1, t1, pic_offset_table_rtx));
-+	          t2 = gen_rtx_LO_SUM (Pmode, t1, base);
-+		}
-+	      else
-+	        t2 = gen_rtx_LO_SUM (Pmode, pic_offset_table_rtx, base);
- 	      t2 = gen_const_mem (Pmode, t2);
- 	      emit_insn (gen_rtx_SET (t1, t2));
- 	      base = t1;
-@@ -1089,7 +1096,7 @@ print_reloc (FILE *stream, rtx x, HOST_WIDE_INT add, reloc_kind kind)
-      no special markup.  */
-   static const char * const relocs[RKIND_MAX][RTYPE_MAX] = {
-     { "lo", "got", "gotofflo", "tpofflo", "gottpofflo", "tlsgdlo" },
--    { "ha", NULL,  "gotoffha", "tpoffha", "gottpoffha", "tlsgdhi" },
-+    { "ha", "gotha", "gotoffha", "tpoffha", "gottpoffha", "tlsgdhi" },
-   };
-   reloc_type type = RTYPE_DIRECT;
- 
-diff --git a/gcc/config/or1k/or1k.h b/gcc/config/or1k/or1k.h
-index fe01ab81ead..669907e7e74 100644
---- a/gcc/config/or1k/or1k.h
-+++ b/gcc/config/or1k/or1k.h
-@@ -21,6 +21,8 @@
- #ifndef GCC_OR1K_H
- #define GCC_OR1K_H
- 
-+#include "config/or1k/or1k-opts.h"
-+
- /* Names to predefine in the preprocessor for this target machine.  */
- #define TARGET_CPU_CPP_BUILTINS()		\
-   do						\
-@@ -37,6 +39,11 @@
-     }						\
-   while (0)
- 
-+#define TARGET_CMODEL_SMALL \
-+  (or1k_code_model == CMODEL_SMALL)
-+#define TARGET_CMODEL_LARGE \
-+  (or1k_code_model == CMODEL_LARGE)
-+
- /* Storage layout.  */
- 
- #define DEFAULT_SIGNED_CHAR 1
-diff --git a/gcc/config/or1k/or1k.opt b/gcc/config/or1k/or1k.opt
-index 6bd0f3eee6d..cc23e3b8856 100644
---- a/gcc/config/or1k/or1k.opt
-+++ b/gcc/config/or1k/or1k.opt
-@@ -21,6 +21,9 @@
- ; See the GCC internals manual (options.texi) for a description of
- ; this file's format.
- 
-+HeaderInclude
-+config/or1k/or1k-opts.h
-+
- mhard-div
- Target RejectNegative InverseMask(SOFT_DIV)
- Enable generation of hardware divide (l.div, l.divu) instructions.  This is the
-@@ -63,6 +66,22 @@ When -mhard-float is selected, enables generation of unordered floating point
- compare and set flag (lf.sfun*) instructions.  By default functions from libgcc
- are used to perform unordered floating point compare and set flag operations.
- 
-+mcmodel=
-+Target RejectNegative Joined Enum(or1k_cmodel_type) Var(or1k_code_model) Init(CMODEL_SMALL)
-+Specify the code model used for accessing memory addresses.  Specifying large
-+enables generating binaries with large global offset tables.  By default the
-+value is small.
-+
-+Enum
-+Name(or1k_cmodel_type) Type(enum or1k_cmodel_type)
-+Known code model types (for use with the -mcmodel= option):
-+
-+EnumValue
-+Enum(or1k_cmodel_type) String(small) Value(CMODEL_SMALL)
-+
-+EnumValue
-+Enum(or1k_cmodel_type) String(large) Value(CMODEL_LARGE)
-+
- mcmov
- Target RejectNegative Mask(CMOV)
- Enable generation of conditional move (l.cmov) instructions.  By default the
-diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index f1217812280..90c6186fc14 100644
---- a/gcc/doc/invoke.texi
-+++ b/gcc/doc/invoke.texi
-@@ -1136,7 +1136,8 @@ Objective-C and Objective-C++ Dialects}.
- @gccoptlist{-mboard=@var{name}  -mnewlib  -mhard-mul  -mhard-div @gol
- -msoft-mul  -msoft-div @gol
- -msoft-float  -mhard-float  -mdouble-float -munordered-float @gol
---mcmov  -mror  -mrori  -msext  -msfimm  -mshftimm}
-+-mcmov  -mror  -mrori  -msext  -msfimm  -mshftimm @gol
-+-mcmodel=@var{code-model}}
- 
- @emph{PDP-11 Options}
- @gccoptlist{-mfpu  -msoft-float  -mac0  -mno-ac0  -m40  -m45  -m10 @gol
-@@ -26444,6 +26445,15 @@ Enable generation of shift with immediate (@code{l.srai}, @code{l.srli},
- @code{l.slli}) instructions.  By default extra instructions will be generated
- to store the immediate to a register first.
- 
-+@item -mcmodel=small
-+@opindex mcmodel=small
-+Generate OpenRISC code for the small model: The GOT is limited to 64k. This is
-+the default model.
-+
-+@item -mcmodel=large
-+@opindex mcmodel=large
-+Generate OpenRISC code for the large model: The GOT may grow up to 4G in size.
-+
- 
- @end table
- 
--- 
-2.34.3
-
diff --git a/package/gcc/11.4.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch b/package/gcc/11.4.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch
deleted file mode 100644
index eb45175135..0000000000
--- a/package/gcc/11.4.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From f75178ccd2f5e4d73e27cccffffada859b87be7d Mon Sep 17 00:00:00 2001
-From: Stafford Horne <shorne@gmail.com>
-Date: Wed, 21 Apr 2021 05:33:15 +0900
-Subject: [PATCH] or1k: Use cmodel=large when building crtstuff
-
-When linking gcc runtime objects into large binaries the link may fail
-with the below errors.  This will happen even if we are building with
--mcmodel=large.
-
-    /home/shorne/work/openrisc/output/host/lib/gcc/or1k-buildroot-linux-uclibc/10.3.0/crtbeginS.o: in function `deregister_tm_clones':
-    crtstuff.c:(.text+0x3c): relocation truncated to fit: R_OR1K_GOT16 against undefined symbol `_ITM_deregisterTMCloneTable'
-    /home/shorne/work/openrisc/output/host/lib/gcc/or1k-buildroot-linux-uclibc/10.3.0/crtbeginS.o: in function `register_tm_clones':
-    crtstuff.c:(.text+0xc0): relocation truncated to fit: R_OR1K_GOT16 against undefined symbol `_ITM_registerTMCloneTable'
-
-This patch builds the gcc crtstuff binaries always with the
--mcmodel=large option to ensure they can be linked into large binaries.
-
-libgcc/ChangeLog:
-
-	PR target/99783
-	* config.host (or1k-*, tmake_file): Add or1k/t-crtstuff.
-	* config/or1k/t-crtstuff: New file.
-
-Upstream: da8a9d695b3c4b9397b5d9a27660bfa48af8d707
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-[Romain: add Upstream tag]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- libgcc/config.host            | 4 ++--
- libgcc/config/or1k/t-crtstuff | 2 ++
- 2 files changed, 4 insertions(+), 2 deletions(-)
- create mode 100644 libgcc/config/or1k/t-crtstuff
-
-diff --git a/libgcc/config.host b/libgcc/config.host
-index 45f8e19ada4..5523345abb0 100644
---- a/libgcc/config.host
-+++ b/libgcc/config.host
-@@ -1150,12 +1150,12 @@ nios2-*-*)
- 	extra_parts="$extra_parts crti.o crtn.o"
- 	;;
- or1k-*-linux*)
--	tmake_file="$tmake_file or1k/t-or1k"
-+	tmake_file="$tmake_file or1k/t-or1k or1k/t-crtstuff"
- 	tmake_file="$tmake_file t-softfp-sfdf t-softfp"
- 	md_unwind_header=or1k/linux-unwind.h
- 	;;
- or1k-*-*)
--	tmake_file="$tmake_file or1k/t-or1k"
-+	tmake_file="$tmake_file or1k/t-or1k or1k/t-crtstuff"
- 	tmake_file="$tmake_file t-softfp-sfdf t-softfp"
- 	;;
- pdp11-*-*)
-diff --git a/libgcc/config/or1k/t-crtstuff b/libgcc/config/or1k/t-crtstuff
-new file mode 100644
-index 00000000000..dcae7f3498e
---- /dev/null
-+++ b/libgcc/config/or1k/t-crtstuff
-@@ -0,0 +1,2 @@
-+# Compile crtbeginS.o and crtendS.o with -mcmodel=large
-+CRTSTUFF_T_CFLAGS_S += -mcmodel=large
--- 
-2.34.3
-
diff --git a/package/gcc/11.4.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch b/package/gcc/11.4.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
deleted file mode 100644
index cb407c78fc..0000000000
--- a/package/gcc/11.4.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 48ced46a5f81f49737ea13d11a099e03062cf141 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Fri, 27 Mar 2020 21:23:53 +0100
-Subject: [PATCH] gcc: define _REENTRANT for OpenRISC when -pthread is passed
-
-The detection of pthread support fails on OpenRISC unless _REENTRANT
-is defined. Added the CPP_SPEC definition to correct this.
-
-Patch sent upstream: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94372
-
-Upstream: cac2f69cdad434ad5cb60f5fe931d45cd82ef476
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Romain: add Upstream tag]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gcc/config/or1k/linux.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/gcc/config/or1k/linux.h b/gcc/config/or1k/linux.h
-index 196f3f3c8f0..0cbdc934af1 100644
---- a/gcc/config/or1k/linux.h
-+++ b/gcc/config/or1k/linux.h
-@@ -32,6 +32,8 @@
- #undef MUSL_DYNAMIC_LINKER
- #define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-or1k.so.1"
- 
-+#define CPP_SPEC "%{pthread:-D_REENTRANT}"
-+
- #undef LINK_SPEC
- #define LINK_SPEC "%{h*}			\
-    %{static:-Bstatic}				\
--- 
-2.34.3
-
diff --git a/package/gcc/11.4.0/0004-disable-split-stack-for-non-thread-builds.patch b/package/gcc/11.4.0/0004-disable-split-stack-for-non-thread-builds.patch
deleted file mode 100644
index 817997e925..0000000000
--- a/package/gcc/11.4.0/0004-disable-split-stack-for-non-thread-builds.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 590ef1956786bfd49dae7a5e2fed67509d06f36b Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Mon, 25 Jul 2022 00:29:55 +0200
-Subject: [PATCH] disable split-stack for non-thread builds
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-[Romain: convert to git format]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- libgcc/config/t-stack | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/libgcc/config/t-stack b/libgcc/config/t-stack
-index cc0366b4cd8..f3f97e86d60 100644
---- a/libgcc/config/t-stack
-+++ b/libgcc/config/t-stack
-@@ -1,4 +1,6 @@
- # Makefile fragment to provide generic support for -fsplit-stack.
- # This should be used in config.host for any host which supports
- # -fsplit-stack.
-+ifeq ($(enable_threads),yes)
- LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
-+endif
--- 
-2.34.3
-
diff --git a/package/gcc/11.4.0/0005-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch b/package/gcc/11.4.0/0005-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
deleted file mode 100644
index 88bc26e0d7..0000000000
--- a/package/gcc/11.4.0/0005-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-From 3e878f9d1c473f91a1377193d4d8d2616357bed1 Mon Sep 17 00:00:00 2001
-From: Xi Ruoyao <xry111@mengyan1223.wang>
-Date: Mon, 28 Jun 2021 13:54:58 +0800
-Subject: [PATCH] fixinc: don't "fix" machine names in __has_include(...)
- [PR91085]
-
-fixincludes/
-
-	PR other/91085
-	* fixfixes.c (check_has_inc): New static function.
-	  (machine_name_fix): Don't replace header names in
-	  __has_include(...).
-	* inclhack.def (machine_name): Adjust test.
-	* tests/base/testing.h: Update.
-
-Upstream: 6bf383c37e6131a8e247e8a0997d55d65c830b6d
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- fixincludes/fixfixes.c           | 45 ++++++++++++++++++++++++++++++--
- fixincludes/inclhack.def         |  3 ++-
- fixincludes/tests/base/testing.h |  2 +-
- 3 files changed, 46 insertions(+), 4 deletions(-)
-
-diff --git a/fixincludes/fixfixes.c b/fixincludes/fixfixes.c
-index 5b23a8b640d..404b420f302 100644
---- a/fixincludes/fixfixes.c
-+++ b/fixincludes/fixfixes.c
-@@ -477,6 +477,39 @@ FIX_PROC_HEAD( char_macro_def_fix )
-   fputs (text, stdout);
- }
- 
-+/* Check if the pattern at pos is actually in a "__has_include(...)"
-+   directive.  Return the pointer to the ')' of this
-+   "__has_include(...)" if it is, NULL otherwise.  */
-+static const char *
-+check_has_inc (const char *begin, const char *pos, const char *end)
-+{
-+  static const char has_inc[] = "__has_include";
-+  const size_t has_inc_len = sizeof (has_inc) - 1;
-+  const char *p;
-+
-+  for (p = memmem (begin, pos - begin, has_inc, has_inc_len);
-+       p != NULL;
-+       p = memmem (p, pos - p, has_inc, has_inc_len))
-+    {
-+      p += has_inc_len;
-+      while (p < end && ISSPACE (*p))
-+        p++;
-+
-+      /* "__has_include" may appear as "defined(__has_include)",
-+         search for the next appearance then.  */
-+      if (*p != '(')
-+        continue;
-+
-+      /* To avoid too much complexity, just hope there is never a
-+         ')' in a header name.  */
-+      p = memchr (p, ')', end - p);
-+      if (p == NULL || p > pos)
-+        return p;
-+    }
-+
-+  return NULL;
-+}
-+
- /* Fix for machine name #ifdefs that are not in the namespace reserved
-    by the C standard.  They won't be defined if compiling with -ansi,
-    and the headers will break.  We go to some trouble to only change
-@@ -524,7 +557,7 @@ FIX_PROC_HEAD( machine_name_fix )
-       /* If the 'name_pat' matches in between base and limit, we have
-          a bogon.  It is not worth the hassle of excluding comments
-          because comments on #if/#ifdef lines are rare, and strings on
--         such lines are illegal.
-+         such lines are only legal in a "__has_include" directive.
- 
-          REG_NOTBOL means 'base' is not at the beginning of a line, which
-          shouldn't matter since the name_re has no ^ anchor, but let's
-@@ -544,8 +577,16 @@ FIX_PROC_HEAD( machine_name_fix )
-             break;
- 
-           p = base + match[0].rm_so;
--          base += match[0].rm_eo;
- 
-+          /* Check if the match is in __has_include(...) (PR 91085). */
-+          q = check_has_inc (base, p, limit);
-+          if (q) 
-+            {
-+              base = q + 1;
-+              goto again;
-+            }
-+
-+          base += match[0].rm_eo;
-           /* One more test: if on the same line we have the same string
-              with the appropriate underscores, then leave it alone.
-              We want exactly two leading and trailing underscores.  */
-diff --git a/fixincludes/inclhack.def b/fixincludes/inclhack.def
-index c2f54d1189a..b2841d384f3 100644
---- a/fixincludes/inclhack.def
-+++ b/fixincludes/inclhack.def
-@@ -3201,7 +3201,8 @@ fix = {
-     c_fix     = machine_name;
- 
-     test_text = "/* MACH_DIFF: */\n"
--    "#if defined( i386 ) || defined( sparc ) || defined( vax )"
-+    "#if defined( i386 ) || defined( sparc ) || defined( vax ) || "
-+    "defined( linux ) || __has_include ( <linux.h> )"
-     "\n/* no uniform test, so be careful  :-) */";
- };
- 
-diff --git a/fixincludes/tests/base/testing.h b/fixincludes/tests/base/testing.h
-index cf95321fb86..8b3accaf04e 100644
---- a/fixincludes/tests/base/testing.h
-+++ b/fixincludes/tests/base/testing.h
-@@ -64,7 +64,7 @@ BSD43__IOWR('T', 1) /* Some are multi-line */
- 
- #if defined( MACHINE_NAME_CHECK )
- /* MACH_DIFF: */
--#if defined( i386 ) || defined( sparc ) || defined( vax )
-+#if defined( i386 ) || defined( sparc ) || defined( vax ) || defined( linux ) || __has_include ( <linux.h> )
- /* no uniform test, so be careful  :-) */
- #endif  /* MACHINE_NAME_CHECK */
- 
--- 
-2.34.3
-
diff --git a/package/gcc/11.4.0/0006-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch b/package/gcc/11.4.0/0006-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
deleted file mode 100644
index 025e6cfe32..0000000000
--- a/package/gcc/11.4.0/0006-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From ca01d2526917ec6e54b30472d3aedfd46d4ca585 Mon Sep 17 00:00:00 2001
-From: Stafford Horne <shorne@gmail.com>
-Date: Thu, 29 Sep 2022 15:32:39 +0100
-Subject: [PATCH] or1k: Only define TARGET_HAVE_TLS when HAVE_AS_TLS
-
-This was found when testing buildroot with linuxthreads enabled.  In
-this case, the build passes --disable-tls to the toolchain during
-configuration.  After building the OpenRISC toolchain it was still
-generating TLS code sequences and causing linker failures such as:
-
- ..../or1k-buildroot-linux-uclibc-gcc -o gpsd-3.24/gpsctl .... -lusb-1.0 -lm -lrt -lnsl
- ..../ld: ..../sysroot/usr/lib/libusb-1.0.so: undefined reference to `__tls_get_addr'
-
-This patch fixes this by disabling tls for the OpenRISC target when requested
-via --disable-tls.
-
-gcc/ChangeLog:
-
-	* config/or1k/or1k.c (TARGET_HAVE_TLS): Only define if
-	HAVE_AS_TLS is defined.
-
-Tested-by: Yann E. MORIN <yann.morin@orange.com>
-
-Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=ca01d2526917ec6e54b30472d3aedfd46d4ca585
-
-[Bernd: backported to 11.4.0]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- gcc/config/or1k/or1k.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/gcc/config/or1k/or1k.c b/gcc/config/or1k/or1k.c
-index da2f59062ba..0ce7b234417 100644
---- a/gcc/config/or1k/or1k.c
-+++ b/gcc/config/or1k/or1k.c
-@@ -2175,8 +2175,10 @@ or1k_output_mi_thunk (FILE *file, tree thunk_fndecl,
- #undef  TARGET_LEGITIMATE_ADDRESS_P
- #define TARGET_LEGITIMATE_ADDRESS_P or1k_legitimate_address_p
- 
-+#ifdef HAVE_AS_TLS
- #undef  TARGET_HAVE_TLS
- #define TARGET_HAVE_TLS true
-+#endif
- 
- #undef  TARGET_HAVE_SPECULATION_SAFE_VALUE
- #define TARGET_HAVE_SPECULATION_SAFE_VALUE speculation_safe_value_not_needed
--- 
-2.39.3
-
diff --git a/package/gcc/11.4.0/0007-xtensa-add-.note.GNU-stack-section-on-linux.patch b/package/gcc/11.4.0/0007-xtensa-add-.note.GNU-stack-section-on-linux.patch
deleted file mode 100644
index 967bbaf3fe..0000000000
--- a/package/gcc/11.4.0/0007-xtensa-add-.note.GNU-stack-section-on-linux.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 4958020ecc85a30c52544deaf3c017cea82a0fb0 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Thu, 2 Mar 2023 09:45:41 -0800
-Subject: [PATCH] xtensa: add .note.GNU-stack section on linux
-
-gcc/
-	* config/xtensa/linux.h (TARGET_ASM_FILE_END): New macro.
-
-libgcc/
-	* config/xtensa/crti.S: Add .note.GNU-stack section on linux.
-	* config/xtensa/crtn.S: Likewise.
-	* config/xtensa/lib1funcs.S: Likewise.
-	* config/xtensa/lib2funcs.S: Likewise.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=6360bf9a2d08f08c151464c77c0da53cd702ff25
----
- gcc/config/xtensa/linux.h        | 1 +
- libgcc/config/xtensa/crti.S      | 6 ++++++
- libgcc/config/xtensa/crtn.S      | 6 ++++++
- libgcc/config/xtensa/lib1funcs.S | 6 ++++++
- libgcc/config/xtensa/lib2funcs.S | 6 ++++++
- 5 files changed, 25 insertions(+)
-
-diff --git a/gcc/config/xtensa/linux.h b/gcc/config/xtensa/linux.h
-index 468a48489e7..a69e38c58ee 100644
---- a/gcc/config/xtensa/linux.h
-+++ b/gcc/config/xtensa/linux.h
-@@ -69,3 +69,4 @@ along with GCC; see the file COPYING3.  If not see
- 
- #undef DBX_REGISTER_NUMBER
- 
-+#define TARGET_ASM_FILE_END file_end_indicate_exec_stack
-diff --git a/libgcc/config/xtensa/crti.S b/libgcc/config/xtensa/crti.S
-index 87a66e32e4a..40dd8c0dbc2 100644
---- a/libgcc/config/xtensa/crti.S
-+++ b/libgcc/config/xtensa/crti.S
-@@ -26,6 +26,12 @@
- 
- #include "xtensa-config.h"
- 
-+/* An executable stack is *not* required for these functions.  */
-+#if defined(__ELF__) && defined(__linux__)
-+.section .note.GNU-stack,"",%progbits
-+.previous
-+#endif
-+
- 	.section .init
- 	.globl _init
- 	.type _init,@function
-diff --git a/libgcc/config/xtensa/crtn.S b/libgcc/config/xtensa/crtn.S
-index 8d2c2b1f22b..9d29f8fce1a 100644
---- a/libgcc/config/xtensa/crtn.S
-+++ b/libgcc/config/xtensa/crtn.S
-@@ -27,6 +27,12 @@
- 
- #include "xtensa-config.h"
- 
-+/* An executable stack is *not* required for these functions.  */
-+#if defined(__ELF__) && defined(__linux__)
-+.section .note.GNU-stack,"",%progbits
-+.previous
-+#endif
-+
- 	.section .init
- #if XCHAL_HAVE_WINDOWED && !__XTENSA_CALL0_ABI__
- 	retw
-diff --git a/libgcc/config/xtensa/lib1funcs.S b/libgcc/config/xtensa/lib1funcs.S
-index a482a6eefc8..5245d7ad8ad 100644
---- a/libgcc/config/xtensa/lib1funcs.S
-+++ b/libgcc/config/xtensa/lib1funcs.S
-@@ -25,6 +25,12 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
- 
- #include "xtensa-config.h"
- 
-+/* An executable stack is *not* required for these functions.  */
-+#if defined(__ELF__) && defined(__linux__)
-+.section .note.GNU-stack,"",%progbits
-+.previous
-+#endif
-+
- /* Define macros for the ABS and ADDX* instructions to handle cases
-    where they are not included in the Xtensa processor configuration.  */
- 
-diff --git a/libgcc/config/xtensa/lib2funcs.S b/libgcc/config/xtensa/lib2funcs.S
-index 36938c84924..a574a45fa68 100644
---- a/libgcc/config/xtensa/lib2funcs.S
-+++ b/libgcc/config/xtensa/lib2funcs.S
-@@ -25,6 +25,12 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
- 
- #include "xtensa-config.h"
- 
-+/* An executable stack is *not* required for these functions.  */
-+#if defined(__ELF__) && defined(__linux__)
-+.section .note.GNU-stack,"",%progbits
-+.previous
-+#endif
-+
- /* __xtensa_libgcc_window_spill: This function flushes out all but the
-    current register window.  This is used to set up the stack so that
-    arbitrary frames can be accessed.  */
--- 
-2.39.2
-
diff --git a/package/gcc/11.4.0/0008-Remove-crypt-and-crypt_r-interceptors.patch b/package/gcc/11.4.0/0008-Remove-crypt-and-crypt_r-interceptors.patch
deleted file mode 100644
index 36db9681cd..0000000000
--- a/package/gcc/11.4.0/0008-Remove-crypt-and-crypt_r-interceptors.patch
+++ /dev/null
@@ -1,140 +0,0 @@
-From 0ef972d11dda9051941656e5797889b8fbf2dca6 Mon Sep 17 00:00:00 2001
-From: Fangrui Song <i@maskray.me>
-Date: Fri, 28 Apr 2023 09:59:17 -0700
-Subject: [PATCH] Remove crypt and crypt_r interceptors
-
-From Florian Weimer's D144073
-
-> On GNU/Linux (glibc), the crypt and crypt_r functions are not part of the main shared object (libc.so.6), but libcrypt (with multiple possible sonames). The sanitizer libraries do not depend on libcrypt, so it can happen that during sanitizer library initialization, no real implementation will be found because the crypt, crypt_r functions are not present in the process image (yet). If its interceptors are called nevertheless, this results in a call through a null pointer when the sanitizer library attempts to forward the call to the real implementation.
->
-> Many distributions have already switched to libxcrypt, a library that is separate from glibc and that can be build with sanitizers directly (avoiding the need for interceptors). This patch disables building the interceptor for glibc targets.
-
-Let's remove crypt and crypt_r interceptors (D68431) to fix issues with
-newer glibc.
-
-For older glibc, msan will not know that an uninstrumented crypt_r call
-initializes `data`, so there is a risk for false positives. However, with some
-codebase survey, I think crypt_r uses are very few and the call sites typically
-have a `memset(&data, 0, sizeof(data));` anyway.
-
-Fix https://github.com/google/sanitizers/issues/1365
-Related: https://bugzilla.redhat.com/show_bug.cgi?id=2169432
-
-Reviewed By: #sanitizers, fweimer, thesamesam, vitalybuka
-
-Differential Revision: https://reviews.llvm.org/D149403
-
-[Thomas: taken from Crosstool-NG]
-Upstream: (llvm) https://github.com/llvm/llvm-project/commit/d7bead833631486e337e541e692d9b4a1ca14edd
-Upstream: (gcc)  https://github.com/gcc-mirror/gcc/commit/d96e14ceb9475f9bccbbc0325d5b11419fad9246
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- .../sanitizer_common_interceptors.inc         | 37 -------------------
- .../sanitizer_platform_interceptors.h         |  2 -
- .../sanitizer_platform_limits_posix.cpp       |  2 -
- .../sanitizer_platform_limits_posix.h         |  1 -
- 4 files changed, 42 deletions(-)
-
-diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc
-index ff2acfc7c010..6d802bc7159f 100644
---- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc
-+++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc
-@@ -9814,41 +9814,6 @@ INTERCEPTOR(SSIZE_T, getrandom, void *buf, SIZE_T buflen, unsigned int flags) {
- #define INIT_GETRANDOM
- #endif
- 
--#if SANITIZER_INTERCEPT_CRYPT
--INTERCEPTOR(char *, crypt, char *key, char *salt) {
--  void *ctx;
--  COMMON_INTERCEPTOR_ENTER(ctx, crypt, key, salt);
--  COMMON_INTERCEPTOR_READ_RANGE(ctx, key, internal_strlen(key) + 1);
--  COMMON_INTERCEPTOR_READ_RANGE(ctx, salt, internal_strlen(salt) + 1);
--  char *res = REAL(crypt)(key, salt);
--  if (res != nullptr)
--    COMMON_INTERCEPTOR_INITIALIZE_RANGE(res, internal_strlen(res) + 1);
--  return res;
--}
--#define INIT_CRYPT COMMON_INTERCEPT_FUNCTION(crypt);
--#else
--#define INIT_CRYPT
--#endif
--
--#if SANITIZER_INTERCEPT_CRYPT_R
--INTERCEPTOR(char *, crypt_r, char *key, char *salt, void *data) {
--  void *ctx;
--  COMMON_INTERCEPTOR_ENTER(ctx, crypt_r, key, salt, data);
--  COMMON_INTERCEPTOR_READ_RANGE(ctx, key, internal_strlen(key) + 1);
--  COMMON_INTERCEPTOR_READ_RANGE(ctx, salt, internal_strlen(salt) + 1);
--  char *res = REAL(crypt_r)(key, salt, data);
--  if (res != nullptr) {
--    COMMON_INTERCEPTOR_WRITE_RANGE(ctx, data,
--                                   __sanitizer::struct_crypt_data_sz);
--    COMMON_INTERCEPTOR_INITIALIZE_RANGE(res, internal_strlen(res) + 1);
--  }
--  return res;
--}
--#define INIT_CRYPT_R COMMON_INTERCEPT_FUNCTION(crypt_r);
--#else
--#define INIT_CRYPT_R
--#endif
--
- #if SANITIZER_INTERCEPT_GETENTROPY
- INTERCEPTOR(int, getentropy, void *buf, SIZE_T buflen) {
-   void *ctx;
-@@ -10337,8 +10302,6 @@ static void InitializeCommonInterceptors() {
-   INIT_GETUSERSHELL;
-   INIT_SL_INIT;
-   INIT_GETRANDOM;
--  INIT_CRYPT;
--  INIT_CRYPT_R;
-   INIT_GETENTROPY;
-   INIT_QSORT;
-   INIT_QSORT_R;
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h b/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h
-index 18bab346ce6e..cf329b76836e 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h
-@@ -572,8 +572,6 @@
- #define SANITIZER_INTERCEPT_FDEVNAME SI_FREEBSD
- #define SANITIZER_INTERCEPT_GETUSERSHELL (SI_POSIX && !SI_ANDROID)
- #define SANITIZER_INTERCEPT_SL_INIT (SI_FREEBSD || SI_NETBSD)
--#define SANITIZER_INTERCEPT_CRYPT (SI_POSIX && !SI_ANDROID)
--#define SANITIZER_INTERCEPT_CRYPT_R (SI_LINUX && !SI_ANDROID)
- 
- #define SANITIZER_INTERCEPT_GETRANDOM \
-   ((SI_LINUX && __GLIBC_PREREQ(2, 25)) || SI_FREEBSD)
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-index 5743516c0460..980776fc7d78 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-@@ -142,7 +142,6 @@ typedef struct user_fpregs elf_fpregset_t;
- #include <linux/serial.h>
- #include <sys/msg.h>
- #include <sys/ipc.h>
--#include <crypt.h>
- #endif // SANITIZER_LINUX && !SANITIZER_ANDROID
- 
- #if SANITIZER_ANDROID
-@@ -244,7 +243,6 @@ namespace __sanitizer {
-   unsigned struct_ustat_sz = SIZEOF_STRUCT_USTAT;
-   unsigned struct_rlimit64_sz = sizeof(struct rlimit64);
-   unsigned struct_statvfs64_sz = sizeof(struct statvfs64);
--  unsigned struct_crypt_data_sz = sizeof(struct crypt_data);
- #endif // SANITIZER_LINUX && !SANITIZER_ANDROID
- 
- #if SANITIZER_LINUX && !SANITIZER_ANDROID
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-index 83861105a509..7ad11b943157 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-@@ -295,7 +295,6 @@ extern unsigned struct_msqid_ds_sz;
- extern unsigned struct_mq_attr_sz;
- extern unsigned struct_timex_sz;
- extern unsigned struct_statvfs_sz;
--extern unsigned struct_crypt_data_sz;
- #endif  // SANITIZER_LINUX && !SANITIZER_ANDROID
- 
- struct __sanitizer_iovec {
--- 
-2.43.0
-
diff --git a/package/gcc/11.4.0/0009-libiberty-Darwin-Fix-a-build-warning.patch b/package/gcc/11.4.0/0009-libiberty-Darwin-Fix-a-build-warning.patch
deleted file mode 100644
index 3c694a89fa..0000000000
--- a/package/gcc/11.4.0/0009-libiberty-Darwin-Fix-a-build-warning.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From d1fc3505cc09d0ee02abbb732eafc91967c3ac07 Mon Sep 17 00:00:00 2001
-From: Iain Sandoe <iain@sandoe.co.uk>
-Date: Mon, 23 Aug 2021 17:34:43 +0100
-Subject: [PATCH] libiberty, Darwin: Fix a build warning.
-
-r12-3005-g220c410162ebece4f missed a cast for the set_32 call.
-Fixed thus.
-
-Signed-off-by: Iain Sandoe <iain@sandoe.co.uk>
-
-libiberty/ChangeLog:
-
-	* simple-object-mach-o.c (simple_object_mach_o_write_segment):
-	Cast the first argument to set_32 as needed.
-
-Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=38757aa88735ab2e511bc428e2407a5a5e9fa0be
-Signed-off-by: Brandon Maier <brandon.maier@collins.com>
----
- libiberty/simple-object-mach-o.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libiberty/simple-object-mach-o.c b/libiberty/simple-object-mach-o.c
-index 72b69d19c21..a8869e7c639 100644
---- a/libiberty/simple-object-mach-o.c
-+++ b/libiberty/simple-object-mach-o.c
-@@ -1228,7 +1228,7 @@ simple_object_mach_o_write_segment (simple_object_write *sobj, int descriptor,
-       /* Swap the indices, if required.  */
- 
-       for (i = 0; i < (nsects_in * 4); ++i)
--	set_32 (&index[i], index[i]);
-+	set_32 ((unsigned char *) &index[i], index[i]);
- 
-       sechdr_offset += sechdrsize;
- 
--- 
-2.45.0
-
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index a635b6d5ad..2324561a3e 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -22,16 +22,6 @@ config BR2_GCC_VERSION_POWERPC_SPE
 	depends on BR2_POWERPC_CPU_HAS_SPE
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
-config BR2_GCC_VERSION_11_X
-	bool "gcc 11.x"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_12
-	# powerpc spe support has been deprecated since gcc 8.x.
-	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
-	depends on !BR2_POWERPC_CPU_HAS_SPE
-	# ARC HS48 rel 31 only supported by gcc arc fork.
-	depends on !BR2_archs4x_rel31
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
-
 config BR2_GCC_VERSION_12_X
 	bool "gcc 12.x"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -83,7 +73,6 @@ config BR2_GCC_SUPPORTS_DLANG
 config BR2_GCC_VERSION
 	string
 	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
-	default "11.4.0"    if BR2_GCC_VERSION_11_X
 	default "12.3.0"    if BR2_GCC_VERSION_12_X
 	default "13.2.0"    if BR2_GCC_VERSION_13_X
 	default "14.1.0"    if BR2_GCC_VERSION_14_X
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index b686bb1ca7..08d4fca6e7 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -2,8 +2,6 @@
 sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-10.4.0/sha512.sum
 sha512  440c08ca746da450d9a1b35e8fd2305cb27e7e6987cd9d0f7d375f3b1fc9e4b0bd7acb3cd7bf795e72fcbead59cdef5b6c152862f5d35cd9fbfe6902101ce648  gcc-10.4.0.tar.xz
-# From https://gcc.gnu.org/pub/gcc/releases/gcc-11.4.0/sha512.sum
-sha512  a5018bf1f1fa25ddf33f46e720675d261987763db48e7a5fdf4c26d3150a8abcb82fdc413402df1c32f2e6b057d9bae6bdfa026defc4030e10144a8532e60f14  gcc-11.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-12.3.0/sha512.sum
 sha512  8fb799dfa2e5de5284edf8f821e3d40c2781e4c570f5adfdb1ca0671fcae3fb7f794ea783e80f01ec7bfbf912ca508e478bd749b2755c2c14e4055648146c204  gcc-12.3.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-13.2.0/sha512.sum
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
