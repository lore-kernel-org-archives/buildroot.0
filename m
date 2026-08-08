Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6F7C55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 12:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4B78605F5;
	Sat,  8 Aug 2026 12:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KWcEI1L0o-ve; Sat,  8 Aug 2026 12:06:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5768260666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786190794;
	bh=c9vNB5NF8BDAZUOBkZ6iy4oLXuvj8aiTvlPROAvS3XI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JqlTgXL/y1SsLhinWd9sKYVrTEFunnjG5ZMDydsU9qmSX8VLEQBOxprOZwX+KW1XF
	 MVN/+hQJbC/sd+VYw6dz44zcTFTvxZ6c/++AlDMxkBY+UQAxYC4cmIjVLpBEccd7Mt
	 ofrtigdkVAmW7lPF2pqFgg9+IzwNl2CGDdjK2vfbGIYjwKRQjHtn7NfZhpxJxEC/1f
	 Edb2pqlE8m0gZ+TkuLvOVzolNblo4io4C+7EYwxXwxaITPutXT6mbP68WMJPsHfV9t
	 XhMQdt3Gq549y7bkZZLwAQBkibx8RgWE4lc751pL+COjnKEQPtmt/nEsuth+EccR1X
	 DcCCTk+2kQkiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5768260666;
	Sat,  8 Aug 2026 12:06:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3289282
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 12:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3CD540131
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 12:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ol8APNlaDTO9 for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 12:06:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 757E54011F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 757E54011F
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 12:06:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B9FE8C9A4; Sat,  8 Aug 2026 12:05:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 8 Aug 2026 12:57:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e9de8815f7e8cd5785df97819157e05b28cc560
X-Git-Newrev: a4d4c7527a28cd2efdb178735b90037c319818d9
X-Patchwork-Hint: ignore
Message-Id: <20260808120544.6B9FE8C9A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{glibc,
 localedef}: security bump version to 2.44-23-g11ac3d78f
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
Content-Type: multipart/mixed; boundary="===============6207853271624792465=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6207853271624792465==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a4d4c7527a28cd2efdb178735b90037c319818d9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://sourceware.org/pipermail/libc-announce/2026/000058.html

Fixes CVE-2026-4046, CVE-2026-4437, & CVE-2026-4438.

host-localedef:
- added build fix
- added Upstream: tag to patch 0002
- rebased patches

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 package/glibc/glibc.hash                           |  2 +-
 package/glibc/glibc.mk                             | 38 +------------------
 ...001-HACK-only-build-and-install-localedef.patch | 14 +++----
 ...ndency-on-GCC-to-4.8-and-binutils-to-2.24.patch | 10 +++--
 package/localedef/0005-HACK-Fix-dependencies.patch | 43 ++++++++++++++++++++++
 package/localedef/localedef.mk                     |  2 +-
 7 files changed, 59 insertions(+), 51 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index deb62f8496..c3ec943075 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -557,7 +557,6 @@ package/lm-sensors/0001-no-host-ldconfig.patch lib_patch.Upstream
 package/lmbench/0001-scripts-build-use-bin-bash-as-shell.patch lib_patch.Upstream
 package/lmbench/0002-src-Makefile-add-lmbench-to-list-of-executables.patch lib_patch.Upstream
 package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch lib_patch.Upstream
-package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch lib_patch.Upstream
 package/lockfile-progs/0001-sus3v-legacy.patch lib_patch.Sob lib_patch.Upstream
 package/lshw/0001-solve-Compile-error-when-g-version-is-less-than-5.patch lib_patch.Upstream
 package/ltrace/0001-arm-plt.patch lib_patch.Upstream
diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 97862aef14..750d328287 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  647325cc2e9f2c6260f3c48d0385ac5e30cb60d2ec2e5afd649555c518c9bf60  glibc-2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674-git4.tar.gz
+sha256  a818ca8450ef1e19a2413b2c9a2882f381f05be07b31e9b38085b6ba193d0af2  glibc-2.44-23-g11ac3d78fc5e4f7f2846002e099f773ad8ff82fc-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 797df314e9..7f12e7ffd0 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674
+GLIBC_VERSION = 2.44-23-g11ac3d78fc5e4f7f2846002e099f773ad8ff82fc
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -19,42 +19,6 @@ GLIBC_CPE_ID_VENDOR = gnu
 # allow proper matching with the CPE database.
 GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
 
