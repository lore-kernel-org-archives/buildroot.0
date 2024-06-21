Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABA1C2BB85
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 15:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A45EC42EF7;
	Fri, 21 Jun 2024 15:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kVRhX_mb6z2C; Fri, 21 Jun 2024 15:44:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D72342F79
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D72342F79;
	Fri, 21 Jun 2024 15:44:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F62F1BF3DE
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 15:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A9EF80F66
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 15:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AQ8aL7HdiNPw for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 15:44:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 691F380F62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 691F380F62
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 691F380F62
 for <buildroot@busybox.net>; Fri, 21 Jun 2024 15:44:25 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.221]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMXQ5-1s2Jw80YVz-00YUFE; Fri, 21
 Jun 2024 17:44:23 +0200
To: buildroot@busybox.net
Date: Fri, 21 Jun 2024 17:44:22 +0200
Message-ID: <20240621154422.18332-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:CJBiJLSdRLc31DtF0PJu4XU3Rg6SjIWJfR++Xbm2QJ51sJMXMlc
 4GckT0TdZ5pXGcYUTHbPqSjl3V9LXNNBeB+PKuqoGQ3j7ZPo19T1HpzKc//gL6FxmMDkNMC
 949yeqoSZB0k9bKmsIvcGVX/N5Jd+7ZvB7pd9TCwczgQjOB+sDd3Uow87yURRYmgIYDsI8t
 Vh60kvOKrdyY6lFmKyKNA==
UI-OutboundReport: notjunk:1;M01:P0:WbQpFbLB7YQ=;H8Px3Wu0Ud3/cX4oXZz3HWlAMg/
 2nHNJc928vJWCo3QSyjhmjLQwEbYweU9AmCo4TpJNekOcxtpPeCkaHnp6zaZZ3yQBqSOQG9xb
 QIF/4lzXGKT17Mgpy7PAu/hHHpl/nziNyw5UA4sPhtJo9t+hM6XK+E73J+NkgaoOezeRhFZM3
 fnBxwAPzsTxyB1Gp/Cg4aptjZPnmGrUyMWM9adXre91DLtr9+NGhvK3aXP0gWPsDffTPBKNRs
 dFNCDnGJg7hIIl69GBi8M8drzKXFiV9lQ8t3Z7AblRU5ZDtIadQ8KUNL2V1lC/aal1jxg+PST
 Z03v92IS/SY/GBf7TKRberd3HYaKmV0iSgISWjbxPE0cdDcPO1qfxlVFSMR67buWU/5ZnHGsD
 ZIRvOXfNMTZfX6fwQGk4nhcMjWB+c792D1wEW1usxhHE4tJix0nNLgQXmKWMhP4xFOu16MH7S
 YGfkXDXBSqbk5TJqyOtN3psJ8xTc22lvvSvyGAB/gf0w6cg3LCv/ks4/DXwLkMw8Wap6Skuhk
 DBepn87mM1c5GqLD2Iippj24DHm+hpy0X90CSGVie8zK+Sr16RoXzossaxYFsTmlHB1T+68Mg
 GmmtPWEwGGD3pv/u9aKa6mpcX0bHdU9HEWcumQC3pPyCS6PWFQ6Kc0Y3FZSJGNhNFML4i4Nav
 rQiV4ciQV9F77V+1I0sXIADrLnGxrWnjdVUbzXKenpv0+IMCY7Bk2se7oV2cmT5hnMyaWTVCn
 UEEMEJROcgKd/ySH35eML1Zu0KycKRnFWl1glypQOZKck7Z3FbaYE8HhFneNjcbflqIWdUSYw
 VYscCFrSwv9Pl9ei7WyPbe3mBiphBT3e1moHUhuOLCeoc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1718984663; x=1719589463; i=ps.report@gmx.net;
 bh=07XCvtx09Rb7B7jcYC8Z+bFdh6uoP18JgpvQbaJB6VI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=BfPPNu0vGhUXhdP087zbSeqbLXeVErwmqnu8jYYfbZXhcJNTKWOippL7rjBFl3m2
 YemTH/fP268fearxk8zqsbxXwOt//ys28tsk8ou6pYP8/l5n0JLEBsiRuo9Y/Rdza
 Avb3FG58k7E3hvM8rARLxIgUNzKGENruPYy8ttibHXVpwF1bcgs5QlZymYdwq4id4
 UrfgHh5U55AFCxUHlG6x3Yf555ag9NILmWc3AlWkAUxQ8TIMkge7QmfrGK7+ynXZR
 saql5VBf1vnrL172cL8Xc2mdEcL/YgarGqN00tFI3l1c3SzvNcPpZdst0ob8/MXvs
 OA1ZjkTqardoFFGMUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=BfPPNu0v
