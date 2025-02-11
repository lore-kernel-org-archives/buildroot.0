Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D5FC0219B
	for <buildroot@archiver.kernel.org>; Tue, 11 Feb 2025 17:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 008FD82998;
	Tue, 11 Feb 2025 17:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DWkZ4F1LNd0A; Tue, 11 Feb 2025 17:14:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CACDC82A6C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CACDC82A6C;
	Tue, 11 Feb 2025 17:14:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DFE26C
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 17:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1219360AC6
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 17:14:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O5dcNwCGKrwX for <buildroot@buildroot.org>;
 Tue, 11 Feb 2025 17:14:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0753C606F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0753C606F3
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 17:14:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E48F587539; Tue, 11 Feb 2025 17:13:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 11 Feb 2025 18:05:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a310884588fb629dc7d6d4a80440cadc05d87054
X-Git-Newrev: 915ee667ae7d448b6a5d3145b43404d7ce5faecf
X-Patchwork-Hint: ignore
Message-Id: <20250211171359.E48F587539@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mimic: remove the mimic package
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

commit: https://git.buildroot.net/buildroot/commit/?id=915ee667ae7d448b6a5d3145b43404d7ce5faecf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mimic package hasn't been updated in recent years and
downloading this package is now broken.
This commit removes the mimic package.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  1 -
 Config.in.legacy                                   |  6 ++++
 DEVELOPERS                                         |  1 -
 package/Config.in                                  |  1 -
 .../0001-Fix-linking-on-gcc-10.2.0-or-newer.patch  | 27 --------------
 package/mimic/Config.in                            | 41 ----------------------
 package/mimic/mimic.hash                           |  3 --
 package/mimic/mimic.mk                             | 29 ---------------
 8 files changed, 6 insertions(+), 103 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index ba07cb94f9..ed29682bb7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -821,7 +821,6 @@ package/metacity/0002-gconf.patch lib_patch.Upstream
 package/metacity/0003-mag-add-libm-reference.patch lib_patch.Upstream
 package/mfgtools/0001-lnx_def.h-fix-conflicting-declaration-of-__time64_t.patch lib_patch.Upstream
 package/mii-diag/0001-strchr.patch lib_patch.Sob lib_patch.Upstream
-package/mimic/0001-Fix-linking-on-gcc-10.2.0-or-newer.patch lib_patch.Upstream
 package/mini-snmpd/0001-linux.c-fix-musl-build.patch lib_patch.Upstream
 package/minidlna/S60minidlnad Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/minissdpd/S50minissdpd Shellcheck lib_sysv.Indent lib_sysv.Variables
diff --git a/Config.in.legacy b/Config.in.legacy
index 214d351e4a..c302b73423 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -231,6 +231,12 @@ config BR2_PACKAGE_GST_OMX
 	  The gst-omx module has been removed from Gstreamer in
 	  release 1.24 in favor of Video4Linux-based video encoders.
 
+config BR2_PACKAGE_MIMIC
+	bool "mimic has been removed"
+	select BR2_LEGACY
+	help
+	  The mimic package has been removed from Buildroot.
+
 config BR2_PACKAGE_SDL2_DIRECTFB
 	bool "sdl2 directfb support removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 837fa93f4d..5f98257b86 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -966,7 +966,6 @@ F:	configs/ci20_defconfig
 F:	package/fio/
 F:	package/iptraf-ng/
 F:	package/jimtcl/
-F:	package/mimic/
 F:	package/nodm/
 F:	package/openbox/
 F:	package/supertuxkart/
diff --git a/package/Config.in b/package/Config.in
index 3153fd6afa..dac1fc568d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -31,7 +31,6 @@ menu "Audio and video applications"
 	source "package/kodi/Config.in"
 	source "package/lame/Config.in"
 	source "package/madplay/Config.in"
-	source "package/mimic/Config.in"
 	source "package/minimodem/Config.in"
 	source "package/miraclecast/Config.in"
 	source "package/mjpegtools/Config.in"
