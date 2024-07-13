Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE22C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A848740725;
	Sat, 13 Jul 2024 14:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6I9IfZg-zNpw; Sat, 13 Jul 2024 14:39:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B976406C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B976406C9;
	Sat, 13 Jul 2024 14:39:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E91A1BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0891680CB3
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gg8aBUKLwfrv for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:39:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E63980C75
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E63980C75
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:39:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1F1A864C7; Sat, 13 Jul 2024 14:39:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 16:38:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d40b0c9403346ba63dfbd22a518ce50fcd22d34d
X-Git-Newrev: c5896d00d975c52176536c0704a9aacfbdc687f6
X-Patchwork-Hint: ignore
Message-Id: <20240713143919.C1F1A864C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenmpt: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c5896d00d975c52176536c0704a9aacfbdc687f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libopenmpt is a cross-platform C++ and C library to decode
tracked music files (modules) into a raw PCM audio stream.

openmpt123 is a cross-platform command-line or terminal
based module file player.

https://lib.openmpt.org/libopenmpt

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/libopenmpt/Config.in       | 28 ++++++++++++
 package/libopenmpt/libopenmpt.hash |  3 ++
 package/libopenmpt/libopenmpt.mk   | 92 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 125 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b841334757..5974ba4bc5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1770,6 +1770,7 @@ F:	package/gnupg2/
 F:	package/highway/
 F:	package/kexec/
 F:	package/libjxl/
+F:	package/libopenmpt/
 F:	package/mokutil/
 F:	package/octave/
 F:	package/ola/
diff --git a/package/Config.in b/package/Config.in
index 65d7981773..980ffaaa72 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1496,6 +1496,7 @@ menu "Audio/Sound"
 	source "package/libmad/Config.in"
 	source "package/libmodplug/Config.in"
 	source "package/libmpdclient/Config.in"
+	source "package/libopenmpt/Config.in"
 	source "package/libreplaygain/Config.in"
 	source "package/libsamplerate/Config.in"
 	source "package/libsidplay2/Config.in"
diff --git a/package/libopenmpt/Config.in b/package/libopenmpt/Config.in
new file mode 100644
index 0000000000..43a5802954
--- /dev/null
+++ b/package/libopenmpt/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_LIBOPENMPT
+	bool "libopenmpt"
+	# See: https://lib.openmpt.org/doc/dependencies.html
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  libopenmpt is a cross-platform C++ and C library to decode
+	  tracked music files (modules) into a raw PCM audio stream.
+
+	  openmpt123 is a cross-platform command-line or terminal
+	  based module file player.
+
+	  https://lib.openmpt.org/libopenmpt
+
+if BR2_PACKAGE_LIBOPENMPT
+
+config BR2_PACKAGE_LIBOPENMPT_OPENMPT123
+	bool "openmpt123"
+	help
+	  Install the openmpt123 command line tool.
+
+endif
+
+comment "libopenmpt needs a toolchain w/ threads, C++, gcc >= 7"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libopenmpt/libopenmpt.hash b/package/libopenmpt/libopenmpt.hash
new file mode 100644
index 0000000000..df0b43096a
--- /dev/null
+++ b/package/libopenmpt/libopenmpt.hash
@@ -0,0 +1,3 @@
+# computed locally
+sha256  87778c8046a226c6cbfb114f4c8e3e27c121b7b3dccce5cb7de45899250274cc  libopenmpt-0.7.8+release.autotools.tar.gz
+sha256  e3d7e76c6b441ddd9fff0a397e7b5e055a11678bd7c3b246a0ce13e352eb15e8  LICENSE
diff --git a/package/libopenmpt/libopenmpt.mk b/package/libopenmpt/libopenmpt.mk
new file mode 100644
index 0000000000..d07dc1c2fc
--- /dev/null
+++ b/package/libopenmpt/libopenmpt.mk
@@ -0,0 +1,92 @@
+################################################################################
+#
+# libopenmpt
+#
+################################################################################
+
+LIBOPENMPT_VERSION = 0.7.8
+LIBOPENMPT_SITE = https://lib.openmpt.org/files/libopenmpt/src
+LIBOPENMPT_SOURCE = libopenmpt-$(LIBOPENMPT_VERSION)+release.autotools.tar.gz
+LIBOPENMPT_LICENSE = BSD-3-Clause
+LIBOPENMPT_LICENSE_FILES = LICENSE
+LIBOPENMPT_DEPENDENCIES = host-pkgconf
+
+ifeq ($(BR2_PACKAGE_LIBOPENMPT_OPENMPT123),y)
+LIBOPENMPT_CONF_OPTS += --enable-openmpt123
+else
+LIBOPENMPT_CONF_OPTS += --disable-openmpt123
+endif
+
+ifeq ($(BR2_PACKAGE_FLAC),y)
+LIBOPENMPT_CONF_OPTS += --with-flac
+LIBOPENMPT_DEPENDENCIES += flac
+else
+LIBOPENMPT_CONF_OPTS += --without-flac
+endif
+
+ifeq ($(BR2_PACKAGE_LIBOGG),y)
+LIBOPENMPT_CONF_OPTS += --with-ogg
+LIBOPENMPT_DEPENDENCIES += libogg
+else
+LIBOPENMPT_CONF_OPTS += --without-ogg
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+LIBOPENMPT_CONF_OPTS += --with-sndfile
+LIBOPENMPT_DEPENDENCIES += libsndfile
+else
+LIBOPENMPT_CONF_OPTS += --without-sndfile
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
+LIBOPENMPT_CONF_OPTS += --with-vorbis --with-vorbisfile
+LIBOPENMPT_DEPENDENCIES += libvorbis
+else
+LIBOPENMPT_CONF_OPTS += --without-vorbis --without-vorbisfile
+endif
+
+ifeq ($(BR2_PACKAGE_MPG123),y)
+LIBOPENMPT_CONF_OPTS += --with-mpg123
+LIBOPENMPT_DEPENDENCIES += mpg123
+else
+LIBOPENMPT_CONF_OPTS += --without-mpg123
+endif
+
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+LIBOPENMPT_CONF_OPTS += --with-portaudio
+LIBOPENMPT_DEPENDENCIES += portaudio
+else
+LIBOPENMPT_CONF_OPTS += --without-portaudio
+endif
+
+ifeq ($(BR2_PACKAGE_PORTAUDIO_CXX),y)
+LIBOPENMPT_CONF_OPTS += --with-portaudiocpp
+# No need to add portaudio dependency, because this config already
+# depends on BR2_PACKAGE_PORTAUDIO. So the dependency has already been
+# added in the previous block.
+else
+LIBOPENMPT_CONF_OPTS += --without-portaudiocpp
+endif
+
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+LIBOPENMPT_CONF_OPTS += --with-pulseaudio
+LIBOPENMPT_DEPENDENCIES += pulseaudio
+else
+LIBOPENMPT_CONF_OPTS += --without-pulseaudio
+endif
+
+ifeq ($(BR2_PACKAGE_SDL2),y)
+LIBOPENMPT_CONF_OPTS += --with-sdl2
+LIBOPENMPT_DEPENDENCIES += sdl2
+else
+LIBOPENMPT_CONF_OPTS += --without-sdl2
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LIBOPENMPT_CONF_OPTS += --with-zlib
+LIBOPENMPT_DEPENDENCIES += zlib
+else
+LIBOPENMPT_CONF_OPTS += --without-zlib
+endif
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
