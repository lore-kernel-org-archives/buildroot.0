Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FE1C5AC80
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 09:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80AC760616;
	Sun,  9 Aug 2026 09:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_2MxHxsDm0N; Sun,  9 Aug 2026 09:15:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A888360644
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786266950;
	bh=kh0OKXKYCHKEyhVLJ3yk9GV9gClk6BAV2MbWuMeS1x8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DP8+81au+dAjhIxJ9RH2itvkKKBJm9A/9Ne/pprZeHjiWMphF7fjjf7bgwBDDBhLu
	 7Joz0gTg5WIpDf3/p1BMBhWPKbKKNqY14lxNv4hQtqO3qEXFer1H8NPO9RSJNKGyk1
	 2jcyhEEiZ3nVVgon5iNbVC9jFqyOhvdZNuvtjWbVtww7ESl5U54v1cYGrdW6qpBFZm
	 Z/PjCQDVhe1EXv8mgTCga8L2JX3odSZESDD+3LVWTmZrRn/SFrPT+yUCN5ikrS9NqN
	 y1r2PujFzbr7yOmNSMXDMGXEdDnz5GiQY6W1UESlvValk4yapvk4x1sJz7/1+YI+qy
	 1rCGIwqDPOYXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A888360644;
	Sun,  9 Aug 2026 09:15:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E8CAF259
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 09:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D78E860644
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 09:15:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-EQaryroa1U for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 09:15:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6182A60616
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6182A60616
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 09:15:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E149B8D207; Sun,  9 Aug 2026 09:14:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Aug 2026 11:12:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11bf0dc202c46c0cc3b9a5357b28fb649a886362
X-Git-Newrev: 53c29cf0466a1cb73739af2acdce61024df9650c
X-Patchwork-Hint: ignore
Message-Id: <20260809091459.E149B8D207@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvpl: update configure options
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/53c29cf0466a1cb73739af2acdce61024df9650c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
index e5ab9ac8ee..53a576a0a7 100644
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