diff --git a/package/mimic/0001-Fix-linking-on-gcc-10.2.0-or-newer.patch b/package/mimic/0001-Fix-linking-on-gcc-10.2.0-or-newer.patch
deleted file mode 100644
index ea02bf587e..0000000000
--- a/package/mimic/0001-Fix-linking-on-gcc-10.2.0-or-newer.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 77b36eaeb2c38eba571b8db7e9bb0fd507774e6d Mon Sep 17 00:00:00 2001
-From: Kris Gesling <kris.gesling@mycroft.ai>
-Date: Tue, 11 May 2021 09:15:22 +0930
-Subject: [PATCH] Fix linking on gcc 10.2.0 or newer
-
-Co-authored-by: MichaelSabal <michaelsabal@users.noreply.github.com>
-
-[Retrieved from:
-https://github.com/MycroftAI/mimic1/commit/77b36eaeb2c38eba571b8db7e9bb0fd507774e6d]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lang/cmu_indic_lang/cmu_indic_lang.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lang/cmu_indic_lang/cmu_indic_lang.h b/lang/cmu_indic_lang/cmu_indic_lang.h
-index 75ee46c..83e2afa 100644
---- a/lang/cmu_indic_lang/cmu_indic_lang.h
-+++ b/lang/cmu_indic_lang/cmu_indic_lang.h
-@@ -51,7 +51,7 @@ void cmu_indic_lang_init(cst_voice *v);
- extern const cst_phoneset cmu_indic_phoneset;
- extern const cst_cart cmu_indic_phrasing_cart; 
- 
--const cst_regex * const cst_rx_not_indic;
-+extern const cst_regex * const cst_rx_not_indic;
- 
- #ifdef __cplusplus
- } /* extern "C" */
diff --git a/package/mimic/Config.in b/package/mimic/Config.in
deleted file mode 100644
index 79641d3790..0000000000
--- a/package/mimic/Config.in
+++ /dev/null
@@ -1,41 +0,0 @@
-comment "mimic needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
-
-config BR2_PACKAGE_MIMIC
-	bool "mimic"
-	depends on BR2_USE_WCHAR
-	help
-	  Mimic is a fast, lightweight Text-to-speech engine developed
-	  by Mycroft A.I. and VocaliD, based on Carnegie Mellon
-	  University's Flite (Festival-Lite) software. Mimic takes in
-	  text and reads it out loud to create a high quality voice.
-
-	  https://github.com/MycroftAI/mimic
-
-if BR2_PACKAGE_MIMIC
-
-choice
-	prompt "audio backend"
-	default BR2_PACKAGE_MIMIC_AUDIO_BACKEND_NONE
-
-config BR2_PACKAGE_MIMIC_AUDIO_BACKEND_NONE
-	bool "none"
-	help
-	  With no backend, mimic will only be able to produce .wav
-	  files.
-
-config BR2_PACKAGE_MIMIC_AUDIO_BACKEND_ALSA
-	bool "alsa"
-	depends on BR2_PACKAGE_ALSA_LIB
-
-config BR2_PACKAGE_MIMIC_AUDIO_BACKEND_PORTAUDIO
-	bool "alsa via portaudio"
-	depends on BR2_PACKAGE_PORTAUDIO
-
-config BR2_PACKAGE_MIMIC_AUDIO_BACKEND_PULSEAUDIO
-	bool "pulseaudio"
-	depends on BR2_PACKAGE_PULSEAUDIO
-
-endchoice
-
-endif # BR2_PACKAGE_MIMIC
diff --git a/package/mimic/mimic.hash b/package/mimic/mimic.hash
deleted file mode 100644
index 10780d415d..0000000000
--- a/package/mimic/mimic.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  725003c9972d5b67c49d5ea6a89cb26b63414ff2c7adbbaf9200cf9eb55f80eb  mimic-1.1.0.tar.gz
-sha256  c423c1c6d260091d80ee4c00f386a10fea39963a3f1530f2c245f15dd20324ee  COPYING
diff --git a/package/mimic/mimic.mk b/package/mimic/mimic.mk
deleted file mode 100644
index 2d246561c9..0000000000
--- a/package/mimic/mimic.mk
+++ /dev/null
@@ -1,29 +0,0 @@
-################################################################################
-#
-# mimic
-#
-################################################################################
-
-MIMIC_VERSION = 1.1.0
-MIMIC_SITE = $(call github,MycroftAI,mimic,$(MIMIC_VERSION))
-MIMIC_LICENSE = MIT
-MIMIC_LICENSE_FILES = COPYING
-
-MIMIC_DEPENDENCIES = host-pkgconf
-
-ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_ALSA),y)
-MIMIC_AUDIO_BACKEND = alsa
-MIMIC_DEPENDENCIES += alsa-lib
-else ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_PORTAUDIO),y)
-MIMIC_AUDIO_BACKEND = portaudio
-MIMIC_DEPENDENCIES += portaudio
-else ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_PULSEAUDIO),y)
-MIMIC_AUDIO_BACKEND = pulseaudio
-MIMIC_DEPENDENCIES += pulseaudio
-else ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_NONE),y)
-MIMIC_AUDIO_BACKEND = none
-endif
-
-MIMIC_CONF_OPTS += --with-audio=$(MIMIC_AUDIO_BACKEND)
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
