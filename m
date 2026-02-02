Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB130E7FDF3
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 22:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 928B7409C0;
	Mon,  2 Feb 2026 22:13:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kSxfZfenXoeK; Mon,  2 Feb 2026 22:13:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D17F409DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770070427;
	bh=a+qjo6cyupbBTFa9te2/5ffx3egDbgiKK5pTfioV1N4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H2TN2RrS1kX3pgyYBm/quEmc4zqJaw+mIKHGufhpUkeQtLrX0eWt1xV1uXXmNd4V9
	 eJJZQnFIRRRFctaypH+dDSutyE+EshmhIKWkXNDG+dXlYS1uIK8S50RXQMDCs44a+W
	 s/nr+xVHUN2lvdhMewDvOFhzvsqkmbUpruMujRrrcHKYKX+gII0EuDDrfi82YSbVo+
	 LfR2cg1y62Yav3cg9DpSfQVdsKcID4P2RR0PrIDqdlsSgbVpTJc7yp5Smar0yque7y
	 aCXObw4iTYWVlvUnfSTbgC0C2KLbficUfmJKsVMgITCAK6uO9zPvkhes8C1Zbnl0rl
	 SIQEIEw97J7sQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D17F409DA;
	Mon,  2 Feb 2026 22:13:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BB5F2F5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A49276078E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3nLrZUpMk2QQ for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 22:13:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD59E60641
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD59E60641
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:13:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3FEA864E7; Mon,  2 Feb 2026 22:13:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 22:39:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c15318805c4f4ff21fb6543815a0542b22d86b3
X-Git-Newrev: 8ed45eff338e2828f3b2f456f7e0205c38caaf7d
X-Patchwork-Hint: ignore
Message-Id: <20260202221345.A3FEA864E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/collectd: prepare abseil-cpp/grpc
 bump by enforcing c++17
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8ed45eff338e2828f3b2f456f7e0205c38caaf7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We're about to bump abseil to a version >= 20250512.02, which requires
C++17, meaning that protobuf/grpc will also C++17. This in turn means
that the grpc support in collectd will also need C++17.

So just like our current patch 0002-configure.ac-fix-grpc-build.patch
updates the collectd logic from C++11 to C++14, this new
patch (accepted upstream) updates the collectd logic again from C++14
to C++17.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0005-configure.ax-fix-grpc-build-2025.patch    | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/package/collectd/0005-configure.ax-fix-grpc-build-2025.patch b/package/collectd/0005-configure.ax-fix-grpc-build-2025.patch
new file mode 100644
index 0000000000..e750483135
--- /dev/null
+++ b/package/collectd/0005-configure.ax-fix-grpc-build-2025.patch
@@ -0,0 +1,73 @@
+From 42b2ede4dadcf88293e408bcdf5645995b61b148 Mon Sep 17 00:00:00 2001
+From: Michael Nosthoff <buildroot@heine.tech>
+Date: Wed, 29 Oct 2025 16:48:20 +0100
+Subject: [PATCH] configure.ac: fix grpc build
+
+Similar to the previous "configure.ac: fix grpc build" commit:
+Google bumped it's compiler requirements again [1], hence the c++ version needs to be adjusted to c++17 to be able to build with the latest grpc versions.
+
+[1] https://github.com/google/oss-policies-info/blob/a5e3ed43d45ad615a20201cea8f7282f595555da/foundational-cxx-support-matrix.md
+
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
+Upstream: https://github.com/collectd/collectd/commit/42b2ede4dadcf88293e408bcdf5645995b61b148
+---
+ configure.ac | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8aa03fce63..eb6cbbc5d5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2844,20 +2844,20 @@ PKG_CHECK_MODULES([GRPCPP], [grpc++],
+ fi
+ 
+ if test "x$withval" != "xno"; then
+-  AC_MSG_CHECKING([whether $CXX accepts -std=c++14])
+-  if test_cxx_flags -std=c++14; then
++  AC_MSG_CHECKING([whether $CXX accepts -std=c++17])
++  if test_cxx_flags -std=c++17; then
+     AC_MSG_RESULT([yes])
+   else
+     AC_MSG_RESULT([no])
+-    with_libgrpcpp="no (requires C++14 support)"
+-    with_libprotobuf="no (<absl/base/policy_checks.h> requires C++14 support)"
++    with_libgrpcpp="no (requires C++17 support)"
++    with_libprotobuf="no (<absl/base/policy_checks.h> requires C++17 support)"
+   fi
+ fi
+ 
+ if test "x$with_libgrpcpp" = "xyes"; then
+   AC_LANG_PUSH(C++)
+   SAVE_CPPFLAGS="$CPPFLAGS"
+-  CPPFLAGS="-std=c++14 $with_libgrpcpp_cppflags $GRPCPP_CFLAGS $CPPFLAGS"
++  CPPFLAGS="-std=c++17 $with_libgrpcpp_cppflags $GRPCPP_CFLAGS $CPPFLAGS"
+   AC_CHECK_HEADERS([grpc++/grpc++.h],
+     [with_libgrpcpp="yes"],
+     [with_libgrpcpp="no (<grpc++/grpc++.h> not found)"]
+@@ -2871,7 +2871,7 @@ if test "x$with_libgrpcpp" = "xyes"; then
+   SAVE_CPPFLAGS="$CPPFLAGS"
+   SAVE_LDFLAGS="$LDFLAGS"
+   SAVE_LIBS="$LIBS"
+-  CPPFLAGS="-std=c++14 $with_libgrpcpp_cppflags $GRPCPP_CFLAGS $CPPFLAGS"
++  CPPFLAGS="-std=c++17 $with_libgrpcpp_cppflags $GRPCPP_CFLAGS $CPPFLAGS"
+   LDFLAGS="$with_libgrpcpp_ldflags"
+   if test "x$GRPCPP_LIBS" = "x"; then
+     LIBS="-lgrpc++"
+@@ -2899,7 +2899,7 @@ if test "x$with_libgrpcpp" = "xyes"; then
+   AC_LANG_POP(C++)
+ fi
+ 
+-BUILD_WITH_LIBGRPCPP_CPPFLAGS="-std=c++14 $with_libgrpcpp_cppflags $GRPCPP_CFLAGS"
++BUILD_WITH_LIBGRPCPP_CPPFLAGS="-std=c++17 $with_libgrpcpp_cppflags $GRPCPP_CFLAGS"
+ BUILD_WITH_LIBGRPCPP_LDFLAGS="$with_libgrpcpp_ldflags"
+ BUILD_WITH_LIBGRPCPP_LIBS="$GRPCPP_LIBS"
+ AC_SUBST([BUILD_WITH_LIBGRPCPP_CPPFLAGS])
+@@ -4843,7 +4843,7 @@ if test "x$withval" != "xno"; then
+   AC_CHECK_LIB([protobuf], [main],
+     [
+       SAVE_CPPFLAGS="$CPPFLAGS"
+-      CPPFLAGS="-std=c++14 $with_libprotobuf_cppflags $PROTOBUF_CFLAGS"
++      CPPFLAGS="-std=c++17 $with_libprotobuf_cppflags $PROTOBUF_CFLAGS"
+       if test "x$PROTOBUF_LIBS" = "x"
+       then
+         PROTOBUF_LIBS="-lprotobuf"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
