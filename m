Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5E9E95A6C
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 11:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D974960B52;
	Tue, 30 Dec 2025 11:14:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IAzNkRncOSVv; Tue, 30 Dec 2025 11:14:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FDFA60B89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767093297;
	bh=0++jzxWAkHPHj21JPJfF59j/LtXyJWGwxnrLTEiAmcI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IzOd+qg9KpGaG6SlIzrPoTpNYaviCcH3qIK3TR6TbpP27yYySnwwZ05A10ZZr4Bbt
	 y5b2bs8EB3c6KFLuM4PqpW4/rINpI6hYftjOWQ+xDfyrLSa07owBGGWynGUnIoOrwY
	 GRvKU5vGmGSr4uD+BmDSHNLCUIn5+5EoBbfFw1xT3oiliWvmD8ksV2aSB7Eem9I2ep
	 6J1xbdY7rChQJhzOotFPPJNBJhbSQZhuFk1u+smNKVuIHdm3Yqb8tyGWZtl8FxfK4E
	 8gCHzy3RDkKov/SisWPvoXP+OQQTii69SEF6gOPkgNkxZun/J9sGDOb7QU6i1jbonf
	 kdL4kyE9/0+DQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FDFA60B89;
	Tue, 30 Dec 2025 11:14:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2545135B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12925809A7
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:14:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_5dd3gug5HD for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 11:14:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D95780AF3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D95780AF3
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:14:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C7A786324; Tue, 30 Dec 2025 11:14:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 12:01:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 554ba0d95edeb0d181c4dd0c43962160f065f3c1
X-Git-Newrev: b0980aaea0461db01027dc173060bd9dd20110c4
X-Patchwork-Hint: ignore
Message-Id: <20251230111445.2C7A786324@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alure: remove package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b0980aaea0461db01027dc173060bd9dd20110c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Analysis of https://github.com/kcat/alure:
last commit: Feb 2020
last bug report: Oct 2020
last pull request: 0 open

The package is broken with cmake 4 and no other package depends on it.

The upstream site kcat.strangesoft.net has no DNS record anymore, the
main site strangesoft.net serves content unrelated to alure.

Although the cmake error is easy to fix we remove this unsupported
package instead.

Fixes:
https://autobuild.buildroot.net/results/d5a/d5a275f2d282c9dd2e3053667c79be11d48e918d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy         |  6 +++++
 DEVELOPERS               |  1 -
 package/Config.in        |  1 -
 package/alure/Config.in  | 56 -----------------------------------------
 package/alure/alure.hash |  3 ---
 package/alure/alure.mk   | 65 ------------------------------------------------
 6 files changed, 6 insertions(+), 126 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7ff34b6801..4e27af0f00 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_ALURE
+	bool "alure has been removed"
+	select BR2_LEGACY
+	help
+	  alure is unmaintained and has been removed
+
 config BR2_PACKAGE_LIBUWSC
 	bool "libuwsc has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index ab68fd2b2c..df13cc37d0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2906,7 +2906,6 @@ F:	configs/qemu_*
 F:	configs/am574x_idk_defconfig
 F:	configs/beagleboneai64_defconfig
 F:	configs/beagley_ai_defconfig
-F:	package/alure/
 F:	package/aubio/
 F:	package/bcc/
 F:	package/binutils/
diff --git a/package/Config.in b/package/Config.in
index bef6ae7b22..7a7f80f37b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1536,7 +1536,6 @@ menu "Libraries"
 menu "Audio/Sound"
 	source "package/alsa-lib/Config.in"
 	source "package/alsa-plugins/Config.in"
-	source "package/alure/Config.in"
 	source "package/aubio/Config.in"
 	source "package/bcg729/Config.in"
 	source "package/caps/Config.in"
