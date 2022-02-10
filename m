Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205F1C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 19:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C458040156;
	Thu, 10 Feb 2022 19:30:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yqRnjRFvo1py; Thu, 10 Feb 2022 19:30:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 553DB401F2;
	Thu, 10 Feb 2022 19:30:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D0361BF3BB
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 434CF402BC
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WdkHZiO_zhLO for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 19:29:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A69940156
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 19:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644521347;
 bh=ayVo564bTCKc4kiuL7y7GEqEdlZbWVeyHGotBgIS6+A=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=U7LSW2Q4K3x51qCxCb13knB/ZUEqj4UpYDafDFF92sikE8KAo7xc1hnafE1aV3vFj
 zsz7L3aVVAfy1hYX0f+55HSnhdmGv36XWwviwF4U6FO6AQ6eQ361ChUOwgfIks5ePY
 KcEnRd7AgkjT4A1yIs+291gcb42wGcxD5ugZJhwc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.34]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVvPD-1nh9sN3Qjl-00RlxU; Thu, 10
 Feb 2022 20:29:06 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 20:28:56 +0100
Message-Id: <20220210192905.4500-5-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210192905.4500-1-ps.report@gmx.net>
References: <20220210192905.4500-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Gn3MtbhVtCEPKzY2bfImI0fsTBmH1h/OUI+5wfa9LutA5/Q66qt
 MtlCgGwXBwa+E5Sq+v4M2hNlV+lLwZZ03n5kv39MPrWEL6biAf351nngLiRwT6WFrFMBrQU
 bUVbSMI59PIyfHm8BV3EVX0YqYujW0Sdtc9uofkeTJpdl5AGpiV+C2h1BVydvmtHHVM3JE8
 zawMzc4jSsQjwq+FxsexA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4ssiGG1dCJA=:A7NYOlYfRcS/VG4dOp0gN9
 8r7rJU5pOoatROT1LbI91kfG5WqL80345QKdjbABqbW/SeGcm6FJmwqkHaQIn0AkETEP1sY0Y
 E9LR6w/mJikH8+R37WhDEGhT5dERylnkFF/vbLpP3TohF8XDduElL+acW/N7JccSc2/9aU1YB
 CIPQ8xCRk6S8VsUmX3+xr20qV7bT44VqgMNx0eVH8lkCge6hG+idUUC4ogCbs2TVi7louMEd+
 YJ0MdbVjYE6H1dbfLvUj4Z9z1djfPbUzBCtaLEMG7GPPcf3K/EF+JySHV5bGsiyeAxChqqxBL
 erKZ3FR4LxSKx6d/X9rCg3P+GrXTfWo7qw70Z/F8+y5lQZVDfa/EXhh95e04iytUdVlaY9Up/
 VhcGEquEihlbIlswsZrFEIu5xhQDlT1oTfjsPZ8KURj2y9EBcTt/8qOg4nUNsbA3px2Iytm1H
 nFemDvjR/i7tw2hviyTPKmQxJPgPvMo11b1VPGuUGqjvLl+qxIhoE5NSZLMe4l7ntRDPNWm9x
 Giuf9e0VFgMcmdRlb0uzrCziicPrv3tAdFGsSQ0y+/meHTUSVbNxtewqgcKoD3ayWx/C4bkTM
 sJC4pmZLVokjQQ7Z/lEhPiqeo25Kq8rFgX6isEy/wDuTCyNOfjZV2r62bYsF2RQyBHC66/WzT
 YK6kT78hXUOCHkM3JPIt79S7oLwR+bZQUCjlgfVoekbPzHCCL4PWj6QZQ5F+t9QWNKPG5l1b1
 pEtMvZx9SH2Qe3oYK5cwhS6PZIbMc4tu1eYtv4rf5axTS/DU1ltNtEXv2bUbEOWf9XR1u3tgA
 fmve6U47ZIuW4+y8UDGDMx3myH4x+YqG3H+gn7lvTdijKbyyGV02DFl+6Y08ZSRX2nmc6WaeX
 6FFNxpBSpOYRrlG5p+NIj9Edc2JZknomlN+jb4dMIm5uwjrGUiHb4JQbn54FDSKofonPc17z3
 H69dDEZ61RbRroF3JkQy/TBvn+g6B3mZ/hc7k8wFR5TUqXe60FjrVy31sqw9k0mbhwI1hqugd
 7Dla+tuh/rVP+21H9x4hIRbrDCngvd0OpHKracd+hh+esnc+DaVne9vt0gA5zYe+AH8ziXTOX
 JmEbLMzy20+ops=