-# Fixed by glibc-2.41-64-g1e16d0096d80a6e12d5bfa8e0aafdd13c47efd65
-GLIBC_IGNORE_CVES += CVE-2025-8058
-
-# Fixed by glibc-2.42-49-gb0ec8fb689df862171f0f78994a3bdeb51313545
-GLIBC_IGNORE_CVES += CVE-2026-0861
-
-# Fixed by glibc-2.42-50-g453e6b8dbab935257eb0802b0c97bca6b67ba30e
-GLIBC_IGNORE_CVES += CVE-2026-0915
-
-# Fixed by glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
-GLIBC_IGNORE_CVES += CVE-2025-15281
-
-# Fixed by glibc-2.43-16-g5c6fca0c62ce5bd6e68e259f138097756cbafd4d
-GLIBC_IGNORE_CVES += CVE-2026-4437
-
-# Fixed by glibc-2.43-17-gdd9945c0ba40d2dbc9eb7c99291ba6b69bd66718
-GLIBC_IGNORE_CVES += CVE-2026-4438
-
-# Fixed by glibc-2.43-22-g8362e8ce10b24068bacc19552c128dd10e082fd9
-GLIBC_IGNORE_CVES += CVE-2026-4046
-
-# Fixed by glibc-2.43-26-g2890b35cd361df2517525bf2c5f8c63f6f0d4a20
-GLIBC_IGNORE_CVES += CVE-2026-5928
-
-# Fixed by glibc-2.43-27-g4070d808bea1c077eb7e7d52b52b91cae98205d5
-GLIBC_IGNORE_CVES += CVE-2026-5450
-
-# Fixed by glibc-2.43-42-ge64ae5a591f0604b7504df4df631857bb11cc78b
-GLIBC_IGNORE_CVES += CVE-2026-5435
-
-# Fixed by glibc-2.43-43-g3a418da6a3938756763980541e440dbdd46900fb
-GLIBC_IGNORE_CVES += CVE-2026-6238
-
-# Fixed by glibc-2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674
-GLIBC_IGNORE_CVES += CVE-2026-6791
-
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/0001-HACK-only-build-and-install-localedef.patch
index b7c51c4ed3..33aab4c3dc 100644
--- a/package/localedef/0001-HACK-only-build-and-install-localedef.patch
+++ b/package/localedef/0001-HACK-only-build-and-install-localedef.patch
@@ -11,7 +11,7 @@ Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
 [yann.morin.1998@free.fr: rebase for 2.39]
 Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
-[Bernd: rebase for 2.43]
+[Bernd: rebase for 2.44]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Rules           | 14 ++++++++++----
@@ -19,10 +19,10 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  2 files changed, 10 insertions(+), 7 deletions(-)
 
 diff --git a/Rules b/Rules
-index b07400a979..4ce2180b49 100644
+index 71495028fb..5e1243e44d 100644
 --- a/Rules
 +++ b/Rules
