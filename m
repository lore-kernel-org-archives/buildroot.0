Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E4CC43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFC8780E3D;
	Fri,  3 Jul 2026 14:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C8iPvL_J-c99; Fri,  3 Jul 2026 14:28:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C3E080BA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088909;
	bh=tx8YsdoWyXWDNQQYPmyzXrdGRekBohw4XSf0riuPgxU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TM7qn0iGFnWhuZDljifcnXcRjE8v4dN/IvBbuBozvXe5TLmufpzJWdmyXM4P6AUmc
	 8NMuBQavQMA/evq3l4uzIzoVayx5KufbaURQ9Lhm1WAT3ZT+ZEsqo7oEYY1n9vrl4j
	 OCHOAmhZxJOAj7M7ajorhQJ7Yyscurg0K/0BL/idHNXm7bRbzECfvWRDFrDhKQWRQx
	 MEkVUcEFIO3i9aB9D65Wr5Cg+RTNRXpj6QsBlopY/Kg7TfSigBStYvNjbz4zBczzPF
	 qfvKUsDqAUIkXSPgKkOeKTRTd3u32kBHPh/iVLQvtqCRntqbwfja1To3JSQdpWWgVn
	 N2Ythl6uOp0Sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C3E080BA4;
	Fri,  3 Jul 2026 14:28:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EE6D514F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E067760A55
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OsRA-TYL5mRq for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AAE660648
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AAE660648
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F580883A1; Fri,  3 Jul 2026 14:27:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:26:58 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 6d8efb145e50432b1c8662939a35ecb3ad39e5fd
X-Git-Newrev: 1e06978a0f009f105e54f63b83b764f4e05b9a80
X-Patchwork-Hint: ignore
Message-Id: <20260703142757.8F580883A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/libepoxy: remove
 gl/egl dependency
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1e06978a0f009f105e54f63b83b764f4e05b9a80
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
(cherry picked from commit cd2583ca0a993cb44e8822966f101e820ac2619e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
