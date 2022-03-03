Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924B6C433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Mar 2022 17:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 101A960A9E;
	Thu,  3 Mar 2022 17:38:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yi8RCq98G2YI; Thu,  3 Mar 2022 17:38:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28B1960A74;
	Thu,  3 Mar 2022 17:38:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B513A1BF3BC
 for <buildroot@lists.busybox.net>; Thu,  3 Mar 2022 17:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3A3560A74
 for <buildroot@lists.busybox.net>; Thu,  3 Mar 2022 17:38:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aroFd2MhdIIo for <buildroot@lists.busybox.net>;
 Thu,  3 Mar 2022 17:38:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CEA0608B7
 for <buildroot@buildroot.org>; Thu,  3 Mar 2022 17:38:37 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout05.t-online.de (Postfix) with SMTP id DB6B9EB7C
 for <buildroot@buildroot.org>; Thu,  3 Mar 2022 18:38:34 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.199.122]) by fwd81.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nPpPO-3WrpTt0; Thu, 3 Mar 2022 18:38:34 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:32818)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nPpPN-0007RS-Ub
 for buildroot@buildroot.org; Thu, 03 Mar 2022 18:38:34 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  3 Mar 2022 18:38:33 +0100
Message-Id: <20220303173833.54609-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1646329114-0000BD0E-9B47DB6B/0/0 CLEAN NORMAL
X-TOI-MSGID: 29858fc1-fd69-432e-9b33-9ec7ce6560f6
Subject: [Buildroot] [PATCH/next v2 1/1] package/kodi: bump version to 19.4
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
v2: added dependencies to giflib, libjpeg and libpng

 package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk | 2 +-
 package/kodi-texturepacker/kodi-texturepacker.mk         | 2 +-
 package/kodi/Config.in                                   | 3 +++
 package/kodi/kodi.hash                                   | 2 +-
 package/kodi/kodi.mk                                     | 7 +++++--
 5 files changed, 11 insertions(+), 5 deletions(-)

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
index 56e901fa17..f4c5bfc685 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -6,9 +6,9 @@
 
 # When updating the version, please also update kodi-jsonschemabuilder
 # and kodi-texturepacker
-KODI_VERSION_MAJOR = 19.3
+KODI_VERSION_MAJOR = 19.4
 KODI_VERSION_NAME = Matrix
-KODI_VERSION = $(KODI_VERSION_MAJOR)-$(KODI_VERSION_NAME)
+KODI_VERSION = 6586a6c535b72896e00733f25fde93980d5f0cca
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
 KODI_LICENSE = GPL-2.0
 KODI_LICENSE_FILES = LICENSE.md
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
