Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D878C4167B
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 22:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 186A681D16;
	Sat,  4 Nov 2023 22:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 186A681D16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id suKd5slDprBN; Sat,  4 Nov 2023 22:04:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DCA58210D;
	Sat,  4 Nov 2023 22:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DCA58210D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EC021BF267
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 22:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16F058210D
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 22:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16F058210D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vqePbJPVU7Jb for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 22:04:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2BDA81D16
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 22:04:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2BDA81D16
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBC8586799; Sat,  4 Nov 2023 22:04:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 23:04:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3cc1b539e7e9fd49f571441e395e7daa8597dbec
X-Git-Newrev: a9ceaba794141e9f06d97aebc852b67b6fb501b8
X-Patchwork-Hint: ignore
Message-Id: <20231104220442.CBC8586799@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcanberra: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9ceaba794141e9f06d97aebc852b67b6fb501b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package defines a simple abstract interface for playing event sounds.
It is mainly used by desktop applications such as GDM and GNOME Session.

http://0pointer.de/lennart/projects/libcanberra/

Signed-off-by: Takumi Takahashi <takumiiinn@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/libcanberra/Config.in        | 21 +++++++++++++
 package/libcanberra/libcanberra.hash |  3 ++
 package/libcanberra/libcanberra.mk   | 59 ++++++++++++++++++++++++++++++++++++
 5 files changed, 85 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 14bf8d982c..a1bb99319c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2837,6 +2837,7 @@ F:	package/tl-expected/
 
 N:	Takumi Takahashi <takumiiinn@gmail.com>
 F:	package/gsettings-desktop-schemas/
+F:	package/libcanberra/
 
 N:	Tan En De <ende.tan@starfivetech.com>
 F:	package/libkcapi/
diff --git a/package/Config.in b/package/Config.in
index a7aee1816d..9da39c2159 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1426,6 +1426,7 @@ menu "Audio/Sound"
 	source "package/fdk-aac/Config.in"
 	source "package/libao/Config.in"
 	source "package/libbroadvoice/Config.in"
+	source "package/libcanberra/Config.in"
 	source "package/libcdaudio/Config.in"
 	source "package/libcddb/Config.in"
 	source "package/libcdio/Config.in"
diff --git a/package/libcanberra/Config.in b/package/libcanberra/Config.in
new file mode 100644
index 0000000000..b24088005a
--- /dev/null
+++ b/package/libcanberra/Config.in
@@ -0,0 +1,21 @@
+comment "libcanberra needs a toolchain w/ wchar, threads, dynamic library"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
+
+config BR2_PACKAGE_LIBCANBERRA
+	bool "libcanberra"
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	# We need at least one audio backend
+	select BR2_PACKAGE_ALSA_LIB if \
+	       !BR2_PACKAGE_PULSEAUDIO && \
+	       !BR2_PACKAGE_GSTREAMER1
+	# We need libltdl
+	select BR2_PACKAGE_LIBTOOL
+	select BR2_PACKAGE_LIBVORBIS
+	help
+	  libcanberra defines a simple abstract interface for playing
+	  event sounds.
+
+	  http://0pointer.de/lennart/projects/libcanberra/
diff --git a/package/libcanberra/libcanberra.hash b/package/libcanberra/libcanberra.hash
new file mode 100644
index 0000000000..8dc90ccd88
--- /dev/null
+++ b/package/libcanberra/libcanberra.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  c2b671e67e0c288a69fc33dc1b6f1b534d07882c2aceed37004bf48c601afa72  libcanberra-0.30.tar.xz
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LGPL
diff --git a/package/libcanberra/libcanberra.mk b/package/libcanberra/libcanberra.mk
new file mode 100644
index 0000000000..1eadcb571b
--- /dev/null
+++ b/package/libcanberra/libcanberra.mk
@@ -0,0 +1,59 @@
+################################################################################
+#
+# libcanberra
+#
+################################################################################
+
+LIBCANBERRA_VERSION = 0.30
+LIBCANBERRA_SOURCE = libcanberra-$(LIBCANBERRA_VERSION).tar.xz
+LIBCANBERRA_SITE = http://0pointer.de/lennart/projects/libcanberra
+LIBCANBERRA_LICENSE = LGPL-2.1+
+LIBCANBERRA_LICENSE_FILES = LICENSE
+LIBCANBERRA_INSTALL_STAGING = YES
+
+LIBCANBERRA_DEPENDENCIES = host-pkgconf libtool libvorbis
+LIBCANBERRA_CONF_OPTS = --disable-oss --disable-null --disable-tdb --disable-lynx
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+LIBCANBERRA_CONF_OPTS += --enable-udev
+LIBCANBERRA_DEPENDENCIES += udev
+else
+LIBCANBERRA_CONF_OPTS += --disable-udev
+endif
+
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+LIBCANBERRA_CONF_OPTS += --enable-alsa
+LIBCANBERRA_DEPENDENCIES += alsa-lib
+else
+LIBCANBERRA_CONF_OPTS += --disable-alsa
+endif
+
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+LIBCANBERRA_CONF_OPTS += --enable-pulse
+LIBCANBERRA_DEPENDENCIES += pulseaudio
+else
+LIBCANBERRA_CONF_OPTS += --disable-pulse
+endif
+
+ifeq ($(BR2_PACKAGE_GSTREAMER1),y)
+LIBCANBERRA_CONF_OPTS += --enable-gstreamer
+LIBCANBERRA_DEPENDENCIES += gstreamer1
+else
+LIBCANBERRA_CONF_OPTS += --disable-gstreamer
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK2),y)
+LIBCANBERRA_CONF_OPTS += --enable-gtk
+LIBCANBERRA_DEPENDENCIES += libgtk2
+else
+LIBCANBERRA_CONF_OPTS += --disable-gtk
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
+LIBCANBERRA_CONF_OPTS += --enable-gtk3
+LIBCANBERRA_DEPENDENCIES += libgtk3
+else
+LIBCANBERRA_CONF_OPTS += --disable-gtk3
+endif
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
