Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B54BC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 10:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C40A60B37;
	Sun,  9 Jan 2022 10:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PsHvDv4AM7fo; Sun,  9 Jan 2022 10:54:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A9F960B34;
	Sun,  9 Jan 2022 10:54:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E7881BF4DD
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 10:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AE2540209
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 10:53:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j7XwWy5ngx5Q for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 10:53:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53D50401E1
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 10:53:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F003982B94; Sun,  9 Jan 2022 10:47:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 11:38:49 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: e6e12337f1874a5a53b42badf3d7fdd258d86a38
X-Git-Newrev: f0f648eb6bf3602d9e34691bea43cd6fae1eb40f
X-Patchwork-Hint: ignore
Message-Id: <20220109104743.F003982B94@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/openblas:
 security bump to version 0.3.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0f648eb6bf3602d9e34691bea43cd6fae1eb40f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

- Fix CVE-2021-4048: An out-of-bounds read flaw was found in the CLARRV,
  DLARRV, SLARRV, and ZLARRV functions in lapack through version 3.10.0,
  as also used in OpenBLAS before version 0.3.18. Specially crafted
  inputs passed to these functions could cause an application using
  lapack to crash or possibly disclose portions of its memory.
- Drop first and second patches (already in version)

https://github.com/xianyi/OpenBLAS/blob/v0.3.18/Changelog.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...o-consider-Os-when-determining-LAPACK_NO.patch} |  0
 package/openblas/0001-fix-gfortran-detection.patch | 30 --------------
 ...x-support-for-passing-FFLAGS-on-the-make-.patch | 47 ----------------------
 ...tem-don-t-specify-optimization-level-bui.patch} |  0
 package/openblas/openblas.hash                     |  2 +-
 package/openblas/openblas.mk                       |  4 +-
 6 files changed, 3 insertions(+), 80 deletions(-)

