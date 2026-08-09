Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E31C5AE5D
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 14:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE71880B6B;
	Sun,  9 Aug 2026 14:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0P7hJfOkbDo; Sun,  9 Aug 2026 14:58:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E588380C4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786287536;
	bh=Cio1yUUGvUQ52dsuztT+rADLpDxJNwLZP7FtqYbO3Ys=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FCbGu9XqRsb5XOI9iSAC2KpXOW2wbNps6OuoeuXojZcKPe/KigdpMKyxv450Emb9b
	 +yPsDjnYEC6onIRfK/g98KOh4uRbfWOekO3hh2oy8ZyOpFZHYFapyP9e1VXjfOed1E
	 V0b2/9qngcJqRqs0ofBmY8zEM3y5bVdSN6pEa5wIG5lwxCbUdI7G288oKQuFYXxzeW
	 1VabyWIuRU+mBgJHgdpOaNVTNVQK5H38rtNvaU0K+mdCUzsTa4D9QyVxPRlVHcjlVz
	 AMI6OJvbt1bTDnN/8F4fhCQmva18KPedyE/hd3GaqW6kZJhDjGF7rpZiT7yVvYi7JG
	 aYDu5tWb7RYpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E588380C4D;
	Sun,  9 Aug 2026 14:58:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA4DA28A
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 14:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CD8280B84
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 14:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TZivJWx5DXeG for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 14:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A2BF80B6B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A2BF80B6B
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 14:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CDA968D21B; Sun,  9 Aug 2026 14:58:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Aug 2026 16:44:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebd944375675ac74c4199282097a6fa1f6be0e09
X-Git-Newrev: f62a95d1d79212391719bff106a5be04781f5d38
X-Patchwork-Hint: ignore
Message-Id: <20260809145802.CDA968D21B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl3_image: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f62a95d1d79212391719bff106a5be04781f5d38
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

SDL3_image is an image file loading library for SDL3. For now only
optional PNG support (via libpng) is wired up.

https://github.com/libsdl-org/SDL_image

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/sdl3_image/Config.in       |  9 +++++++++
 package/sdl3_image/sdl3_image.hash |  3 +++
 package/sdl3_image/sdl3_image.mk   | 22 ++++++++++++++++++++++
 5 files changed, 36 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 23eead299b..d3451beb99 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2428,6 +2428,7 @@ F:	package/gnuplot/
 F:	package/sdl2/
 F:	package/sdl3/
 F:	package/sdl3_gfx/
+F:	package/sdl3_image/
 
 N:	Michael Nosthoff <buildroot@heine.tech>
 F:	package/boost/
diff --git a/package/Config.in b/package/Config.in
index 674d906aa5..a3276ede1d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -366,6 +366,7 @@ comment "Graphic libraries"
 	source "package/sdl2_ttf/Config.in"
 	source "package/sdl3/Config.in"
 	source "package/sdl3_gfx/Config.in"
+	source "package/sdl3_image/Config.in"
 	source "package/spirv-headers/Config.in"
 	source "package/tk/Config.in"
 	source "package/virglrenderer/Config.in"
diff --git a/package/sdl3_image/Config.in b/package/sdl3_image/Config.in
new file mode 100644
index 0000000000..9b9c4f0d74
--- /dev/null
+++ b/package/sdl3_image/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SDL3_IMAGE
+	bool "sdl3_image"
+	depends on BR2_PACKAGE_SDL3
+	help
+	  SDL3_image is an image file loading library. It loads images
+	  as SDL surfaces, and supports the following formats: BMP,
+	  GIF, JPEG, LBM, PCX, PNG, PNM, TGA, TIFF, XCF, XPM, XV.
+
+	  http://www.libsdl.org/projects/SDL_image/
diff --git a/package/sdl3_image/sdl3_image.hash b/package/sdl3_image/sdl3_image.hash
new file mode 100644
index 0000000000..83f5e7eaf1
--- /dev/null
+++ b/package/sdl3_image/sdl3_image.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  d5685f220d5ae99439d710d808d8c478c6ccfaac539876929239b875a6723792  SDL3_image-3.1.1.tar.gz
+sha256  7826eca0a0f7e591f38dd844e207a200aac81a59b20d8a30c3af8c6282af13e6  LICENSE.txt
diff --git a/package/sdl3_image/sdl3_image.mk b/package/sdl3_image/sdl3_image.mk
new file mode 100644
index 0000000000..fadb870b6f
--- /dev/null
+++ b/package/sdl3_image/sdl3_image.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# sdl3_image
+#
+################################################################################
+
+SDL3_IMAGE_VERSION = 3.1.1
+SDL3_IMAGE_SITE = https://www.libsdl.org/projects/SDL_image/release
+SDL3_IMAGE_SOURCE = SDL3_image-$(SDL3_IMAGE_VERSION).tar.gz
+SDL3_IMAGE_LICENSE = Zlib
+SDL3_IMAGE_LICENSE_FILES = LICENSE.txt
+SDL3_IMAGE_INSTALL_STAGING = YES
+SDL3_IMAGE_DEPENDENCIES = sdl3
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+SDL3_IMAGE_DEPENDENCIES += libpng
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_PNG=ON
+else
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_PNG=OFF
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
