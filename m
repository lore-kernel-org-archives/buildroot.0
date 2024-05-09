Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49012C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 21:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E2AE60FCC;
	Thu,  9 May 2024 21:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8e1e5ldXhCOU; Thu,  9 May 2024 21:03:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EACFE612F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EACFE612F8;
	Thu,  9 May 2024 21:03:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 31F431BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E3B5612A4
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OPLyMQZQifHW for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 21:03:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4462A60FCC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4462A60FCC
 for <buildroot@buildroot.org>; Thu,  9 May 2024 21:03:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C68786DDD; Thu,  9 May 2024 21:03:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 23:03:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e28418dd4181fde155b799724e7e672938427804
X-Git-Newrev: 8660d11b089ea628bbfb3ace61fd31a103bbd2c6
X-Patchwork-Hint: ignore
Message-Id: <20240509210353.3C68786DDD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxmlb: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=8660d11b089ea628bbfb3ace61fd31a103bbd2c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libxmlb/Config.in    | 17 +++++++++++++++++
 package/libxmlb/libxmlb.hash |  3 +++
 package/libxmlb/libxmlb.mk   | 36 ++++++++++++++++++++++++++++++++++++
 5 files changed, 58 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ef870f12d6..61bededd7d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3318,6 +3318,7 @@ F:	package/libsoc/
 F:	package/libsocketcan/
 F:	package/libubox/
 F:	package/libuci/
+F:	package/libxmlb/
 F:	package/linux-firmware/
 F:	package/linux-serial-test/
 F:	package/modem-manager/
diff --git a/package/Config.in b/package/Config.in
index 310b763fbf..2b1e4a86b9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1863,6 +1863,7 @@ menu "JSON/XML"
 	source "package/libroxml/Config.in"
 	source "package/libucl/Config.in"
 	source "package/libxml2/Config.in"
+	source "package/libxmlb/Config.in"
 	source "package/libxmlpp/Config.in"
 	source "package/libxmlrpc/Config.in"
 	source "package/libxslt/Config.in"
diff --git a/package/libxmlb/Config.in b/package/libxmlb/Config.in
new file mode 100644
index 0000000000..c582b14f58
--- /dev/null
+++ b/package/libxmlb/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LIBXMLB
+	bool "libxmlb"
+	depends on !BR2_STATIC_LIBS # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_USE_WCHAR # glib2
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  The libxmlb library takes XML source, and converts it
+	  to a structured binary representation with a deduplicated
+	  string table where the strings have the NULs included.
+
+	  https://github.com/hughsie/libxmlb
+
+comment "libxmlb needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libxmlb/libxmlb.hash b/package/libxmlb/libxmlb.hash
new file mode 100644
index 0000000000..0f91486a03
--- /dev/null
+++ b/package/libxmlb/libxmlb.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  7050a3e43c4e1f53020cfbdfcb6fd5dc664c6c240faceb5ae3c8830423918262  libxmlb-0.3.19.tar.gz
+sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  LICENSE
diff --git a/package/libxmlb/libxmlb.mk b/package/libxmlb/libxmlb.mk
new file mode 100644
index 0000000000..1d5d339e4f
--- /dev/null
+++ b/package/libxmlb/libxmlb.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# libxmlb
+#
+################################################################################
+
+LIBXMLB_VERSION = 0.3.19
+LIBXMLB_SITE = $(call github,hughsie,libxmlb,$(LIBXMLB_VERSION))
+LIBXMLB_LICENSE = LGPL-2.1+
+LIBXMLB_LICENSE_FILES = LICENSE
+LIBXMLB_INSTALL_STAGING = YES
+LIBXMLB_DEPENDENCIES = libglib2
+LIBXMLB_CONF_OPTS = -Dgtkdoc=false -Dtests=false
+
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBXMLB_CONF_OPTS += -Dintrospection=true
+LIBXMLB_DEPENDENCIES += gobject-introspection
+else
+LIBXMLB_CONF_OPTS += -Dintrospection=false
+endif
+
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+LIBXMLB_DEPENDENCIES += zstd
+LIBXMLB_CONF_OPTS += -Dzstd=enabled
+else
+LIBXMLB_CONF_OPTS += -Dzstd=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_XZ),y)
+LIBXMLB_DEPENDENCIES += xz
+LIBXMLB_CONF_OPTS += -Dlzma=enabled
+else
+LIBXMLB_CONF_OPTS += -Dlzma=disabled
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
