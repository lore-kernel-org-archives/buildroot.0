Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE77C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:47:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7524B60F6E
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7524B60F6E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 335CD400CF;
	Tue, 21 Sep 2021 20:47:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mVnZXH7_T2Aq; Tue, 21 Sep 2021 20:47:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37FC740189;
	Tue, 21 Sep 2021 20:47:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F1471BF47E
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E9D383E4A
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:46:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JJuvKDPv94hw for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:46:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5E0183521
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:46:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 037368C982; Tue, 21 Sep 2021 20:44:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:39:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ddad938149e80d14ab2c7695ac3ba7e7de6c327b
X-Git-Newrev: c9a3c10417aadce9ee4922e30235776409ce8eb3
X-Patchwork-Hint: ignore
Message-Id: <20210921204420.037368C982@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireplumber: new package
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1781765816583628405=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============1781765816583628405==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c9a3c10417aadce9ee4922e30235776409ce8eb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                    |  1 +
 package/wireplumber/Config.in        | 22 ++++++++++++++++++++
 package/wireplumber/wireplumber.hash |  3 +++
 package/wireplumber/wireplumber.mk   | 39 ++++++++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 899b493180..f2f80da3ff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1539,6 +1539,7 @@ menu "Graphics"
 	source "package/waylandpp/Config.in"
 	source "package/webkitgtk/Config.in"
 	source "package/webp/Config.in"
+	source "package/wireplumber/Config.in"
 	source "package/wlroots/Config.in"
 	source "package/woff2/Config.in"
 	source "package/wpebackend-fdo/Config.in"
diff --git a/package/wireplumber/Config.in b/package/wireplumber/Config.in
new file mode 100644
index 0000000000..6528a2e102
--- /dev/null
+++ b/package/wireplumber/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_WIREPLUMBER
+	bool "wireplumber"
+	depends on BR2_PACKAGE_PIPEWIRE
+	depends on BR2_PACKAGE_LUA_5_3 || BR2_PACKAGE_LUA_5_4
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  WirePlumber is a modular session / policy manager for
+	  PipeWire and a GObject-based high-level library that
+	  wraps PipeWire’s API, providing convenience for writing
+	  the daemon’s modules as well as external tools for
+	  managing PipeWire.
+
+	  https://pipewire.pages.freedesktop.org/wireplumber/
+
+comment "wireplumber needs a toolchain w/ wchar, threads and Lua >= 5.3"
+	depends on BR2_PACKAGE_PIPEWIRE
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		(!BR2_PACKAGE_LUA_5_3 && !BR2_PACKAGE_LUA_5_4)
diff --git a/package/wireplumber/wireplumber.hash b/package/wireplumber/wireplumber.hash
new file mode 100644
index 0000000000..561fcc2e5e
--- /dev/null
+++ b/package/wireplumber/wireplumber.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  41f174eaae5a630e195001fdd580918fa5143a71edceb050b320f85a8e65e53b  wireplumber-0.4.2.tar.bz2
+sha256  ff2eb9af5b05d92ac3a38cffcad27582ef555a31ff1781e1c1d4e087f77c9c81  LICENSE
diff --git a/package/wireplumber/wireplumber.mk b/package/wireplumber/wireplumber.mk
new file mode 100644
index 0000000000..2dab6042ea
--- /dev/null
+++ b/package/wireplumber/wireplumber.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# wireplumber
+#
+################################################################################
+
+WIREPLUMBER_VERSION = 0.4.2
+WIREPLUMBER_SOURCE = wireplumber-$(WIREPLUMBER_VERSION).tar.bz2
+WIREPLUMBER_SITE = https://gitlab.freedesktop.org/pipewire/wireplumber/-/archive/$(WIREPLUMBER_VERSION)
+WIREPLUMBER_LICENSE = MIT
+WIREPLUMBER_LICENSE_FILES = LICENSE
+WIREPLUMBER_DEPENDENCIES = host-pkgconf dbus pipewire libglib2 lua
+
+WIREPLUMBER_CONF_OPTS = \
+	-Ddoc=disabled \
+	-Dsystem-lua=true \
+	-Dsystem-lua-version=
+
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+WIREPLUMBER_DEPENDENCIES += gobject-introspection
+WIREPLUMBER_CONF_OPTS += -Dintrospection=enabled
+else
+WIREPLUMBER_CONF_OPTS += -Dintrospection=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+WIREPLUMBER_DEPENDENCIES += systemd
+WIREPLUMBER_CONF_OPTS += \
+	-Dsystemd=enabled \
+	-Dsystemd-system-service=true \
+	-Dsystemd-user-service=true
+else
+WIREPLUMBER_CONF_OPTS += \
+	-Dsystemd=disabled \
+	-Dsystemd-system-service=false \
+	-Dsystemd-user-service=false
+endif
+
+$(eval $(meson-package))

--===============1781765816583628405==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1781765816583628405==--
