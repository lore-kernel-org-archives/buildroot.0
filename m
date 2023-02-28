Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99037C64EC4
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 22:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1294360AE7;
	Tue, 28 Feb 2023 22:16:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1294360AE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UMCj--6L-dPK; Tue, 28 Feb 2023 22:16:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9450D60B09;
	Tue, 28 Feb 2023 22:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9450D60B09
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 465161BF580
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 22:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D73881819
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 22:16:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D73881819
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kvjfb2MAG-Dj for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 22:16:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC322814B6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC322814B6
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 22:16:27 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.87]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McpJg-1oxWbT2RsI-00ZwpF; Tue, 28
 Feb 2023 23:16:25 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 23:16:25 +0100
Message-Id: <20230228221625.32577-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:Ks+ebGDe8/VTvU8mYk0U8OKaWSHSTUCxtzbMQGvabU7Z/IexHfe
 kI0BGi9s10Gbua3XSOmaDw4693v9elldUUIetZBrIkDaMgB34GmKq0oj5AYpmxl+W7KMwEq
 TCVbyE9vY5ZpLciWXl4tqqqqqRYCbrrosnPyfqKq8koCSVzaaQ7/xRVArrorT45f0BpdmVg
 VsHxO10nKYxbLjHKMfiHQ==
UI-OutboundReport: notjunk:1;M01:P0:JRq8CSUXsPo=;09AzFgDffhcF+L2S6gZd+ixDixN
 HeYWGL7wjBxwOQG12YNTwF8JT0rKuW/m/FEU18aF/j37Ft80W0v7ODFRKGGlUOuTRtVD27WB6
 Ss7e1HEpphJZmNFviB9QHPrXu992PbHbiok9r0I1zQNj5kpYmU3lVTbICEosmuRZRr6VclX2t
 B2Go5MFZrtcBWvLbeFoiQ+7ynti0souR/JObwxB4oTqchmf2v/Ey/6UZ2/U6BC+1Wja39RSym
 SIyYTzW2XIH1Mmp1/NNJnn56FC/Tbc5cXXvmsm5ogv6jXUknkfHylaTBB8wP+tX6nnth1pD4y
 LhEXM7jeSzh1NmNW+lIqh1eo7zuS7CTRwnoXrux/EupEvN7imRl1PqwhXogc/UhBslb2WJMFS
 KajPTh6FZNRwelwVKr6HlNv78Jljvr1LHX16ZO7EZAJvgqH6tnLWtTmAIZXrrAM0eZcglxfNG
 T31adHv1v0hQuD1XYqgP9zeAaR9rPRbRFdvjeW92ASHYoFRQRNXPQT7gtznf7pOjfr6CmzEuo
 h+cPPh66q+w0/WRkVSMQ+6qRw00RY2jjShbcxQtB38iUFTGQltIlqQc1v4Vtf3FrkhYDwwhBh
 YEpTX4e61LP3tFZ2x8Xkk3oU+aKDU2KYWtZ9IRQxx2jpG1M8SSsOZD2Fy1x0ju5X1YJibWAD1
 f3/8KEQRD9JKVrUe1WqutI04wqSiuvZhkv1bhUM6gMec6Oi1BzJatE6gTH8cCOhpYVcJIJmZ/
 URvCjXLhGjbPEYWk4YgSj6wOgErR5SJfDyHAR5G012a0EP8t41wItxZH/migei5H1KFAM4vsI
 WCmpVAsEJn4Nnjfz4AJZCxCcu7wOOjcw652+sveAlpDJAy9Kqm6r2tYwiiCC9HFCvDuDOq26v
 IUonFDlVZPxr6mvFSjQEGIG90EWIjMLtbWa4Jdda7okKqDhNpwjLLdQh/t3lPy6bFuRgJfMv8
 /3mjWOO5dkLbQT9Ro17+EhwUpBk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1677622585; i=ps.report@gmx.net;
 bh=HUzrLSsXHxn93nltd60byOgH6AauDOJ/wDRc5rPFzuw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=K5F3msz1VXnJDjp5dMAJJTGvD/2Joy4ZFzcHXwL3K1LpXJoKKRZ/r2QPRQoQC/hCQ
 Qh+XofhQgJ4bRXRshcwGjyzF/Z3j4DCo3YN5I9E6sCh0VHaV0hXcMI4CZBqXJD/q/W
 NdFKuUFzgGhtTwb5QLjbV3joxxu9+omsX5j8WNEGEBqlpgKBmu2rmIxMPo1J3o1SFs
 wPdCm82IrGb+SSBqRCAGfuUb9xI4zDNGzL7z8cgAiTlb9nvaEDPpyVtKxvDIekfpVa
 V8P9MH6wqXa8CJnanqJISykUnk/XUHL1PXF21840A+WyPiftNje4AbyhOoLgxzi8In
 ZO2mbnH1o73ow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=K5F3msz1
