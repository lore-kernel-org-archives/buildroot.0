From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:05:41 +0200
Subject: [Buildroot] [git commit] package/collectd: bump to version 5.11.0
Message-ID: <20200411075349.D3BA17FAEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57adbfc482454e3fb17172626b2dc971afaf5cfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already on upstream).

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...c-fix-protobuf-util-time_util.h-detection.patch | 50 ----------------------
 package/collectd/collectd.hash                     |  6 +--
 package/collectd/collectd.mk                       |  4 +-
 3 files changed, 5 insertions(+), 55 deletions(-)

diff --git a/package/collectd/0001-configure.ac-fix-protobuf-util-time_util.h-detection.patch b/package/collectd/0001-configure.ac-fix-protobuf-util-time_util.h-detection.patch
deleted file mode 100644
index 5eb22bef46..0000000000
--- a/package/collectd/0001-configure.ac-fix-protobuf-util-time_util.h-detection.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From a81fb110f7685b3268cd921ba72a00796f43d034 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 29 Oct 2019 10:25:07 +0100
-Subject: [PATCH] configure.ac: fix protobuf/util/time_util.h detection
-
-Add -std=c++11 when checking gor protobuf/util/time_util.h otherwise
-test will fail on:
-
-configure:104495: checking google/protobuf/util/time_util.h usability
-configure:104495: /home/br-user/autobuild/run/instance-2/output/host/bin/mips-linux-gnu-g++ -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -D_FORTIFY_SOURCE=1  -pthread  conftest.cpp >&5
-In file included from /home/br-user/autobuild/run/instance-2/output/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/atomic:38:0,
-                 from /home/br-user/autobuild/run/instance-2/output/host/mips-buildroot-linux-gnu/sysroot/usr/include/google/protobuf/io/coded_stream.h:113,
-                 from /home/br-user/autobuild/run/instance-2/output/host/mips-buildroot-linux-gnu/sysroot/usr/include/google/protobuf/duration.pb.h:23,
-                 from /home/br-user/autobuild/run/instance-2/output/host/mips-buildroot-linux-gnu/sysroot/usr/include/google/protobuf/util/time_util.h:52,
-                 from conftest.cpp:188:
-/home/br-user/autobuild/run/instance-2/output/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/bits/c++0x_warning.h:32:2: error: #error This file requires compiler and library support for the ISO C++ 2011 standard. This support is currently experimental, and must be enabled with the -std=c++11 or -std=gnu++11 compiler options.
-
-Fixes:
- - http://autobuild.buildroot.net/results/0d486edaf4c51b6438adeec61fe2c55099862acb
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/collectd/collectd/pull/3325]
----
- configure.ac | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 34386d06..59a7f355 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2722,6 +2722,7 @@ if test "x$withval" != "xno"; then
-   else
-     AC_MSG_RESULT([no])
-     with_libgrpcpp="no (requires C++11 support)"
-+    with_libprotobuf="no (<google/protobuf/util/time_util.h> requires C++11 support)"
-   fi
- fi
- 
-@@ -4568,7 +4569,7 @@ if test "x$withval" != "xno"; then
-   AC_CHECK_LIB([protobuf], [main],
-     [
-       SAVE_CPPFLAGS="$CPPFLAGS"
--      CPPFLAGS="$with_libprotobuf_cppflags $PROTOBUF_CFLAGS"
-+      CPPFLAGS="-std=c++11 $with_libprotobuf_cppflags $PROTOBUF_CFLAGS"
-       if test "x$PROTOBUF_LIBS" = "x"
-       then
-         PROTOBUF_LIBS="-lprotobuf"
--- 
-2.23.0
-
diff --git a/package/collectd/collectd.hash b/package/collectd/collectd.hash
index 7f716b7a93..0378eca11f 100644
--- a/package/collectd/collectd.hash
+++ b/package/collectd/collectd.hash
@@ -1,5 +1,5 @@
 # Locally computed checksums
-sha512	1296085fb19bba0c7b7d8684ec877851158b25c9f7b58fc3ae602fba7d7dc718876e730e1cdba96d39101cc5452705bb3445aaee717b219025ae816299b6a3c5	collectd-5.10.0.tar.bz2
-sha256	a03359f563023e744c2dc743008a00a848f4cd506e072621d86b6d8313c0375b	collectd-5.10.0.tar.bz2
-sha1	9d64ec4e6e834b8e417e282390e2a9c57934d3bc	collectd-5.10.0.tar.bz2
+sha512	87671545e3d01770c204ba4439265d1c0add6a105bf04ff02dc04db3731fd933d32ecb9b0dc15f2e504d70c3e421a64cf19728c897aa4fb1fda86e393ffc15bf	collectd-5.11.0.tar.bz2
+sha256	37b10a806e34aa8570c1cafa6006c604796fae13cc2e1b3e630d33dcba9e5db2	collectd-5.11.0.tar.bz2
+sha1	18bfb0be0493ed4a1b5d73c8bcc3f28d37652480	collectd-5.11.0.tar.bz2
 sha256	ed0409b2b1c30566dab5fcdaf46ee70e140c99788e22f0267645a9357b476ae4	COPYING
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 65307dce4c..97e1d17b5e 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-COLLECTD_VERSION = 5.10.0
+COLLECTD_VERSION = 5.11.0
 COLLECTD_SITE = \
-	https://github.com/collectd/collectd/releases/download/$(COLLECTD_VERSION)
+	https://github.com/collectd/collectd/releases/download/collectd-$(COLLECTD_VERSION)
 COLLECTD_SOURCE = collectd-$(COLLECTD_VERSION).tar.bz2
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
 COLLECTD_INSTALL_STAGING = YES
