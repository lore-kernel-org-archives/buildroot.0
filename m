Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98A8C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A64A670A99;
	Fri, 28 Feb 2025 17:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uvMAUQZRj634; Fri, 28 Feb 2025 17:10:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73B6470A9A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73B6470A9A;
	Fri, 28 Feb 2025 17:10:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13E301DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 375FD4076B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JvEZBHiC3xVq for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0941B42F54
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0941B42F54
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F36D485FAE; Fri, 28 Feb 2025 16:30:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 11:56:52 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4def253882ff2b16ddaff9bcaf75c15c82a7dd9f
X-Git-Newrev: 8af6f2eaf99c3c808742bf5154e57752b20b234a
X-Patchwork-Hint: ignore
Message-Id: <20250228163028.F36D485FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libserialport: update
 to 0.1.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8af6f2eaf99c3c808742bf5154e57752b20b234a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop the patch, that has been upstreamed as b2359c5c994c (libserialport:
Fix Linux files not compiled in with a toolchain for ucLinux).

Accordingly, drop the now superfluous autoreconf.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  1 -
 package/libserialport/0001-uclinux-detection.patch | 26 ----------------------
 package/libserialport/libserialport.hash           |  2 +-
 package/libserialport/libserialport.mk             |  3 +--
 4 files changed, 2 insertions(+), 30 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 7ebfdd0499..8fd03b0dd6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -711,7 +711,6 @@ package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.pat
 package/libsepol/0001-support-static-only.patch lib_patch.Upstream
 package/libserial/0001-SerialPort.cpp-fix-build-when-size_t-is-an-unsigned-.patch lib_patch.Upstream
 package/libserial/0002-SerialPort.cpp-don-t-use-high-baudrates-when-not-ava.patch lib_patch.Upstream
-package/libserialport/0001-uclinux-detection.patch lib_patch.Upstream
 package/libshdata/0001-backend-Add-missing-include-files.patch lib_patch.Upstream
 package/libshdata/0002-examples-stress_test-Fix-build-with-musl-libc.patch lib_patch.Upstream
 package/libsidplay2/0001-sidplay2-libs-2.1.1.patch lib_patch.Upstream
diff --git a/package/libserialport/0001-uclinux-detection.patch b/package/libserialport/0001-uclinux-detection.patch
deleted file mode 100644
index 7d7199c1f0..0000000000
--- a/package/libserialport/0001-uclinux-detection.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From faab9aa5879fab93556b7a3a6f24070eeb3cbf15 Mon Sep 17 00:00:00 2001
-From: Paul Cercueil <paul.cercueil@analog.com>
-Date: Mon, 29 Aug 2016 11:11:01 +0200
-Subject: [PATCH] Fix Linux files not compiled in with a toolchain for ucLinux
-
-Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index f6b66e8..de6f5b9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -74,7 +74,7 @@ AC_DEFINE_UNQUOTED([SP_LIB_VERSION_REVISION], [$SP_LIB_VERSION_REVISION], [.])
- AC_DEFINE_UNQUOTED([SP_LIB_VERSION_AGE], [$SP_LIB_VERSION_AGE], [.])
- AC_DEFINE_UNQUOTED([SP_LIB_VERSION_STRING], ["$SP_LIB_VERSION"], [.])
- 
--AM_CONDITIONAL([LINUX], [test -z "${host_os##linux*}"])
-+AM_CONDITIONAL([LINUX], [test -z "${host_os##linux*}" || test -z "${host_os##uclinux*}"])
- AM_CONDITIONAL([WIN32], [test -z "${host_os##mingw*}" || test -z "${host_os##cygwin*}"])
- AM_CONDITIONAL([MACOSX], [test -z "${host_os##darwin*}"])
- AM_CONDITIONAL([FREEBSD], [test -z "${host_os##freebsd*}"])
--- 
-2.8.1
-
diff --git a/package/libserialport/libserialport.hash b/package/libserialport/libserialport.hash
index 39f0c8f1f0..5bf7823d63 100644
--- a/package/libserialport/libserialport.hash
+++ b/package/libserialport/libserialport.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4a2af9d9c3ff488e92fb75b4ba38b35bcf9b8a66df04773eba2a7bbf1fa7529d  libserialport-0.1.1.tar.gz
+sha256  5deb92b5ca72c0347b07b786848350deca2dcfd975ce613b8e0e1d947a4b4ca9  libserialport-0.1.2.tar.gz
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/libserialport/libserialport.mk b/package/libserialport/libserialport.mk
index 84d7a5315b..f3331db074 100644
--- a/package/libserialport/libserialport.mk
+++ b/package/libserialport/libserialport.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-LIBSERIALPORT_VERSION = 0.1.1
+LIBSERIALPORT_VERSION = 0.1.2
 LIBSERIALPORT_SITE = http://sigrok.org/download/source/libserialport
 LIBSERIALPORT_LICENSE = LGPL-3.0+
 LIBSERIALPORT_LICENSE_FILES = COPYING
 LIBSERIALPORT_INSTALL_STAGING = YES
 LIBSERIALPORT_DEPENDENCIES = host-pkgconf
-LIBSERIALPORT_AUTORECONF = YES
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