-@@ -247,10 +247,16 @@ binaries-shared-notests = $(filter-out $(binaries-pie) $(binaries-static), \
+@@ -263,10 +263,16 @@ binaries-shared-notests = $(filter-out $(binaries-pie) $(binaries-static), \
  				       $(binaries-all-notests))
  
  ifneq "$(strip $(binaries-shared-notests))" ""
@@ -44,10 +44,10 @@ index b07400a979..4ce2180b49 100644
  
  ifneq "$(strip $(binaries-shared-tests))" ""
 diff --git a/locale/Makefile b/locale/Makefile
-index fc38c02114..c00bc085b4 100644
+index 25f9b5bbce..5cbcd34bd3 100644
 --- a/locale/Makefile
 +++ b/locale/Makefile
-@@ -76,7 +76,6 @@ aux = \
+@@ -77,7 +77,6 @@ aux = \
    xlocale \
    # aux
  others = \
@@ -55,7 +55,7 @@ index fc38c02114..c00bc085b4 100644
    localedef \
    # others
  #others-static = \
-@@ -84,7 +83,6 @@ others = \
+@@ -85,7 +84,6 @@ others = \
  # locale \
  # # others-static
  install-bin = \
@@ -63,7 +63,7 @@ index fc38c02114..c00bc085b4 100644
    localedef \
    # install-bin
  extra-objs = \
-@@ -96,7 +94,6 @@ extra-objs = \
+@@ -97,7 +95,6 @@ extra-objs = \
  generated += C-translit.h
  before-compile += $(objpfx)C-translit.h
  
diff --git a/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
index 30799cfc46..518a0489a7 100644
--- a/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
+++ b/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
@@ -23,6 +23,8 @@ GCC 5+
 GCC 6.2+
  https://sourceware.org/git/?p=glibc.git;a=commit;h=4dcbbc3b28aaeafe23e1a30db84055aa6f6fa987
 
+Upstream: Not applicable
+
 Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 [yann.morin.1998@free.fr: update for 2.37]
 Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
@@ -30,17 +32,17 @@ Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
 [yann.morin.1998@free.fr: rebase for 2.39]
 Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
-[Bernd: rebase for 2.43]
+[Bernd: rebase for 2.44]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  configure | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 0cd2269859..1c7e42ec10 100755
+index 604279533a..9daca5fb98 100755
 --- a/configure
 +++ b/configure
-@@ -5350,7 +5350,7 @@ printf %s "checking version of $LD... " >&6; }
+@@ -5307,7 +5307,7 @@ printf %s "checking version of $LD... " >&6; }
    ac_prog_version=`$LD --version 2>&1 | sed -n 's/^.*GNU ld.* \([0-9][0-9]*\.[0-9.]*\).*$/\1/p'`
    case $ac_prog_version in
      '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
@@ -49,7 +51,7 @@ index 0cd2269859..1c7e42ec10 100755
         ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
      *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
  
-@@ -5799,7 +5799,7 @@ int
+@@ -5756,7 +5756,7 @@ int
  main (void)
  {
  
diff --git a/package/localedef/0005-HACK-Fix-dependencies.patch b/package/localedef/0005-HACK-Fix-dependencies.patch
new file mode 100644
index 0000000000..36e18271d1
--- /dev/null
+++ b/package/localedef/0005-HACK-Fix-dependencies.patch
@@ -0,0 +1,43 @@
+From 8419660a3dcf8e6780365f7298e7d85ca0c5537f Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 26 Jul 2026 12:17:36 +0200
+Subject: [PATCH] HACK: Fix dependencies
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream commit 7cac99621e9601f916121bcaa9b7734a2e4c2529 changed the
+handling of dependencies which forced the addition of the make target
+'lib' to the target 'others' causing the build of unneeded targets for
+the host build of localedef including build errors:
+
+/home/bernd/buildroot/output/per-package/host-localedef/host/bin/ccache
+ /usr/bin/gcc gconv_simple.c
+[...]
+In file included from <command-line>:
+../include/wchar.h:154:20: error: ‘wcstof128’ undeclared here (not in a function); did you mean ‘wcstof128_l’?
+
+To fix the problem we remove the addition of the 'lib' make target.
+
+Upstream: Not applicable
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index a6aabca691..0ac1a45c36 100644
+--- a/Makefile
++++ b/Makefile
+@@ -581,7 +581,6 @@ endif
+ # 'tests' and 'xtests' additionally require the 'others' pass.  The
+ # testroot used by the container tests performs a full installation in
+ # its recipe, which must not run concurrently with the build passes.
+-$(addsuffix /others,$(subdirs)): lib
+ $(addsuffix /tests,$(subdirs)) $(addsuffix /xtests,$(subdirs)): others
+ $(objpfx)testroot.pristine/install.stamp: | others
+ 
+-- 
+2.47.3
+
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 8eff7f136d..7a6aa8a043 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674
+LOCALEDEF_VERSION = 2.44-23-g11ac3d78fc5e4f7f2846002e099f773ad8ff82fc
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git

--===============6207853271624792465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6207853271624792465==--