Subject: [Buildroot] [PATCH v1] package/apr: security bump version to 1.7.2
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- remove 0001-cross-compile.patch
  (superseeded by upstream commit [1])

- rename 0002-sys-param-h.patch to 0001-sys-param-h.patch

- remove 0003-Merge-r1887279-from-trunk.patch
  (from upstream [2])

- remove 0004-apr-1.7.0-CVE-2021-35940.patch
  (superseeded by upstream commit [3], remove APR_IGNORE_CVES accordingly)

- set new configure option '--disable-sctp' (no libsctp provided by buildroot)

- set new 'ac_cv_strerror_r_rc_int' explicitly to no (default for
  cross compile)

- set new 'ac_cv_mmap__dev_zero' explicitly to yes

- revert two upstream commits ([4], [5]) to fix apr-util build, fails
  otherwise because of some path mismatch where to find apr_rules.mk copied
  to apr-util-1.6.3/build/rules.mk, fixes:

    Makefile:50: .../build/apr-util-1.6.3/build/rules.mk: No such file or directory

For details see [6].

[1] https://github.com/apache/apr/commit/866e1df66be6704a584feaf5c3d241e3d631d03a
[2] https://github.com/apache/apr/commit/0a763c5e500f4304b7c534fae0fad430d64982e8
[3] https://github.com/apache/apr/commit/e0be630b681fac7b8b5e2f2e402a8e18a147f966
[4] https://github.com/apache/apr/commit/f82374627b3a6500a7a6cb11e48bcac59bcbb6a1
[5] https://github.com/apache/apr/commit/b6dbbc77da35a7b46754c99f465827f2a583e23c
[6] https://downloads.apache.org/apr/CHANGES-APR-1.7

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/apr/0001-cross-compile.patch          |  58 ---------
 ...s-param-h.patch => 0001-sys-param-h.patch} |   0
 ...r1872164.-Fix-the-name-of-libtool-wh.patch |  30 +++++
 .../apr/0003-Merge-r1887279-from-trunk.patch  |  69 -----------
 ...Add-the-ability-to-cross-compile-APR.patch | 112 ++++++++++++++++++
 .../apr/0004-apr-1.7.0-CVE-2021-35940.patch   |  57 ---------
 package/apr/apr.hash                          |   4 +-
 package/apr/apr.mk                            |   7 +-
 8 files changed, 148 insertions(+), 189 deletions(-)
 delete mode 100644 package/apr/0001-cross-compile.patch
 rename package/apr/{0002-sys-param-h.patch => 0001-sys-param-h.patch} (100%)
 create mode 100644 package/apr/0002-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch
 delete mode 100644 package/apr/0003-Merge-r1887279-from-trunk.patch
 create mode 100644 package/apr/0003-Revert-Add-the-ability-to-cross-compile-APR.patch
 delete mode 100644 package/apr/0004-apr-1.7.0-CVE-2021-35940.patch

