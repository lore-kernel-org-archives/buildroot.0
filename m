Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD00C5DF8C
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 19:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3B2E606ED;
	Sun, 23 Aug 2026 19:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JjSIyCRo5KIa; Sun, 23 Aug 2026 19:42:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787514154;
	bh=IcSNBZI149kxOPuUlD3PhmkmHoaJFVG3BrqcJgK+yHc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sAd9cb5ctL2jzAT5rwR15EPXlbSgsoblgiEejAIsL0ITQPwV3yBj1HKkQUWYZzRQ2
	 f5sUYtmq1Tujra8ImLAZS5ZvsbFLfmi6KZb9cPv0LGtvNisxbl3o//wV/YgfP7xltO
	 /7mqogvGWHkoWD/HXTMBgSSrmre3ExzUAHE9eLEZfGPETDyQmsbG6Hg3HgkHL2LDhN
	 Oqz3aAAngSgkc6iGQT4e7LWcJ4TmVaqofgSdY6JIpbcH0S8WHwc3Jjet/uWe43RkSI
	 LX6oXedoOoAFR1rq1LDoi+6a6T7yUAjQm7+26uFgFTkdwUPFowtwNcV2A72JN8lH1D
	 eiPLbPn8clHOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D4A460622;
	Sun, 23 Aug 2026 19:42:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 18F59336
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2F3940433
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id joXtZxAS0oAk for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 19:42:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 460ED40412
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:42:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83FA98EE98; Sun, 23 Aug 2026 19:41:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Aug 2026 21:29:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88351e5f9ba3508a99e858ee3bd117c8420b385c
X-Git-Newrev: 566bdcb97f5706aa08f40a88e4728e4a0bed8257
X-Patchwork-Hint: ignore
Message-Id: <20260823194135.83FA98EE98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluidsynth: security bump to
 version 2.5.7
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/566bdcb97f5706aa08f40a88e4728e4a0bed8257
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log since v2.4.7, see:
https://github.com/FluidSynth/fluidsynth/releases

According to:
https://github.com/FluidSynth/fluidsynth/blob/master/doc/wiki/ChangeLog.md

FluidSynth 2.5.6 fixes:
CVE-2026-58264 - a heap-based buffer overrun in command handler (GHSA-mqmq-w63q-cj94)
CVE-2026-61714 - a heap-based buffer overflow in MIDI player (GHSA-976m-35rw-h3m6)
CVE-2026-61721 - a heap-based buffer overrun for DLS samples (GHSA-59ph-rx8r-8p4j)
CVE-2026-61723 - a DLS ptbl chunk integer overflow (GHSA-r4mc-v3p8-pv47)
CVE-2026-61722 - a DLS articulation chunk integer overflow (GHSA-hp72-35pr-6h6r)
CVE-2026-61720 - a SF2 DMOD chunk integer underflow (GHSA-rmc4-c8hw-455w)

FluidSynth 2.5.2 fixes:
CVE-2025-68617 - a heap-based use-after-free involving DLS files (GHSA-ffw2-xvvp-39ch)

SDL2 audio support was removed upstream in commit:
https://github.com/FluidSynth/fluidsynth/commit/89145b004a44a53e734b6bf82a73cef255baef5d

It was replaced by the newer SDL3. This commit reflects that change
(update option name and comments, add legacy option entry).

Also, dynamic library dependency was added in Buildroot commit:
https://gitlab.com/buildroot.org/buildroot/-/commit/111a1c7091aed6f9da03c2a095bcc2f50a1ad32c
This commot removes the duplicate dependency for SDL3.

FluidSynth also added a native DLS soundfont support in:
https://github.com/FluidSynth/fluidsynth/commit/c959f8d208bbad9e396dfb745285806b5a4c5a07
It is enabled by default and uses C++17. This commit adds a new
option with a dependency on gcc >= 7.

The license option hash is also updated, after the FSF address
update in:
https://github.com/FluidSynth/fluidsynth/commit/db42fa333baf1cb7c60556ab75ad1e592c850f68

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                   |  6 ++++++
 package/fluidsynth/Config.in       | 21 +++++++++++++--------
 package/fluidsynth/fluidsynth.hash |  4 ++--
 package/fluidsynth/fluidsynth.mk   | 16 +++++++++++-----
 4 files changed, 32 insertions(+), 15 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d0d487f010..aeb9b9676e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.08"
 
