Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74040C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30DD260B6B;
	Tue, 15 Mar 2022 21:23:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U97SrewAXMfi; Tue, 15 Mar 2022 21:23:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 340C560AB1;
	Tue, 15 Mar 2022 21:23:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E6A401BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B71C760B83
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:21:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CLHQHgQkvyJB for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:21:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDC7960BA4
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:21:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 04EE48408A; Tue, 15 Mar 2022 21:12:23 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 22:10:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9c7e517e4b2e17d4a244da9268b4b0071bddc4a
X-Git-Newrev: 4a0fb798be7432fb88047eb3a7d6a0915879b7ba
X-Patchwork-Hint: ignore
Message-Id: <20220315211223.04EE48408A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: bump version to 19.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a0fb798be7432fb88047eb3a7d6a0915879b7ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add dependencies to giflib, libjpeg and libpng due to
https://github.com/xbmc/xbmc/pull/20462

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
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
index 6896e85e7b..c8e1e5d0ed 100644
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
index 58ad115475..c41c515d10 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
