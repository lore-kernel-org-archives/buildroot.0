Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA41C4332F
	for <buildroot@archiver.kernel.org>; Sat, 24 Dec 2022 12:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BD3F81427;
	Sat, 24 Dec 2022 12:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BD3F81427
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AxBwwxpej9LP; Sat, 24 Dec 2022 12:57:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86D4A813CD;
	Sat, 24 Dec 2022 12:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86D4A813CD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 573231BF5DD
 for <buildroot@lists.busybox.net>; Sat, 24 Dec 2022 12:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 322D281423
 for <buildroot@lists.busybox.net>; Sat, 24 Dec 2022 12:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 322D281423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ZNc3O3U-4Af for <buildroot@lists.busybox.net>;
 Sat, 24 Dec 2022 12:57:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BB18813A5
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BB18813A5
 for <buildroot@buildroot.org>; Sat, 24 Dec 2022 12:57:24 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout11.t-online.de (Postfix) with SMTP id F40D9B37E
 for <buildroot@buildroot.org>; Sat, 24 Dec 2022 13:57:20 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd73.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p945Y-2X2qlF0; Sat, 24 Dec 2022 13:57:20 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:59670)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p945Y-0002mI-0H
 for buildroot@buildroot.org; Sat, 24 Dec 2022 13:57:20 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 24 Dec 2022 13:57:19 +0100
Message-Id: <20221224125720.2905231-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671886640-2508E98D-F7F76BA4/0/0 CLEAN NORMAL
X-TOI-MSGID: 051feabb-276a-4c1c-a214-afcb7b5a5d2c
Subject: [Buildroot] [PATCH 1/2] package/kodi: bump version to 19.5-Matrix
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed two upstream patches included in this version.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-jsonschemabuilder.mk                 |  2 +-
 .../kodi-texturepacker/kodi-texturepacker.mk  |  2 +-
 ...char-as-formatting-of-non-void-point.patch | 54 -------------------
 ...t-as-char-as-formatting-of-non-void-.patch | 33 ------------
 package/kodi/kodi.hash                        |  2 +-
 package/kodi/kodi.mk                          |  2 +-
 6 files changed, 4 insertions(+), 91 deletions(-)
 delete mode 100644 package/kodi/0005-GLUtils-cast-as-char-as-formatting-of-non-void-point.patch
 delete mode 100644 package/kodi/0006-WinSystemX11-cast-as-char-as-formatting-of-non-void-.patch

diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
index 8cc2297bdb..a13fb91afe 100644
--- a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
+++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_JSONSCHEMABUILDER_VERSION = 19.4-Matrix
+KODI_JSONSCHEMABUILDER_VERSION = 19.5-Matrix
 KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,$(KODI_JSONSCHEMABUILDER_VERSION))
 KODI_JSONSCHEMABUILDER_SOURCE = kodi-$(KODI_JSONSCHEMABUILDER_VERSION).tar.gz
 KODI_JSONSCHEMABUILDER_DL_SUBDIR = kodi
diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
index 4733399edc..9432e4bbd6 100644
--- a/package/kodi-texturepacker/kodi-texturepacker.mk
+++ b/package/kodi-texturepacker/kodi-texturepacker.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_TEXTUREPACKER_VERSION = 19.4-Matrix
+KODI_TEXTUREPACKER_VERSION = 19.5-Matrix
 KODI_TEXTUREPACKER_SITE = $(call github,xbmc,xbmc,$(KODI_TEXTUREPACKER_VERSION))
 KODI_TEXTUREPACKER_SOURCE = kodi-$(KODI_TEXTUREPACKER_VERSION).tar.gz
 KODI_TEXTUREPACKER_DL_SUBDIR = kodi
