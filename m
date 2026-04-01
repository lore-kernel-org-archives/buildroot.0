Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6618107639C
	for <buildroot@archiver.kernel.org>; Wed,  1 Apr 2026 18:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F4F26103C;
	Wed,  1 Apr 2026 18:41:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HSVPSFIQiu1Y; Wed,  1 Apr 2026 18:41:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64E256127B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775068882;
	bh=Pb7JiHzU5zjlykoB/ddIStUK82iJVss7dGmE84X6aEc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mu3JIiMXaplQEQ7bvxHbk93j+r9a1F0YMqbAvbqLswgrizm23Jk4buXMbdfAzx/La
	 P9J1TYlO2+JRNrwU7rjYISrD1Zqa+7zKEJJH7tYKIjmiFhoxBJd9d58xWwi9p5qG29
	 vfplwRc+kp0p+2pZ9sr3i3qlGl/UpMKnnvPyBD6eJsExKHVUu2nlLE6VZsNokXYy88
	 FUe514aFh81RshHnVBRFCcxwxWKe9So9NUPyzVyZX42gS7Dq3EOMGhE2hgv9VVOrFJ
	 moibnDHazGovuq7QonuJcI2/sg/6/DG4mY1CzHvKfnbCPuSJHjuXhlGesw4dQoi654
	 VjTq2iWkzR/FQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64E256127B;
	Wed,  1 Apr 2026 18:41:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60404177
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 18:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5239E406F9
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 18:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7oGuOLNWUP2 for <buildroot@buildroot.org>;
 Wed,  1 Apr 2026 18:41:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AF9B406F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AF9B406F0
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 18:41:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 942097FF20; Wed,  1 Apr 2026 18:41:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Apr 2026 19:07:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea698142bdd04811fd85f5c6e492d4f896b32990
X-Git-Newrev: 66c12774cfd9daf3e1ee633f51bd0cd1b188ab24
X-Patchwork-Hint: ignore
Message-Id: <20260401184118.942097FF20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: allow build with giflib 6.x
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/66c12774cfd9daf3e1ee633f51bd0cd1b188ab24
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

These patches fix build errors which would be introduced by the upcoming
bump of giflib to 6.1.2.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...TexturePacker-allow-build-with-giflib-6.x.patch | 71 ++++++++++++++++++++++
 ...TexturePacker-allow-build-with-giflib-6.x.patch | 71 ++++++++++++++++++++++
 2 files changed, 142 insertions(+)

