Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF87C5AE49
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 14:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A9C8606D6;
	Sun,  9 Aug 2026 14:58:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uCZYQxsMM7EO; Sun,  9 Aug 2026 14:58:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB5B96066D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786287534;
	bh=kbq2UzNXR400CaNRaCeyDE3X6TytMmeGqAidzt78+VA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r6G2hLX0ft7gpiKbxldaOiDLaHsasjyNQ7vIe5NQ6h/O6aLV0OZUdAX0o0WsAf5P1
	 pHxO/qqlqpi6O7oHp4eHbNewExSnEEhjKgm+ctFPgM3LR+qDX64UJsGBWXCFwZrhTv
	 vLb8TXtRbDJOSsRNy/xyQAeN5Tyt7AJZ2hEY1gORwXkPG36OR26rrX3hf10q7McHd+
	 n9SRLBz+pXFmkjH+JfKr81PG1j+fuEw6nasVnqGVzoa/QKgJY3/GDDLmwMuAz53U5B
	 o3ErEfMI+kkxQPtEauVE55rSeoGxIcH44nqlRS8PmmWntQAYZJRkUVMfhQMCXQhfzE
	 m3iOqMfw0uwxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB5B96066D;
	Sun,  9 Aug 2026 14:58:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 52EDF28A
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 14:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38F3D40531
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 14:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kyL8UkXf3Fse for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 14:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 802F94051D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 802F94051D
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 14:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE2B88D231; Sun,  9 Aug 2026 14:58:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Aug 2026 16:44:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f62a95d1d79212391719bff106a5be04781f5d38
X-Git-Newrev: baa86d079d7afa6bce8ff213fb992900b8c27c71
X-Patchwork-Hint: ignore
Message-Id: <20260809145802.EE2B88D231@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl3_ttf: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/baa86d079d7afa6bce8ff213fb992900b8c27c71
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

SDL3_ttf is a TrueType font rendering library for SDL3, based on
freetype, with optional harfbuzz support.

https://github.com/libsdl-org/SDL_ttf

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/sdl3_ttf/Config.in     |  9 +++++++++
 package/sdl3_ttf/sdl3_ttf.hash |  3 +++
 package/sdl3_ttf/sdl3_ttf.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 39 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d3451beb99..b7749df319 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2429,6 +2429,7 @@ F:	package/sdl2/
 F:	package/sdl3/
 F:	package/sdl3_gfx/
 F:	package/sdl3_image/
+F:	package/sdl3_ttf/
 
 N:	Michael Nosthoff <buildroot@heine.tech>
 F:	package/boost/
diff --git a/package/Config.in b/package/Config.in
index a3276ede1d..e4deb5f00e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -367,6 +367,7 @@ comment "Graphic libraries"
 	source "package/sdl3/Config.in"
 	source "package/sdl3_gfx/Config.in"
 	source "package/sdl3_image/Config.in"
+	source "package/sdl3_ttf/Config.in"
 	source "package/spirv-headers/Config.in"
 	source "package/tk/Config.in"
 	source "package/virglrenderer/Config.in"
diff --git a/package/sdl3_ttf/Config.in b/package/sdl3_ttf/Config.in
new file mode 100644
index 0000000000..d1c6c2efd0
--- /dev/null
+++ b/package/sdl3_ttf/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SDL3_TTF
+	bool "sdl3_ttf"
+	depends on BR2_PACKAGE_SDL3
+	select BR2_PACKAGE_FREETYPE
+	help
+	  SDL3_ttf is a sample TrueType font library. It allows you to
+	  use TrueType fonts in your SDL3 applications.
+
+	  http://www.libsdl.org/projects/SDL_ttf/
diff --git a/package/sdl3_ttf/sdl3_ttf.hash b/package/sdl3_ttf/sdl3_ttf.hash
new file mode 100644
index 0000000000..a959f011ce
--- /dev/null
+++ b/package/sdl3_ttf/sdl3_ttf.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  63547d58d0185c833213885b635a2c0548201cc8f301e6587c0be1a67e1e045d  SDL3_ttf-3.2.2.tar.gz
+sha256  7826eca0a0f7e591f38dd844e207a200aac81a59b20d8a30c3af8c6282af13e6  LICENSE.txt
diff --git a/package/sdl3_ttf/sdl3_ttf.mk b/package/sdl3_ttf/sdl3_ttf.mk
new file mode 100644
index 0000000000..12441e243e
--- /dev/null
+++ b/package/sdl3_ttf/sdl3_ttf.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# sdl3_ttf
+#
+################################################################################
+
+SDL3_TTF_VERSION = 3.2.2
+SDL3_TTF_SOURCE = SDL3_ttf-$(SDL3_TTF_VERSION).tar.gz
+SDL3_TTF_SITE = https://www.libsdl.org/projects/SDL_ttf/release
+SDL3_TTF_LICENSE = Zlib
+SDL3_TTF_LICENSE_FILES = LICENSE.txt
+SDL3_TTF_INSTALL_STAGING = YES
+
+SDL3_TTF_DEPENDENCIES = sdl3 freetype host-pkgconf
+
+SDL3_TTF_CONF_OPTS = \
+	-DSDLTTF_VENDORED=OFF \
+	-DSDLTTF_HARFBUZZ=OFF
+
+ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
+SDL3_TTF_DEPENDENCIES += harfbuzz
+SDL3_TTF_CONF_OPTS += -DSDLTTF_HARFBUZZ=ON
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
