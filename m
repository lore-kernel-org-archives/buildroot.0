Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2D0C433EF
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 14:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BB0141BA3;
	Wed, 18 May 2022 14:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U04t1DjmLyKw; Wed, 18 May 2022 14:19:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1663641BAE;
	Wed, 18 May 2022 14:19:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E82801BF396
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 14:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D690C40FEC
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 14:19:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vZaF14RJ8WSN for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 14:19:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0DBA40FE2
 for <buildroot@buildroot.org>; Wed, 18 May 2022 14:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eqFd2UvkTr8x/zWhnJO3oO78LYjWy/p3KcXA21ce3Zk=; b=UGWXQOG9PQUsUj0A0zHjb+xE4T
 BXNy2ZhubIt/bmaqxhOCsVcMpTdPvPEEozs4Zk+6qCp620CqkvgOL5sdi6G6jlv8lABc0lyt6VbNX
 fbXKv07Cwmm2lxchm8B2mfu5ZXjgQUVMyl+HWJghpLVUwkUVrAkAD2lI9YE8GRKfK0g7KlXM8NBBg
 g/f50Nju/o4QS9FcMrzhqzG9T4E5w2dQ3eTX7154dXtcnF9Ma/7Ml1FxKACZGCNDZc+zFgWY6iQaB
 zgH0l1mPkaBklaWv+XqaJKcP1IqFXP6qdTn4mVZkcsj7i3lSv7MugKwUDjBfDJcpoHdg/sGmBdq0p
 /hn3LOCw==;
Received: from 91-153-34-181.elisa-laajakaista.fi ([91.153.34.181] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nrKWX-00A24F-Sj; Wed, 18 May 2022 16:19:37 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id a9bf7e6d;
 Wed, 18 May 2022 14:19:27 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed, 18 May 2022 17:19:27 +0300
Message-Id: <20220518141927.554571-1-aperez@igalia.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: bump to version 2.36.2
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

Bugfix release, mostly with build fixes, and an important fix for
when using threaded rendering. Release notes:

  https://wpewebkit.org/release/wpewebkit-2.36.2.html

This release fails to build when X11 headers are not present, but there
is already a fix accepted upstream and slated for inclusion in the next
release in the series, so in the meantime imported it locally.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...GLE-with-the-EGL_NO_PLATFORM_SPECIFI.patch | 39 +++++++++++++++++++
 package/wpewebkit/wpewebkit.hash              |  8 ++--
 package/wpewebkit/wpewebkit.mk                |  2 +-
 3 files changed, 44 insertions(+), 5 deletions(-)
 create mode 100644 package/wpewebkit/0001-GTK-WPE-Build-ANGLE-with-the-EGL_NO_PLATFORM_SPECIFI.patch

diff --git a/package/wpewebkit/0001-GTK-WPE-Build-ANGLE-with-the-EGL_NO_PLATFORM_SPECIFI.patch b/package/wpewebkit/0001-GTK-WPE-Build-ANGLE-with-the-EGL_NO_PLATFORM_SPECIFI.patch
new file mode 100644
index 0000000000..0b6dd9bcb1
--- /dev/null
+++ b/package/wpewebkit/0001-GTK-WPE-Build-ANGLE-with-the-EGL_NO_PLATFORM_SPECIFI.patch
@@ -0,0 +1,39 @@
+From 32135a4af7c2ea1db2ea528df9af0a331ca88dba Mon Sep 17 00:00:00 2001
+From: "zan@falconsigh.net"
+ <zan@falconsigh.net@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
+Date: Tue, 12 Apr 2022 06:34:44 +0000
+Subject: [PATCH] [GTK][WPE] Build ANGLE with the
+ EGL_NO_PLATFORM_SPECIFIC_TYPES define
+ https://bugs.webkit.org/show_bug.cgi?id=239039
+
+Reviewed by Adrian Perez de Castro.
+
+Specify the EGL_NO_PLATFORM_SPECIFIC_TYPES define when building ANGLE
+subproject for the GTK and WPE ports. This should avoid searching for
+platform-specific headers that might not be available at all during
+build, e.g. the X11 headers which are used by default on UNIX platforms.
+
+* PlatformGTK.cmake:
+* PlatformWPE.cmake:
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+Upstream status: https://bugs.webkit.org/show_bug.cgi?id=239039
+---
+ Source/ThirdParty/ANGLE/ChangeLog         | 15 +++++++++++++++
+ Source/ThirdParty/ANGLE/PlatformGTK.cmake |  2 +-
+ Source/ThirdParty/ANGLE/PlatformWPE.cmake |  2 +-
+ 3 files changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/Source/ThirdParty/ANGLE/PlatformWPE.cmake b/Source/ThirdParty/ANGLE/PlatformWPE.cmake
+index a4d0b959c62..8f5bff7f19a 100644
+--- a/Source/ThirdParty/ANGLE/PlatformWPE.cmake
++++ b/Source/ThirdParty/ANGLE/PlatformWPE.cmake
+@@ -1,4 +1,4 @@
+-list(APPEND ANGLE_DEFINITIONS ANGLE_PLATFORM_LINUX)
++list(APPEND ANGLE_DEFINITIONS ANGLE_PLATFORM_LINUX EGL_NO_PLATFORM_SPECIFIC_TYPES)
+ include(linux.cmake)
+ 
+ if (USE_OPENGL)
+-- 
+2.36.1
+
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 3923c32111..d509ab091f 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.36.1.tar.xz.sums
-md5  7ba1c7fd0f67891ad137d11cac12f7a9  wpewebkit-2.36.1.tar.xz
-sha1  0918a4daded01f42e65ec02a69f21cd6705311db  wpewebkit-2.36.1.tar.xz
-sha256  ec83d8b2f8c3479ce9950d69440f3b9876ab70200fe6f4e07686054a0cba5723  wpewebkit-2.36.1.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.36.2.tar.xz.sums
+md5  bcfb465ae085835ae96c68fddc85ca44  wpewebkit-2.36.2.tar.xz
+sha1  1a5a6b7b5e94f4ea7e3462d6bdb5de7efa678f74  wpewebkit-2.36.2.tar.xz
+sha256  959519562701e2005f2767a62e85977d6c3e65858709b376c89d8e33502febb9  wpewebkit-2.36.2.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 9c9a9a2838..ca26cb3f65 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.36.1
+WPEWEBKIT_VERSION = 2.36.2
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
