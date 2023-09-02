Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8E0C001DB
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 17:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24CD8605E0;
	Sat,  2 Sep 2023 17:14:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24CD8605E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vhExlqOQkJ6X; Sat,  2 Sep 2023 17:14:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54C7160E7A;
	Sat,  2 Sep 2023 17:14:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54C7160E7A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A83E1BF407
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 17:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 438E281E1D
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 17:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 438E281E1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RvhwNasHORMi for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 17:14:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C2F0813A6
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 17:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C2F0813A6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45DE786902; Sat,  2 Sep 2023 17:14:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 19:09:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84b0d834a4a0b0fab4bf80d85533db7b5975a09e
X-Git-Newrev: cb4e9360b4a2b225a627dc37b7da24bd265e8065
X-Patchwork-Hint: ignore
Message-Id: <20230902171402.45DE786902@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdecor: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb4e9360b4a2b225a627dc37b7da24bd265e8065
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for wayland support in mesa3d-demos.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Tested-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/libdecor/Config.in     | 25 +++++++++++++++++++++++++
 package/libdecor/libdecor.hash |  3 +++
 package/libdecor/libdecor.mk   | 22 ++++++++++++++++++++++
 5 files changed, 52 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9b500f3701..26d0a0c223 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -365,6 +365,7 @@ F:	package/libcec/
 F:	package/libcodec2/
 F:	package/libcrossguid/
 F:	package/libde265/
+F:	package/libdecor/
 F:	package/libdeflate/
 F:	package/libdisplay-info/
 F:	package/libdrm/
diff --git a/package/Config.in b/package/Config.in
index 54cddc3914..42a9ec59d1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1608,6 +1608,7 @@ menu "Graphics"
 	source "package/leptonica/Config.in"
 	source "package/lesstif/Config.in"
 	source "package/libart/Config.in"
+	source "package/libdecor/Config.in"
 	source "package/libdmtx/Config.in"
 	source "package/libdri2/Config.in"
 	source "package/libdrm/Config.in"
diff --git a/package/libdecor/Config.in b/package/libdecor/Config.in
new file mode 100644
index 0000000000..782fe855b4
--- /dev/null
+++ b/package/libdecor/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_LIBDECOR
+	bool "libdecor"
+	depends on !BR2_STATIC_LIBS # wayland
+	depends on BR2_USE_MMU # pango
+	depends on BR2_USE_WCHAR # pango
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango
+	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pango, wayland
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+	help
+	  libdecor is a library that can help Wayland clients draw
+	  window decorations for them. It aims to provide multiple
+	  backends that implements the decoration drawing.
+
+	  https://gitlab.freedesktop.org/libdecor/libdecor
+
+comment "libdecor needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libdecor/libdecor.hash b/package/libdecor/libdecor.hash
new file mode 100644
index 0000000000..9e51e90593
--- /dev/null
+++ b/package/libdecor/libdecor.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  82adece5baeb6194292b0d1a91b4b3d10da41115f352a5e6c5844b20b88a0512  libdecor-0.1.1.tar.gz
+sha256  508a77d2e7b51d98adeed32648ad124b7b30241a8e70b2e72c99f92d8e5874d1  LICENSE
diff --git a/package/libdecor/libdecor.mk b/package/libdecor/libdecor.mk
new file mode 100644
index 0000000000..b965726292
--- /dev/null
+++ b/package/libdecor/libdecor.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# libdecor
+#
+################################################################################
+
+LIBDECOR_VERSION = 0.1.1
+LIBDECOR_SITE = https://gitlab.freedesktop.org/libdecor/libdecor/-/archive/$(LIBDECOR_VERSION)
+LIBDECOR_LICENSE = MIT
+LIBDECOR_LICENSE_FILES = LICENSE
+LIBDECOR_INSTALL_STAGING = YES
+LIBDECOR_DEPENDENCIES = cairo pango wayland wayland-protocols
+LIBDECOR_CONF_OPTS = -Ddemo=false
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+LIBDECOR_CONF_OPTS += -Ddbus=enabled
+LIBDECOR_DEPENDENCIES += dbus
+else
+LIBDECOR_CONF_OPTS += -Ddbus=disabled
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
