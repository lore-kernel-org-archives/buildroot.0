Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D78C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 20:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A243D422ED;
	Sat, 11 May 2024 20:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3QQ4U5_64AsT; Sat, 11 May 2024 20:02:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25D10422E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25D10422E6;
	Sat, 11 May 2024 20:02:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C4D001BF5B5
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B052E422E6
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6CNcE9rS-WXq for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 20:02:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74E77422DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74E77422DA
 for <buildroot@buildroot.org>; Sat, 11 May 2024 20:02:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E04186F9D; Sat, 11 May 2024 20:02:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 May 2024 13:56:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7aa4c0d9cc5819c0eb4f7da850bf7ade6ffc7644
X-Git-Newrev: 142fec6cbd8f6af0eb21cdf38ebbdf8dbea8724c
X-Patchwork-Hint: ignore
Message-Id: <20240511200255.5E04186F9D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ustreamer: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=142fec6cbd8f6af0eb21cdf38ebbdf8dbea8724c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Lightweight and fast MJPEG-HTTP streamer
(https://github.com/pikvm/ustreamer/tree/master#%C2%B5streamer)

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                       |  3 +++
 package/Config.in                |  1 +
 package/ustreamer/Config.in      | 21 +++++++++++++++++++++
 package/ustreamer/ustreamer.hash |  3 +++
 package/ustreamer/ustreamer.mk   | 40 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 68 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cb8a69a36a..1c0cd336ca 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1920,6 +1920,9 @@ F:	package/easy-rsa/
 N:	Justin Maggard <jmaggard@netgear.com>
 F:	package/dtach/
 
+N:	Kadambini Nema <kadambini.nema@gmail.com>
+F:	package/ustreamer/
+
 N:	Kamel Bouhara <kamel.bouhara@gmail.com>
 F:	package/libodb-boost/
 F:	package/libodb-mysql/
diff --git a/package/Config.in b/package/Config.in
index c7bad67553..edc56290ea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2609,6 +2609,7 @@ endif
 	source "package/uredir/Config.in"
 	source "package/ushare/Config.in"
 	source "package/ussp-push/Config.in"
+	source "package/ustreamer/Config.in"
 	source "package/vde2/Config.in"
 	source "package/vdr/Config.in"
 	source "package/vdr-plugin-vnsiserver/Config.in"
diff --git a/package/ustreamer/Config.in b/package/ustreamer/Config.in
new file mode 100644
index 0000000000..79c22ee691
--- /dev/null
+++ b/package/ustreamer/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_USTREAMER
+	bool "ustreamer"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16 # V4L2_EVENT_SOURCE_CHANGE
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libbsd
+	depends on !BR2_STATIC_LIBS # libbsd
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS # libbsd
+	depends on BR2_USE_WCHAR # libbsd
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBBSD
+	select BR2_PACKAGE_LIBEVENT
+	help
+	  Lightweight and fast MJPEG-HTTP streamer
+
+	  https://github.com/pikvm/ustreamer
+
+comment "ustreamer needs a toolchain w/ headers >= 3.16, threads, dynamic library, wchar"
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16 || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS || \
+		!BR2_USE_WCHAR
diff --git a/package/ustreamer/ustreamer.hash b/package/ustreamer/ustreamer.hash
new file mode 100644
index 0000000000..d3f603e0c8
--- /dev/null
+++ b/package/ustreamer/ustreamer.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  88f107e02a0b5c6493d55ed1bce0c85f66ce83d2bc0271ff6319ad593c6584bc  ustreamer-5.51.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ustreamer/ustreamer.mk b/package/ustreamer/ustreamer.mk
new file mode 100644
index 0000000000..dc8577b5e9
--- /dev/null
+++ b/package/ustreamer/ustreamer.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# ustreamer
+#
+################################################################################
+
+USTREAMER_VERSION = 5.51
+USTREAMER_SITE = $(call github,pikvm,ustreamer,v$(USTREAMER_VERSION))
+USTREAMER_LICENSE = GPL-3.0+
+USTREAMER_LICENSE_FILES = LICENSE
+USTREAMER_DEPENDENCIES = jpeg libevent libbsd
+
+USTREAMER_MAKE_OPTS = \
+	$(TARGET_CONFIGURE_OPTS) \
+	WITH_PTHREAD_NP=1 \
+	WITH_SETPROCTITLE=1 \
+	HAS_PDEATHSIG=1
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+USTREAMER_MAKE_OPTS += WITH_SYSTEMD=1
+USTREAMER_DEPENDENCIES += systemd
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGPIOD),y)
+USTREAMER_MAKE_OPTS += WITH_GPIO=1
+USTREAMER_DEPENDENCIES += libgpiod
+endif
+
+define USTREAMER_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(USTREAMER_MAKE_OPTS) -C $(@D)
+endef
+
+define USTREAMER_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/ustreamer \
+		$(TARGET_DIR)/usr/bin/ustreamer
+	$(INSTALL) -D -m 0755 $(@D)/ustreamer-dump \
+		$(TARGET_DIR)/usr/bin/ustreamer-dump
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
