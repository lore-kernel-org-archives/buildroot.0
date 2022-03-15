Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B3CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCE8B41708;
	Tue, 15 Mar 2022 21:22:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wz2JgAUO-_EY; Tue, 15 Mar 2022 21:22:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0F28416FD;
	Tue, 15 Mar 2022 21:22:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CD041BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C899C40103
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:21:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ABhKKKkxa_rA for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:21:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2ADD405A4
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:21:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1798D8408C; Tue, 15 Mar 2022 21:12:23 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 22:10:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e1e941b67035187d153eeb4ececb69fde104311
X-Git-Newrev: 1c2f90f44d6d563d4a641d3f634aab8637e53bfb
X-Patchwork-Hint: ignore
Message-Id: <20220315211223.1798D8408C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openblas: bump to version v0.3.20
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c2f90f44d6d563d4a641d3f634aab8637e53bfb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit dropped a patch included upstream. The other patch was
rebased.

For change log since v0.3.18, see:
- https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.19
- https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.20

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...so-consider-Os-when-determining-LAPACK_NO.patch | 31 ----------------------
 ...tem-don-t-specify-optimization-level-bui.patch} |  9 +++----
 package/openblas/openblas.hash                     |  2 +-
 package/openblas/openblas.mk                       |  2 +-
 4 files changed, 6 insertions(+), 38 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
