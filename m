Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9455C38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 22:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76A03416E4;
	Sat, 28 Jan 2023 22:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76A03416E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KeK2QMJcEOx4; Sat, 28 Jan 2023 22:50:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B71C416E7;
	Sat, 28 Jan 2023 22:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B71C416E7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 872D51BF44C
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 22:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 594F84050C
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 22:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 594F84050C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T6TR_86H63du for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 22:50:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1390B404EB
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 22:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1390B404EB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F035788078; Sat, 28 Jan 2023 22:50:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 23:40:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f46e197374bdac762a628db5ce6977a148d74859
X-Git-Newrev: a97ab5d2faf4c0498e1c7b4eb68f98fc2eb78060
X-Patchwork-Hint: ignore
Message-Id: <20230128225020.F035788078@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rng-tools: bump to version 6.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=a97ab5d2faf4c0498e1c7b4eb68f98fc2eb78060
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patches (already in version)
- libcap is a mandatory dependency since
  https://github.com/nhorman/rng-tools/commit/50afdce9d3fed6244a0cf772d38f2d8475312bc5
- Add Qrypt support:
  https://github.com/nhorman/rng-tools/commit/7ab7f540da567467055f77016590744d828fc9eb

https://github.com/nhorman/rng-tools/releases/tag/v6.16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...configure.ac-fix-build-without-sys-auxv.h.patch | 52 ----------------------
 ...erentropy-detection-to-look-for-the-setti.patch | 30 -------------
 ...erentropy-library-to-timeout-fail-on-long.patch | 39 ----------------
 package/rng-tools/Config.in                        | 16 +++++++
 package/rng-tools/rng-tools.hash                   |  2 +-
 package/rng-tools/rng-tools.mk                     | 11 ++++-
 6 files changed, 26 insertions(+), 124 deletions(-)

