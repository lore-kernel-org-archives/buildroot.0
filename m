Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC46C28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 18:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A8016FA2C;
	Fri, 28 Mar 2025 18:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z7l-Qrz5UnT7; Fri, 28 Mar 2025 18:52:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B70067067F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B70067067F;
	Fri, 28 Mar 2025 18:52:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1609412A
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92BBE703C8
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:51:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2lDdHm-9Cc-e for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 18:51:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B69FC7068D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B69FC7068D
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:51:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B12DD8375E; Fri, 28 Mar 2025 18:51:49 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 28 Mar 2025 19:39:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 364afb899df96f2503ab901063acebdeb8950761
X-Git-Newrev: 0a5a0772c238d1bd9acc61cd0017ce1ef305195c
X-Patchwork-Hint: ignore
Message-Id: <20250328185149.B12DD8375E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: bump 16.x series to 16.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0a5a0772c238d1bd9acc61cd0017ce1ef305195c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a corrective release over GDB 16.1, fixing the following issues:

    PR build/32578 (cannot build GDB 16.1 out of tree when calling the configure script with a relative path)
    PR tui/32592 ([gdb/tui] internal error in tui-winsource.c:340:refresh_window)
    PR remote/32593 (Incompatibilities between GDB's and LLDB's 'x' packet implementation)
    PR build/32610 (Missing #include file in darwin_nat.c)

None of which is really super important for Buildroot, but at least
we're using the latest without wondering why we're not.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                    | 18 +++++++++---------
 ...ace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |  4 ++--
 ...ce-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch |  4 ++--
 .../gdb/{16.1 => 16.2}/0003-use-asm-sgidefs.h.patch    |  4 ++--
 .../0004-gdbserver-fix-build-for-m68k.patch            |  4 ++--
 ...0005-nat-fork-inferior-include-linux-ptrace.h.patch |  4 ++--
 ...0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch |  4 ++--
 .../{16.1 => 16.2}/0007-fix-musl-build-on-riscv.patch  |  4 ++--
 .../0008-gdbserver-Makefile.in-fix-NLS-build.patch     |  4 ++--
 .../0009-gdb-Fix-native-build-on-xtensa.patch          |  4 ++--
 package/gdb/Config.in.host                             |  2 +-
 package/gdb/gdb.hash                                   |  2 +-
 12 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 260168b0e8..0907cb39ed 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -505,15 +505,15 @@ package/gdb/15.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch lib_patch.U
 package/gdb/15.1/0007-fix-musl-build-on-riscv.patch lib_patch.Upstream
 package/gdb/15.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch lib_patch.Upstream
 package/gdb/15.1/0009-gdb-Fix-native-build-on-xtensa.patch lib_patch.Upstream
-package/gdb/16.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch lib_patch.Upstream
-package/gdb/16.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch lib_patch.Upstream
-package/gdb/16.1/0003-use-asm-sgidefs.h.patch lib_patch.Upstream
-package/gdb/16.1/0004-gdbserver-fix-build-for-m68k.patch lib_patch.Upstream
-package/gdb/16.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch lib_patch.Upstream
-package/gdb/16.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch lib_patch.Upstream
-package/gdb/16.1/0007-fix-musl-build-on-riscv.patch lib_patch.Upstream
-package/gdb/16.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch lib_patch.Upstream
-package/gdb/16.1/0009-gdb-Fix-native-build-on-xtensa.patch lib_patch.Upstream
+package/gdb/16.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch lib_patch.Upstream
+package/gdb/16.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch lib_patch.Upstream
+package/gdb/16.2/0003-use-asm-sgidefs.h.patch lib_patch.Upstream
+package/gdb/16.2/0004-gdbserver-fix-build-for-m68k.patch lib_patch.Upstream
+package/gdb/16.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch lib_patch.Upstream
+package/gdb/16.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch lib_patch.Upstream
+package/gdb/16.2/0007-fix-musl-build-on-riscv.patch lib_patch.Upstream
+package/gdb/16.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch lib_patch.Upstream
+package/gdb/16.2/0009-gdb-Fix-native-build-on-xtensa.patch lib_patch.Upstream
 package/genpart/0001-fix-return-code.patch lib_patch.Upstream
 package/gensio/0001-Fix-missing-EVP_PKEY_ED25519-build-error-on-libressl.patch lib_patch.Upstream
 package/gerbera/S99gerbera lib_sysv.Indent
diff --git a/package/gdb/16.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/16.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
similarity index 95%
rename from package/gdb/16.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
rename to package/gdb/16.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
index 195aa58a20..5118e929df 100644
--- a/package/gdb/16.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
+++ b/package/gdb/16.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -1,4 +1,4 @@
-From d251b3cd408849d032c869846364964d1ddc7a9e Mon Sep 17 00:00:00 2001
+From 7fbcc55c3b2dac91dcb0a8dc6daa5514ff323185 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 6 Aug 2016 17:32:50 -0700
 Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
@@ -51,5 +51,5 @@ index 3ce978f4c7c..38534297cdf 100644
  #include "arch/ppc-linux-common.h"
  #include "arch/ppc-linux-tdesc.h"
 -- 
-2.47.1
+2.48.1
 
diff --git a/package/gdb/16.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/16.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
similarity index 94%
rename from package/gdb/16.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
rename to package/gdb/16.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
index 9dae76b3be..878239a82e 100644
--- a/package/gdb/16.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
+++ b/package/gdb/16.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
@@ -1,4 +1,4 @@
-From a5098f7fb6ec72c3694d1e0c34e6db982110d944 Mon Sep 17 00:00:00 2001
+From ab3ce973d6423552de732a05ac9da04c22b21411 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sat, 3 Jun 2017 21:23:52 +0200
 Subject: [PATCH] sh/ptrace: Define pt_{dsp,}regs uapi_pt_{dsp,}regs on !GLIBC
@@ -39,5 +39,5 @@ index 64e6de3480b..4770e652614 100644
  #define sh_num_regs 41
  
 -- 
-2.47.1
+2.48.1
 
diff --git a/package/gdb/16.1/0003-use-asm-sgidefs.h.patch b/package/gdb/16.2/0003-use-asm-sgidefs.h.patch
similarity index 93%
rename from package/gdb/16.1/0003-use-asm-sgidefs.h.patch
rename to package/gdb/16.2/0003-use-asm-sgidefs.h.patch
index 4738733c53..b36d3730de 100644
--- a/package/gdb/16.1/0003-use-asm-sgidefs.h.patch
+++ b/package/gdb/16.2/0003-use-asm-sgidefs.h.patch
@@ -1,4 +1,4 @@
-From 047f9e6b31e2d2dcc633d2d1749153a8bb4f5aa1 Mon Sep 17 00:00:00 2001
+From aa66834f88463c23a641c12e967bce68799cda47 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <amccurdy@gmail.com>
 Date: Sat, 30 Apr 2016 15:29:06 -0700
 Subject: [PATCH] use <asm/sgidefs.h>
@@ -36,5 +36,5 @@ index 3d072ea935c..d763c9b8f7e 100644
  #include <asm/ptrace.h>
  #include "inf-ptrace.h"
 -- 
-2.47.1
+2.48.1
 
diff --git a/package/gdb/16.1/0004-gdbserver-fix-build-for-m68k.patch b/package/gdb/16.2/0004-gdbserver-fix-build-for-m68k.patch
similarity index 96%
rename from package/gdb/16.1/0004-gdbserver-fix-build-for-m68k.patch
rename to package/gdb/16.2/0004-gdbserver-fix-build-for-m68k.patch
index 0cee801fed..8711190747 100644
--- a/package/gdb/16.1/0004-gdbserver-fix-build-for-m68k.patch
+++ b/package/gdb/16.2/0004-gdbserver-fix-build-for-m68k.patch
@@ -1,4 +1,4 @@
-From 15097e614fd3c686a69779a578a24b63b674925c Mon Sep 17 00:00:00 2001
+From cec7ed0cb055f960a689f2403a871a7e3e852e6e Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Fri, 22 Jun 2018 22:40:26 +0200
 Subject: [PATCH] gdbserver: fix build for m68k
@@ -60,5 +60,5 @@ index 8020e49ac6e..d9ba6235288 100644
  #define m68k_num_gregs 18
  
 -- 
-2.47.1
+2.48.1
 
diff --git a/package/gdb/16.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch b/package/gdb/16.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch
similarity index 96%
rename from package/gdb/16.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
rename to package/gdb/16.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch
index 23c816887d..1e0bfdf6d1 100644
--- a/package/gdb/16.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
+++ b/package/gdb/16.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch
@@ -1,4 +1,4 @@
-From 4919bd469c1385cef4109280c6861db760001690 Mon Sep 17 00:00:00 2001
+From 11b382a75cae8f4599e9d3f8b85815d2d95a58fa Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sun, 24 Jun 2018 23:33:55 +0200
 Subject: [PATCH] nat/fork-inferior: include linux-ptrace.h
@@ -49,5 +49,5 @@ index 41765b102bc..a44a1d48722 100644
  
  extern char **environ;
 -- 
-2.47.1
+2.48.1
 
diff --git a/package/gdb/16.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch b/package/gdb/16.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
similarity index 94%
rename from package/gdb/16.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
rename to package/gdb/16.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
index ea045e4231..6d205279da 100644
--- a/package/gdb/16.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
+++ b/package/gdb/16.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
@@ -1,4 +1,4 @@
-From 74c9d53de1c3c3de2e66e559889ce041f41e952a Mon Sep 17 00:00:00 2001
+From 95d6a5a844083585f4f7b235cba14be94595b04a Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Sat, 6 Nov 2021 10:06:25 +0100
 Subject: [PATCH] Fix getrandom compile for uclibc < v1.0.35
@@ -35,5 +35,5 @@ index e1468730933..3948d8d552a 100644
  
  #include <errno.h>
 -- 
-2.47.1
+2.48.1
 
diff --git a/package/gdb/16.1/0007-fix-musl-build-on-riscv.patch b/package/gdb/16.2/0007-fix-musl-build-on-riscv.patch
similarity index 96%
rename from package/gdb/16.1/0007-fix-musl-build-on-riscv.patch
rename to package/gdb/16.2/0007-fix-musl-build-on-riscv.patch
index 5e8cce435e..aea5eef84a 100644
--- a/package/gdb/16.1/0007-fix-musl-build-on-riscv.patch
+++ b/package/gdb/16.2/0007-fix-musl-build-on-riscv.patch
@@ -1,4 +1,4 @@
-From 5895710a6692dfdf00fdb258b89dae6c6784eedc Mon Sep 17 00:00:00 2001
+From 76bee99c13ab44949c25582f49528cd0c661cdb3 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Wed, 10 Nov 2021 23:14:54 +0100
 Subject: [PATCH] fix musl build on riscv
@@ -56,5 +56,5 @@ index 44c805bb6d6..d43c3b9fe02 100644
  
  class riscv_target : public linux_process_target
 -- 
-2.47.1
+2.48.1
 
diff --git a/package/gdb/16.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch b/package/gdb/16.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch
similarity index 96%
rename from package/gdb/16.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch
rename to package/gdb/16.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch
index d5eb12a65d..10156407cb 100644
--- a/package/gdb/16.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch
+++ b/package/gdb/16.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch
@@ -1,4 +1,4 @@
-From dd6ca97fa5fa5acd0fdaa5aa7e5aee33f92ba2df Mon Sep 17 00:00:00 2001
+From e5a09ecd2a222168a6c58eb57a171f64e75ad053 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Thu, 18 Nov 2021 22:52:08 +0100
 Subject: [PATCH] gdbserver/Makefile.in: fix NLS build
@@ -34,5 +34,5 @@ index 365dcf23650..42e1b7bcf6d 100644
  # Put the proper machine-specific files first, so M-. on a machine
  # specific routine gets the one for the correct machine.
 -- 
-2.47.1
+2.48.1
 
diff --git a/package/gdb/16.1/0009-gdb-Fix-native-build-on-xtensa.patch b/package/gdb/16.2/0009-gdb-Fix-native-build-on-xtensa.patch
similarity index 97%
rename from package/gdb/16.1/0009-gdb-Fix-native-build-on-xtensa.patch
rename to package/gdb/16.2/0009-gdb-Fix-native-build-on-xtensa.patch
index 1455810dd5..4d5a171aff 100644
--- a/package/gdb/16.1/0009-gdb-Fix-native-build-on-xtensa.patch
+++ b/package/gdb/16.2/0009-gdb-Fix-native-build-on-xtensa.patch
@@ -1,4 +1,4 @@
-From cbb4871a793965abbe53df76c699ff7c4936d4a3 Mon Sep 17 00:00:00 2001
+From 43501f9838e7aefd7d5d19aede49491591c34c98 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Sun, 28 Aug 2022 23:21:37 +0200
 Subject: [PATCH] gdb: Fix native build on xtensa
@@ -53,5 +53,5 @@ index f8509b02e07..794be827f9a 100644
  /* Defines ps_err_e, struct ps_prochandle.  */
  #include "gdb_proc_service.h"
 -- 
-2.47.1
+2.48.1
 
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 3d21fc2a3f..42e3928a19 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -71,5 +71,5 @@ config BR2_GDB_VERSION
 	default "arc-2023.09-release" if BR2_arc
 	default "14.2"     if BR2_GDB_VERSION_14 || (!BR2_PACKAGE_HOST_GDB && !BR2_TOOLCHAIN_GCC_AT_LEAST_9)
 	default "15.1"	   if BR2_GDB_VERSION_15 || (!BR2_PACKAGE_HOST_GDB && BR2_TOOLCHAIN_GCC_AT_LEAST_9)
-	default "16.1"	   if BR2_GDB_VERSION_16
+	default "16.2"	   if BR2_GDB_VERSION_16
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 405fb764ac..0336e4a7a4 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -1,7 +1,7 @@
 # From https://gcc.gnu.org/pub/gdb/releases/sha512.sum
 sha512  7e07941f1fe661288cc571b4964012ceabc1760624fce20320db2f470c01439b2386f859b5288da13204b758e2e3b22a74c68c012178db93b9529b06f1e22ede  gdb-14.2.tar.xz
 sha512  0217434073023a8b8316088bf3ee95d53a1b6a7897f6269095429016a8900f9a05e130c390d8d5d5550cc515c16519de1071d8eef96aa58e38056c7e37da1d8b  gdb-15.1.tar.xz
-sha512  17b322fde0655a849506851c879aba9ad1f8bfee804b900efc718806091bec75511383bd4d632b8b32a32ef207233331581501157df18a8df528abe6ff667577  gdb-16.1.tar.xz
+sha512  f04a6335dbdee371edb7e3213294fcbb878ac39adedb73f7e17e621f54350488f5f5bea9bc742639239c122d590bed158771a74fc3aaeaa7fa0ae304232576a3  gdb-16.2.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  3518b47d5c11d1fb478ee152bde1719363f9391db73f3b9f5491217c17742bef8ebca6a51a40302dfaa9476c5a32a8b8f70a4bf64289422dea5f750ae53ab88d  gdb-arc-2023.09-release.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
