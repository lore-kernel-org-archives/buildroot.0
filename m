Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B220AC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BD854012F;
	Mon,  5 Feb 2024 21:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BD854012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v9Exdlzq6F2f; Mon,  5 Feb 2024 21:25:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE75640160;
	Mon,  5 Feb 2024 21:25:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE75640160
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4BFFD1BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 264C360E2E
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 264C360E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SINEk3U3IuNT for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:25:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15F8660ECE
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15F8660ECE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0204A86DE6; Mon,  5 Feb 2024 21:25:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 22:24:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a01774d9897310c00a0945865f5a6d5167dfca3
X-Git-Newrev: 282b951ed3315c6e2a37725f0bc033bfab4c72cb
X-Patchwork-Hint: ignore
Message-Id: <20240205212520.0204A86DE6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/collectd: fix grpc build
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

commit: https://git.buildroot.net/buildroot/commit/?id=282b951ed3315c6e2a37725f0bc033bfab4c72cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following grpc build failure raised since bump of libabseil-cpp
to version 20230802.1 in commit
aea790392af5358568a4f1c5d2dd9f1adfb29109:

configure:25127: checking grpc++/grpc++.h usability
configure:25127: /home/buildroot/autobuild/instance-0/output-1/host/bin/sparc64-linux-g++ -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O1 -g0 -D_FORTIFY_SOURCE=2 -std=c++11  -DNOMINMAX  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.cpp >&5
In file included from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/absl/base/config.h:86,
                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/absl/base/const_init.h:25,
                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/absl/synchronization/mutex.h:67,
                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/grpcpp/impl/codegen/sync.h:32,
                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/grpcpp/completion_queue.h:41,
                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/grpcpp/channel.h:25,
                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/grpcpp/grpcpp.h:52,
                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/grpc++/grpc++.h:26,
                 from conftest.cpp:167:
/home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/absl/base/policy_checks.h:79:2: error: #error "C++ versions less than C++14 are not supported."
   79 | #error "C++ versions less than C++14 are not supported."
      |  ^~~~~

[...]

    grpc  . . . . . . . . no (libgrpc++ not found) (dependency error)

[...]

configure: error: "Some plugins are missing dependencies - see the summary above for details"

Fixes:
 - http://autobuild.buildroot.org/results/e2cf909ab3c356f1881fd18cfa039e87faa10d7d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-configure.ac-fix-grpc-build.patch         | 96 ++++++++++++++++++++++
 package/collectd/collectd.mk                       |  2 +
 2 files changed, 98 insertions(+)

