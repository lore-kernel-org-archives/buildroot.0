Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D88CD6E50
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 14:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC69C60E82;
	Fri, 29 May 2026 14:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tdgmXkbOOFB9; Fri, 29 May 2026 14:48:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8E9160687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780066106;
	bh=vwpisdkVHZyQRKIw+k9bnjBdn6/lTqerqVyaLPqn3NU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oh8rQTWkXZdMZten9ews9LFl3hDofN0I7gYQ6Q1qXBrfZuyJbLk9IRJTbDgllprT2
	 OTEvNRTjr+LWnxwpwBa28yplik//hXPTX3WK7GJvskcsN3EkveDz44dYsPlnS/Kspc
	 xThhLruELRQjHjQxd87EoUIcFyPHVtiRLRyW/d83cZPqT7TfrDmtLjtNXDP1ghSMZp
	 0JwsQ1R2lObvGpz7dQIflS8I9IMixp7EfgyVBwhYxu9p3U7oWbpJog8c5ihjqTu1Bw
	 e83TiBjZMP4jnB9C//QMEcRdmAola/WoKCRzv1M6359XpRLb1H7FfngTqh8PYGXq13
	 T6ETHt+uf596A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8E9160687;
	Fri, 29 May 2026 14:48:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53191D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 14:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4120C822D7
 for <buildroot@buildroot.org>; Fri, 29 May 2026 14:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gs5PjbSAj8w8 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 14:48:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 572D9822B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 572D9822B4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 14:48:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD1E0873E2; Fri, 29 May 2026 14:48:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 16:30:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81e24e90bb98f7e3768ebd9e69808921bd0f2e2a
X-Git-Newrev: a659fa3bb501b1e8cbbd656ca456a93a59ae0573
X-Patchwork-Hint: ignore
Message-Id: <20260529144811.BD1E0873E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vlc: replace wayland-scanner patch
 with upstream commit
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a659fa3bb501b1e8cbbd656ca456a93a59ae0573
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...ake-it-possible-to-override-wayland-scann.patch | 39 +++++++++++++++++
 ...c-also-use-AC_PATH_PROG-to-check-for-wayl.patch | 50 ----------------------
 package/vlc/vlc.mk                                 |  1 +
 4 files changed, 40 insertions(+), 51 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0ecd022707..59df8e5cf4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -933,7 +933,6 @@ package/vlc/0004-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch lib_pa
 package/vlc/0005-Don-t-assume-strerror_l-is-available.patch lib_patch.Upstream
 package/vlc/0006-posix-remove-ancient-run-time-fallback-to-real-time-.patch lib_patch.Upstream
 package/vlc/0007-Add-support-for-freerdp2.patch lib_patch.Upstream
-package/vlc/0008-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch lib_patch.Upstream
 package/vlc/0009-modules-video_filter-opencv_example.cpp-fix-build-wi.patch lib_patch.Upstream
 package/vlc/0010-opengl-missing-library-check.patch lib_patch.Upstream
 package/vpnc/0001-Makefile-allow-to-override-the-PREFIX-variable.patch lib_patch.Upstream
diff --git a/package/vlc/0008-configure-make-it-possible-to-override-wayland-scann.patch b/package/vlc/0008-configure-make-it-possible-to-override-wayland-scann.patch
new file mode 100644
index 0000000000..b89687ec74
--- /dev/null
+++ b/package/vlc/0008-configure-make-it-possible-to-override-wayland-scann.patch
@@ -0,0 +1,39 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Yann Lochet <yann@l0chet.fr>
+Date: Fri, 25 Nov 2022 16:20:45 +0100
+Subject: [PATCH] configure: make it possible to override wayland-scanner
+
+When cross-compiling, PKG_CONFIG might pick up the wayland-scanner
+from the sysroot.
+
+Upstream: https://code.videolan.org/videolan/vlc/-/commit/75e52f617bf3273f4883b56c4175d68211e02d14
+
+[Bernd: rebased for 3.0.23]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index a91fc73172..5e8821dea9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3277,6 +3277,7 @@ AS_IF([test "${enable_wayland}" = "yes"], [
+     ])
+ 
+     AC_MSG_CHECKING([for the Wayland scanner])
++    AS_VAR_SET_IF(WAYLAND_SCANNER, [],[
+     PKG_CHECK_EXISTS([wayland-scanner], [
+       WAYLAND_SCANNER="$(${PKG_CONFIG} wayland-scanner --variable wayland_scanner)"
+       AC_MSG_RESULT([${WAYLAND_SCANNER}])
+@@ -3284,6 +3285,7 @@ AS_IF([test "${enable_wayland}" = "yes"], [
+       AC_MSG_RESULT([not found])
+       AC_MSG_ERROR([$(${PKG_CONFIG} --print-errors wayland-scanner)])
+     ])
++    ])
+ 
+     have_wayland="yes"
+ 
+-- 
+2.47.3
+
diff --git a/package/vlc/0008-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch b/package/vlc/0008-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch
deleted file mode 100644
index 2b74fe0d39..0000000000
--- a/package/vlc/0008-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 27635f902831fac898586f1f3dc98369f12582c9 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 26 Aug 2018 12:51:04 +0200
-Subject: [PATCH] configure.ac: also use AC_PATH_PROG to check for
- wayland-scanner
-
-When cross-compiling the .pc file might point to the wrong
-wayland-scanner binary (target rather than host) resulting in a
-non-executable and wrong scanner.
-Try searching the PATH first, and if that fails fall back into
-pkg-config.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure.ac | 19 +++++++++++--------
- 1 file changed, 11 insertions(+), 8 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4808b8becf..a18641ed23 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3140,14 +3140,17 @@ AS_IF([test "${enable_wayland}" != "no"], [
-       AC_MSG_ERROR([$(${PKG_CONFIG} --print-errors 'wayland-protocols >= 1.4')])
-     ])
- 
--    AC_MSG_CHECKING([for the Wayland scanner])
--    PKG_CHECK_EXISTS([wayland-scanner], [
--      WAYLAND_SCANNER="$(${PKG_CONFIG} wayland-scanner --variable wayland_scanner)"
--      AC_MSG_RESULT([${WAYLAND_SCANNER}])
--    ], [
--      AC_MSG_RESULT([not found])
--      AC_MSG_ERROR([$(${PKG_CONFIG} --print-errors wayland-scanner)])
--    ])
-+    AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
-+    if test "x$WAYLAND_SCANNER" = x; then
-+        AC_MSG_CHECKING([for the Wayland scanner])
-+        PKG_CHECK_EXISTS([wayland-scanner], [
-+          WAYLAND_SCANNER="$(${PKG_CONFIG} wayland-scanner --variable wayland_scanner)"
-+          AC_MSG_RESULT([${WAYLAND_SCANNER}])
-+        ], [
-+          AC_MSG_RESULT([not found])
-+          AC_MSG_ERROR([$(${PKG_CONFIG} --print-errors wayland-scanner)])
-+        ])
-+    fi
- 
-     have_wayland="yes"
- 
--- 
-2.18.0
-
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 07aeefd193..0ce6662353 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -527,6 +527,7 @@ VLC_CONF_OPTS += --disable-udev
 endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_WAYLAND_PROTOCOLS),yy)
+VLC_CONF_ENV += WAYLAND_SCANNER=$(HOST_DIR)/bin/wayland-scanner
 VLC_CONF_OPTS += --enable-wayland
 VLC_DEPENDENCIES += wayland wayland-protocols
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
