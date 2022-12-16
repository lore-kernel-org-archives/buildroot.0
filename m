Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5704C4332F
	for <buildroot@archiver.kernel.org>; Fri, 16 Dec 2022 22:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BBE581EF2;
	Fri, 16 Dec 2022 22:19:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BBE581EF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ePP9hin36b5C; Fri, 16 Dec 2022 22:19:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2F9881F34;
	Fri, 16 Dec 2022 22:19:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2F9881F34
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D790B1BF21A
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 22:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2D9C81F34
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 22:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2D9C81F34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AOta23ujA928 for <buildroot@lists.busybox.net>;
 Fri, 16 Dec 2022 22:19:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0F7181EF2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0F7181EF2
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 22:19:45 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.223.124])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 19D6619F396;
 Fri, 16 Dec 2022 23:19:40 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 16 Dec 2022 23:19:34 +0100
Message-Id: <20221216221934.465323-1-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1671229182;
 bh=8vBNxESGcXpvs6vE//IDhmEm7tgDJeuTgnyNFaHYcPs=;
 h=From:To:Cc:Subject:Date:From;
 b=Q9Ews/9YSEsHkJomAFav2BDqWnqpT878+0xpTK78ZB7ciH671nzuaatlOMJibA6BV
 lUtMaRCzNkhlpZUsfeCSkBSXJ/HbDa3J0q/m6vJ5VRTlwl6IsLwJUrjCwtNWVFtXve
 YR+3AhQeRSNz5GOkpdbYKdYrakdjX1SgJ0njaCWoQw/1JU2pjEmSE3o30BNfEgyW7n
 w7dOVx3xPkr1BwRMWsYg0R2kut5biWm5b/AArGMnkAZnfTWF4GcmFtBgjVzshEhh/N
 4Kh6oCDtum3jxpweKLgRxPPXgV/YX80luACFXYwpXb4Ns/94bwrJBBfcLHcvUTRfYq
 tGXXwHcZ/cZ3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Q9Ews/9Y
Subject: [Buildroot] [PATCH 1/1] package/swipl: new package
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SWI-Prolog offers a comprehensive free Prolog environment. Since its
start in 1987, SWI-Prolog development has been driven by the needs of
real world applications. SWI-Prolog is widely used in research and
education as well as commercial applications.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Tested on top of branch master at commit f62d409 with commands:

    make check-package
    ...
    0 warnings generated

    python3 -m flake8  support/testing/tests/package/test_swipl.py
    [no-output]

    ./utils/test-pkg -a -p swipl 
                             arm-aarch64 [ 1/44]: OK
                   bootlin-aarch64-glibc [ 2/44]: OK
               bootlin-arcle-hs38-uclibc [ 3/44]: SKIPPED
                    bootlin-armv5-uclibc [ 4/44]: SKIPPED
                     bootlin-armv7-glibc [ 5/44]: OK
                   bootlin-armv7m-uclibc [ 6/44]: SKIPPED
                      bootlin-armv7-musl [ 7/44]: OK
                bootlin-m68k-5208-uclibc [ 8/44]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/44]: SKIPPED
             bootlin-microblazeel-uclibc [10/44]: SKIPPED
                bootlin-mipsel32r6-glibc [11/44]: OK
                   bootlin-mipsel-uclibc [12/44]: SKIPPED
                     bootlin-nios2-glibc [13/44]: SKIPPED
                 bootlin-openrisc-uclibc [14/44]: SKIPPED
        bootlin-powerpc64le-power8-glibc [15/44]: OK
           bootlin-powerpc-e500mc-uclibc [16/44]: SKIPPED
                   bootlin-riscv32-glibc [17/44]: OK
                   bootlin-riscv64-glibc [18/44]: OK
                    bootlin-riscv64-musl [19/44]: OK
                      bootlin-sh4-uclibc [20/44]: SKIPPED
                   bootlin-sparc64-glibc [21/44]: OK
                    bootlin-sparc-uclibc [22/44]: SKIPPED
                    bootlin-x86-64-glibc [23/44]: OK
                     bootlin-x86-64-musl [24/44]: OK
                   bootlin-x86-64-uclibc [25/44]: SKIPPED
                   bootlin-xtensa-uclibc [26/44]: SKIPPED
                            br-arm-basic [27/44]: SKIPPED
                    br-arm-full-nothread [28/44]: SKIPPED
                      br-arm-full-static [29/44]: SKIPPED
                   br-i386-pentium4-full [30/44]: SKIPPED
                br-i386-pentium-mmx-musl [31/44]: OK
                      br-mips64-n64-full [32/44]: SKIPPED
                 br-mips64r6-el-hf-glibc [33/44]: OK
               br-powerpc-603e-basic-cpp [34/44]: SKIPPED
               br-powerpc64-power7-glibc [35/44]: OK
                       linaro-aarch64-be [36/44]: OK
                          linaro-aarch64 [37/44]: OK
                              linaro-arm [38/44]: OK
                     sourcery-arm-armv4t [39/44]: SKIPPED
                            sourcery-arm [40/44]: SKIPPED
                     sourcery-arm-thumb2 [41/44]: SKIPPED
                         sourcery-mips64 [42/44]: OK
                           sourcery-mips [43/44]: OK
                          sourcery-nios2 [44/44]: SKIPPED
    44 builds, 24 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

    support/testing/run-tests \
      -d dl -o output_folder \
      tests.package.test_swipl.TestSWIPL
    ...
    OK
