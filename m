Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E552110ED64F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B29F8613A3;
	Fri, 27 Mar 2026 10:02:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gO57wK9jXkkY; Fri, 27 Mar 2026 10:02:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B297E613A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605721;
	bh=h/19q0jE9YCQyQgfajuagFwX+qC9WCgpxWJBbYjGIIE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Xu0y1FIIHoljLNAOo/xdb7zGQirpC9u40/ioKY2cfdRYUJX0ErzULVxF82bWJc9Xm
	 b4RnWQqYug5xLfVqckPrT2+30mPY1ZcGdpZd7GNBxgn6bA9v9maQMiHF7p7yueRTrF
	 o2q4QNRN60JZpHyMSA1WgslcAx1Lluj5qENgYKC73ARbHl3tYXZklKN5oPvIXv0DI7
	 x4X1iSEqKomHDmDsDUVZDfMhbvsFuKVHp7f4fFUeoAIFbJvSwSY+3iOcJhF2ub8Hfj
	 RwY6/of0RD7S71Y5PKBCsJO9TLRt2dm2M+5KiUo62+VLCyDIGnbKsogrLt+d3DQJza
	 K35AlRYUTWsBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B297E613A4;
	Fri, 27 Mar 2026 10:02:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E4DCF249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5B2940BE2
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GUAEBYCA51IJ for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 113D640BD9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 113D640BD9
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64F5B7FBB8; Fri, 27 Mar 2026 10:01:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 17:07:46 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 6980799e92d2ab8ffbb780f90834f06d1c3c8f93
X-Git-Newrev: 8061b9f4f76f44d7dccc6f6904a7a1d35972e6ad
X-Patchwork-Hint: ignore
Message-Id: <20260327100141.64F5B7FBB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/mesa3d: add
 EGL_WL_bind_wayland_display support
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8061b9f4f76f44d7dccc6f6904a7a1d35972e6ad
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

This feature was made optional in mesa3d 25.2.0 as it is deprecated,
however some packages still require it so lets add a new config
option that those packages can select until they no longer require
this feature.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 026074163934a5d563449cacf1d3d6768f8b5caa)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mesa3d/Config.in | 6 ++++++
 package/mesa3d/mesa3d.mk | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e1faea95d5..8a7811b6a5 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -50,6 +50,12 @@ comment "llvm support needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
+config BR2_PACKAGE_MESA3D_LEGACY_BIND_WAYLAND_DISPLAY
+	bool "Legacy Wayland EGL_WL_bind_wayland_display support"
+	depends on BR2_PACKAGE_WAYLAND
+	help
+	  Legacy Wayland EGL_WL_bind_wayland_display support.
+
 menuconfig BR2_PACKAGE_MESA3D_OPENCL
 	bool "OpenCL support"
 	depends on BR2_PACKAGE_MESA3D_LLVM
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 325756d92e..f082d3c429 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -209,6 +209,9 @@ endif
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 MESA3D_DEPENDENCIES += wayland wayland-protocols
 MESA3D_PLATFORMS += wayland
+ifeq ($(BR2_PACKAGE_MESA3D_LEGACY_BIND_WAYLAND_DISPLAY),y)
+MESA3D_CONF_OPTS += -Dlegacy-wayland=bind-wayland-display
+endif
 endif
 
 MESA3D_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