diff --git a/package/rng-tools/0001-configure.ac-fix-build-without-sys-auxv.h.patch b/package/rng-tools/0001-configure.ac-fix-build-without-sys-auxv.h.patch
deleted file mode 100644
index 0c15ab6b7d..0000000000
--- a/package/rng-tools/0001-configure.ac-fix-build-without-sys-auxv.h.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 6ea89861c300a732d1bbcffd085d92f5c4c9228e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 15 Aug 2022 11:57:21 +0200
-Subject: [PATCH] configure.ac: fix build without sys/auxv.h
-
-Fix the following build failure on aarch64 without sys/auxv.h (e.g. on
-uclibc) raised since version 6.13 and
-https://github.com/nhorman/rng-tools/commit/9070a04adfcd21ec3839ee8ff190e7130ccd5c9b:
-
-rngd_rndr.c:34:10: fatal error: sys/auxv.h: No such file or directory
-   34 | #include <sys/auxv.h>
-      |          ^~~~~~~~~~~~
-
-The same issue could be raised on powerpc64le since version 6.11 and
-https://github.com/nhorman/rng-tools/commit/ade348cdb90c25b44b203fd4e9c33ec4bccff323
-
-Fixes:
- - http://autobuild.buildroot.org/results/41d5ab9e67eb0d8af8d789fc94d4366f130a7fb2
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/nhorman/rng-tools/commit/6ea89861c300a732d1bbcffd085d92f5c4c9228e]
----
- configure.ac | 11 +++++++----
- 1 file changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0af64e7..411c7b8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -76,14 +76,17 @@ AC_PROG_GCC_TRADITIONAL
- 
- AX_PTHREAD
- 
-+dnl Checks for header files.
-+AC_CHECK_HEADERS(sys/auxv.h)
-+
- AM_CONDITIONAL([RDRAND], [test $host_cpu = x86_64 || test $host_cpu = i686])
- AS_IF([test $host_cpu = x86_64 || test $host_cpu = i686], [AC_DEFINE([HAVE_RDRAND],1,[Enable RDRAND])],[])
- 
--AM_CONDITIONAL([DARN], [test $host_cpu = powerpc64le])
--AS_IF([test $host_cpu = powerpc64le], [AC_DEFINE([HAVE_DARN],1,[Enable DARN])],[])
-+AM_CONDITIONAL([DARN], [test $host_cpu = powerpc64le -a "$ac_cv_header_sys_auxv_h" = "yes"])
-+AS_IF([test $host_cpu = powerpc64le -a "$ac_cv_header_sys_auxv_h" = "yes"], [AC_DEFINE([HAVE_DARN],1,[Enable DARN])],[])
- 
--AM_CONDITIONAL([RNDR], [test $host_cpu = aarch64])
--AS_IF([test $host_cpu = aarch64], [AC_DEFINE([HAVE_RNDR],1,[Enable RNDR])],[])
-+AM_CONDITIONAL([RNDR], [test $host_cpu = aarch64 -a "$ac_cv_header_sys_auxv_h" = "yes"])
-+AS_IF([test $host_cpu = aarch64 -a "$ac_cv_header_sys_auxv_h" = "yes"], [AC_DEFINE([HAVE_RNDR],1,[Enable RNDR])],[])
- AM_CONDITIONAL([JITTER], [false])
- 
- AC_ARG_ENABLE(jitterentropy,
diff --git a/package/rng-tools/0002-Adjust-jitterentropy-detection-to-look-for-the-setti.patch b/package/rng-tools/0002-Adjust-jitterentropy-detection-to-look-for-the-setti.patch
deleted file mode 100644
index 553842640d..0000000000
--- a/package/rng-tools/0002-Adjust-jitterentropy-detection-to-look-for-the-setti.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From e2698477e8abf623c18ab28d33cc894ec882a706 Mon Sep 17 00:00:00 2001
-From: Neil Horman <neil.horman@privafy.com>
-Date: Fri, 18 Mar 2022 18:59:52 -0400
-Subject: [PATCH] Adjust jitterentropy detection to look for the settick
- function
-
-Theres no great way to detect if jitterentropy has the internal timer
-feature enabled so we have to look for a function that is only defined
-when it is enabled
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[downloaded from upstream commit
- https://github.com/nhorman/rng-tools/commit/e2698477e8abf623c18ab28d33cc894ec882a706]
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index e16e1a0..0f5a38e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -94,7 +94,7 @@ AS_IF(
- 		AC_SEARCH_LIBS(jent_version,jitterentropy,
- 				[AM_CONDITIONAL([JITTER], [true])
- 				AC_DEFINE([HAVE_JITTER],1,[Enable JITTER])
--				AC_CHECK_LIB(jitterentropy, jent_entropy_switch_notime_impl,
-+				AC_CHECK_LIB(jitterentropy, jent_notime_settick,
- 				[AC_DEFINE([HAVE_JITTER_NOTIME],1,[Enable JITTER_NOTIME])],
- 				[],-lpthread)],
- 				AC_MSG_NOTICE([No Jitterentropy library found]),-lpthread)
diff --git a/package/rng-tools/0003-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch b/package/rng-tools/0003-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch
deleted file mode 100644
index 9d8dbe2d0b..0000000000
--- a/package/rng-tools/0003-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From c29424f10a0dcbd18ac25607fa1c81c18a960e81 Mon Sep 17 00:00:00 2001
-From: Neil Horman <nhorman@tuxdriver.com>
-Date: Mon, 16 May 2022 13:38:54 -0400
-Subject: [PATCH] Adjust jitterentropy library to timeout/fail on long delay
-
-[Bernd: removed description of unrelated part of the patch]
-
-Also while we're at it, I might have a build solution for the presence
-of internal timers.  When jitterentropy is built without internal
-timers, jent_notime_init is defined publically, but when it is built
-with timers, its declared as a static symbol, preenting resolution, so
-we can test to see if the function exists.  If it does we _don't_ have
-notime support. The logic is a bit backwards, but i think it works
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[downloaded configure.ac patch from upstream commit
- https://github.com/nhorman/rng-tools/commit/57be6d4c90e78ea9ad036a3a6e9b09822ed4d219]
----
- configure.ac  |  6 ++---
- rngd_jitter.c | 62 ++++++++++++++++++++++++++++++++++++++-------------
- 2 files changed, 49 insertions(+), 19 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 52f2bb5..0af64e7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -101,9 +101,9 @@ AS_IF(
- 		AC_SEARCH_LIBS(jent_version,jitterentropy,
- 				[AM_CONDITIONAL([JITTER], [true])
- 				AC_DEFINE([HAVE_JITTER],1,[Enable JITTER])
--				AC_CHECK_LIB(jitterentropy, jent_notime_settick,
--				[AC_DEFINE([HAVE_JITTER_NOTIME],1,[Enable JITTER_NOTIME])],
--				[],-lpthread)],
-+				AC_CHECK_LIB(jitterentropy, jent_notime_init,
-+				[],
-+				[AC_DEFINE([HAVE_JITTER_NOTIME],1, [Enable JITTER_NOTIME])],-lpthread)],
- 				AC_MSG_NOTICE([No Jitterentropy library found]),-lpthread)
- 	], [AC_MSG_NOTICE([Disabling JITTER entropy source])]
- )
diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
index 0dd269c818..be3f078a0b 100644
--- a/package/rng-tools/Config.in
+++ b/package/rng-tools/Config.in
@@ -2,7 +2,9 @@ config BR2_PACKAGE_RNG_TOOLS
 	bool "rng-tools"
 	# pthread_setaffinity_np
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_USE_MMU # libcap
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Daemon to use hardware random number generators.
@@ -35,7 +37,21 @@ config BR2_PACKAGE_RNG_TOOLS_NISTBEACON
 	  never be used for cryptographic purposes, or any use case in
 	  which random data should be known only by a single entity.
 
+config BR2_PACKAGE_RNG_TOOLS_QRYPT
+	bool "Qrypt Entropy Beacon support"
+	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_LIBCURL
+	help
+	  Enable Qrypt NIST-Beacon like entropy support.
+
+	  Entropy gathered from Qrypt server based entropy beacons. Like
+	  NIST, it should likely not be used directly in cryptographic
+	  operation, as the entropy may be intercepted over a network,
+	  but can provide copius amounts of entropy for non-crypto
+	  purposes.
+
 endif
 
 comment "rng-tools needs a toolchain w/ NPTL"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/rng-tools/rng-tools.hash b/package/rng-tools/rng-tools.hash
index be2ee13969..4c86791267 100644
--- a/package/rng-tools/rng-tools.hash
+++ b/package/rng-tools/rng-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bff0c58dff90ec10bd61f672e48618e045155eabd60b32d63a9c4ffbdad05f3a  rng-tools-6.15.tar.gz
+sha256  17666c4745fb635d91df293be188daf94b9e465d51d8503c0195fa3beb390894  rng-tools-6.16.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index f736193a23..3e565103e4 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-RNG_TOOLS_VERSION = 6.15
+RNG_TOOLS_VERSION = 6.16
 RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
 RNG_TOOLS_LICENSE = GPL-2.0
 RNG_TOOLS_LICENSE_FILES = COPYING
 RNG_TOOLS_CPE_ID_VENDOR = rng-tools_project
 RNG_TOOLS_SELINUX_MODULES = rngd
 
-RNG_TOOLS_DEPENDENCIES = host-pkgconf openssl
+RNG_TOOLS_DEPENDENCIES = host-pkgconf libcap openssl
 # From git
 RNG_TOOLS_AUTORECONF = YES
 
@@ -45,6 +45,13 @@ else
 RNG_TOOLS_CONF_OPTS += --without-nistbeacon
 endif
 
+ifeq ($(BR2_PACKAGE_RNG_TOOLS_QRYPT),y)
+RNG_TOOLS_DEPENDENCIES += jansson libcurl
+RNG_TOOLS_CONF_OPTS += --with-qrypt
+else
+RNG_TOOLS_CONF_OPTS += --without-qrypt
+endif
+
 define RNG_TOOLS_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/rng-tools/S21rngd \
 		$(TARGET_DIR)/etc/init.d/S21rngd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
