Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE08C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 23:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 213D660E84;
	Mon, 21 Feb 2022 23:38:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qfTftiJR5_Cu; Mon, 21 Feb 2022 23:38:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F29060C2E;
	Mon, 21 Feb 2022 23:38:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B1C41BF368
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 23:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 338C260C2E
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 23:38:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hmEBRF2JVvRD for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 23:38:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9E7F60BE0
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 23:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Hh9XCa/BcGAc4OL3qlFcrHGZdWO8n24OPVA2XPMaO+4=; b=H7fg8LcirkdNheVI9OfNizVzlh
 KueIhgM8jN3kwbET8yHxce+wJt+x+J5NHHDhZOROeOH5/vxImabtMZGFvMkHu4rx8+Tw4vJJS0+Bi
 RNrt4C0vFMGICa/c566+aFHxOyQwldo9rmMrj4chWLHOaFv7UfabqCifcSJ3fVZib7iFSqYcmVSPz
 SNMHr+z0/jdYmJAK6AT5RLZWoP5jQP7jxT2JpD+Zvkevuau9XGPJCy8Hrlhw/K65hDWna5hmMxLjE
 cAj16JSb9tgpJ1aNejGRCE8a0Xv7lNy9dyuMwBgnSEdcudc8W12LSQF+1tURlr0FfLQISxUR7kcKS
 UJT4Agtg==;
Received: from 91-153-34-133.elisa-laajakaista.fi ([91.153.34.133] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nMIFi-0009ZL-0X; Tue, 22 Feb 2022 00:37:58 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id ffb0801b;
 Mon, 21 Feb 2022 23:37:45 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 01:37:45 +0200
Message-Id: <20220221233745.520318-1-aperez@igalia.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/xdg-dbus-proxy: bump to version
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a minor maintenance release. The release incorporates
"0001-Fix-musl-compilation-by-adding-TEMP_FAILURE_RETRY.patch", which
can now be removed.

Release notes:

  https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.3

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...ilation-by-adding-TEMP_FAILURE_RETRY.patch | 36 -------------------
 package/xdg-dbus-proxy/xdg-dbus-proxy.hash    |  4 +--
 package/xdg-dbus-proxy/xdg-dbus-proxy.mk      |  2 +-
 3 files changed, 3 insertions(+), 39 deletions(-)
 delete mode 100644 package/xdg-dbus-proxy/0001-Fix-musl-compilation-by-adding-TEMP_FAILURE_RETRY.patch

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
index 37bda78436..a2d46ca82f 100644
--- a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
@@ -1,5 +1,5 @@
-# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.2
-sha256 1749d6f9f46dcc9edc87725641cf56cf91dcad1b01707891ea0850c1000c520f xdg-dbus-proxy-0.1.2.tar.xz
+# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.3
+sha256 03b5d28ca879253ddbbce31098909becca1495ea811a6377a492e28f16c09b9b xdg-dbus-proxy-0.1.3.tar.xz
 
 # Hash for license files:
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