diff --git a/package/openblas/0003-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch b/package/openblas/0001-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch
similarity index 100%
rename from package/openblas/0003-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch
rename to package/openblas/0001-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch
diff --git a/package/openblas/0001-fix-gfortran-detection.patch b/package/openblas/0001-fix-gfortran-detection.patch
deleted file mode 100644
index 1fecdac3e5..0000000000
--- a/package/openblas/0001-fix-gfortran-detection.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From ece3ce581e3ec530eaccfe7f284c52e115ec7aa9 Mon Sep 17 00:00:00 2001
-From: Martin Kroeker <martin@ruby.chemie.uni-freiburg.de>
-Date: Wed, 10 Feb 2021 14:22:59 +0100
-Subject: [PATCH] Strip parenthesized (pkgversion) data from GCC version string
- to avoid misinterpretation
-
-See https://github.com/xianyi/OpenBLAS/issues/3099 for details.
-
-Upstream-status: backport
-
-[for import into Buildroot]
-Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-
-
----
- f_check | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/f_check b/f_check
-index e9aca4ff9..ffe9c6b46 100644
---- a/f_check
-+++ b/f_check
-@@ -75,6 +75,7 @@ if ($compiler eq "") {
- 
- 	} elsif ($data =~ /GNU/ || $data =~ /GCC/ ) {
- 
-+            $data =~ s/\(+.*?\)+//g;
- 	    $data =~ /(\d+)\.(\d+).(\d+)/;
- 	    $major = $1;
- 	    $minor = $2;
diff --git a/package/openblas/0002-Makefile-fix-support-for-passing-FFLAGS-on-the-make-.patch b/package/openblas/0002-Makefile-fix-support-for-passing-FFLAGS-on-the-make-.patch
deleted file mode 100644
index 72b387b93e..0000000000
--- a/package/openblas/0002-Makefile-fix-support-for-passing-FFLAGS-on-the-make-.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 4d3829fa52240c2b7e48770ab19584db33ba7863 Mon Sep 17 00:00:00 2001
-From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-Date: Fri, 5 Mar 2021 11:17:59 +0100
-Subject: [PATCH] Makefile: fix support for passing FFLAGS on the make
- command line
-
-When openblas is built while passing FFLAGS on the make command line, the
-compilation of lapack objects will not contain the flags specified in
-Makefile but _only_ those passed in FFLAGS.
-
-This can lead to build failure, e.g. because -fPIC is not passed to the
-compilation of most lapack objects, but is given to the link command:
-
-.../buildroot/output/host/bin/x86_64-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -O2 -DMAX_STACK_ALLOC=2048 -Wall -m64 -DF_INTERFACE_GFORT -fPIC -DNO_WARMUP -DMAX_CPU_NUMBER=4 -DMAX_PARALLEL_NUMBER=1 -DVERSION=\"0.3.9\" -DASMNAME= -DASMFNAME=_ -DNAME=_ -DCNAME= -DCHAR_NAME=\"_\" -DCHAR_CNAME=\"\" -DNO_AFFINITY -I..  -shared -o ../libopenblas_nehalem-r0.3.9.so \
--Wl,--whole-archive ../libopenblas_nehalem-r0.3.9.a -Wl,--no-whole-archive \
--Wl,-soname,libopenblas.so.0 -lm -lgfortran -lm -lgfortran
-.../buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/9.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: ../libopenblas_nehalem-r0.3.9.a(sbdsvdx.o): relocation R_X86_64_32 against `.rodata.str1.1' can not be used when making a shared object; recompile with -fPIC
-
-In the initial support for this principle, added in commit
-d0e731e8b825e7a554f245aa8f1118dcec9e2728, the flags specified in the
-makefile were appended to the flags specified on the command-line.
-
-Fix this situation by using 'override' for 'FFLAGS' in
-lapack-netlib/make.inc. The flags passed on the command-line are already
-part of the LAPACK_FFLAGS variable, so no '+=' is needed here.
-
-Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index fc5fe3f5..8ae1ff47 100644
---- a/Makefile
-+++ b/Makefile
-@@ -248,7 +248,7 @@ prof_lapack : lapack_prebuild
- lapack_prebuild :
- ifeq ($(NOFORTRAN), $(filter 0,$(NOFORTRAN)))
- 	-@echo "FC          = $(FC)" > $(NETLIB_LAPACK_DIR)/make.inc
--	-@echo "FFLAGS      = $(LAPACK_FFLAGS)" >> $(NETLIB_LAPACK_DIR)/make.inc
-+	-@echo "override FFLAGS      = $(LAPACK_FFLAGS)" >> $(NETLIB_LAPACK_DIR)/make.inc
- 	-@echo "POPTS       = $(LAPACK_FPFLAGS)" >> $(NETLIB_LAPACK_DIR)/make.inc
- 	-@echo "FFLAGS_NOOPT       = -O0 $(LAPACK_NOOPT)" >> $(NETLIB_LAPACK_DIR)/make.inc
- 	-@echo "PNOOPT      = $(LAPACK_FPFLAGS) -O0" >> $(NETLIB_LAPACK_DIR)/make.inc
--- 
-2.26.2
-
diff --git a/package/openblas/0004-Makefile.system-don-t-specify-optimization-level-bui.patch b/package/openblas/0002-Makefile.system-don-t-specify-optimization-level-bui.patch
similarity index 100%
rename from package/openblas/0004-Makefile.system-don-t-specify-optimization-level-bui.patch
rename to package/openblas/0002-Makefile.system-don-t-specify-optimization-level-bui.patch
diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index c58def9d5d..a1e35f4fc4 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  17d4677264dfbc4433e97076220adc79b050e4f8a083ea3f853a53af253bc380  openblas-0.3.9.tar.gz
+sha256  1632c1e8cca62d8bed064b37747e331a1796fc46f688626337362bf0d16aeadb  openblas-0.3.18.tar.gz
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 60b9d9b15b..4d506fa618 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.9
-OPENBLAS_SITE = $(call github,xianyi,OpenBLAS,v$(OPENBLAS_VERSION))
+OPENBLAS_VERSION = 0.3.18
+OPENBLAS_SITE = https://github.com/xianyi/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
 OPENBLAS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
