Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40088C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 10:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFA1860B6A;
	Tue, 22 Feb 2022 10:37:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tugb1W3LEVzB; Tue, 22 Feb 2022 10:37:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6C2060EE4;
	Tue, 22 Feb 2022 10:37:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 392131BF9BA
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 267D9409A3
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:37:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8WfekI9sGm11 for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 10:37:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44038408AE
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 10:37:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DDFDC837C4; Tue, 22 Feb 2022 10:29:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 11:36:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c7e250c699b23051a64bc0c2ef3e3f2bd020b3d
X-Git-Newrev: 1a0d90d8aba6862060ba6e839ebd75436f671acf
X-Patchwork-Hint: ignore
Message-Id: <20220222102907.DDFDC837C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xdg-dbus-proxy: bump to version
 0.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a0d90d8aba6862060ba6e839ebd75436f671acf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a minor maintenance release. The release incorporates
"0001-Fix-musl-compilation-by-adding-TEMP_FAILURE_RETRY.patch", which
can now be removed.

Release notes:

  https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.3

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-compilation-by-adding-TEMP_FAILURE_RETRY.patch | 36 ----------------------
 package/xdg-dbus-proxy/xdg-dbus-proxy.hash         |  6 ++--
 package/xdg-dbus-proxy/xdg-dbus-proxy.mk           |  2 +-
 3 files changed, 4 insertions(+), 40 deletions(-)

diff --git a/package/xdg-dbus-proxy/0001-Fix-musl-compilation-by-adding-TEMP_FAILURE_RETRY.patch b/package/xdg-dbus-proxy/0001-Fix-musl-compilation-by-adding-TEMP_FAILURE_RETRY.patch
deleted file mode 100644
index e531f58923..0000000000
--- a/package/xdg-dbus-proxy/0001-Fix-musl-compilation-by-adding-TEMP_FAILURE_RETRY.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 645c45f0334bb1d6e31b5927cece5e446f129cbb Mon Sep 17 00:00:00 2001
-From: Danilo Spinella <danyspin97@protonmail.com>
-Date: Sat, 7 Dec 2019 00:05:21 +0100
-Subject: [PATCH] Fix musl compilation by adding TEMP_FAILURE_RETRY
-
-Fetch from: https://github.com/flatpak/xdg-dbus-proxy/pull/13
-Upstream-Status: Accepted
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-
----
- dbus-proxy.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/dbus-proxy.c b/dbus-proxy.c
-index 163df21..4b07931 100644
---- a/dbus-proxy.c
-+++ b/dbus-proxy.c
-@@ -30,6 +30,15 @@
- #include <errno.h>
- 
- #include "flatpak-proxy.h"
-+// Taken from glibc unistd.h
-+#ifndef TEMP_FAILURE_RETRY
-+# define TEMP_FAILURE_RETRY(expression) \
-+  (__extension__                                                              \
-+    ({ long int __result;                                                     \
-+       do __result = (long int) (expression);                                 \
-+       while (__result == -1L && errno == EINTR);                             \
-+       __result; }))
-+#endif
- 
- static const char *argv0;
- static GList *proxies;
--- 
-2.24.1
-
diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
index 37bda78436..b7aa9ac701 100644
--- a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
@@ -1,5 +1,5 @@
-# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.2
-sha256 1749d6f9f46dcc9edc87725641cf56cf91dcad1b01707891ea0850c1000c520f xdg-dbus-proxy-0.1.2.tar.xz
+# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.3
+sha256  03b5d28ca879253ddbbce31098909becca1495ea811a6377a492e28f16c09b9b  xdg-dbus-proxy-0.1.3.tar.xz
 
 # Hash for license files:
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
index 1b056c36f0..9c4449c7bb 100644
--- a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDG_DBUS_PROXY_VERSION = 0.1.2
+XDG_DBUS_PROXY_VERSION = 0.1.3
 XDG_DBUS_PROXY_SITE = https://github.com/flatpak/xdg-dbus-proxy/releases/download/$(XDG_DBUS_PROXY_VERSION)
 XDG_DBUS_PROXY_SOURCE = xdg-dbus-proxy-$(XDG_DBUS_PROXY_VERSION).tar.xz
 XDG_DBUS_PROXY_DEPENDENCIES = host-pkgconf libglib2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