---
 DEVELOPERS                                    |  3 +
 package/Config.in                             |  1 +
 package/swipl/Config.in                       | 38 +++++++++++++
 package/swipl/swipl.hash                      |  4 ++
 package/swipl/swipl.mk                        | 55 +++++++++++++++++++
 support/testing/tests/package/test_swipl.py   | 52 ++++++++++++++++++
 .../test_swipl/rootfs-overlay/root/sudoku.pl  | 42 ++++++++++++++
 7 files changed, 195 insertions(+)
 create mode 100644 package/swipl/Config.in
 create mode 100644 package/swipl/swipl.hash
 create mode 100644 package/swipl/swipl.mk
 create mode 100644 support/testing/tests/package/test_swipl.py
 create mode 100644 support/testing/tests/package/test_swipl/rootfs-overlay/root/sudoku.pl

diff --git a/DEVELOPERS b/DEVELOPERS
index 3a0e3c14ab..38259fd0d8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1682,6 +1682,7 @@ F:	package/python-distro/
 F:	package/python-gnupg/
 F:	package/python-pyalsa/
 F:	package/riscv-isa-sim/
+F:	package/swipl/
 F:	package/tinycompress/
 F:	package/z3/
 F:	package/zynaddsubfx/
@@ -1696,6 +1697,8 @@ F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
 F:	support/testing/tests/package/test_python_pyalsa.py
+F:	support/testing/tests/package/test_swipl.py
+F:	support/testing/tests/package/test_swipl/
 F:	support/testing/tests/package/test_z3.py
 
 N:	Julien Viard de Galbert <julien@vdg.name>
diff --git a/package/Config.in b/package/Config.in
index 914c3584e9..64e2bdd991 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1351,6 +1351,7 @@ endmenu
 endif
 	source "package/quickjs/Config.in"
 	source "package/ruby/Config.in"
+	source "package/swipl/Config.in"
 	source "package/tcl/Config.in"
 if BR2_PACKAGE_TCL
 menu "Tcl libraries/modules"
