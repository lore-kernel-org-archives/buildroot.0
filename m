Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCEBC433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Mar 2022 17:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAFDB60AC1;
	Thu,  3 Mar 2022 17:41:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26Iuw-hAeemZ; Thu,  3 Mar 2022 17:41:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D330560A8D;
	Thu,  3 Mar 2022 17:41:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41C691BF3BC
 for <buildroot@lists.busybox.net>; Thu,  3 Mar 2022 17:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A98541582
 for <buildroot@lists.busybox.net>; Thu,  3 Mar 2022 17:41:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wiMqu5ELuafr for <buildroot@lists.busybox.net>;
 Thu,  3 Mar 2022 17:41:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 075444156F
 for <buildroot@buildroot.org>; Thu,  3 Mar 2022 17:41:25 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout02.t-online.de (Postfix) with SMTP id 7032B16C7
 for <buildroot@buildroot.org>; Thu,  3 Mar 2022 18:41:23 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.199.122]) by fwd72.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nPpS6-4bTVyL0; Thu, 3 Mar 2022 18:41:22 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:32820)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nPpS5-0007us-Tz
 for buildroot@buildroot.org; Thu, 03 Mar 2022 18:41:22 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  3 Mar 2022 18:41:21 +0100
Message-Id: <20220303174121.55867-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1646329282-0000B7AB-BC27A8CC/0/0 CLEAN NORMAL
X-TOI-MSGID: 2ec8392d-15a7-4b32-bb8d-6df7be74c1ef
Subject: [Buildroot] [PATCH/next v3 1/1] package/kodi: bump version to 19.4
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

Add dependencies to giflib, libjpeg and libpng due to
https://github.com/xbmc/xbmc/pull/20462

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: removed remnants from internal patch, sorry for the noise
v2: added dependencies to giflib, libjpeg and libpng

 package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk | 2 +-
 package/kodi-texturepacker/kodi-texturepacker.mk         | 2 +-
 package/kodi/Config.in                                   | 3 +++
 package/kodi/kodi.hash                                   | 2 +-
 package/kodi/kodi.mk                                     | 5 ++++-
 5 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
index 81fc2bb9f1..8cc2297bdb 100644
--- a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
+++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_JSONSCHEMABUILDER_VERSION = 19.3-Matrix
+KODI_JSONSCHEMABUILDER_VERSION = 19.4-Matrix
 KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,$(KODI_JSONSCHEMABUILDER_VERSION))
 KODI_JSONSCHEMABUILDER_SOURCE = kodi-$(KODI_JSONSCHEMABUILDER_VERSION).tar.gz
 KODI_JSONSCHEMABUILDER_DL_SUBDIR = kodi
diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
index 2ebcd7d8de..4733399edc 100644
--- a/package/kodi-texturepacker/kodi-texturepacker.mk
+++ b/package/kodi-texturepacker/kodi-texturepacker.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_TEXTUREPACKER_VERSION = 19.3-Matrix
+KODI_TEXTUREPACKER_VERSION = 19.4-Matrix
 KODI_TEXTUREPACKER_SITE = $(call github,xbmc,xbmc,$(KODI_TEXTUREPACKER_VERSION))
 KODI_TEXTUREPACKER_SOURCE = kodi-$(KODI_TEXTUREPACKER_VERSION).tar.gz
 KODI_TEXTUREPACKER_DL_SUBDIR = kodi
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index f31bf19b99..ebc95343a9 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -72,6 +72,8 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_FONTCONFIG # needed for libass
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_FSTRCMP
+	select BR2_PACKAGE_GIFLIB
+	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBASS
 	select BR2_PACKAGE_LIBCDIO
 	select BR2_PACKAGE_LIBCROSSGUID
@@ -81,6 +83,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBICONV_EXTRA_ENCODINGS if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBPLIST
+	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index 7f96af385a..a17e0fb29f 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  440f47e475dd8a48e0a6d41349e83b74890f3fbe8275d3e401d3c50f5b9ea09b  kodi-19.3-Matrix.tar.gz
+sha256  cc026f59fd6e37ae90f3449df50810f1cefa37da9444e1188302d910518710da  kodi-19.4-Matrix.tar.gz
 sha256  38816f8373e243bc5950449b4f3b18938c4e1c59348e3411e23f31db4072e40d  kodi-libdvdcss-1.4.2-Leia-Beta-5.tar.gz
 sha256  071e414e61b795f2ff9015b21a85fc009dde967f27780d23092643916538a57a  kodi-libdvdnav-6.0.0-Leia-Alpha-3.tar.gz
 sha256  a30b6aa0aad0f2c505bc77948af2d5531a80b6e68112addb4c123fca24d5d3bf  kodi-libdvdread-6.0.0-Leia-Alpha-3.tar.gz
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 56e901fa17..7326cd536d 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update kodi-jsonschemabuilder
 # and kodi-texturepacker
-KODI_VERSION_MAJOR = 19.3
+KODI_VERSION_MAJOR = 19.4
 KODI_VERSION_NAME = Matrix
 KODI_VERSION = $(KODI_VERSION_MAJOR)-$(KODI_VERSION_NAME)
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
@@ -25,6 +25,7 @@ KODI_DEPENDENCIES = \
 	fontconfig \
 	freetype \
 	fstrcmp \
+	giflib \
 	host-flatbuffers \
 	host-gawk \
 	host-gettext \
@@ -34,6 +35,7 @@ KODI_DEPENDENCIES = \
 	host-nasm \
 	host-swig \
 	host-xmlstarlet \
+	jpeg \
 	libass \
 	libcdio \
 	libcrossguid \
@@ -42,6 +44,7 @@ KODI_DEPENDENCIES = \
 	libegl \
 	libfribidi \
 	libplist \
+	libpng \
 	lzo \
 	openssl \
 	pcre \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
