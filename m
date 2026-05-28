Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5896CCD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29CAC83ADA;
	Fri, 29 May 2026 08:26:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q2-7uwK6N6DY; Fri, 29 May 2026 08:26:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52A1183BB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043167;
	bh=rYOR9EsGx3RPLRrENGqIIH4/PKzrO2is/hi1oYFtan8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=klaMQF8LJgo64L/YzLWfRKpaOxdTkQlRsRwxqq/V4wEKK5wobmU1e7diQHab7q5Jy
	 7da/Cy+bnS8RxD5AxpYthHF8q4QG5XxvgmoRCILB0T1Matjma6UU3cuCZSW/md+8jR
	 xtw5tqzr4heNesxxUKJ7VoOPIOJ9qlSHVCdZ47oGpvkWFQE7UaPGmZrcvzEKd60Jxt
	 MWqLSIG+sPIve0KueJYzJJm7QfrPl86ojfUa1Z6R25IIccpUMl+wu5CuD2k4gS3CSg
	 qjLto0j2yaK701V4jzu7nBfDIBUutu8BP3LivC7yfKb+khP4a/lbX6szlkroMepgk2
	 kJ6HEK8mrYKMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52A1183BB3;
	Fri, 29 May 2026 08:26:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 105EE28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2720641F82
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6uXr7I0niD14 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A589041F83
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A589041F83
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 452BD87171; Fri, 29 May 2026 08:25:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 11:48:14 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bb3974cb61c8dc3833d090bfc8cd69b7f9c041ed
X-Git-Newrev: ff85f9f4607022860ae0be8fcf3e1b4b5363bbad
X-Patchwork-Hint: ignore
Message-Id: <20260529082507.452BD87171@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/weston: add EGL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ff85f9f4607022860ae0be8fcf3e1b4b5363bbad
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index ef96a9b75e..28efc5126e 100644
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