Subject: [Buildroot] [PATCH v2 04/13] package/gst1-plugins-bad: bump version
 to 1.20.0
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- removed 0001-neon-Allow-building-against-neon-0-32-x.patch
  (from upstream [1])

- add codecalpha option (VP8/VP9 alpha support)

- add qroverlay option (overlay data on top of video in the form of a QR code)
  with json-glib and libqrencode dependencies (omit json-glib explicit
  dependencies as they are the same as for gstreamer1, glib2 BR2_USE_WCHAR,
  BR2_TOOLCHAIN_HAS_THREADS and BR2_USE_MMU), place instead to 'plugins without
  external deps' section into 'plugins that need external deps' section as it
  clearly has dependencies (prelimary to upstream commit [2])

- add aes option (AES encryption/decryption plugin)

- disable new option asio (Steinberg Audio Streaming, windows only)

- disable new option gs (Google Cloud Storage, needs storage_client library)

- disable new option ldac (LDAC bluetooth audio codec, needs ldacBT-enc library)

- remove legacy option ofa (disabled)

- disable new option onnx (ONNX neural network, needs libonnxruntime library)

- disable new option isac (iSAC plugin, needs webrtc-audio-coding-1 library)

- removed libmms ('Microsoft Multi Media Server streaming protocol' option,
  add Config.in.legacy entry

- enable new gpl option ('Allow build plugins that have (A)GPL-licensed
  dependencies') in case gpl plugin enabled

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/b83e85ab677c79b46f520abebd1ee031e3a139c0.patch
[2] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/5d70c168b356691073a0d22f7ce3ea7efb20641c.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - fix rebase/merge artefact in Config.in.legacy (Baruch Siach)
---
 Config.in.legacy                              |  8 +++++
 ...n-Allow-building-against-neon-0-32-x.patch | 29 ---------------
 package/gstreamer1/gst1-plugins-bad/Config.in | 31 ++++++++++------
 .../gst1-plugins-bad/gst1-plugins-bad.hash    |  4 +--
 .../gst1-plugins-bad/gst1-plugins-bad.mk      | 36 ++++++++++++++-----
 5 files changed, 57 insertions(+), 51 deletions(-)
 delete mode 100644 package/gstreamer1/gst1-plugins-bad/0001-neon-Allow-building-against-neon-0-32-x.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index 49c24e61bf..2b1fd48de5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBMMS
+	bool "gst1-plugins-bad plugin libmms was removed"
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_LEGACY
+	help
+	  This plugin was removed with gst1-plugins-bad-1.20.0.
+
 config BR2_PACKAGE_PYTHON_FUNCTOOLS32
 	bool "python-functools32 removed"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/gst1-plugins-bad/0001-neon-Allow-building-against-neon-0-32-x.patch b/package/gstreamer1/gst1-plugins-bad/0001-neon-Allow-building-against-neon-0-32-x.patch
deleted file mode 100644
index e995a8cb91..0000000000
--- a/package/gstreamer1/gst1-plugins-bad/0001-neon-Allow-building-against-neon-0-32-x.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From b83e85ab677c79b46f520abebd1ee031e3a139c0 Mon Sep 17 00:00:00 2001
-From: Heiko Becker <heirecka@exherbo.org>
-Date: Sun, 26 Sep 2021 21:34:30 +0200
-Subject: [PATCH] neon: Allow building against neon 0.32.x
-
-No API/ABI changes: https://github.com/notroj/neon/blob/0.32.0/NEWS#L3
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1267>
-
-[Retrieved from:
-https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/b83e85ab677c79b46f520abebd1ee031e3a139c0]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- subprojects/gst-plugins-bad/ext/neon/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ext/neon/meson.build b/ext/neon/meson.build
-index bf49be9111..abd9763649 100644
---- a/ext/neon/meson.build
-+++ b/ext/neon/meson.build
-@@ -1,4 +1,4 @@
--neon_dep = dependency('neon', version: ['>= 0.27', '<= 0.31.99'],
-+neon_dep = dependency('neon', version: ['>= 0.27', '<= 0.32.99'],
-                       required : get_option('neon'))
- 
- if neon_dep.found()
--- 
-GitLab
-
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index b793cb8eb1..234d57636b 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -76,6 +76,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CAMERABIN2
 	help
 	  Take image snapshots and record movies from camera
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CODECALPHA
+	bool "codecalpha"
+	help
+	  Elements for VP8/VP9 alpha support (codecalphademux,
+	  alphacombine, vp8alphadecodebin, vp9alphadecodebin)
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COLOREFFECTS
 	bool "coloreffects"
 	help
@@ -324,6 +330,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_Y4M
 
 comment "plugins with external dependencies"
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AES
+	bool "aes"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  "AES encryption/decryption plugin"
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASSRENDER
 	bool "assrender"
 	depends on BR2_INSTALL_LIBSTDCPP # libass -> harfbuzz
@@ -458,17 +470,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_KMS
 	help
 	  KMS video sink
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBMMS
-	bool "libmms"
-	depends on BR2_USE_WCHAR # libmms -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libmms -> libglib2
-	select BR2_PACKAGE_LIBMMS
-	help
-	  Microsoft Multi Media Server streaming protocol support
-
-comment "libmms needs a toolchain w/ wchar, threads"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DTLS
 	bool "dtls"
 	select BR2_PACKAGE_OPENSSL
@@ -558,6 +559,14 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPUS
 	help
 	  OPUS plugin library
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_QROVERLAY
+	bool "qroverlay"
+	select BR2_PACKAGE_JSON_GLIB
+	select BR2_PACKAGE_LIBQRENCODE
+	help
+	  Elements qroverlay, debugqroverlay (overlay data on top of
+	  video in the form of a QR code)
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RSVG
 	bool "rsvg"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # librsvg
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index d31a78981e..72c9624b94 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.18.6.tar.xz.sha256sum
-sha256  0b1b50ac6311f0c510248b6cd64d6d3c94369344828baa602db85ded5bc70ec9  gst-plugins-bad-1.18.6.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.20.0.tar.xz.sha256sum
+sha256  015b8d4d9a395ebf444d40876867a2034dd3304b3ad48bc3a0dd0c1ee71dc11d  gst-plugins-bad-1.20.0.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index d02ca1ba74..24fd9dd312 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.18.6
+GST1_PLUGINS_BAD_VERSION = 1.20.0
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
@@ -34,6 +34,7 @@ GST1_PLUGINS_BAD_CONF_OPTS = \
 
 # Options which require currently unpackaged libraries
 GST1_PLUGINS_BAD_CONF_OPTS += \
+	-Dasio=disabled \
 	-Davtp=disabled \
 	-Dopensles=disabled \
 	-Dmsdk=disabled \
@@ -46,16 +47,18 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	-Dresindvd=disabled \
 	-Dfaac=disabled \
 	-Dflite=disabled \
+	-Dgs=disabled \
 	-Dgsm=disabled \
 	-Dkate=disabled \
 	-Dladspa=disabled \
+	-Dldac=disabled \
 	-Dlv2=disabled \
 	-Dmediafoundation=disabled \
 	-Dmicrodns=disabled \
 	-Dlibde265=disabled \
 	-Dmodplug=disabled \
 	-Dmplex=disabled \
-	-Dofa=disabled \
+	-Donnx=disabled \
 	-Dopenexr=disabled \
 	-Dopenni2=disabled \
 	-Dteletext=disabled \
@@ -69,6 +72,7 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	-Dwasapi2=disabled \
 	-Dzxing=disabled \
 	-Dmagicleap=disabled \
+	-Disac=disabled \
 	-Diqa=disabled \
 	-Dopencv=disabled
 
@@ -180,6 +184,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dcamerabin2=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CODECALPHA),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Dcodecalpha=enabled
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Dcodecalpha=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COLOREFFECTS),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dcoloreffects=enabled
 else
@@ -497,6 +507,13 @@ endif
 
 # Plugins with dependencies
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AES),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Daes=enabled
+GST1_PLUGINS_BAD_DEPENDENCIES += openssl
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Daes=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASSRENDER),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dassrender=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += libass
@@ -604,13 +621,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dkms=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBMMS),y)
-GST1_PLUGINS_BAD_CONF_OPTS += -Dlibmms=enabled
-GST1_PLUGINS_BAD_DEPENDENCIES += libmms
-else
-GST1_PLUGINS_BAD_CONF_OPTS += -Dlibmms=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DTLS),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Ddtls=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += openssl
@@ -677,6 +687,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dopus=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_QROVERLAY),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Dqroverlay=enabled
+GST1_PLUGINS_BAD_DEPENDENCIES += json-glib libqrencode
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Dqroverlay=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RSVG),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Drsvg=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += librsvg
@@ -787,6 +804,7 @@ endif
 
 # Add GPL license if GPL licensed plugins enabled.
 ifeq ($(GST1_PLUGINS_BAD_HAS_GPL_LICENSE),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Dgpl=enabled
 GST1_PLUGINS_BAD_LICENSE += , GPL-2.0+
 GST1_PLUGINS_BAD_LICENSE_FILES += COPYING
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