diff --git a/package/kodi/0005-GLUtils-cast-as-char-as-formatting-of-non-void-point.patch b/package/kodi/0005-GLUtils-cast-as-char-as-formatting-of-non-void-point.patch
deleted file mode 100644
index af68de220c..0000000000
--- a/package/kodi/0005-GLUtils-cast-as-char-as-formatting-of-non-void-point.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 44b30c116682968bacf8aec566fc9c193026ecc9 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Wed, 6 Jul 2022 22:48:35 +1000
-Subject: [PATCH] GLUtils: cast as char as formatting of non-void pointers
- is disallowed
-
-Downloaded from upstream commit:
-https://github.com/xbmc/xbmc/commit/44b30c116682968bacf8aec566fc9c193026ecc9
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- xbmc/utils/GLUtils.cpp | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/xbmc/utils/GLUtils.cpp b/xbmc/utils/GLUtils.cpp
-index 1ef804709f..c36dcf6a20 100644
---- a/xbmc/utils/GLUtils.cpp
-+++ b/xbmc/utils/GLUtils.cpp
-@@ -148,27 +148,27 @@ void _VerifyGLState(const char* szfile, const char* szfunction, int lineno)
- void LogGraphicsInfo()
- {
- #if defined(HAS_GL) || defined(HAS_GLES)
--  const GLubyte *s;
-+  const char* s;
- 
--  s = glGetString(GL_VENDOR);
-+  s = reinterpret_cast<const char*>(glGetString(GL_VENDOR));
-   if (s)
-     CLog::Log(LOGINFO, "GL_VENDOR = %s", s);
-   else
-     CLog::Log(LOGINFO, "GL_VENDOR = NULL");
- 
--  s = glGetString(GL_RENDERER);
-+  s = reinterpret_cast<const char*>(glGetString(GL_RENDERER));
-   if (s)
-     CLog::Log(LOGINFO, "GL_RENDERER = %s", s);
-   else
-     CLog::Log(LOGINFO, "GL_RENDERER = NULL");
- 
--  s = glGetString(GL_VERSION);
-+  s = reinterpret_cast<const char*>(glGetString(GL_VERSION));
-   if (s)
-     CLog::Log(LOGINFO, "GL_VERSION = %s", s);
-   else
-     CLog::Log(LOGINFO, "GL_VERSION = NULL");
- 
--  s = glGetString(GL_SHADING_LANGUAGE_VERSION);
-+  s = reinterpret_cast<const char*>(glGetString(GL_SHADING_LANGUAGE_VERSION));
-   if (s)
-     CLog::Log(LOGINFO, "GL_SHADING_LANGUAGE_VERSION = %s", s);
-   else
--- 
-2.30.2
-
diff --git a/package/kodi/0006-WinSystemX11-cast-as-char-as-formatting-of-non-void-.patch b/package/kodi/0006-WinSystemX11-cast-as-char-as-formatting-of-non-void-.patch
deleted file mode 100644
index 41dc3356bd..0000000000
--- a/package/kodi/0006-WinSystemX11-cast-as-char-as-formatting-of-non-void-.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 651c82853fe69dc5aa3e6a50f2eb2f752caafba0 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Mon, 11 Jul 2022 09:39:02 +0000
-Subject: [PATCH] WinSystemX11: cast as char as formatting of non-void
- pointers is disallowed
-
-Downloaded from upstream commit:
-https://github.com/xbmc/xbmc/commit/651c82853fe69dc5aa3e6a50f2eb2f752caafba0
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- xbmc/windowing/X11/WinSystemX11.cpp | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/xbmc/windowing/X11/WinSystemX11.cpp b/xbmc/windowing/X11/WinSystemX11.cpp
-index 8a18288fd8..033c0f77bf 100644
---- a/xbmc/windowing/X11/WinSystemX11.cpp
-+++ b/xbmc/windowing/X11/WinSystemX11.cpp
-@@ -1038,7 +1038,10 @@ bool CWinSystemX11::HasWindowManager()
- 
-   if(status == Success && items_read)
-   {
--    CLog::Log(LOGDEBUG,"Window Manager Name: %s", data);
-+    const char* s;
-+
-+    s = reinterpret_cast<const char*>(data);
-+    CLog::Log(LOGDEBUG, "Window Manager Name: {}", s);
-   }
-   else
-     CLog::Log(LOGDEBUG,"Window Manager Name: ");
--- 
-2.30.2
-
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index a17e0fb29f..e0f548879e 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  cc026f59fd6e37ae90f3449df50810f1cefa37da9444e1188302d910518710da  kodi-19.4-Matrix.tar.gz
+sha256  56e0074f27f08496b2a21af5704a15378a2f0979ae3e9fa9a50a2630d0313d19  kodi-19.5-Matrix.tar.gz
 sha256  38816f8373e243bc5950449b4f3b18938c4e1c59348e3411e23f31db4072e40d  kodi-libdvdcss-1.4.2-Leia-Beta-5.tar.gz
 sha256  071e414e61b795f2ff9015b21a85fc009dde967f27780d23092643916538a57a  kodi-libdvdnav-6.0.0-Leia-Alpha-3.tar.gz
 sha256  a30b6aa0aad0f2c505bc77948af2d5531a80b6e68112addb4c123fca24d5d3bf  kodi-libdvdread-6.0.0-Leia-Alpha-3.tar.gz
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 7326cd536d..812c4be6e8 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update kodi-jsonschemabuilder
 # and kodi-texturepacker
-KODI_VERSION_MAJOR = 19.4
+KODI_VERSION_MAJOR = 19.5
 KODI_VERSION_NAME = Matrix
 KODI_VERSION = $(KODI_VERSION_MAJOR)-$(KODI_VERSION_NAME)
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
