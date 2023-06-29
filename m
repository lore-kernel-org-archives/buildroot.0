Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C219EB64D9
	for <buildroot@archiver.kernel.org>; Thu, 29 Jun 2023 16:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7B68403BE;
	Thu, 29 Jun 2023 16:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7B68403BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MDS9a3vfVRxX; Thu, 29 Jun 2023 16:59:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF0904014E;
	Thu, 29 Jun 2023 16:59:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF0904014E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 73AD31BF277
 for <buildroot@lists.busybox.net>; Thu, 29 Jun 2023 16:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DA3D4014E
 for <buildroot@lists.busybox.net>; Thu, 29 Jun 2023 16:59:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DA3D4014E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UCOnXtrby_8g for <buildroot@lists.busybox.net>;
 Thu, 29 Jun 2023 16:59:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 867BD400E7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 867BD400E7
 for <buildroot@buildroot.org>; Thu, 29 Jun 2023 16:59:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 964A9A4C00F8
 for <buildroot@buildroot.org>; Thu, 29 Jun 2023 18:59:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47974)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qEuzH-0005IZ-2P
 for buildroot@buildroot.org; Thu, 29 Jun 2023 18:59:19 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 29 Jun 2023 18:59:19 +0200
Message-Id: <20230629165919.1261088-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688057960;
 bh=hQm3QG/C+gtiy16+CPB5XZgoxsXcT7JFKA52yuMDpaQ=;
 h=From:To:Subject:Date:From;
 b=bs2aCF+k636r6SOs2nqUD6OPuIY6gdlAvh7fKTwcJ2xM7BmvdS0bbhAWc1vDumGbb
 1WiRkOOQ+rXDQ8JOohq5lNOn8Ouy/uTVu/fXQ65LVgTVXCL/XPkZ3nY/NdRHG7YFca
 XAlUoNnc0gFBCW0aXz93JIhdXRuG29C5P/Bh2w+8EhDH9lhfSwTWo8y4gQfL4ZasP1
 8qcqmuP2zqq88sZOnViWg+L+Fe9ri6+HhYisn5EYDC8J6V2/BiQahfRd3guxxS9fig
 4BgrFbiKcLolyJ0SmlVxMkPZ353ixpSDx2BPdY/NMbv2KCbUDjvVmRAq8ZgcAFke06
 b9g8Ep1cLiD+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=bs2aCF+k
Subject: [Buildroot] [PATCH 1/1] package/kodi: bump version to 20.2-Nexus
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

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-jsonschemabuilder.mk                 |  2 +-
 .../kodi-texturepacker/kodi-texturepacker.mk  |  2 +-
 ...fer-Remove-forward-declararion-of-Fl.patch | 42 -------------------
 package/kodi/kodi.hash                        |  2 +-
 package/kodi/kodi.mk                          |  2 +-
 5 files changed, 4 insertions(+), 46 deletions(-)
 delete mode 100644 package/kodi/0003-SavestateFlatBuffer-Remove-forward-declararion-of-Fl.patch

diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
index 72a2f05bd6..569bde8cd2 100644
--- a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
+++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_JSONSCHEMABUILDER_VERSION = 20.1-Nexus
+KODI_JSONSCHEMABUILDER_VERSION = 20.2-Nexus
 KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,$(KODI_JSONSCHEMABUILDER_VERSION))
 KODI_JSONSCHEMABUILDER_SOURCE = kodi-$(KODI_JSONSCHEMABUILDER_VERSION).tar.gz
 KODI_JSONSCHEMABUILDER_DL_SUBDIR = kodi
diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
index cb6b04d069..44eba85d75 100644
--- a/package/kodi-texturepacker/kodi-texturepacker.mk
+++ b/package/kodi-texturepacker/kodi-texturepacker.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_TEXTUREPACKER_VERSION = 20.1-Nexus
+KODI_TEXTUREPACKER_VERSION = 20.2-Nexus
 KODI_TEXTUREPACKER_SITE = $(call github,xbmc,xbmc,$(KODI_TEXTUREPACKER_VERSION))
 KODI_TEXTUREPACKER_SOURCE = kodi-$(KODI_TEXTUREPACKER_VERSION).tar.gz
 KODI_TEXTUREPACKER_DL_SUBDIR = kodi
diff --git a/package/kodi/0003-SavestateFlatBuffer-Remove-forward-declararion-of-Fl.patch b/package/kodi/0003-SavestateFlatBuffer-Remove-forward-declararion-of-Fl.patch
deleted file mode 100644
index 87df0e4c9a..0000000000
--- a/package/kodi/0003-SavestateFlatBuffer-Remove-forward-declararion-of-Fl.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 07d8c98a0a65e005b85ef70e06eb1b9bbe7f764c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Markus=20H=C3=A4rer?= <markus.haerer@gmx.net>
-Date: Sun, 28 May 2023 00:49:40 +0200
-Subject: [PATCH] SavestateFlatBuffer: Remove forward declararion of
- FlatBufferBuilder
-
-This caused a compiler error with recent faltbuffers because the type changed:
-
-In file included from xbmc/cores/RetroPlayer/savestates/SavestateDatabase.cpp:12:
-xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h:19:7: error: definition of type 'FlatBufferBuilder' conflicts with type alias of the same name
-class FlatBufferBuilder;
-      ^
-/usr/include/flatbuffers/flatbuffer_builder.h:1414:7: note: 'FlatBufferBuilder' declared here
-using FlatBufferBuilder = FlatBufferBuilderImpl<false>;
-      ^
-1 error generated.
-
-(cherry picked from commit 351184d7e4e3edc447d04a297769eb41a477ba68)
-
-Upstream: https://github.com/xbmc/xbmc/commit/07d8c98a0a65e005b85ef70e06eb1b9bbe7f764c
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h b/xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h
-index cb93e6bbc2e12..fa42a9bad7034 100644
---- a/xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h
-+++ b/xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h
-@@ -14,11 +14,6 @@
- 
- #include <flatbuffers/flatbuffers.h>
- 
--namespace flatbuffers
--{
--class FlatBufferBuilder;
--}
--
- namespace KODI
- {
- namespace RETRO
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index ea9a588aeb..37fbf0c004 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  cd4158b2bc2d9593ad2f5c1cd2494957ab726b13d8379bbfb09d7d36df7b7d7e  kodi-20.1-Nexus.tar.gz
+sha256  4e81abf81172812bc8891f69a7a80a2b846298cecaae7b5009725e28a3040c23  kodi-20.2-Nexus.tar.gz
 sha256  f38c4a4e7a4f4da6d8e83b8852489aa3bb6588a915dc41f5ee89d9aad305a06e  kodi-libdvdcss-1.4.3-Next-Nexus-Alpha2-2.tar.gz
 sha256  584f62a3896794408d46368e2ecf2c6217ab9c676ce85921b2d68b8961f49dfc  kodi-libdvdnav-6.1.1-Next-Nexus-Alpha2-2.tar.gz
 sha256  719130091e3adc9725ba72df808f24a14737a009dca5a4c38c601c0c76449b62  kodi-libdvdread-6.1.3-Next-Nexus-Alpha2-2.tar.gz
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 70ed270555..7cbc1df40a 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update kodi-jsonschemabuilder
 # and kodi-texturepacker
-KODI_VERSION_MAJOR = 20.1
+KODI_VERSION_MAJOR = 20.2
 KODI_VERSION_NAME = Nexus
 KODI_VERSION = $(KODI_VERSION_MAJOR)-$(KODI_VERSION_NAME)
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
