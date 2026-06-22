Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1DACDB46F
	for <buildroot@archiver.kernel.org>; Mon, 22 Jun 2026 21:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F118180E98;
	Mon, 22 Jun 2026 21:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6TbPXirXHiVm; Mon, 22 Jun 2026 21:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4254A80E8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782164434;
	bh=+SGa4Ve/3Slcgs3b55frXmzN9uzt6D9TbRjzbGgnKnQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ap5a7OrLUZCrTn74jZsfRKkX+aKpDXkb69arIvtq5R8wDH3GtDDRTCXXn1B8ZjvSi
	 xcE75U/SB6Mh7axMdfNMMP+46XAsgoYmIV/M9yxFGlqtIqVg8XJh6k3p6VfLG0wDxH
	 z4aYZ9BPXRpZtutOGVjJ2VJeQDFomUTCLG1+1emBTKxLpA8o6igOiY8vi0NpLBxg6X
	 Q6dU0nfDSa22E9xcQIWvrb1mBHQMH10oE3Loo2s2QkJdkxvPukm+jFh+OwirO21CLF
	 CCBpdy5zSBq40sLDTWAr9j87TEVbJrZhKUOVTb7ZRsGufbolTTMW+H5/3jxXx+TaEG
	 3EK4apH5r6rlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4254A80E8D;
	Mon, 22 Jun 2026 21:40:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A52E1367
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 21:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BFA1606E8
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 21:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aYJM7snN0biZ for <buildroot@buildroot.org>;
 Mon, 22 Jun 2026 21:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D827C606E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D827C606E6
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 21:40:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E0BA8401E; Mon, 22 Jun 2026 21:40:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jun 2026 22:48:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aed60cba39aa2e3e189f8520412c807bf7fcb768
X-Git-Newrev: cd2583ca0a993cb44e8822966f101e820ac2619e
X-Patchwork-Hint: ignore
Message-Id: <20260622214008.8E0BA8401E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libepoxy: remove gl/egl dependency
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cd2583ca0a993cb44e8822966f101e820ac2619e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Libepoxy is a library for handling OpenGL function pointer management.

It has backends for egl/glx, which may at one point have been mandatory
to enable, but the library now builds with none of the above enabled
features, as seen below.

  libepoxy 1.5.10

    User defined options
      Cross files            : /home/joseph/br-test-pkg/arm-aarch64/build/libepoxy-1.5.10//buildroot-build/cross-compilation.conf
      b_pie                  : false
      b_staticpic            : true
      buildtype              : release
      build.cmake_prefix_path: /home/joseph/br-test-pkg/arm-aarch64/host/lib/cmake
      default_library        : shared
      docs                   : false
      egl                    : no
      glx                    : no
      libdir                 : lib
      build.pkg_config_path  : /home/joseph/br-test-pkg/arm-aarch64/host/lib/pkgconfig
      prefix                 : /usr
      strip                  : false
      tests                  : false
      x11                    : false

Removing these dependencies allows for some applications that require it
as a build dependency, but otherwise can run headless or without GL, to
build and function, using other graphics APIs or display pipelines.

Weston, for example, can still use Vulkan and DRM when linked to
libepoxy without GL/EGL/X11 support.

Acked-by: Arnout Vanecappelle <arnout@rnout.be>
Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/libepoxy/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libepoxy/Config.in b/package/libepoxy/Config.in
index 9da190b895..4b23497d46 100644
--- a/package/libepoxy/Config.in
+++ b/package/libepoxy/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_LIBEPOXY
 	bool "libepoxy"
-	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	help
 	  Epoxy is a library for handling OpenGL function pointer
 	  management for you.
 
-	  https://github.com/anholt/libepoxy
+	  It can be built without EGL or GLX support for packages
+	  that use libepoxy as a mandatory dependency but do not need
+	  OpenGL entry points at runtime.
 
-comment "libepoxy needs an OpenGL and/or OpenGL EGL backend"
-	depends on !BR2_PACKAGE_HAS_LIBEGL && !BR2_PACKAGE_HAS_LIBGL
+	  https://github.com/anholt/libepoxy
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
