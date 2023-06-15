Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5046AEB64DB
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 06:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F41A241733;
	Thu, 15 Jun 2023 06:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F41A241733
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id akhtcQKKYhgV; Thu, 15 Jun 2023 06:56:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EB1541907;
	Thu, 15 Jun 2023 06:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EB1541907
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1599A1BF48C
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 06:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9529408CA
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 06:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9529408CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RaoIJJwAemw8 for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 06:55:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A79141F1B
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 06:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A79141F1B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84C8C837D2; Thu, 15 Jun 2023 06:55:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Jun 2023 08:50:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 067a8864c594958004dfdb9dea55c304913e2be6
X-Git-Newrev: 81cb8b7e104019c892333907afbdd6cdf35e57ff
X-Patchwork-Hint: ignore
Message-Id: <20230615065520.84C8C837D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfuse3: bump to version 3.15.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=81cb8b7e104019c892333907afbdd6cdf35e57ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop local patch that has been upstreamed but add a new one to fix build
failure:
../meson.build:180:12: ERROR: Can not run test applications in this
cross environment.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  1 -
 ...001-Fix-MS_LAZYTIME-not-defined-on-uclibc.patch | 48 ----------------------
 ...und-test-applications-for-cross-compiler-.patch | 43 +++++++++++++++++++
 package/libfuse3/libfuse3.hash                     |  2 +-
 package/libfuse3/libfuse3.mk                       |  2 +-
 5 files changed, 45 insertions(+), 51 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 14c9bdbb7a..5e1fec9e97 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -740,7 +740,6 @@ package/libftdi1/0002-CMakeLists.txt-fix-paths-when-FTDIPP-is-set.patch Upstream
 package/libftdi1/0003-CMakeLists.txt-fix-static-build-with-libusb-and-lato.patch Upstream
 package/libfuse/0001-fix-aarch64-build.patch Upstream
 package/libfuse/0002-util-ulockmgr_server-c-conditionally-define-closefrom-fix-glibc-2-34.patch Upstream
-package/libfuse3/0001-Fix-MS_LAZYTIME-not-defined-on-uclibc.patch Upstream
 package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch Upstream
 package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch Upstream
 package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch Upstream
diff --git a/package/libfuse3/0001-Fix-MS_LAZYTIME-not-defined-on-uclibc.patch b/package/libfuse3/0001-Fix-MS_LAZYTIME-not-defined-on-uclibc.patch
deleted file mode 100644
index 58f9747d77..0000000000
--- a/package/libfuse3/0001-Fix-MS_LAZYTIME-not-defined-on-uclibc.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 56038446952516da5d4cf09e1192824031082943 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Mon, 27 Mar 2023 21:08:57 +0200
-Subject: [PATCH] Fix MS_LAZYTIME not defined on uclibc
-
-[Upstream status: https://github.com/libfuse/libfuse/pull/753]
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- lib/mount.c       | 5 +++++
- util/fusermount.c | 6 ++++++
- 2 files changed, 11 insertions(+)
-
-diff --git a/lib/mount.c b/lib/mount.c
-index 1f1ee86..84e5c73 100644
---- a/lib/mount.c
-+++ b/lib/mount.c
-@@ -27,6 +27,11 @@
- #include <sys/wait.h>
- #include <sys/mount.h>
- 
-+/* uclibc doesn't define MS_LAZYTIME */
-+#ifndef MS_LAZYTIME
-+#define MS_LAZYTIME	(1<<25)
-+#endif
-+
- #ifdef __NetBSD__
- #include <perfuse.h>
- 
-diff --git a/util/fusermount.c b/util/fusermount.c
-index 6e72f0d..82cc420 100644
---- a/util/fusermount.c
-+++ b/util/fusermount.c
-@@ -25,6 +25,12 @@
- #include <sys/wait.h>
- #include <sys/stat.h>
- #include <sys/mount.h>
-+
-+/* uclibc doesn't define MS_LAZYTIME */
-+#ifndef MS_LAZYTIME
-+#define MS_LAZYTIME	(1<<25)
-+#endif
-+
- #include <sys/fsuid.h>
- #include <sys/socket.h>
- #include <sys/utsname.h>
--- 
-2.34.1
-
diff --git a/package/libfuse3/0001-Wrapper-around-test-applications-for-cross-compiler-.patch b/package/libfuse3/0001-Wrapper-around-test-applications-for-cross-compiler-.patch
new file mode 100644
index 0000000000..b99b4c23f4
--- /dev/null
+++ b/package/libfuse3/0001-Wrapper-around-test-applications-for-cross-compiler-.patch
@@ -0,0 +1,43 @@
+From b58a0014bff619f1810af49441d987d732c4244e Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Tue, 13 Jun 2023 20:02:01 +1000
+Subject: [PATCH] Wrapper around test applications for cross compiler
+ environment in meson.build (#804)
+
+This enhances commit 7be56c57f93e3436b1fbd9ecc320de5c03a3e4b8 to allow build
+fuse to be built using a cross compiler
+
+Fixes:
+../meson.build:180:12: ERROR: Can not run test applications in this cross environment.
+
+Upstream: https://github.com/libfuse/libfuse/commit/b58a0014bff619f1810af49441d987d732c4244e
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ meson.build | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 7aa4e0d..9707ea3 100644
+--- a/meson.build
++++ b/meson.build
+@@ -177,10 +177,12 @@ int main()
+ }
+ '''
+ 
+-result = cc.run(detect_getmntent_needs_unescape)
+-if result.compiled() and result.returncode() == 0 and result.stdout().strip() == 'needs escaping'
+-  message('getmntent does not unescape')
+-  add_project_arguments('-DGETMNTENT_NEEDS_UNESCAPING', language: 'c')
++if not meson.is_cross_build()
++  result = cc.run(detect_getmntent_needs_unescape)
++  if result.compiled() and result.returncode() == 0 and result.stdout().strip() == 'needs escaping'
++    message('getmntent does not unescape')
++    add_project_arguments('-DGETMNTENT_NEEDS_UNESCAPING', language: 'c')
++  endif
+ endif
+ 
+ # Write private test results into fuse_config.h (stored in build directory)
+-- 
+2.34.1
+
diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index df4df524d0..155c29ecd2 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  99688d68a753ee97eed51d536b216b8ae5d7fe0236c1a45d439357903bfd4d88  libfuse3-3.14.1.tar.gz
+sha256  1e79f1dd60eaf79645c21411c4a7028c97b5e745ea677ac5bda747c90497a785  libfuse3-3.15.0.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index 61523820ad..f1b294f74f 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.14.1
+LIBFUSE3_VERSION = 3.15.0
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
