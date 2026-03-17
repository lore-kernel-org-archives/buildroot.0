Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5842EFF6E8C
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 22:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2211B607A6;
	Tue, 17 Mar 2026 22:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gd_l80gjIaao; Tue, 17 Mar 2026 22:04:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D1C8607AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773785055;
	bh=ERPFbuO1LO5Y+HvrCmDbTwo1M1joF17o1vgcozX+f90=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YXEloWrwDLaT/BkOuv0WCBWsi2/Gq2Ci081DjWrM7++gEPPYW+3Bp+bsOZgzQls5Q
	 FLiJMATnpXJwRvryV3te/mCnZfPcNvjeliIp1Y5pdc0DfuAnl2yinXKHZVdqSVH/5W
	 y1T62Gsy2BXhmtPv5C5YVVyFWtVfNnFbu+/QzYq8cJsrhcod5V3xxfG412J9kg78un
	 1KzlMMSL7onTdmIXFJbrI/XJgTl6JocCauo5T+7TpUaHFHSF2rGDNwnPZcopydxjzk
	 6MdZI61jBwQdk9otmm3mXLQu/k0wWr5QTi6ZvOpHBgnTrUW9k4bKzEGOARB3wneoTY
	 162IiI138KBFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D1C8607AC;
	Tue, 17 Mar 2026 22:04:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D537D3DA
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAED540CE9
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:04:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RaLhGxR9crK1 for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 22:04:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 032D040C96
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 032D040C96
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:04:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20C5281974; Tue, 17 Mar 2026 22:04:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 17 Mar 2026 22:50:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a5e70d1d123d8fd0f1843de47fc1cd7a66ae445
X-Git-Newrev: 026074163934a5d563449cacf1d3d6768f8b5caa
X-Patchwork-Hint: ignore
Message-Id: <20260317220411.20C5281974@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: add
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/026074163934a5d563449cacf1d3d6768f8b5caa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This feature was made optional in mesa3d 25.2.0 as it is deprecated,
however some packages still require it so lets add a new config
option that those packages can select until they no longer require
this feature.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mesa3d/Config.in | 6 ++++++
 package/mesa3d/mesa3d.mk | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 63acf0cc6e..66ebe04394 100644
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
index e9f5419e4f..3e5ce1266e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -212,6 +212,9 @@ endif
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