diff --git a/package/swipl/Config.in b/package/swipl/Config.in
new file mode 100644
index 0000000000..8d8d5b1b76
--- /dev/null
+++ b/package/swipl/Config.in
@@ -0,0 +1,38 @@
+# swipl supports arch for which libc fenv.h provides all four macros:
+# FE_DOWNWARD, FE_TONEAREST, FE_TOWARDZERO, FE_UPWARD
+# See for example in glibc https://sourceware.org/git/glibc.git
+# git grep -E '^[[:space:]]*#[[:space:]]*define[[:space:]]+FE_(TONEAREST|UPWARD|DOWNWARD|TOWARDZERO)' sysdeps/
+config BR2_PACKAGE_SWIPL_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arceb || BR2_arcle
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386
+	default y if BR2_m68k
+	# BR2_microblaze has only FE_TONEAREST
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	# BR2_nios2 has only FE_TONEAREST
+	default y if BR2_or1k
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_riscv
+	default y if BR2_s390x
+	# BR2_sh has only FE_{TONEAREST,TOWARDZERO}
+	default y if BR2_sparc || BR2_sparc64
+	default y if BR2_x86_64
+	# BR2_xtensa supports only uclibc which does not have fenv.h
+
+config BR2_PACKAGE_SWIPL
+	bool "SWI-Prolog"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # __has_attribute()
+	depends on BR2_PACKAGE_SWIPL_ARCH_SUPPORTS
+	# swipl needs fenv.h which is not provided by uclibc
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	select BR2_PACKAGE_ZLIB
+	help
+	  SWI-Prolog offers a comprehensive free Prolog
+	  environment. Since its start in 1987, SWI-Prolog development
+	  has been driven by the needs of real world
+	  applications. SWI-Prolog is widely used in research and
+	  education as well as commercial applications.
+
+	  https://swi-prolog.org
diff --git a/package/swipl/swipl.hash b/package/swipl/swipl.hash
new file mode 100644
index 0000000000..be448a5604
--- /dev/null
+++ b/package/swipl/swipl.hash
@@ -0,0 +1,4 @@
+# From https://www.swi-prolog.org/download/stable
+sha256  33b5de34712d58f14c1e019bd1613df9a474f5e5fd024155a0f6e67ebb01c307  swipl-9.0.2.tar.gz
+# Locally calculated
+sha256  770594d0f4463b71f1485f00e4bc5cf4b6f667d62ef6bc9bde2fee236541992a  LICENSE
diff --git a/package/swipl/swipl.mk b/package/swipl/swipl.mk
new file mode 100644
index 0000000000..3f232f47f3
--- /dev/null
+++ b/package/swipl/swipl.mk
@@ -0,0 +1,55 @@
+################################################################################
+#
+# swipl
+#
+################################################################################
+
+SWIPL_VERSION = 9.0.2
+SWIPL_SITE = https://www.swi-prolog.org/download/stable/src
+SWIPL_LICENSE = BSD-2-Clause
+SWIPL_LICENSE_FILES = LICENSE
+
+SWIPL_DEPENDENCIES = host-swipl zlib
+
+# A host-swipl is needed to compile the target prolog boot
+# boot.prl file.
+HOST_SWIPL_CONF_OPTS = \
+	-DBUILD_PDF_DOCUMENTATION=OFF \
+	-DSWIPL_PACKAGES=OFF \
+	-DUSE_GMP=OFF \
+	-DUSE_TCMALLOC=OFF
+
+# swipl uses cmake macros try_run() and check_c_source_runs(), which
+# are not suitable for cross compilation.  We add results in cache to
+# avoid running those tests.  The SWIPL_NATIVE_FRIEND variable, is
+# meant to point to build directory of a host native swipl, rather
+# than the binary itself.  The Cmake macro will append "src/swipl" to
+# the path set to this variable.  Therefore, we cannot use the host
+# "swipl" binary installed in $(HOST_DIR)/usr/bin.
+SWIPL_CONF_OPTS = \
+	-DBUILD_PDF_DOCUMENTATION=OFF \
+	-DHAVE_WEAK_ATTRIBUTE=1 \
+	-DLLROUND_OK=1 \
+	-DMODF_OK=1 \
+	-DQSORT_R_GNU=1 \
+	-DSWIPL_NATIVE_FRIEND=$(BUILD_DIR)/host-swipl-$(SWIPL_VERSION) \
+	-DSWIPL_PACKAGES=OFF \
+	-DUSE_TCMALLOC=OFF
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+SWIPL_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
+ifeq ($(BR2_PACKAGE_GMP),y)
+SWIPL_CONF_OPTS += -DUSE_GMP=ON
+SWIPL_DEPENDENCIES += gmp
+else
+SWIPL_CONF_OPTS += -DUSE_GMP=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+SWIPL_DEPENDENCIES += ncurses
+endif
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
diff --git a/support/testing/tests/package/test_swipl.py b/support/testing/tests/package/test_swipl.py
new file mode 100644
index 0000000000..4248f6f13c
--- /dev/null
+++ b/support/testing/tests/package/test_swipl.py
@@ -0,0 +1,52 @@
+import os
+
+import infra.basetest
+
+
+class TestSWIPL(infra.basetest.BRTest):
+    # Need to use a different toolchain than the default due to
+    # swipl requiring fenv.h not provided by uclibc.
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
+        BR2_PACKAGE_SWIPL=y
+        BR2_ROOTFS_OVERLAY="{}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+           # overlay to add a swi prolog test scripts
+           infra.filepath("tests/package/test_swipl/rootfs-overlay"))
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check program executes
+        cmd = "swipl --version"
+        self.assertRunOk(cmd)
+
+        # Check swipl fails when goal is false
+        cmd = "swipl -g false"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertNotEqual(exit_code, 0)
+
+        # Test output
+        string = "Hello Buildroot !"
+        cmd = "swipl -g 'writeln(\"{}\")' -t halt".format(string)
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output, [string])
+
+        # Check the swipl demo file works (ex: "sam" likes "pizza")
+        cmd = "swipl -g '[swi(demo/likes)]' -g 'likes(sam,pizza)' -t halt"
+        self.assertRunOk(cmd)
+
+        # Run a more complex logic program (solve a sudoku)
+        cmd = "swipl -g top -t halt /root/sudoku.pl"
+        self.assertRunOk(cmd, timeout=10)
diff --git a/support/testing/tests/package/test_swipl/rootfs-overlay/root/sudoku.pl b/support/testing/tests/package/test_swipl/rootfs-overlay/root/sudoku.pl
new file mode 100644
index 0000000000..2b68b6cc89
--- /dev/null
+++ b/support/testing/tests/package/test_swipl/rootfs-overlay/root/sudoku.pl
@@ -0,0 +1,42 @@
+% taken from:
+% https://www.swi-prolog.org/pldoc/man?section=clpfd-sudoku
+
+:- use_module(library(clpfd)).
+
+sudoku(Rows) :-
+        length(Rows, 9), maplist(same_length(Rows), Rows),
+        append(Rows, Vs), Vs ins 1..9,
+        maplist(all_distinct, Rows),
+        transpose(Rows, Columns),
+        maplist(all_distinct, Columns),
+        Rows = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],
+        blocks(As, Bs, Cs),
+        blocks(Ds, Es, Fs),
+        blocks(Gs, Hs, Is).
+
+blocks([], [], []).
+blocks([N1,N2,N3|Ns1], [N4,N5,N6|Ns2], [N7,N8,N9|Ns3]) :-
+        all_distinct([N1,N2,N3,N4,N5,N6,N7,N8,N9]),
+        blocks(Ns1, Ns2, Ns3).
+
+problem(1, [[_,_,_,_,_,_,_,_,_],
+            [_,_,_,_,_,3,_,8,5],
+            [_,_,1,_,2,_,_,_,_],
+            [_,_,_,5,_,7,_,_,_],
+            [_,_,4,_,_,_,1,_,_],
+            [_,9,_,_,_,_,_,_,_],
+            [5,_,_,_,_,_,_,7,3],
+            [_,_,2,_,1,_,_,_,_],
+            [_,_,_,_,4,_,_,_,9]]).
+
+top :- writeln("Sudoku solution:"),
+    problem(1, Rows), sudoku(Rows), maplist(portray_clause, Rows),
+    Rows = [[9, 8, 7, 6, 5, 4, 3, 2, 1],
+            [2, 4, 6, 1, 7, 3, 9, 8, 5],
+            [3, 5, 1, 9, 2, 8, 7, 4, 6],
+            [1, 2, 8, 5, 3, 7, 6, 9, 4],
+            [6, 3, 4, 8, 9, 2, 1, 5, 7],
+            [7, 9, 5, 4, 6, 1, 8, 3, 2],
+            [5, 1, 9, 2, 8, 6, 4, 7, 3],
+            [4, 7, 2, 3, 1, 9, 5, 6, 8],
+            [8, 6, 3, 7, 4, 5, 2, 1, 9]].
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
