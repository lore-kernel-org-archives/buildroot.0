Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E99C61DBD
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1E7681123;
	Fri, 28 Aug 2026 14:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MDt-odl7sNhR; Fri, 28 Aug 2026 14:43:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787928191;
	bh=rmLp+SRETkXIS/LeXw6LCiemgcjV3ZxVsFAhAo1+x18=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mM+xB1/hz4Af93HIm8sSJoZCg101pe3/qUQDrO/QVfAv8bPKGleBLv7dH5Zn2Wsho
	 aBxbDEMy+LqPvfZD0Mq/2HiruOx52EReTIs/Bo8bQOpDPRrPkpY8vLbnnakl2iTC/g
	 ZDq+W7KQftjcUXFWs/RbDRF3lznQASEvGNb86ANtqjGDpWsVgl2O/i7EeIo6PsJG7x
	 pQQSEcmyZfCL76ofkcsxLqLfMMbDbGJihNtCSg0BUkvPvwQewye9iWww8lDk6ksCmE
	 Im259/u8ZhLwajCl2eR002+sjXds+2Ac45/R0Da2mR9WNo10mcvZilOku0qvmk/8MZ
	 Q2FLFNrhGAARw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF2C181126;
	Fri, 28 Aug 2026 14:43:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BFDC1127
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD3CC407A2
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K6Iw0EABhs5M for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:43:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A1FD40762
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:43:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07907921FC; Fri, 28 Aug 2026 14:42:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 16:40:17 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 458f2bf01bdd574f32bfed9510d323d4be20bbc1
X-Git-Newrev: 3cb30131935c04ce6a8238dc5a9e95d977f8546f
X-Patchwork-Hint: ignore
Message-Id: <20260828144212.07907921FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] Revert
 "package/fluidsynth: security bump to version 2.5.7"
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3cb30131935c04ce6a8238dc5a9e95d977f8546f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

This reverts commit a40212568cb602b949992aae4a079b36633781dc.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Config.in.legacy                   |  6 ------
 package/fluidsynth/Config.in       | 21 ++++++++-------------
 package/fluidsynth/fluidsynth.hash |  4 ++--
 package/fluidsynth/fluidsynth.mk   | 16 +++++-----------
 4 files changed, 15 insertions(+), 32 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7b2d448aba..affd1cf8c0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,12 +146,6 @@ endif
 
 comment "Legacy options removed in 2026.05.2"
 
-config BR2_PACKAGE_FLUIDSYNTH_SDL2
-	bool "fluidsynth sdl2 audio support removed"
-	select BR2_LEGACY
-	help
-	  FluidSynth SDL2 audio support was removed in v2.5.0.
-
 config BR2_PACKAGE_HOSTAPD_DRIVER_HOSTAP
 	bool "hostapd hostap driver removed"
 	select BR2_LEGACY
diff --git a/package/fluidsynth/Config.in b/package/fluidsynth/Config.in
index 206824560b..66fb07f45e 100644
--- a/package/fluidsynth/Config.in
+++ b/package/fluidsynth/Config.in
@@ -84,11 +84,15 @@ comment "pulseaudio support needs a toolchain w/ dynamic library, wchar, threads
 	depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC
 	depends on BR2_STATIC_LIBS || !BR2_USE_MMU || !BR2_TOOLCHAIN_HAS_THREADS
 
-config BR2_PACKAGE_FLUIDSYNTH_SDL3
-	bool "sdl3"
-	select BR2_PACKAGE_SDL3
+config BR2_PACKAGE_FLUIDSYNTH_SDL2
+	bool "sdl2"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_SDL2
 	help
-	  Enable SDL3 audio support.
+	  Enable SDL2 audio support.
+
+comment "SDL2 audio support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
 
 comment "Misc options"
 
@@ -110,15 +114,6 @@ config BR2_PACKAGE_FLUIDSYNTH_FLOATS
 	  Enable 32-bit single precision float support, instead of
 	  64-bit double precision floats for DSP samples.
 
-config BR2_PACKAGE_FLUIDSYNTH_NATIVE_DLS
-	bool "Native DLS soundfont"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
-	help
-	  Enable the native DLS soundfont format support.
-
-comment "native dls soundfont support needs gcc >= 7"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
-
 config BR2_PACKAGE_FLUIDSYNTH_READLINE
 	bool "readline"
 	select BR2_PACKAGE_READLINE
diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index 0d727e75e6..9953997692 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ce27840221ab00dd59bf27e85ecbba480c6c2a7c9fbec4243658f68f59c07f4a  fluidsynth-2.5.7.tar.gz
-sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  LICENSE
+sha256  7fb0e328c66a24161049e2b9e27c3b6e51a6904b31b1a647f73cc1f322523e88  fluidsynth-2.4.7.tar.gz
+sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index 1d6cb118ff..e06afe4a07 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.5.7
+FLUIDSYNTH_VERSION = 2.4.7
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
@@ -46,12 +46,6 @@ else
 FLUIDSYNTH_CONF_OPTS += -Denable-libsndfile=0
 endif
 
-ifeq ($(BR2_PACKAGE_FLUIDSYNTH_NATIVE_DLS),y)
-FLUIDSYNTH_CONF_OPTS += -Denable-native-dls=1
-else
-FLUIDSYNTH_CONF_OPTS += -Denable-native-dls=0
-endif
-
 ifeq ($(BR2_PACKAGE_FLUIDSYNTH_PORTAUDIO),y)
 FLUIDSYNTH_CONF_OPTS += -Denable-portaudio=1
 FLUIDSYNTH_DEPENDENCIES += portaudio
@@ -73,11 +67,11 @@ else
 FLUIDSYNTH_CONF_OPTS += -Denable-readline=0
 endif
 
-ifeq ($(BR2_PACKAGE_FLUIDSYNTH_SDL3),y)
-FLUIDSYNTH_CONF_OPTS += -Denable-sdl3=1
-FLUIDSYNTH_DEPENDENCIES += sdl3
+ifeq ($(BR2_PACKAGE_FLUIDSYNTH_SDL2),y)
+FLUIDSYNTH_CONF_OPTS += -Denable-sdl2=1
+FLUIDSYNTH_DEPENDENCIES += sdl2
 else
-FLUIDSYNTH_CONF_OPTS += -Denable-sdl3=0
+FLUIDSYNTH_CONF_OPTS += -Denable-sdl2=0
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
