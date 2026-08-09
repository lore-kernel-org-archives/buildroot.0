Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8977C5AD4E
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 14:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F81B80B89;
	Sun,  9 Aug 2026 14:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ooNXeN_2VTpT; Sun,  9 Aug 2026 14:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B003580B6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786287532;
	bh=JEm4LhRVcYfNPgYX1xnOpJBb6SLnXm7F7isL0fM3wic=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Gbr/OKhYRdlMlMg2lb8IsTMU1oCvilH0uV9ui+3w4LgKXX+dKCYeAEgsvolXmLUlO
	 +3qHfVgSTxXQMgEEUvROQB8J4ZqxKSIN5JhuNCD9XUP3lDo7W/Vs1+UAGtv65NAat0
	 /IIzJwvrK8djkKKYMgPaDHryX8sQQrhXXL4kjg9RYMx8veGTXrHwjghkCWeNvU0dFD
	 Q373uhOKZteSmCWxsHu6D24XLwPLonfaZXbtF3RgUoevwGiREr7FsDEqKr8stL16uQ
	 3ILaU7lIRz+rsHGeL17JVZOPHegFOaJmHr8bjy2jzEbVni9TW99qIdN9qTKvInb79p
	 7QbEedzbuAscg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B003580B6B;
	Sun,  9 Aug 2026 14:58:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3433828A
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 14:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31C636062B
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 14:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PljTXtIjC_uY for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 14:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48DE3605E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48DE3605E6
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 14:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE9A48D209; Sun,  9 Aug 2026 14:58:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Aug 2026 16:44:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2dd13e328f118363165b47258429604a5ffd3b41
X-Git-Newrev: ebd944375675ac74c4199282097a6fa1f6be0e09
X-Patchwork-Hint: ignore
Message-Id: <20260809145802.AE9A48D209@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl3_gfx: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ebd944375675ac74c4199282097a6fa1f6be0e09
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

SDL3_gfx provides basic antialiased drawing routines such as lines,
circles or polygons, an interpolating rotozoomer for SDL surfaces,
framerate control and MMX image filters, as an extension to SDL3.

https://github.com/sabdul-khabir/SDL3_gfx

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/sdl3_gfx/Config.in     | 10 ++++++++++
 package/sdl3_gfx/sdl3_gfx.hash |  3 +++
 package/sdl3_gfx/sdl3_gfx.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 39 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 128ce22799..23eead299b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2427,6 +2427,7 @@ N:	Michael Fischer <mf@go-sys.de>
 F:	package/gnuplot/
 F:	package/sdl2/
 F:	package/sdl3/
+F:	package/sdl3_gfx/
 
 N:	Michael Nosthoff <buildroot@heine.tech>
 F:	package/boost/
diff --git a/package/Config.in b/package/Config.in
index 084a17b7d7..674d906aa5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -365,6 +365,7 @@ comment "Graphic libraries"
 	source "package/sdl2_net/Config.in"
 	source "package/sdl2_ttf/Config.in"
 	source "package/sdl3/Config.in"
+	source "package/sdl3_gfx/Config.in"
 	source "package/spirv-headers/Config.in"
 	source "package/tk/Config.in"
 	source "package/virglrenderer/Config.in"
diff --git a/package/sdl3_gfx/Config.in b/package/sdl3_gfx/Config.in
new file mode 100644
index 0000000000..d7f5a9d7ee
--- /dev/null
+++ b/package/sdl3_gfx/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_SDL3_GFX
+	bool "sdl3_gfx"
+	depends on BR2_PACKAGE_SDL3
+	help
+	  The SDL3_gfx library is an extension to the SDL3 library
+	  which provides basic antialiased drawing routines such as
+	  lines, circles or polygons, an interpolating rotozoomer for
+	  SDL surfaces, framerate control and MMX image filters.
+
+	  https://github.com/sabdul-khabir/SDL3_gfx
diff --git a/package/sdl3_gfx/sdl3_gfx.hash b/package/sdl3_gfx/sdl3_gfx.hash
new file mode 100644
index 0000000000..2c3b091c1d
--- /dev/null
+++ b/package/sdl3_gfx/sdl3_gfx.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  b92e6002825f92b19e10abe8a974f0c38839f6bfb9b065f2d8dd14c51bf12a77  sdl3_gfx-1.0.1.tar.gz
+sha256  72bf1f2078e66213b5a563fbb1c1905c96d8e62d922aa08b79088ec7a7e237ca  COPYING
diff --git a/package/sdl3_gfx/sdl3_gfx.mk b/package/sdl3_gfx/sdl3_gfx.mk
new file mode 100644
index 0000000000..fb747c0e95
--- /dev/null
+++ b/package/sdl3_gfx/sdl3_gfx.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# sdl3_gfx
+#
+################################################################################
+
+SDL3_GFX_VERSION = 1.0.1
+SDL3_GFX_SITE = $(call github,sabdul-khabir,SDL3_gfx,v$(SDL3_GFX_VERSION))
+SDL3_GFX_LICENSE = Zlib
+SDL3_GFX_LICENSE_FILES = COPYING
+SDL3_GFX_INSTALL_STAGING = YES
+SDL3_GFX_DEPENDENCIES = sdl3 host-pkgconf
+
+SDL3_GFX_CONF_OPTS = \
+	-DSDL3_GFX_TESTS=OFF \
+	-DSDL3_GFX_INSTALL=ON
+
+ifeq ($(BR2_i386)$(BR2_X86_CPU_HAS_MMX),yy)
+SDL3_GFX_CONF_OPTS += -DSDL3_GFX_MMX=ON
+else
+SDL3_GFX_CONF_OPTS += -DSDL3_GFX_MMX=OFF
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