diff --git a/package/alure/Config.in b/package/alure/Config.in
deleted file mode 100644
index c831bba913..0000000000
--- a/package/alure/Config.in
+++ /dev/null
@@ -1,56 +0,0 @@
-config BR2_PACKAGE_ALURE
-	bool "alure"
-	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # openal
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
-	depends on BR2_USE_WCHAR # use wchar_t
-	select BR2_PACKAGE_OPENAL
-	help
-	  Alure is a C++ 3D audio API. It uses OpenAL for audio
-	  rendering, and provides common higher-level features such as
-	  file loading and decoding, buffer caching, background
-	  streaming, and source management for virtually unlimited
-	  sound source handles.
-
-	  https://kcat.strangesoft.net/alure.html
-
-if BR2_PACKAGE_ALURE
-
-config BR2_PACKAGE_ALURE_FLAC_DECODER
-	bool "flac decoder"
-	help
-	  Enables the built-in FLAC decoder.
-
-config BR2_PACKAGE_ALURE_MINIMP3_DECODER
-	bool "minimp3 decoder"
-	help
-	  Enables the built-in minimp3 decoder.
-
-config BR2_PACKAGE_ALURE_OPUS_DECODER
-	bool "opus decoder"
-	select BR2_PACKAGE_LIBOGG
-	select BR2_PACKAGE_OPUS
-	help
-	  Enables the built-in libopusfile decoder.
-
-config BR2_PACKAGE_ALURE_SNDFILE_DECODER
-	bool "sndfile decoder"
-	select BR2_PACKAGE_LIBSNDFILE
-	help
-	  Enables the built-in libsndfile decoder.
-
-config BR2_PACKAGE_ALURE_VORBIS_DECODER
-	bool "vorbis decoder"
-	select BR2_PACKAGE_LIBOGG
-	select BR2_PACKAGE_LIBVORBIS
-	help
-	  Enables the built-in libvorbis decoder.
-
-endif
-
-comment "alure needs a toolchain w/ C++, gcc >= 9, NPTL, wchar"
-	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_9 \
-		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
diff --git a/package/alure/alure.hash b/package/alure/alure.hash
deleted file mode 100644
index 0d4c36c4ae..0000000000
--- a/package/alure/alure.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  9b808e5b5a54d156348221dc86704c7831115047d5238691e6088f8c4814b2ca  alure-14beed2a86d5a36030e907b21c46614d505f07cd.tar.gz
-sha256  7331ddc67daaf1a283c81e8dc17bac8dc40f54ed3fab3d3964616f4bd502a0a3  LICENSE
diff --git a/package/alure/alure.mk b/package/alure/alure.mk
deleted file mode 100644
index fe27bfd12b..0000000000
--- a/package/alure/alure.mk
+++ /dev/null
@@ -1,65 +0,0 @@
-################################################################################
-#
-# alure
-#
-################################################################################
-
-ALURE_VERSION = 14beed2a86d5a36030e907b21c46614d505f07cd
-ALURE_SITE = $(call github,kcat,alure,$(ALURE_VERSION))
-ALURE_LICENSE = Zlib, Public Domain (src/decoders/dr_flac.h)
-ALURE_LICENSE_FILES = LICENSE
-ALURE_INSTALL_STAGING = YES
-
-ALURE_DEPENDENCIES = openal
-
-# Disabling alure examples removes the dependencies on physfs and dump
-# libraries. Enable at least one built-in decoder (wave).
-ALURE_CONF_OPTS = -DALURE_INSTALL=ON \
-	-DALURE_BUILD_EXAMPLES=OFF \
-	-DALURE_ENABLE_WAVE=ON
-
-ifeq ($(BR2_PACKAGE_ALURE_FLAC_DECODER),y)
-ALURE_CONF_OPTS += -DALURE_ENABLE_FLAC=ON
-else
-ALURE_CONF_OPTS += -DALURE_ENABLE_FLAC=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_ALURE_MINIMP3_DECODER),y)
-ALURE_CONF_OPTS += -DALURE_ENABLE_MINIMP3=ON
-else
-ALURE_CONF_OPTS += -DALURE_ENABLE_MINIMP3=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_ALURE_OPUS_DECODER),y)
-ALURE_CONF_OPTS += -DALURE_ENABLE_OPUS=ON
-ALURE_DEPENDENCIES += libogg opus
-else
-ALURE_CONF_OPTS += -DALURE_ENABLE_OPUS=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_ALURE_SNDFILE_DECODER),y)
-ALURE_CONF_OPTS += -DALURE_ENABLE_SNDFILE=ON
-ALURE_DEPENDENCIES += libsndfile
-else
-ALURE_CONF_OPTS += -DALURE_ENABLE_SNDFILE=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_ALURE_VORBIS_DECODER),y)
-ALURE_CONF_OPTS += -DALURE_ENABLE_VORBIS=ON
-ALURE_DEPENDENCIES += libogg libvorbis
-else
-ALURE_CONF_OPTS += -DALURE_ENABLE_VORBIS=OFF
-endif
-
-ifeq ($(BR2_STATIC_LIBS),y)
-ALURE_CONF_OPTS += -DALURE_BUILD_SHARED=OFF \
-	-DALURE_BUILD_STATIC=ON
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-ALURE_CONF_OPTS += -DALURE_BUILD_SHARED=ON \
-	-DALURE_BUILD_STATIC=ON
-else
-ALURE_CONF_OPTS += -DALURE_BUILD_SHARED=ON \
-	-DALURE_BUILD_STATIC=OFF
-endif
-
-$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
