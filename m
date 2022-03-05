Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3995C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Mar 2022 17:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 568084056D;
	Sat,  5 Mar 2022 17:51:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cIWghZZg__Q1; Sat,  5 Mar 2022 17:51:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79CE540526;
	Sat,  5 Mar 2022 17:51:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F39D1BF427
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 17:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D21B40526
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 17:51:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FbTfW7y3roWh for <buildroot@lists.busybox.net>;
 Sat,  5 Mar 2022 17:51:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtpfb2-g21.free.fr (smtpfb2-g21.free.fr [212.27.42.10])
 by smtp2.osuosl.org (Postfix) with ESMTP id E14F2402FE
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 17:51:03 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtpfb2-g21.free.fr (Postfix) with ESMTP id 54ABA4DAA4
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 18:51:01 +0100 (CET)
Received: from b52572-12.ea.freescale.net.net (unknown [37.173.126.21])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 72E4F780333;
 Sat,  5 Mar 2022 18:50:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1646502655;
 bh=d+JacfhH7O8u5lUidgkawieKHBQqZ16yj3RjpJ0ROd8=;
 h=From:To:Cc:Subject:Date:From;
 b=bJCYhsn+Gv4+i58VD3UYw3SgNBpyTVzRdEyzOMy6g68XFU/EYte/VqA/BX3gmMVe6
 8uHYQhJw1j75c/kSsVi4LtKh5UhMLwB6eqGMYjfmw5csabd8EiVS27JCAS/72UVv8G
 6JdEri5i8ooc9PE0TSVjMlJ8v2Jz+K4YhNs80gukMR5i+4uw09nIsCYqBwaTltJ8w1
 GjwBo1+vnTXWxG4VJ/mAfnMjY9l/H2EGP14GJ9btCd5X4DHatoeArJbMJBcJDsgBZs
 rfv5wT9+VYUcVh/CpU1kgdN4YPCHxxHh8wRmbBDemKXOxtSlrQ+rNu/Y3zvl3SkUw4
 Gjcx3K9bvXtPQ==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat,  5 Mar 2022 18:50:41 +0100
Message-Id: <20220305175041.2225915-1-ju.o@free.fr>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/openblas: bump to version v0.3.20
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

This commit dropped a patch included upstream. The other patch was
rebased.

For change log since v0.3.18, see:
- https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.19
- https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.20

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Tested with:

    make check-package
    ...
    0 warnings generated

    ./utils/test-pkg -p openblas -a
    ...
    45 builds, 25 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 ...nsider-Os-when-determining-LAPACK_NO.patch | 31 -------------------
 ...on-t-specify-optimization-level-bui.patch} |  9 +++---
 package/openblas/openblas.hash                |  2 +-
 package/openblas/openblas.mk                  |  2 +-
 4 files changed, 6 insertions(+), 38 deletions(-)
 delete mode 100644 package/openblas/0001-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch
 rename package/openblas/{0002-Makefile.system-don-t-specify-optimization-level-bui.patch => 0001-Makefile.system-don-t-specify-optimization-level-bui.patch} (86%)

diff --git a/package/openblas/0001-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch b/package/openblas/0001-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch
deleted file mode 100644
index f9278bd099..0000000000
--- a/package/openblas/0001-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From ced08de1ad74811bc23d74121751537bfd8e9556 Mon Sep 17 00:00:00 2001
-From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-Date: Fri, 5 Mar 2021 11:15:52 +0100
-Subject: [PATCH] Makefile: also consider -O, -Og and -Os when stripping flags
-
-gcc also supports -O, -Og and -Os as optimization flags.
-They may be given on the make command-line by users.
-
-For the calculation of LAPACK_NOOPT, all such flags should be considered.
-
-Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index a22e16ba..fc5fe3f5 100644
---- a/Makefile
-+++ b/Makefile
-@@ -32,7 +32,7 @@ export NOFORTRAN
- export NO_LAPACK
- endif
- 
--LAPACK_NOOPT := $(filter-out -O0 -O1 -O2 -O3 -Ofast,$(LAPACK_FFLAGS))
-+LAPACK_NOOPT := $(filter-out -O0 -O1 -O2 -O3 -Ofast -O -Og -Os,$(LAPACK_FFLAGS))
- 
- SUBDIRS_ALL = $(SUBDIRS) test ctest utest exports benchmark ../laswp ../bench cpp_thread_test
- 
--- 
-2.26.2
-
diff --git a/package/openblas/0002-Makefile.system-don-t-specify-optimization-level-bui.patch b/package/openblas/0001-Makefile.system-don-t-specify-optimization-level-bui.patch
similarity index 86%
rename from package/openblas/0002-Makefile.system-don-t-specify-optimization-level-bui.patch
rename to package/openblas/0001-Makefile.system-don-t-specify-optimization-level-bui.patch
index bcc3e0eb6a..e0c738748a 100644
--- a/package/openblas/0002-Makefile.system-don-t-specify-optimization-level-bui.patch
+++ b/package/openblas/0001-Makefile.system-don-t-specify-optimization-level-bui.patch
@@ -1,4 +1,4 @@
-From 6d1c1350977d74fb2239f765bd92a5763cd3bb73 Mon Sep 17 00:00:00 2001
+From d8ec4e4c6ef69165179f376e365034de10e6fee3 Mon Sep 17 00:00:00 2001
 From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 Date: Fri, 5 Mar 2021 14:09:23 +0100
 Subject: [PATCH] Makefile.system: don't specify optimization level
@@ -12,16 +12,15 @@ The CFLAGS/FFLAGS would e.g. contain '-Os -O2' in which -O2 survives.
 Remove the optimization level specified in openblas itself.
 
 Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-
 ---
  Makefile.system | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.system b/Makefile.system
-index 1e30d05a..04b0be16 100644
+index 438a8148..9de1bbd5 100644
 --- a/Makefile.system
 +++ b/Makefile.system
-@@ -1216,11 +1216,11 @@ FCOMMON_OPT += -g
+@@ -1519,11 +1519,11 @@ FCOMMON_OPT += -g
  endif
  
  ifndef COMMON_OPT
@@ -36,5 +35,5 @@ index 1e30d05a..04b0be16 100644
  
  override CFLAGS     += $(COMMON_OPT) $(CCOMMON_OPT) -I$(TOPDIR)
 -- 
-2.26.2
+2.35.1
 
diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index a1e35f4fc4..71fc4d34c5 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1632c1e8cca62d8bed064b37747e331a1796fc46f688626337362bf0d16aeadb  openblas-0.3.18.tar.gz
+sha256  8495c9affc536253648e942908e88e097f2ec7753ede55aca52e5dead3029e3c  openblas-0.3.20.tar.gz
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 4d506fa618..608c2f24ea 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.18
+OPENBLAS_VERSION = 0.3.20
 OPENBLAS_SITE = https://github.com/xianyi/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
