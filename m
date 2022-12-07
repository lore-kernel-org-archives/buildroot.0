Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068F8C352A1
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 13:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB26640053;
	Wed,  7 Dec 2022 13:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB26640053
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TXUMEcPczRbs; Wed,  7 Dec 2022 13:34:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AF3240881;
	Wed,  7 Dec 2022 13:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AF3240881
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5EA211BF955
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 13:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4639240382
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 13:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4639240382
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ol-QYNoBMZ6f for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 13:33:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 181A040322
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 13:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 181A040322
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0428585D9C; Wed,  7 Dec 2022 13:33:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Dec 2022 09:38:16 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: f91c90e080b270082f077688e8ceb5599dc802a3
X-Git-Newrev: fa32dc149eadb1d37a988b0e010f6b5ce0535aeb
X-Patchwork-Hint: ignore
Message-Id: <20221207133355.0428585D9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/kodi: fix build
 with fmt >= 9.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa32dc149eadb1d37a988b0e010f6b5ce0535aeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

For details see https://github.com/xbmc/xbmc/pull/21674

Build-tested using this previously broken defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON3_PY_ONLY=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 61bdd02e933e194a6f8aa5c1541f675d8ab71d09)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...t-as-char-as-formatting-of-non-void-point.patch | 54 ++++++++++++++++++++++
 ...1-cast-as-char-as-formatting-of-non-void-.patch | 33 +++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/package/kodi/0005-GLUtils-cast-as-char-as-formatting-of-non-void-point.patch b/package/kodi/0005-GLUtils-cast-as-char-as-formatting-of-non-void-point.patch
new file mode 100644
index 0000000000..af68de220c
--- /dev/null
+++ b/package/kodi/0005-GLUtils-cast-as-char-as-formatting-of-non-void-point.patch
@@ -0,0 +1,54 @@
+From 44b30c116682968bacf8aec566fc9c193026ecc9 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Wed, 6 Jul 2022 22:48:35 +1000
+Subject: [PATCH] GLUtils: cast as char as formatting of non-void pointers
+ is disallowed
+
+Downloaded from upstream commit:
+https://github.com/xbmc/xbmc/commit/44b30c116682968bacf8aec566fc9c193026ecc9
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ xbmc/utils/GLUtils.cpp | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/xbmc/utils/GLUtils.cpp b/xbmc/utils/GLUtils.cpp
+index 1ef804709f..c36dcf6a20 100644
+--- a/xbmc/utils/GLUtils.cpp
++++ b/xbmc/utils/GLUtils.cpp
+@@ -148,27 +148,27 @@ void _VerifyGLState(const char* szfile, const char* szfunction, int lineno)
+ void LogGraphicsInfo()
+ {
+ #if defined(HAS_GL) || defined(HAS_GLES)
+-  const GLubyte *s;
++  const char* s;
+ 
+-  s = glGetString(GL_VENDOR);
++  s = reinterpret_cast<const char*>(glGetString(GL_VENDOR));
+   if (s)
+     CLog::Log(LOGINFO, "GL_VENDOR = %s", s);
+   else
+     CLog::Log(LOGINFO, "GL_VENDOR = NULL");
+ 
+-  s = glGetString(GL_RENDERER);
++  s = reinterpret_cast<const char*>(glGetString(GL_RENDERER));
+   if (s)
+     CLog::Log(LOGINFO, "GL_RENDERER = %s", s);
+   else
+     CLog::Log(LOGINFO, "GL_RENDERER = NULL");
+ 
+-  s = glGetString(GL_VERSION);
++  s = reinterpret_cast<const char*>(glGetString(GL_VERSION));
+   if (s)
+     CLog::Log(LOGINFO, "GL_VERSION = %s", s);
+   else
+     CLog::Log(LOGINFO, "GL_VERSION = NULL");
+ 
+-  s = glGetString(GL_SHADING_LANGUAGE_VERSION);
++  s = reinterpret_cast<const char*>(glGetString(GL_SHADING_LANGUAGE_VERSION));
+   if (s)
+     CLog::Log(LOGINFO, "GL_SHADING_LANGUAGE_VERSION = %s", s);
+   else
+-- 
+2.30.2
+
diff --git a/package/kodi/0006-WinSystemX11-cast-as-char-as-formatting-of-non-void-.patch b/package/kodi/0006-WinSystemX11-cast-as-char-as-formatting-of-non-void-.patch
new file mode 100644
index 0000000000..41dc3356bd
--- /dev/null
+++ b/package/kodi/0006-WinSystemX11-cast-as-char-as-formatting-of-non-void-.patch
@@ -0,0 +1,33 @@
+From 651c82853fe69dc5aa3e6a50f2eb2f752caafba0 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Mon, 11 Jul 2022 09:39:02 +0000
+Subject: [PATCH] WinSystemX11: cast as char as formatting of non-void
+ pointers is disallowed
+
+Downloaded from upstream commit:
+https://github.com/xbmc/xbmc/commit/651c82853fe69dc5aa3e6a50f2eb2f752caafba0
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ xbmc/windowing/X11/WinSystemX11.cpp | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/xbmc/windowing/X11/WinSystemX11.cpp b/xbmc/windowing/X11/WinSystemX11.cpp
+index 8a18288fd8..033c0f77bf 100644
+--- a/xbmc/windowing/X11/WinSystemX11.cpp
++++ b/xbmc/windowing/X11/WinSystemX11.cpp
+@@ -1038,7 +1038,10 @@ bool CWinSystemX11::HasWindowManager()
+ 
+   if(status == Success && items_read)
+   {
+-    CLog::Log(LOGDEBUG,"Window Manager Name: %s", data);
++    const char* s;
++
++    s = reinterpret_cast<const char*>(data);
++    CLog::Log(LOGDEBUG, "Window Manager Name: {}", s);
+   }
+   else
+     CLog::Log(LOGDEBUG,"Window Manager Name: ");
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