Subject: [Buildroot] [PATCH v1] package/apr: bump version to 1.7.4
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- remove 0002-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch and
  0003-Revert-Add-the-ability-to-cross-compile-APR.patch (cross compile
  hopefully fixes by upstream commit [1])

For details see [2].

[1] https://github.com/apache/apr/commit/130cf8cb3c6fe713095e560ade1df050aa2a6a14
[2] https://downloads.apache.org/apr/CHANGES-APR-1.7

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...r1872164.-Fix-the-name-of-libtool-wh.patch |  30 -----
 ...Add-the-ability-to-cross-compile-APR.patch | 112 ------------------
 package/apr/apr.hash                          |   4 +-
 package/apr/apr.mk                            |   2 +-
 4 files changed, 3 insertions(+), 145 deletions(-)
 delete mode 100644 package/apr/0002-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch
 delete mode 100644 package/apr/0003-Revert-Add-the-ability-to-cross-compile-APR.patch

diff --git a/package/apr/0002-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch b/package/apr/0002-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch
deleted file mode 100644
index f80db1cb6b..0000000000
--- a/package/apr/0002-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 0aa7e33372b479a26e5f04dfc4801e24573a8737 Mon Sep 17 00:00:00 2001
-From: Graham Leggett <minfrin@apache.org>
-Date: Wed, 1 Jan 2020 10:43:39 +0000
-Subject: [PATCH] Revert: Backport r1872164. Fix the name of libtool when
- cross compiling.
-
-git-svn-id: https://svn.apache.org/repos/asf/apr/apr/branches/1.7.x@1872165 13f79535-47bb-0310-9956-ffa450edef68
-
-[Revert upstream commit https://github.com/apache/apr/commit/f82374627b3a6500a7a6cb11e48bcac59bcbb6a1]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- apr-config.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/apr-config.in b/apr-config.in
-index bed47ca..4873fc0 100644
---- a/apr-config.in
-+++ b/apr-config.in
-@@ -246,7 +246,7 @@ while test $# -gt 0; do
-     if test "$location" = "installed"; then
-         echo "${installbuilddir}/libtool"
-     elif test "$location" = "crosscompile"; then
--        echo "$APR_TARGET_DIR/${installbuilddir}/libtool"
-+        echo "$APR_TARGET_DIR/${installbuilddir}/build"
-     else
-         echo "$APR_BUILD_DIR/libtool"
-     fi
--- 
-2.39.2
-
diff --git a/package/apr/0003-Revert-Add-the-ability-to-cross-compile-APR.patch b/package/apr/0003-Revert-Add-the-ability-to-cross-compile-APR.patch
deleted file mode 100644
index ad250d4427..0000000000
--- a/package/apr/0003-Revert-Add-the-ability-to-cross-compile-APR.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From ed1daed074fba0dabff825e63525d751b6bb7b8d Mon Sep 17 00:00:00 2001
-From: Graham Leggett <minfrin@apache.org>
-Date: Tue, 31 Dec 2019 21:26:02 +0000
-Subject: [PATCH] Revert: Add the ability to cross compile APR.
-
-git-svn-id: https://svn.apache.org/repos/asf/apr/apr/branches/1.7.x@1872147 13f79535-47bb-0310-9956-ffa450edef68
-
-[Revert upstream commit https://github.com/apache/apr/commit/b6dbbc77da35a7b46754c99f465827f2a583e23c]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- CHANGES       |  2 --
- apr-config.in | 22 ----------------------
- 2 files changed, 24 deletions(-)
-
-diff --git a/CHANGES b/CHANGES
-index 71b2f0e..e751c90 100644
---- a/CHANGES
-+++ b/CHANGES
-@@ -56,8 +56,6 @@ Changes for APR 1.7.1
-   *) Don't try to use PROC_PTHREAD by default when cross compiling.
-      [Yann Ylavic]
- 
--  *) Add the ability to cross compile APR. [Graham Leggett]
--
-   *) While cross-compiling, the tools/gen_test_char could not
-      be executed at build time, use AX_PROG_CC_FOR_BUILD to
-      build native tools/gen_test_char
-diff --git a/apr-config.in b/apr-config.in
-index 4873fc0..84b4073 100644
---- a/apr-config.in
-+++ b/apr-config.in
-@@ -48,14 +48,6 @@ APR_LIBNAME="@APR_LIBNAME@"
- # NOTE: the following line is modified during 'make install': alter with care!
- location=@APR_CONFIG_LOCATION@
- 
--# absolute path, but not installed path - we're cross compiling
--case "$0" in
--  "${bindir}/"*) ;;
--  "/"*)         location=crosscompile;
--                APR_TARGET_DIR=${0%${bindir}/apr-${APR_MAJOR_VERSION}-config} ;;
--  *)            ;;
--esac
--
- show_usage()
- {
-     cat << EOF
-@@ -101,8 +93,6 @@ fi
- 
- if test "$location" = "installed"; then
-     LA_FILE="$libdir/lib${APR_LIBNAME}.la"
--elif test "$location" = "crosscompile"; then
--    LA_FILE="$APR_TARGET_DIR/$libdir/lib${APR_LIBNAME}.la"
- else
-     LA_FILE="$APR_BUILD_DIR/lib${APR_LIBNAME}.la"
- fi
-@@ -132,8 +122,6 @@ while test $# -gt 0; do
-     --includedir)
-     if test "$location" = "installed"; then
-         flags="$includedir"
--    elif test "$location" = "crosscompile"; then
--        flags="$APR_TARGET_DIR/$includedir"
-     elif test "$location" = "source"; then
-         flags="$APR_SOURCE_DIR/include"
-     else
-@@ -166,8 +154,6 @@ while test $# -gt 0; do
-     --includes)
-     if test "$location" = "installed"; then
-         flags="$flags -I$includedir $EXTRA_INCLUDES"
--    elif test "$location" = "crosscompile"; then
--        flags="$flags -I$APR_TARGET_DIR/$includedir $EXTRA_INCLUDES"
-     elif test "$location" = "source"; then
-         flags="$flags -I$APR_SOURCE_DIR/include $EXTRA_INCLUDES"
-     else
-@@ -182,8 +168,6 @@ while test $# -gt 0; do
-     --installbuilddir)
-     if test "$location" = "installed"; then
-         echo "${installbuilddir}"
--    elif test "$location" = "crosscompile"; then
--        echo "$APR_TARGET_DIR/${installbuilddir}"
-     elif test "$location" = "source"; then
-         echo "$APR_SOURCE_DIR/build"
-     else
-@@ -200,8 +184,6 @@ while test $# -gt 0; do
-     if test "$location" = "installed"; then
-         ### avoid using -L if libdir is a "standard" location like /usr/lib
-         flags="$flags -L$libdir -l${APR_LIBNAME}"
--    elif test "$location" = "crosscompile"; then
--        flags="$flags -L$APR_TARGET_DIR/$libdir -l${APR_LIBNAME}"
-     else
-         ### this surely can't work since the library is in .libs?
-         flags="$flags -L$APR_BUILD_DIR -l${APR_LIBNAME}"
-@@ -219,8 +201,6 @@ while test $# -gt 0; do
-         # Since the user is specifying they are linking with libtool, we
-         # *know* that -R will be recognized by libtool.
-         flags="$flags -L$libdir -R$libdir -l${APR_LIBNAME}"
--    elif test "$location" = "crosscompile"; then
--        flags="$flags  -L${APR_TARGET_DIR}/$libdir  -l${APR_LIBNAME}"
-     else
-         flags="$flags $LA_FILE"
-     fi
-@@ -245,8 +225,6 @@ while test $# -gt 0; do
-     --apr-libtool)
-     if test "$location" = "installed"; then
-         echo "${installbuilddir}/libtool"
--    elif test "$location" = "crosscompile"; then
--        echo "$APR_TARGET_DIR/${installbuilddir}/build"
-     else
-         echo "$APR_BUILD_DIR/libtool"
-     fi
--- 
-2.39.2
-
diff --git a/package/apr/apr.hash b/package/apr/apr.hash
index 96f43d3710..66a183c11d 100644
--- a/package/apr/apr.hash
+++ b/package/apr/apr.hash
@@ -1,4 +1,4 @@
-# From https://archive.apache.org/dist/apr/apr-1.7.2.tar.bz2.sha256
-sha256  75e77cc86776c030c0a5c408dfbd0bf2a0b75eed5351e52d5439fa1e5509a43e  apr-1.7.2.tar.bz2
+# From https://archive.apache.org/dist/apr/apr-1.7.4.tar.bz2.sha256
+sha256  fc648de983f3a2a6c9e78dea1f180639bd2fad6c06d556d4367a701fe5c35577  apr-1.7.4.tar.bz2
 # Locally calculated
 sha256  f854aeef66ecd55a126226e82b3f26793fc3b1c584647f6a0edc5639974c38ad  LICENSE
diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index cb8c12dd65..4eb6eb12ad 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APR_VERSION = 1.7.2
+APR_VERSION = 1.7.4
 APR_SOURCE = apr-$(APR_VERSION).tar.bz2
 APR_SITE = https://archive.apache.org/dist/apr
 APR_LICENSE = Apache-2.0
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
