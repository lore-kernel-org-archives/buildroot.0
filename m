Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA33C5DF6A
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27AED60E23;
	Fri, 14 Aug 2026 13:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A1GiejIRBnpF; Fri, 14 Aug 2026 13:22:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B63660E08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713720;
	bh=Foa+HapmGUev7Vv+prluwYJZU+wdlUCx+LqljpuLMFM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=F0Ca2ILNtVFl2pWJqitXiZ0ydpFqaweBBcuzG4R5M838LKAYuyJogHYXBJc2sdqpC
	 HAuu6V6H/QLOGTm0Od+OUpLtOy8spYb46UuIoVgaSzVPtetVKHQGjRpQLwSwCEgKIF
	 GQmYtgIwbNpLLAQiYS991J6iYXi9GrtY0mJSl+zfBG0cLuiQPoA26DvzFalo0ysgSi
	 XWIZjFAcvruY52+hc9B76VLgoDfDdpMOAJ11NOcVKrSjP1EC/kPZVAL67oNhlvICS5
	 XNpV1XSetZYteUUIgArK+nF0rhtdxgSl8PlCa1O1CcciwExl3+wn5vuipH6uk7FD9k
	 qgXK6mKdHGQyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B63660E08;
	Fri, 14 Aug 2026 13:22:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A0E423F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00DB260873
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id USPX5PtBYZMK for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:21:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D078608D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D078608D6
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A15FA8D64C; Fri, 14 Aug 2026 13:20:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 16:03:39 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 206e41be023eb02a4796ab213ffd3087bcc2e14c
X-Git-Newrev: 98046cbf1dab6683be8b4c38019d02b528f40d13
X-Patchwork-Hint: ignore
Message-Id: <20260814132035.A15FA8D64C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/libvpl: update
 configure options
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/98046cbf1dab6683be8b4c38019d02b528f40d13
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Upstream removed configure option INSTALL_EXAMPLE_CODE with commit
https://github.com/intel/libvpl/commit/8434de3cbc2c06822e43d4b24cfd543a6bce1bfb
which was first released with version 2.11.0.

Upstream re-added a similar configure option named INSTALL_EXAMPLE_CODE
with commits
https://github.com/intel/libvpl/commit/f8d989160e3817cd9c18716120dccc1c8c23e915
https://github.com/intel/libvpl/commit/7c803c85383b011c1552d06585588ab7a8fcc4d3
which were first released with version 2.15.0.

Buildroot bumped the package to 2.15.0 with
8e713dcc88e24c47593abb84c9aa15f09610ae11 and forgot to rename the
configure option.

Remove libva/x11/wayland-related configure option due to upstream commit
https://github.com/intel/libvpl/commit/8434de3cbc2c06822e43d4b24cfd543a6bce1bfb
which was first released with version 2.11.0. Remove the selection of
optional packages for these dependencies as well.

Removed unneeded libatomic handling.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 53c29cf0466a1cb73739af2acdce61024df9650c)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libvpl/Config.in |  7 -------
 package/libvpl/libvpl.mk | 28 +---------------------------
 2 files changed, 1 insertion(+), 34 deletions(-)

diff --git a/package/libvpl/Config.in b/package/libvpl/Config.in
index 5a370ed2e3..eac901f9a8 100644
--- a/package/libvpl/Config.in
+++ b/package/libvpl/Config.in
@@ -10,13 +10,6 @@ config BR2_PACKAGE_LIBVPL
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
-	# libva support needs a libdrm with intel driver
-	select BR2_PACKAGE_LIBDRM_INTEL if BR2_PACKAGE_LIBVA && \
-		(BR2_i386 || BR2_x86_64) && \
-		BR2_PACKAGE_LIBDRM_HAS_ATOMIC
-	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	help
 	  oneAPI Video Processing Library (oneVPL) dispatcher,
 	  tools, and examples
diff --git a/package/libvpl/libvpl.mk b/package/libvpl/libvpl.mk
index 4e3c4807cd..7ec3556fe6 100644
--- a/package/libvpl/libvpl.mk
+++ b/package/libvpl/libvpl.mk
@@ -13,32 +13,6 @@ LIBVPL_DEPENDENCIES = host-pkgconf
 
 LIBVPL_CONF_OPTS = \
 	-DBUILD_TOOLS=OFF \
-	-DINSTALL_EXAMPLE_CODE=OFF
-
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-LIBVPL_CONF_OPTS += \
-	-DCMAKE_CXX_FLAGS="-latomic"
-endif
-
-ifeq ($(BR2_PACKAGE_LIBVA),y)
-LIBVPL_CONF_OPTS += -DENABLE_VA=ON
-LIBVPL_DEPENDENCIES += libva
-else
-LIBVPL_CONF_OPTS += -DENABLE_VA=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_WAYLAND),y)
-LIBVPL_CONF_OPTS += -DENABLE_WAYLAND=ON
-LIBVPL_DEPENDENCIES += wayland wayland-protocols
-else
-LIBVPL_CONF_OPTS += -DENABLE_WAYLAND=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_XORG7),y)
-LIBVPL_CONF_OPTS += -DENABLE_X11=ON
-LIBVPL_DEPENDENCIES += libxcb xlib_libX11
-else
-LIBVPL_CONF_OPTS += -DENABLE_X11=OFF
-endif
+	-DINSTALL_EXAMPLES=OFF
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