+config BR2_PACKAGE_FLUIDSYNTH_SDL2
+	bool "fluidsynth sdl2 audio support removed"
+	select BR2_LEGACY
+	help
+	  FluidSynth SDL2 audio support was removed in v2.5.0.
+
 config BR2_PACKAGE_HOSTAPD_DRIVER_HOSTAP
 	bool "hostapd hostap driver removed"
 	select BR2_LEGACY
diff --git a/package/fluidsynth/Config.in b/package/fluidsynth/Config.in
index 66fb07f45e..206824560b 100644
--- a/package/fluidsynth/Config.in
+++ b/package/fluidsynth/Config.in
@@ -84,15 +84,11 @@ comment "pulseaudio support needs a toolchain w/ dynamic library, wchar, threads
 	depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC
 	depends on BR2_STATIC_LIBS || !BR2_USE_MMU || !BR2_TOOLCHAIN_HAS_THREADS
 
-config BR2_PACKAGE_FLUIDSYNTH_SDL2
-	bool "sdl2"
-	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_SDL2
+config BR2_PACKAGE_FLUIDSYNTH_SDL3
+	bool "sdl3"
+	select BR2_PACKAGE_SDL3
 	help
-	  Enable SDL2 audio support.
-
-comment "SDL2 audio support needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+	  Enable SDL3 audio support.
 
 comment "Misc options"
 
@@ -114,6 +110,15 @@ config BR2_PACKAGE_FLUIDSYNTH_FLOATS
 	  Enable 32-bit single precision float support, instead of
 	  64-bit double precision floats for DSP samples.
 
+config BR2_PACKAGE_FLUIDSYNTH_NATIVE_DLS
+	bool "Native DLS soundfont"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	help
+	  Enable the native DLS soundfont format support.
+
+comment "native dls soundfont support needs gcc >= 7"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
+
 config BR2_PACKAGE_FLUIDSYNTH_READLINE
 	bool "readline"
 	select BR2_PACKAGE_READLINE
diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index 9953997692..0d727e75e6 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7fb0e328c66a24161049e2b9e27c3b6e51a6904b31b1a647f73cc1f322523e88  fluidsynth-2.4.7.tar.gz
-sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
+sha256  ce27840221ab00dd59bf27e85ecbba480c6c2a7c9fbec4243658f68f59c07f4a  fluidsynth-2.5.7.tar.gz
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index e06afe4a07..1d6cb118ff 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.4.7
+FLUIDSYNTH_VERSION = 2.5.7
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
@@ -46,6 +46,12 @@ else
 FLUIDSYNTH_CONF_OPTS += -Denable-libsndfile=0
 endif
 
+ifeq ($(BR2_PACKAGE_FLUIDSYNTH_NATIVE_DLS),y)
+FLUIDSYNTH_CONF_OPTS += -Denable-native-dls=1
+else
+FLUIDSYNTH_CONF_OPTS += -Denable-native-dls=0
+endif
+
 ifeq ($(BR2_PACKAGE_FLUIDSYNTH_PORTAUDIO),y)
 FLUIDSYNTH_CONF_OPTS += -Denable-portaudio=1
 FLUIDSYNTH_DEPENDENCIES += portaudio
@@ -67,11 +73,11 @@ else
 FLUIDSYNTH_CONF_OPTS += -Denable-readline=0
 endif
 
-ifeq ($(BR2_PACKAGE_FLUIDSYNTH_SDL2),y)
-FLUIDSYNTH_CONF_OPTS += -Denable-sdl2=1
-FLUIDSYNTH_DEPENDENCIES += sdl2
+ifeq ($(BR2_PACKAGE_FLUIDSYNTH_SDL3),y)
+FLUIDSYNTH_CONF_OPTS += -Denable-sdl3=1
+FLUIDSYNTH_DEPENDENCIES += sdl3
 else
-FLUIDSYNTH_CONF_OPTS += -Denable-sdl2=0
+FLUIDSYNTH_CONF_OPTS += -Denable-sdl3=0
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
