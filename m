Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED9DC4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 20:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6034060ADC;
	Tue, 27 Dec 2022 20:27:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6034060ADC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tTJMq-QfrJQe; Tue, 27 Dec 2022 20:27:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74E5360C0C;
	Tue, 27 Dec 2022 20:27:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74E5360C0C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C40701BF37A
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC4CF402F7
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC4CF402F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ctzNRdIcUwC8 for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 20:27:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72657402C3
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 20:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72657402C3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BB7C86E87; Tue, 27 Dec 2022 20:27:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 21:04:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1df9d42bdd8cc2e594d6337ee62c3f31499baf80
X-Git-Newrev: 95a16926ed78c905d38f6eeb8bc46c9d3d3bb5a0
X-Patchwork-Hint: ignore
Message-Id: <20221227202720.5BB7C86E87@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: bump version to 19.5-Matrix
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

commit: https://git.buildroot.net/buildroot/commit/?id=95a16926ed78c905d38f6eeb8bc46c9d3d3bb5a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed two upstream patches included in this version.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../kodi-jsonschemabuilder.mk                      |  2 +-
 package/kodi-texturepacker/kodi-texturepacker.mk   |  2 +-
 ...t-as-char-as-formatting-of-non-void-point.patch | 54 ----------------------
 ...1-cast-as-char-as-formatting-of-non-void-.patch | 33 -------------
 package/kodi/kodi.hash                             |  2 +-
 package/kodi/kodi.mk                               |  2 +-
 6 files changed, 4 insertions(+), 91 deletions(-)

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
index c41c515d10..dbe6c1e8f6 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