diff --git a/package/collectd/0002-configure.ac-fix-grpc-build.patch b/package/collectd/0002-configure.ac-fix-grpc-build.patch
new file mode 100644
index 0000000000..00de673e89
--- /dev/null
+++ b/package/collectd/0002-configure.ac-fix-grpc-build.patch
@@ -0,0 +1,96 @@
+From d355618813bb8180e460ba45a0ebd3ce5183e267 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 22 Jan 2024 22:15:21 +0100
+Subject: [PATCH] configure.ac: fix grpc build
+
+abseil and other google tools are now subject to
+"Google's Foundational C++ Support Policy" [0][1]. This currently
+mandates gcc 7.3.1 and C++14 as minimum versions. So replace -std=c++11
+by -std=c++14 to fix following build failure:
+
+checking whether /home/buildroot/autobuild/instance-0/output-1/host/bin/sparc64-linux-g++ accepts -std=c++11
+configure:25105: result: yes
+configure:25127: checking grpc++/grpc++.h usability
+configure:25127: /home/buildroot/autobuild/instance-0/output-1/host/bin/sparc64-linux-g++ -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O1 -g0 -D_FORTIFY_SOURCE=2 -std=c++11  -DNOMINMAX  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.cpp >&5
+In file included from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/absl/base/config.h:86,
+                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/absl/base/const_init.h:25,
+                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/absl/synchronization/mutex.h:67,
+                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/grpcpp/impl/codegen/sync.h:32,
+                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/grpcpp/completion_queue.h:41,
+                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/grpcpp/channel.h:25,
+                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/grpcpp/grpcpp.h:52,
+                 from /home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/grpc++/grpc++.h:26,
+                 from conftest.cpp:167:
+/home/buildroot/autobuild/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/absl/base/policy_checks.h:79:2: error: #error "C++ versions less than C++14 are not supported."
+   79 | #error "C++ versions less than C++14 are not supported."
+      |  ^~~~~
+
+[0] https://github.com/abseil/abseil-cpp/releases/tag/20230125.0
+[1] https://github.com/google/oss-policies-info/blob/b842c39db88e6569dfe2cf98be434b03507cb503/foundational-cxx-support-matrix.md
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e2cf909ab3c356f1881fd18cfa039e87faa10d7d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/collectd/collectd/commit/d355618813bb8180e460ba45a0ebd3ce5183e267
+---
+ configure.ac | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c816d3dbbc..dad27f53b0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2853,20 +2853,20 @@ PKG_CHECK_MODULES([GRPCPP], [grpc++],
+ fi
+ 
+ if test "x$withval" != "xno"; then
+-  AC_MSG_CHECKING([whether $CXX accepts -std=c++11])
+-  if test_cxx_flags -std=c++11; then
++  AC_MSG_CHECKING([whether $CXX accepts -std=c++14])
++  if test_cxx_flags -std=c++14; then
+     AC_MSG_RESULT([yes])
+   else
+     AC_MSG_RESULT([no])
+-    with_libgrpcpp="no (requires C++11 support)"
+-    with_libprotobuf="no (<google/protobuf/util/time_util.h> requires C++11 support)"
++    with_libgrpcpp="no (requires C++14 support)"
++    with_libprotobuf="no (<absl/base/policy_checks.h> requires C++14 support)"
+   fi
+ fi
+ 
+ if test "x$with_libgrpcpp" = "xyes"; then
+   AC_LANG_PUSH(C++)
+   SAVE_CPPFLAGS="$CPPFLAGS"
+-  CPPFLAGS="-std=c++11 $with_libgrpcpp_cppflags $GRPCPP_CFLAGS $CPPFLAGS"
++  CPPFLAGS="-std=c++14 $with_libgrpcpp_cppflags $GRPCPP_CFLAGS $CPPFLAGS"
+   AC_CHECK_HEADERS([grpc++/grpc++.h],
+     [with_libgrpcpp="yes"],
+     [with_libgrpcpp="no (<grpc++/grpc++.h> not found)"]
+@@ -2880,7 +2880,7 @@ if test "x$with_libgrpcpp" = "xyes"; then
+   SAVE_CPPFLAGS="$CPPFLAGS"
+   SAVE_LDFLAGS="$LDFLAGS"
+   SAVE_LIBS="$LIBS"
+-  CPPFLAGS="-std=c++11 $with_libgrpcpp_cppflags $GRPCPP_CFLAGS $CPPFLAGS"
++  CPPFLAGS="-std=c++14 $with_libgrpcpp_cppflags $GRPCPP_CFLAGS $CPPFLAGS"
+   LDFLAGS="$with_libgrpcpp_ldflags"
+   if test "x$GRPCPP_LIBS" = "x"; then
+     LIBS="-lgrpc++"
+@@ -2908,7 +2908,7 @@ if test "x$with_libgrpcpp" = "xyes"; then
+   AC_LANG_POP(C++)
+ fi
+ 
+-BUILD_WITH_LIBGRPCPP_CPPFLAGS="-std=c++11 $with_libgrpcpp_cppflags $GRPCPP_CFLAGS"
++BUILD_WITH_LIBGRPCPP_CPPFLAGS="-std=c++14 $with_libgrpcpp_cppflags $GRPCPP_CFLAGS"
+ BUILD_WITH_LIBGRPCPP_LDFLAGS="$with_libgrpcpp_ldflags"
+ BUILD_WITH_LIBGRPCPP_LIBS="$GRPCPP_LIBS"
+ AC_SUBST([BUILD_WITH_LIBGRPCPP_CPPFLAGS])
+@@ -4852,7 +4852,7 @@ if test "x$withval" != "xno"; then
+   AC_CHECK_LIB([protobuf], [main],
+     [
+       SAVE_CPPFLAGS="$CPPFLAGS"
+-      CPPFLAGS="-std=c++11 $with_libprotobuf_cppflags $PROTOBUF_CFLAGS"
++      CPPFLAGS="-std=c++14 $with_libprotobuf_cppflags $PROTOBUF_CFLAGS"
+       if test "x$PROTOBUF_LIBS" = "x"
+       then
+         PROTOBUF_LIBS="-lprotobuf"
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 6c993827c4..76f622b8db 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -14,6 +14,8 @@ COLLECTD_LICENSE = MIT (daemon, plugins), GPL-2.0 (plugins), LGPL-2.1 (plugins)
 COLLECTD_LICENSE_FILES = COPYING
 COLLECTD_CPE_ID_VENDOR = collectd
 COLLECTD_SELINUX_MODULES = apache collectd
+# We're patching configure.ac
+COLLECTD_AUTORECONF = YES
 
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
