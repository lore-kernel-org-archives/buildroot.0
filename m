Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA2CC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D479C60A47;
	Tue, 21 Feb 2023 00:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D479C60A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CKTaHdurpH8k; Tue, 21 Feb 2023 00:59:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BFB161105;
	Tue, 21 Feb 2023 00:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BFB161105
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6F161BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9026C4181A
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9026C4181A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a3lLMZrzpqMt for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9585541821
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9585541821
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9353E86495; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Feb 2023 14:45:57 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5336566668bd2ac9cd458a051eb6e8105d4b4544
X-Git-Newrev: 9f4f8c5f8993c6d7c2ef730ac211ef84ac9ae26d
X-Patchwork-Hint: ignore
Message-Id: <20230220205301.9353E86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/speechd: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f4f8c5f8993c6d7c2ef730ac211ef84ac9ae26d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/speechd/Config.in    | 20 ++++++++++++++++++++
 package/speechd/speechd.hash |  5 +++++
 package/speechd/speechd.mk   | 34 ++++++++++++++++++++++++++++++++++
 5 files changed, 61 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b9d54feb46..319ea9f4dc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2299,6 +2299,7 @@ F:	support/testing/tests/package/test_docker_compose.py
 
 N:	Peter Seiderer <ps.report@gmx.net>
 F:	package/dotconf/
+F:	package/speechd/
 
 N:	Peter Thompson <peter.macleod.thompson@gmail.com>
 F:	package/sdl2_gfx/
diff --git a/package/Config.in b/package/Config.in
index b2808cc6f8..e9746862b4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -51,6 +51,7 @@ menu "Audio and video applications"
 	source "package/pipewire-media-session/Config.in"
 	source "package/pulseaudio/Config.in"
 	source "package/sox/Config.in"
+	source "package/speechd/Config.in"
 	source "package/squeezelite/Config.in"
 	source "package/tinycompress/Config.in"
 	source "package/tovid/Config.in"
diff --git a/package/speechd/Config.in b/package/speechd/Config.in
new file mode 100644
index 0000000000..8fdc452d19
--- /dev/null
+++ b/package/speechd/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_SPEECHD
+	bool "speechd"
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_DOTCONF
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBSNDFILE
+	help
+	  Speech Dispatcher project provides a high-level device
+	  independent layer for access to speech synthesis through
+	  a simple, stable and well documented interface.
+
+	  https://freebsoft.org/speechd
+
+comment "speechd needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
diff --git a/package/speechd/speechd.hash b/package/speechd/speechd.hash
new file mode 100644
index 0000000000..4eb4cd09d2
--- /dev/null
+++ b/package/speechd/speechd.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  628d4446894b47f0df099123924c1070180b5b5b09c5b637ebe80d8578fba92f  speechd-0.11.4.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL-2
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.GPL-3
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
new file mode 100644
index 0000000000..0d43e4b6fb
--- /dev/null
+++ b/package/speechd/speechd.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# speechd
+#
+################################################################################
+
+SPEECHD_VERSION = 0.11.4
+SPEECHD_SITE = $(call github,brailcom,speechd,$(SPEECHD_VERSION))
+SPEECHD_LICENSE = GPL-2.0+, GPL-3.0+ (buildsystem), LGPL-2.1+
+SPEECHD_LICENSE_FILES = COPYING.GPL-2 COPYING.GPL-3 COPYING.LGPL
+SPEECHD_INSTALL_STAGING = YES
+# speechd source code is released without configure script
+SPEECHD_AUTORECONF = YES
+SPEECHD_DEPENDENCIES = host-pkgconf dotconf libglib2 libsndfile
+
+# fix missing config.rpath (needed for autoreconf) in the codebase
+define SPEECHD_TOUCH_CONFIG_RPATH
+	touch $(@D)/config.rpath
+endef
+SPEECHD_PRE_CONFIGURE_HOOKS += SPEECHD_TOUCH_CONFIG_RPATH
+
+ifeq ($(BR2_PACKAGE_LIBTOOL),y)
+SPEECHD_DEPENDENCIES += libtool
+SPEECHD_CONF_OPTS += --with-libltdl
+else
+SPEECHD_CONF_OPTS += --without-libltdl
+endif
+
+define SPEECHD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(@D)/speech-dispatcherd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/speech-dispatcherd.service
+endef
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