diff --git a/package/apr/0001-cross-compile.patch b/package/apr/0001-cross-compile.patch
deleted file mode 100644
index 559ebb74ba..0000000000
--- a/package/apr/0001-cross-compile.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-Fix cross-compilation
-
-Patch was backported from Apache httpd:
-http://svn.apache.org/viewvc?view=revision&revision=1327907
-http://svn.apache.org/viewvc?view=revision&revision=1328390
-http://svn.apache.org/viewvc?view=revision&revision=1328714
-
-Patch submitted upstream:
-https://issues.apache.org/bugzilla/show_bug.cgi?id=57058
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr apr-1.5.1.org/configure.in apr-1.5.1/configure.in
---- apr-1.5.1.org/configure.in	2014-01-25 16:17:29.000000000 +0100
-+++ apr-1.5.1/configure.in	2014-10-05 11:20:40.080746760 +0200
-@@ -118,6 +118,16 @@
- echo "Configuring APR library"
- echo "Platform: $host"
- 
-+dnl In case of cross compilation we set CC_FOR_BUILD to cc unless
-+dnl we got already CC_FOR_BUILD from environment.
-+if test "x${build_alias}" != "x${host_alias}"; then
-+  if test "x${CC_FOR_BUILD}" = "x"; then
-+    CC_FOR_BUILD=cc
-+  fi
-+fi
-+AC_SUBST(CC_FOR_BUILD)
-+AC_SUBST(CFLAGS_FOR_BUILD)
-+
- dnl Some initial steps for configuration.  We setup the default directory
- dnl and which files are to be configured.
- 
-diff -uNr apr-1.5.1.org/Makefile.in apr-1.5.1/Makefile.in
---- apr-1.5.1.org/Makefile.in	2014-03-17 16:10:26.000000000 +0100
-+++ apr-1.5.1/Makefile.in	2014-10-05 11:22:53.031070519 +0200
-@@ -8,6 +8,8 @@
- # APR (Apache Portable Runtime) library Makefile.
- #
- CPP = @CPP@
-+CC_FOR_BUILD = @CC_FOR_BUILD@
-+CFLAGS_FOR_BUILD = @CFLAGS_FOR_BUILD@
- 
- # get substituted into some targets
- APR_MAJOR_VERSION=@APR_MAJOR_VERSION@
-@@ -134,8 +134,13 @@
- 	$(APR_MKDIR) tools
- 	$(LT_COMPILE)
- 
-+ifdef CC_FOR_BUILD
-+tools/gen_test_char@EXEEXT@: tools/gen_test_char.c $(LOCAL_LIBS)
-+	$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) -DCROSS_COMPILE -o $@ $<
-+else
- tools/gen_test_char@EXEEXT@: $(OBJECTS_gen_test_char)
- 	$(LINK_PROG) $(OBJECTS_gen_test_char) $(ALL_LIBS)
-+endif
- 
- include/private/apr_escape_test_char.h: tools/gen_test_char@EXEEXT@
- 	$(APR_MKDIR) include/private
diff --git a/package/apr/0002-sys-param-h.patch b/package/apr/0001-sys-param-h.patch
similarity index 100%
rename from package/apr/0002-sys-param-h.patch
rename to package/apr/0001-sys-param-h.patch
diff --git a/package/apr/0002-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch b/package/apr/0002-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch
new file mode 100644
index 0000000000..f80db1cb6b
--- /dev/null
+++ b/package/apr/0002-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch
@@ -0,0 +1,30 @@
+From 0aa7e33372b479a26e5f04dfc4801e24573a8737 Mon Sep 17 00:00:00 2001
+From: Graham Leggett <minfrin@apache.org>
+Date: Wed, 1 Jan 2020 10:43:39 +0000
+Subject: [PATCH] Revert: Backport r1872164. Fix the name of libtool when
+ cross compiling.
+
+git-svn-id: https://svn.apache.org/repos/asf/apr/apr/branches/1.7.x@1872165 13f79535-47bb-0310-9956-ffa450edef68
+
+[Revert upstream commit https://github.com/apache/apr/commit/f82374627b3a6500a7a6cb11e48bcac59bcbb6a1]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ apr-config.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/apr-config.in b/apr-config.in
+index bed47ca..4873fc0 100644
+--- a/apr-config.in
++++ b/apr-config.in
+@@ -246,7 +246,7 @@ while test $# -gt 0; do
+     if test "$location" = "installed"; then
+         echo "${installbuilddir}/libtool"
+     elif test "$location" = "crosscompile"; then
+-        echo "$APR_TARGET_DIR/${installbuilddir}/libtool"
++        echo "$APR_TARGET_DIR/${installbuilddir}/build"
+     else
+         echo "$APR_BUILD_DIR/libtool"
+     fi
+-- 
+2.39.2
+
diff --git a/package/apr/0003-Merge-r1887279-from-trunk.patch b/package/apr/0003-Merge-r1887279-from-trunk.patch
deleted file mode 100644
index 444b9d2b06..0000000000
--- a/package/apr/0003-Merge-r1887279-from-trunk.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From a15958a37a06f71c42c690278f9c958b93b7ee20 Mon Sep 17 00:00:00 2001
-From: Yann Ylavic <ylavic@apache.org>
-Date: Thu, 11 Mar 2021 14:10:21 +0000
-Subject: [PATCH] Merge r1887279 from trunk:
-
-build/apr_common.m4: avoid explicit inclusion of "confdefs.h"
-
-The failure is observed on `autoconf-2.69d` (soon to be released
-as `autoconf-2.70`). There `int64_t` detection fails as:
-
-$ autoreconf && ./configure
-checking whether int64_t and int use fmt %d... no
-checking whether int64_t and long use fmt %ld... no
-checking whether int64_t and long long use fmt %lld... no
-configure: error: could not determine the string function for int64_t
-```
-
-This happens because `./configure` always stumbles on warning:
-
-configure:3350: gcc -c -g -O2 -Werror  conftest.c >&5
-In file included from conftest.c:31:
-confdefs.h:22: error: "__STDC_WANT_IEC_60559_ATTRIBS_EXT__" redefined [-Werror]
-   22 | #define __STDC_WANT_IEC_60559_ATTRIBS_EXT__ 1
-      |
-
-It's triggered by double inclusion of `"confdefs.h"` contents:
-explicitly in `APR_TRY_COMPILE_NO_WARNING` macro and implicitly
-via `AC_LANG_SOURCE` use.
-
-To fix it and avoid having to define `main()` declaration the change
-uses `AC_LANG_PROGRAM` instead.
-
-Tested on both `autoconf-2.69` and `autoconf-2.69d`.
-
-
-Github: closes #25
-Submitted by: Sergei Trofimovich <slyfox gentoo.org>
-Reviewed by: ylavic
-
-
-git-svn-id: https://svn.apache.org/repos/asf/apr/apr/branches/1.7.x@1887485 13f79535-47bb-0310-9956-ffa450edef68
-
-[Retrieved from:
-https://github.com/apache/apr/commit/0a763c5e500f4304b7c534fae0fad430d64982e8]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- build/apr_common.m4 | 8 ++------
- 1 file changed, 2 insertions(+), 6 deletions(-)
-
-diff --git a/build/apr_common.m4 b/build/apr_common.m4
-index 297dd32cf75..b67a8608abe 100644
---- a/build/apr_common.m4
-+++ b/build/apr_common.m4
-@@ -467,13 +467,9 @@ AC_DEFUN([APR_TRY_COMPILE_NO_WARNING],
-    CFLAGS="$CFLAGS -Werror"
-  fi
-  AC_COMPILE_IFELSE(
--  [AC_LANG_SOURCE(
--   [#include "confdefs.h"
--   ]
--   [[$1]]
--   [int main(int argc, const char *const *argv) {]
-+  [AC_LANG_PROGRAM(
-+   [[$1]],
-    [[$2]]
--   [   return 0; }]
-   )], [CFLAGS=$apr_save_CFLAGS
- $3],  [CFLAGS=$apr_save_CFLAGS
- $4])
diff --git a/package/apr/0003-Revert-Add-the-ability-to-cross-compile-APR.patch b/package/apr/0003-Revert-Add-the-ability-to-cross-compile-APR.patch
new file mode 100644
index 0000000000..ad250d4427
--- /dev/null
+++ b/package/apr/0003-Revert-Add-the-ability-to-cross-compile-APR.patch
@@ -0,0 +1,112 @@
+From ed1daed074fba0dabff825e63525d751b6bb7b8d Mon Sep 17 00:00:00 2001
+From: Graham Leggett <minfrin@apache.org>
+Date: Tue, 31 Dec 2019 21:26:02 +0000
+Subject: [PATCH] Revert: Add the ability to cross compile APR.
+
+git-svn-id: https://svn.apache.org/repos/asf/apr/apr/branches/1.7.x@1872147 13f79535-47bb-0310-9956-ffa450edef68
+
+[Revert upstream commit https://github.com/apache/apr/commit/b6dbbc77da35a7b46754c99f465827f2a583e23c]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ CHANGES       |  2 --
+ apr-config.in | 22 ----------------------
+ 2 files changed, 24 deletions(-)
+
+diff --git a/CHANGES b/CHANGES
+index 71b2f0e..e751c90 100644
+--- a/CHANGES
++++ b/CHANGES
+@@ -56,8 +56,6 @@ Changes for APR 1.7.1
+   *) Don't try to use PROC_PTHREAD by default when cross compiling.
+      [Yann Ylavic]
+ 
+-  *) Add the ability to cross compile APR. [Graham Leggett]
+-
+   *) While cross-compiling, the tools/gen_test_char could not
+      be executed at build time, use AX_PROG_CC_FOR_BUILD to
+      build native tools/gen_test_char
+diff --git a/apr-config.in b/apr-config.in
+index 4873fc0..84b4073 100644
+--- a/apr-config.in
++++ b/apr-config.in
+@@ -48,14 +48,6 @@ APR_LIBNAME="@APR_LIBNAME@"
+ # NOTE: the following line is modified during 'make install': alter with care!
+ location=@APR_CONFIG_LOCATION@
+ 
+-# absolute path, but not installed path - we're cross compiling
+-case "$0" in
+-  "${bindir}/"*) ;;
+-  "/"*)         location=crosscompile;
+-                APR_TARGET_DIR=${0%${bindir}/apr-${APR_MAJOR_VERSION}-config} ;;
+-  *)            ;;
+-esac
+-
+ show_usage()
+ {
+     cat << EOF
+@@ -101,8 +93,6 @@ fi
+ 
+ if test "$location" = "installed"; then
+     LA_FILE="$libdir/lib${APR_LIBNAME}.la"
+-elif test "$location" = "crosscompile"; then
+-    LA_FILE="$APR_TARGET_DIR/$libdir/lib${APR_LIBNAME}.la"
+ else
+     LA_FILE="$APR_BUILD_DIR/lib${APR_LIBNAME}.la"
+ fi
+@@ -132,8 +122,6 @@ while test $# -gt 0; do
+     --includedir)
+     if test "$location" = "installed"; then
+         flags="$includedir"
+-    elif test "$location" = "crosscompile"; then
+-        flags="$APR_TARGET_DIR/$includedir"
+     elif test "$location" = "source"; then
+         flags="$APR_SOURCE_DIR/include"
+     else
+@@ -166,8 +154,6 @@ while test $# -gt 0; do
+     --includes)
+     if test "$location" = "installed"; then
+         flags="$flags -I$includedir $EXTRA_INCLUDES"
+-    elif test "$location" = "crosscompile"; then
+-        flags="$flags -I$APR_TARGET_DIR/$includedir $EXTRA_INCLUDES"
+     elif test "$location" = "source"; then
+         flags="$flags -I$APR_SOURCE_DIR/include $EXTRA_INCLUDES"
+     else
+@@ -182,8 +168,6 @@ while test $# -gt 0; do
+     --installbuilddir)
+     if test "$location" = "installed"; then
+         echo "${installbuilddir}"
+-    elif test "$location" = "crosscompile"; then
+-        echo "$APR_TARGET_DIR/${installbuilddir}"
+     elif test "$location" = "source"; then
+         echo "$APR_SOURCE_DIR/build"
+     else
+@@ -200,8 +184,6 @@ while test $# -gt 0; do
+     if test "$location" = "installed"; then
+         ### avoid using -L if libdir is a "standard" location like /usr/lib
+         flags="$flags -L$libdir -l${APR_LIBNAME}"
+-    elif test "$location" = "crosscompile"; then
+-        flags="$flags -L$APR_TARGET_DIR/$libdir -l${APR_LIBNAME}"
+     else
+         ### this surely can't work since the library is in .libs?
+         flags="$flags -L$APR_BUILD_DIR -l${APR_LIBNAME}"
+@@ -219,8 +201,6 @@ while test $# -gt 0; do
+         # Since the user is specifying they are linking with libtool, we
+         # *know* that -R will be recognized by libtool.
+         flags="$flags -L$libdir -R$libdir -l${APR_LIBNAME}"
+-    elif test "$location" = "crosscompile"; then
+-        flags="$flags  -L${APR_TARGET_DIR}/$libdir  -l${APR_LIBNAME}"
+     else
+         flags="$flags $LA_FILE"
+     fi
+@@ -245,8 +225,6 @@ while test $# -gt 0; do
+     --apr-libtool)
+     if test "$location" = "installed"; then
+         echo "${installbuilddir}/libtool"
+-    elif test "$location" = "crosscompile"; then
+-        echo "$APR_TARGET_DIR/${installbuilddir}/build"
+     else
+         echo "$APR_BUILD_DIR/libtool"
+     fi
+-- 
+2.39.2
+
diff --git a/package/apr/0004-apr-1.7.0-CVE-2021-35940.patch b/package/apr/0004-apr-1.7.0-CVE-2021-35940.patch
deleted file mode 100644
index b065a3330a..0000000000
--- a/package/apr/0004-apr-1.7.0-CVE-2021-35940.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-
-SECURITY: CVE-2021-35940 (cve.mitre.org)
-
-Restore fix for CVE-2017-12613 which was missing in 1.7.x branch, though
-was addressed in 1.6.x in 1.6.3 and later via r1807976.
-
-The fix was merged back to 1.7.x in r1891198.
-
-Since this was a regression in 1.7.0, a new CVE name has been assigned
-to track this, CVE-2021-35940.
-
-Thanks to Iveta Cesalova <icesalov redhat.com> for reporting this issue.
-
-https://svn.apache.org/viewvc?view=revision&revision=1891198
-
-[Retrieved from:
-https://dist.apache.org/repos/dist/release/apr/patches/apr-1.7.0-CVE-2021-35940.patch]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-Index: ./time/unix/time.c
-===================================================================
---- ./time/unix/time.c	(revision 1891197)
-+++ ./time/unix/time.c	(revision 1891198)
-@@ -142,6 +142,9 @@
-     static const int dayoffset[12] =
-     {306, 337, 0, 31, 61, 92, 122, 153, 184, 214, 245, 275};
- 
-+    if (xt->tm_mon < 0 || xt->tm_mon >= 12)
-+        return APR_EBADDATE;
-+
-     /* shift new year to 1st March in order to make leap year calc easy */
- 
-     if (xt->tm_mon < 2)
-Index: ./time/win32/time.c
-===================================================================
---- ./time/win32/time.c	(revision 1891197)
-+++ ./time/win32/time.c	(revision 1891198)
-@@ -54,6 +54,9 @@
-     static const int dayoffset[12] =
-     {0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334};
- 
-+    if (tm->wMonth < 1 || tm->wMonth > 12)
-+        return APR_EBADDATE;
-+
-     /* Note; the caller is responsible for filling in detailed tm_usec,
-      * tm_gmtoff and tm_isdst data when applicable.
-      */
-@@ -228,6 +231,9 @@
-     static const int dayoffset[12] =
-     {306, 337, 0, 31, 61, 92, 122, 153, 184, 214, 245, 275};
- 
-+    if (xt->tm_mon < 0 || xt->tm_mon >= 12)
-+        return APR_EBADDATE;
-+
-     /* shift new year to 1st March in order to make leap year calc easy */
- 
-     if (xt->tm_mon < 2)
diff --git a/package/apr/apr.hash b/package/apr/apr.hash
index d7739d7ed3..96f43d3710 100644
--- a/package/apr/apr.hash
+++ b/package/apr/apr.hash
@@ -1,4 +1,4 @@
-# From http://archive.apache.org/dist/apr/apr-1.7.0.tar.bz2.sha256
-sha256  e2e148f0b2e99b8e5c6caa09f6d4fb4dd3e83f744aa72a952f94f5a14436f7ea  apr-1.7.0.tar.bz2
+# From https://archive.apache.org/dist/apr/apr-1.7.2.tar.bz2.sha256
+sha256  75e77cc86776c030c0a5c408dfbd0bf2a0b75eed5351e52d5439fa1e5509a43e  apr-1.7.2.tar.bz2
 # Locally calculated
 sha256  f854aeef66ecd55a126226e82b3f26793fc3b1c584647f6a0edc5639974c38ad  LICENSE
diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 77217ccbb3..bdc5e915c6 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APR_VERSION = 1.7.0
+APR_VERSION = 1.7.2
 APR_SOURCE = apr-$(APR_VERSION).tar.bz2
 APR_SITE = https://archive.apache.org/dist/apr
 APR_LICENSE = Apache-2.0
@@ -16,8 +16,7 @@ APR_INSTALL_STAGING = YES
 # so we need to autoreconf:
 APR_AUTORECONF = YES
 
-# 0004-apr-1.7.0-CVE-2021-35940.patch
-APR_IGNORE_CVES += CVE-2021-35940
+APR_CONF_OPTS = --disable-sctp
 
 # avoid apr_hints.m4 by setting apr_preload_done=yes and set
 # the needed CFLAGS on our own (avoids '-D_REENTRANT' in case
@@ -32,6 +31,7 @@ APR_CONF_ENV = \
 	CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
 	CFLAGS="$(APR_CFLAGS)" \
 	ac_cv_file__dev_zero=yes \
+	ac_cv_mmap__dev_zero=yes \
 	ac_cv_func_setpgrp_void=yes \
 	apr_cv_process_shared_works=yes \
 	apr_cv_mutex_robust_shared=no \
@@ -39,6 +39,7 @@ APR_CONF_ENV = \
 	ac_cv_sizeof_struct_iovec=8 \
 	ac_cv_sizeof_pid_t=4 \
 	ac_cv_struct_rlimit=yes \
+	ac_cv_strerror_r_rc_int=no \
 	ac_cv_o_nonblock_inherited=no \
 	apr_cv_mutex_recursive=yes \
 	apr_cv_epoll=yes \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
