Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D80C77B61
	for <buildroot@archiver.kernel.org>; Thu, 13 Apr 2023 14:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A38F83F1D;
	Thu, 13 Apr 2023 14:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A38F83F1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4YX_Zzwm0HLK; Thu, 13 Apr 2023 14:29:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BE8B83CDD;
	Thu, 13 Apr 2023 14:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BE8B83CDD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E9A021BF2B1
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 14:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D024E40589
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 14:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D024E40589
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AJ_UykS10fBm for <buildroot@lists.busybox.net>;
 Thu, 13 Apr 2023 14:29:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EFEA40533
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EFEA40533
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 14:29:30 +0000 (UTC)
Received: from 91-153-34-68.elisa-laajakaista.fi ([91.153.34.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pmxx2-00HZ70-Qb; Thu, 13 Apr 2023 16:29:28 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id c2e2cf3c;
 Thu, 13 Apr 2023 14:29:27 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Thu, 13 Apr 2023 17:29:27 +0300
Message-Id: <20230413142927.3137190-1-aperez@igalia.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DW8Wv3a4hHuN+Af4AWpGFnsdaIENHSehqDn6dOCmQz0=; b=i2UFtxJdKzD1d7Bce1HHvy9AwN
 rzaZZlhD3lPU3EjAiyZtyHKp06+KPD2DO1LRiZakAeWDKcEtKxy6quU78pbEcm+lYSW0bOOtLh+X8
 rdMmpqEhrmRkKscMLWs4tu9R/D9h70Kj0djtkq0MKTGruhcNqsjGMlGInMCj59SVh3UptyZyXvlyA
 fNVAtvQkuJaThUTZD1drCKwFTlMNqDnxGJrKu6NoTYN/IeJAqGOHbHMKl3PZx8ufH9ZYX/drbIMdP
 gh23K+a1ZAFhCEs4A2zamLSR8e3zTmoqMbubsxaK2XT2pWkKnS9dHA/fltRNBs5iNgHzjxW+dO6OG
 X8gXWjIQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=i2UFtxJd
Subject: [Buildroot] [PATCH] package/webkitgtk: allow both X11 and Wayland
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Allow enabling support for both the X11 and Wayland backends.

This in turn needs reorganizing how desktop GL or OpenGL ES is chosen,
as it no longer can depend on whether Wayland support is enabled: the
BR2_PACKAGE_HAS_LIBGL and BR2_PACKAGE_HAS_LIBGLES variables are both
checked, and ENABLE_GLES2 is set only if the package providing OpenGL
claims only GLES is supported; otherwise desktop GL is preferred. This
matches the existing logic.

The existing comment indicating that only one of both windowing systems
can be enabled was wrong: the same WebKitGTK build can target both
X11 and Wayland at the same time, as long as GTK itself has been built
accordingly. Enabling both is the approach taken by most Linux
distributions, and has been supported for years.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.mk | 37 +++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 3263f7fea0..8d88d0914e 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -77,32 +77,33 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_GAMEPAD=OFF
 endif
 
-# Only one target platform can be built, assume X11 > Wayland
-
-# GTK3-X11 target gives OpenGL from newer libgtk3 versions
-# Consider this better than EGL + maybe GLESv2 since both can't be built
-# 2D CANVAS acceleration requires OpenGL proper with cairo-gl
-ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
-WEBKITGTK_CONF_OPTS += \
-	-DENABLE_GLES2=OFF \
-	-DENABLE_X11_TARGET=ON
-WEBKITGTK_DEPENDENCIES += libgl \
-	xlib_libXcomposite xlib_libXdamage xlib_libXrender xlib_libXt
-else # !X11
-# GTK3-BROADWAY/WAYLAND needs at least EGL
-WEBKITGTK_DEPENDENCIES += libegl
-# GLESv2 support is optional though
-ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
+# Use GLES if available and desktop GL is not.
+$(info $(BR2_PACKAGE_HAS_LIBGL):$(BR2_PACKAGE_HAS_LIBGLES))
+ifeq ($(BR2_PACKAGE_HAS_LIBGL):$(BR2_PACKAGE_HAS_LIBGLES),:y)
 WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=ON
 WEBKITGTK_DEPENDENCIES += libgles
 else
-# Disable general OpenGL (shading) if there's no GLESv2
 WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=OFF
 endif
-# We must explicitly state the wayland target
+
+ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
+WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=ON
+WEBKITGTK_DEPENDENCIES += libgl \
+	xlib_libXcomposite xlib_libXdamage xlib_libXrender xlib_libXt
+else
+WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=ON
+WEBKITGTK_DEPENDENCIES += libegl
+else
+WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=OFF
 endif
+
+# If only the GTK Broadway backend is enabled, EGL is still needed.
+ifeq ($(BR2_PACKAGE_LIBGTK3_X11):$(BR2_PACKAGE_LIBGTK3_WAYLAND):$(BR2_PACKAGE_LIBGTK3_BROADWAY),::y)
+WEBKITGTK_DEPENDENCIES += libegl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND)$(BR2_PACKAGE_WPEBACKEND_FDO),yy)
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
