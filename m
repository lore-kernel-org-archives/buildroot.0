Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51BCCD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A71E641F85;
	Fri, 29 May 2026 08:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GQtmZR-d6N7o; Fri, 29 May 2026 08:28:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE80F42177
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043312;
	bh=sqJVKWSwXhfYhip47BfAiQbiX5vte307VBXINqsdkQ4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i3zXIydaPyqsebbpjvvtwGTUVDNhLcuu5we5jlBXYWUwhF214rB5PoEDTuyZTzS/3
	 ykhAyTdzwxOXn2Qnjrpme3fvI2RMvj0A8dn6zpFl+QJGgLyA/xb8M4WPHoA8phFFb9
	 rnc51Mwxoqj6ud400KM7219dlOlYjCU3vl6ulvq5DPYe3CrbZopFj3l/9ftliyumcW
	 TXMY1zY+tjL4M+dFSFBogTDHValJh5q1DhwQPAigJjzEtBosZbEt1IpCFhWRZi0DJo
	 fO//eLp/VV9nf8m33llmOJ9wXHed8LWiP6CwXqOwC8mNNFVAa2JZ0b9DnBdZgXCDjC
	 ubqHyst6iFMCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE80F42177;
	Fri, 29 May 2026 08:28:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04C30288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A15F61320
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rE3qALyVN7OV for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5BB36135E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5BB36135E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7341E87334; Fri, 29 May 2026 08:27:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:26:55 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: afcf84e5a801c91c6cfc1c186b1782d16d5ef7f9
X-Git-Newrev: cc6ace8158a7f2635f5d2bd6243387aa41601384
X-Patchwork-Hint: ignore
Message-Id: <20260529082749.7341E87334@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/weston: add EGL
 dependency for XWayland
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cc6ace8158a7f2635f5d2bd6243387aa41601384
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

BR2_PACKAGE_WESTON_XWAYLAND currently depends on BR2_PACKAGE_LIBEPOXY,
which implicitly requires either libGL or libEGL. However, the XWayland
glamor support uses libepoxy with EGL, so express that dependency
directly. With only libGL and no libEGL, it fails to build. E.g.,

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XWAYLAND=y
BR2_PACKAGE_LIBEPOXY=y

fails with:

In file included from ../glamor/glamor_priv.h:73,
from ../glamor/glamor_composite_glyphs.c:25:
../glamor/glamor_context.h:27:10: fatal error: epoxy/egl.h: No such file or directory
27 | #include <epoxy/egl.h>
   |          ^~~~~~~~~~~~~

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 701f8bb31cac8e6be5a4ccf5bc1d643a65c19327)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/weston/Config.in           | 6 ++++--
 package/x11r7/xwayland/xwayland.mk | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 614fef6bcc..bf7533da58 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -123,6 +123,7 @@ comment "X11 (nested) compositor needs X.org enabled"
 
 config BR2_PACKAGE_WESTON_XWAYLAND
 	bool "XWayland support"
+	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_LIBEPOXY
 	depends on BR2_PACKAGE_XORG7 # xwayland
 	depends on BR2_USE_MMU # xwayland
@@ -136,8 +137,9 @@ config BR2_PACKAGE_WESTON_XWAYLAND
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	select BR2_PACKAGE_XWAYLAND
 
-comment "XWayland support needs libepoxy and X.org enabled"
-	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_LIBEPOXY
+comment "XWayland support needs libepoxy w/ EGL and X.org enabled"
+	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_XORG7 || \
+		!BR2_PACKAGE_LIBEPOXY
 
 comment "XWayland support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index 8fa5260f47..5902f85d4f 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -30,7 +30,7 @@ XWAYLAND_CONF_OPTS = \
 	-Ddtrace=false \
 	-Ddocs=false
 
-ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_LIBEPOXY),yy)
 XWAYLAND_CONF_OPTS += -Dglamor=true
 XWAYLAND_DEPENDENCIES += libepoxy
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
