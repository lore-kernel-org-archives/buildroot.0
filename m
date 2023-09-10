Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2C5EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 19:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDE0A60BBD;
	Sun, 10 Sep 2023 19:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDE0A60BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PB2eAmAnbKkr; Sun, 10 Sep 2023 19:07:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6DDA60BFF;
	Sun, 10 Sep 2023 19:07:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6DDA60BFF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63AFD1BF350
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 19:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D85E4044A
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 19:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D85E4044A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dXHvKjx31ouF for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 19:07:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1BA8400A4
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 19:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1BA8400A4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD98686B77; Sun, 10 Sep 2023 19:07:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 10 Sep 2023 21:05:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a837a609a83428b56fa03e18c439b3878d14fdb6
X-Git-Newrev: 01a5adfc1594e6f11a874c70b03c84300b48948d
X-Patchwork-Hint: ignore
Message-Id: <20230910190700.CD98686B77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpgme: bump to version 1.21.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=01a5adfc1594e6f11a874c70b03c84300b48948d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see [1] and [2].

This commit also drops the package patch, as an alternate upstream
commit is included in release, see [3]. Consequently, AUTORECONF = YES
is dropped as we're no longer patching the configure.ac script.

The option "--disable-cpp-test" is removed from _CONF_OPTS since it no
longer needed.

The file .checkpackageignore is also updated to reflect the patch
removal.

[1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=log;h=gpgme-1.21.0
[2] https://dev.gnupg.org/T6585
[3] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commitdiff;h=e2103be390764f62b21a4e5d4fa90a7b78326787

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 .../libgpgme/0001-Fix-build-without-threads.patch  | 59 ----------------------
 package/libgpgme/libgpgme.hash                     |  4 +-
 package/libgpgme/libgpgme.mk                       |  5 +-
 4 files changed, 3 insertions(+), 66 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index c407581d2c..dd29e06113 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -688,7 +688,6 @@ package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch Upstrea
 package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch Upstream
 package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch Upstream
 package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch Upstream
-package/libgpgme/0001-Fix-build-without-threads.patch Upstream
 package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch Upstream
 package/libgsm/0001-misc-fixes-from-archlinux.patch Upstream
 package/libgtk2/0001-reduce-dependencies.patch Upstream
diff --git a/package/libgpgme/0001-Fix-build-without-threads.patch b/package/libgpgme/0001-Fix-build-without-threads.patch
deleted file mode 100644
index caa4ed7d78..0000000000
--- a/package/libgpgme/0001-Fix-build-without-threads.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From fc1b821c80c78f4ae635639c7fce5bad754edda7 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 27 Aug 2022 23:24:44 +0200
-Subject: [PATCH] Fix build without threads
-
-Allow the user to disable cpp tests to avoid the following build failure
-without threads raised since version 1.17.1 and
-https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commit;h=f3177d3ee0a1d30e15f33ff226b5e4c96b7610db
-
-run-wkdlookup.cpp: In function 'int main(int, char**)':
-run-wkdlookup.cpp:130:18: error: 'std::this_thread' has not been declared
-  130 |             std::this_thread::sleep_for(std::chrono::milliseconds{250 * cnt});
-      |                  ^~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/2915f6105bae595274fabaa12de7cc53926d22d0
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://dev.gnupg.org/T6165]
----
- configure.ac         | 5 +++++
- lang/cpp/Makefile.am | 6 +++++-
- 2 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index e7fe04a7..d1c87486 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -553,6 +553,11 @@ AC_ARG_ENABLE(g13-test,
-          run_g13_test=$enableval)
- AM_CONDITIONAL(RUN_G13_TESTS, test "$run_g13_test" = "yes")
- 
-+run_cpp_test="yes"
-+AC_ARG_ENABLE(cpp-test,
-+  AS_HELP_STRING([--disable-cpp-test],[disable CPP regression test]),
-+         run_cpp_test=$enableval)
-+AM_CONDITIONAL(RUN_CPP_TESTS, test "$run_cpp_test" = "yes")
- 
- # Checks for header files.
- AC_CHECK_HEADERS_ONCE([locale.h sys/select.h sys/uio.h argp.h stdint.h
-diff --git a/lang/cpp/Makefile.am b/lang/cpp/Makefile.am
-index 724da6ca..243c463d 100644
---- a/lang/cpp/Makefile.am
-+++ b/lang/cpp/Makefile.am
-@@ -18,6 +18,10 @@
- # License along with this program; if not, see <https://gnu.org/licenses/>.
- # SPDX-License-Identifier: LGPL-2.1-or-later
- 
--SUBDIRS = src tests
-+SUBDIRS = src
-+
-+if RUN_CPP_TESTS
-+SUBDIRS += tests
-+endif
- 
- EXTRA_DIST = README
--- 
-2.35.1
-
diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
index a71cec1e38..556f1d3b42 100644
--- a/package/libgpgme/libgpgme.hash
+++ b/package/libgpgme/libgpgme.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  369deeec95f1bb77fafc0b6c8fa65995ba82fd1e  gpgme-1.20.0.tar.bz2
-sha256  25a5785a5da356689001440926b94e967d02e13c49eb7743e35ef0cf22e42750  gpgme-1.20.0.tar.bz2
+sha1  abe7db72760c0bb3e9c429b72dcc3c60bed023de  gpgme-1.21.0.tar.bz2
+sha256  416e174e165734d84806253f8c96bda2993fd07f258c3aad5f053a6efd463e88  gpgme-1.21.0.tar.bz2
 # Locally calculated
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LESSER
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index eb63b7c013..02d8462212 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.20.0
+LIBGPGME_VERSION = 1.21.0
 LIBGPGME_SITE = https://gnupg.org/ftp/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPL-2.1+
@@ -14,8 +14,6 @@ LIBGPGME_CPE_ID_PRODUCT = gpgme
 LIBGPGME_INSTALL_STAGING = YES
 LIBGPGME_DEPENDENCIES = libassuan libgpg-error
 LIBGPGME_CONFIG_SCRIPTS = gpgme-config
-# We're patching configure.ac
-LIBGPGME_AUTORECONF = YES
 
 LIBGPGME_LANGUAGE_BINDINGS = cl
 # C++ bindings require a C++11 capable gcc, and -Wsuggest-override support
@@ -30,7 +28,6 @@ LIBGPGME_CONF_OPTS = \
 	--disable-gpgconf-test \
 	--disable-g13-test \
 	--disable-gpg-test \
-	--disable-cpp-test \
 	--enable-languages=$(subst $(space),$(comma),$(LIBGPGME_LANGUAGE_BINDINGS))
 
 # Force the path to "gpgrt-config" (from the libgpg-error package) to
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
