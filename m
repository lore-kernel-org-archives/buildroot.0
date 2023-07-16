Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55176EB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 14:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CC8481A24;
	Sun, 16 Jul 2023 14:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CC8481A24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MtCIaOM2imYx; Sun, 16 Jul 2023 14:50:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21AAD81A30;
	Sun, 16 Jul 2023 14:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21AAD81A30
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC5971BF30F
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 14:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C484B4095C
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 14:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C484B4095C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8gsJ84TjKnp5 for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 14:50:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 548584058C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 548584058C
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 14:50:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 62FF9A4C00B8;
 Sun, 16 Jul 2023 16:50:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36036)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qL34V-0004tP-0R;
 Sun, 16 Jul 2023 16:50:03 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 16:50:02 +0200
Message-Id: <20230716145003.339645-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689519003;
 bh=L+5/2QDEbqpqYO6mcR+UWH6KJdYp/STzlmQSrGgIYF4=;
 h=From:To:Cc:Subject:Date:From;
 b=XrjGBxAEqXeeqmXYQIUx8tUC8Do1ECWi+QHzeBQIwnMsMN3OKOKg55t7Y1t2fito2
 CFpbXFj1xU2AuqRNJmw7EhZXySRTV8pgQdkai3WSpcompYj17Cdp4SrOtxkTHJUyZP
 Vn6S1z4Zg+wy/2EheAtlYdQONJLcL6fau1ns42A7tUSNYIUGKbk13AWxGohboX/fu3
 7xnyKqvjY87FHHSoIokvL3Vyl5IDl2gswxtDrQQADgxLVKRAB9cykiSCisXftMGk35
 gOvl4CtE3OFT3Rz8c5RoRwQkra6KI84KPPl6+996QEwBS8ex+G5c8GW8ADHPc494KL
 rbyPOnG9LESEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=XrjGBxAE
Subject: [Buildroot] [PATCH 1/2] package/libdecor: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Spenser Gilliland <spenser@gillilanding.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed for wayland support in mesa3d-demos.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/Config.in              |  1 +
 package/libdecor/Config.in     | 25 +++++++++++++++++++++++++
 package/libdecor/libdecor.hash |  3 +++
 package/libdecor/libdecor.mk   | 22 ++++++++++++++++++++++
 4 files changed, 51 insertions(+)
 create mode 100644 package/libdecor/Config.in
 create mode 100644 package/libdecor/libdecor.hash
 create mode 100644 package/libdecor/libdecor.mk

diff --git a/package/Config.in b/package/Config.in
index 57d3646566..1097d2deae 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1600,6 +1600,7 @@ menu "Graphics"
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
index 0000000000..21505de785
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
+LIBDECOR_DEPENDENCIES = cairo dbus pango wayland wayland-protocols
+LIBDECOR_CONF_OPTS = -Ddemo=false
+
+ifeq ($(BR2_PACKAGE_DBUS),yx)
+LIBDECOR_CONF_OPTS += -Ddbus=enabled
+LIBDECOR_DEPENDENCIES += dbus
+else
+LIBDECOR_CONF_OPTS += -Ddbus=disabled
+endif
+
+$(eval $(meson-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