diff --git a/package/kodi-texturepacker/0001-TexturePacker-allow-build-with-giflib-6.x.patch b/package/kodi-texturepacker/0001-TexturePacker-allow-build-with-giflib-6.x.patch
new file mode 100644
index 0000000000..5a23237375
--- /dev/null
+++ b/package/kodi-texturepacker/0001-TexturePacker-allow-build-with-giflib-6.x.patch
@@ -0,0 +1,71 @@
+From 29492cbd20d4c90a9c00a30ab525d4d0e81a968b Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Sun, 15 Mar 2026 11:38:16 +0000
+Subject: [PATCH] TexturePacker: allow build with giflib 6.x
+
+Current #if clauses are written with a maximum of giflib 5 written in,
+update the to >= to allow for newer versiosn of the giflib api.
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+
+Upstream: https://github.com/xbmc/xbmc/pull/28016
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../native/TexturePacker/src/decoder/GifHelper.cpp        | 8 ++++----
+ .../depends/native/TexturePacker/src/decoder/GifHelper.h  | 2 +-
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp b/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
+index eb513134b3eb8..b216ecbcef7fa 100644
+--- a/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
++++ b/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
+@@ -52,7 +52,7 @@ GifHelper::~GifHelper()
+ bool GifHelper::Open(GifFileType*& gif, void *dataPtr, InputFunc readFunc)
+ {
+   int err = 0;
+-#if GIFLIB_MAJOR == 5
++#if GIFLIB_MAJOR >= 5
+   gif = DGifOpen(dataPtr, readFunc, &err);
+ #else
+   gif = DGifOpen(dataPtr, readFunc);
+@@ -73,7 +73,7 @@ void GifHelper::Close(GifFileType* gif)
+ {
+   int err = 0;
+   int reason = 0;
+-#if GIFLIB_MAJOR == 5 && GIFLIB_MINOR >= 1
++#if (GIFLIB_MAJOR == 5 && GIFLIB_MINOR >= 1) || GIFLIB_MAJOR >= 6
+   err = DGifCloseFile(gif, &reason);
+ #else
+   err = DGifCloseFile(gif);
+@@ -181,7 +181,7 @@ bool GifHelper::Slurp(GifFileType* gif)
+   if (DGifSlurp(gif) == GIF_ERROR)
+   {
+     int reason = 0;
+-#if GIFLIB_MAJOR == 5
++#if GIFLIB_MAJOR >= 5
+     reason = gif->Error;
+ #else
+     reason = GifLastError();
+@@ -246,7 +246,7 @@ bool GifHelper::GcbToFrame(GifFrame &frame, unsigned int imgIdx)
+ 
+   if (m_gif->ImageCount > 0)
+   {
+-#if GIFLIB_MAJOR == 5
++#if GIFLIB_MAJOR >= 5
+     GraphicsControlBlock gcb;
+     if (DGifSavedExtensionToGCB(m_gif, imgIdx, &gcb))
+     {
+diff --git a/tools/depends/native/TexturePacker/src/decoder/GifHelper.h b/tools/depends/native/TexturePacker/src/decoder/GifHelper.h
+index 6124b69e46296..ce5dca3394b41 100644
+--- a/tools/depends/native/TexturePacker/src/decoder/GifHelper.h
++++ b/tools/depends/native/TexturePacker/src/decoder/GifHelper.h
+@@ -128,7 +128,7 @@ class GifHelper
+   bool PrepareTemplate(GifFrame &frame);
+   void Release();
+ 
+-#if GIFLIB_MAJOR != 5
++#if GIFLIB_MAJOR < 5
+   /*
+   taken from giflib 5.1.0
+   */
diff --git a/package/kodi/0002-TexturePacker-allow-build-with-giflib-6.x.patch b/package/kodi/0002-TexturePacker-allow-build-with-giflib-6.x.patch
new file mode 100644
index 0000000000..5a23237375
--- /dev/null
+++ b/package/kodi/0002-TexturePacker-allow-build-with-giflib-6.x.patch
@@ -0,0 +1,71 @@
+From 29492cbd20d4c90a9c00a30ab525d4d0e81a968b Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Sun, 15 Mar 2026 11:38:16 +0000
+Subject: [PATCH] TexturePacker: allow build with giflib 6.x
+
+Current #if clauses are written with a maximum of giflib 5 written in,
+update the to >= to allow for newer versiosn of the giflib api.
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+
+Upstream: https://github.com/xbmc/xbmc/pull/28016
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../native/TexturePacker/src/decoder/GifHelper.cpp        | 8 ++++----
+ .../depends/native/TexturePacker/src/decoder/GifHelper.h  | 2 +-
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp b/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
+index eb513134b3eb8..b216ecbcef7fa 100644
+--- a/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
++++ b/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
+@@ -52,7 +52,7 @@ GifHelper::~GifHelper()
+ bool GifHelper::Open(GifFileType*& gif, void *dataPtr, InputFunc readFunc)
+ {
+   int err = 0;
+-#if GIFLIB_MAJOR == 5
++#if GIFLIB_MAJOR >= 5
+   gif = DGifOpen(dataPtr, readFunc, &err);
+ #else
+   gif = DGifOpen(dataPtr, readFunc);
+@@ -73,7 +73,7 @@ void GifHelper::Close(GifFileType* gif)
+ {
+   int err = 0;
+   int reason = 0;
+-#if GIFLIB_MAJOR == 5 && GIFLIB_MINOR >= 1
++#if (GIFLIB_MAJOR == 5 && GIFLIB_MINOR >= 1) || GIFLIB_MAJOR >= 6
+   err = DGifCloseFile(gif, &reason);
+ #else
+   err = DGifCloseFile(gif);
+@@ -181,7 +181,7 @@ bool GifHelper::Slurp(GifFileType* gif)
+   if (DGifSlurp(gif) == GIF_ERROR)
+   {
+     int reason = 0;
+-#if GIFLIB_MAJOR == 5
++#if GIFLIB_MAJOR >= 5
+     reason = gif->Error;
+ #else
+     reason = GifLastError();
+@@ -246,7 +246,7 @@ bool GifHelper::GcbToFrame(GifFrame &frame, unsigned int imgIdx)
+ 
+   if (m_gif->ImageCount > 0)
+   {
+-#if GIFLIB_MAJOR == 5
++#if GIFLIB_MAJOR >= 5
+     GraphicsControlBlock gcb;
+     if (DGifSavedExtensionToGCB(m_gif, imgIdx, &gcb))
+     {
+diff --git a/tools/depends/native/TexturePacker/src/decoder/GifHelper.h b/tools/depends/native/TexturePacker/src/decoder/GifHelper.h
+index 6124b69e46296..ce5dca3394b41 100644
+--- a/tools/depends/native/TexturePacker/src/decoder/GifHelper.h
++++ b/tools/depends/native/TexturePacker/src/decoder/GifHelper.h
+@@ -128,7 +128,7 @@ class GifHelper
+   bool PrepareTemplate(GifFrame &frame);
+   void Release();
+ 
+-#if GIFLIB_MAJOR != 5
++#if GIFLIB_MAJOR < 5
+   /*
+   taken from giflib 5.1.0
+   */
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
