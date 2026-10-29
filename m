Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37A3606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LBXx6K3T
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A49F60D4B;
	Fri, 30 Oct 2026 14:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J8Phjy8LokZg; Fri, 30 Oct 2026 14:19:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1E90960C26
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369972;
	b=C4GflzhSgOX45+w4OcjrrZI3bEGdeQFuJl63RfBEWBzVhKsSLiIGCdXRSKhnmrcptmMk
	 33jXIubrhCw2dde89dzrvtsKGHOZrjxnYs1rOieXPQQ0374MTZmmfjjJ5awk0E52s4oyY
	 JgjjyTzQ3wmUW8YL/w2MCsnoPxqsK9jXhTgO9t1of2nYhhcER9qAmrITTbLTzecB9c5Pi
	 +oMVvt+OxpeaPb+9Gpql9WGZqwisHiCV8RKX7dYpd7GOOlR0XwmKvTJmIszdC6E2AW5Lt
	 eWezagGE29Y9qX4jJYzKum99jG4nRKoo6dfoOWVqEGbytU9nFFGPAm4BmxBALQaK54g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369972;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=RVz8ZZNOTnS87BloaPWPXLlKary4Gi6Tdvz2kXr3m0M=;
	b=PFP0qSJJqtIbqla/VjzHn1cP4tiAw5DI9gArQfPj2cL+0Wlez32rlg8myyLZ0ORjvmNQ
	 P2Fm3So2eWze+dwDoAajG5xT6Q9Lzd+/0BYjxLSAt9o2uMv4gCXCMrhZ8MDBxP4DkS/dD
	 XofsSAwVcaqGe0yhA9xjbAzhXvyqelQRW207uGkPub5Jq59qSMkfabnXPXEww83FLtxqT
	 Z+gtwVZbaGa+zm9OWj9B+0msYu/DndrBfzyiveYneJdU/0QRp0tubCZZyONKTgbY9cRDG
	 zygWQ+MR6YzzZDEFFV7enbNxkZI3SXodqa+O72jh9e6nBfg8eDb8d3gI93laaAmutzQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369972;
	bh=RVz8ZZNOTnS87BloaPWPXLlKary4Gi6Tdvz2kXr3m0M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LBXx6K3TutDatHssPM6mH1Ap/sgfKIWVPXnd3DNophLW/sHtv9GbF/8wP/2iA6bD7
	 dP2aAft6HvC/63I1L1tmkm6Ud6ZM5Ki2CeyB9RokrkjxoNm5R4gnxXZVSeHBNzRzpK
	 gsal/MTmpYUYmBdODnYmmts1N0DMEbFMb7MXi/wMYHcLIYFeiu1RnKVyYGfYFpvbic
	 7QqBS2SdFHlRm8cw0J4KGuvEGvZ9Ajm9YJkFhKezS9YCMdxxx/iQPB8/QA+FbBjIUY
	 4cIvCHM+p+ByTqh1+96TOFQgylfs6aGedrIp35Wg2i5YIQ4+obC2/CyX96vDqoz+Uj
	 Z8b2ZFu9Jef+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E90960C26;
	Fri, 30 Oct 2026 14:19:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 36DCA712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33FBF808AE
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c6itInuwYc5J for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B287E812C6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369890;
 b=nzOYBQVuSmDmIvnXav+LQR0pdoBqM/xzQy2fg+oZV27RF2/48ZKanh4oCvr63lTXc7BO
 ef9CCbco68FAaLMprIhdzTvEO13esAuBo09mIHAwTbdL4m6bZu7keygTjti11nne0toek
 hyZ7ynQrwNvk6eE+ARpsq9pN/Bnkf7bTpPE7GER0N1hLgv9DbvDr2jr6iyJvYWHN283Nm
 BU4WndYlAepSw7+yHWSaE/6pIN2+ECBI43Q0nuXqv7NA0UtLSvjirTgXyh4r8y2qGmijV
 r7Hcx57RIIU4r+vAyrJyHtvZrrgA0ogACxTt9WHOFoDI4B5ZjMl05DxRynxsR6InnHA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369890;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WafkrJsMvMprwgLy6MI8aPG2/ZZN2LY/7oxhZpHexis=;
 b=EjeOuhKmo4KtxV0SBiVervuM5x9lUagnbsbn+AyObwHe2FBn6d1BYay7JSa32Ho4Yn0C
 Zv+xT0c/E8waIFEyhn/PWLeO91JLSlBwDXu5N55+CFBcv84TWDj8q6759NbMH8z0sgmMA
 BntQXo7Cybpb+pYPXSZ9U6R5cMmBJ14NDPyqnSYMD18vqgmTIOjLO6EKXCKnFhJ+oX7TX
 SY+iQBI3ElfyYl4p3bNRzypIqowG9Mro4kW0MPkg+fcScQNrqC8WC+Y2gal6XAI83VuC7
 cTi/9vsoyMnh9YK6Snu65Kjkm1IaLkCycdff5JUH0sD+mFZdWWP6VSiVgW+oi6JXwkA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B287E812C6
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1AC79D388; Fri, 30 Oct 2026 14:16:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:07 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: d24372d61e129bcd4aa1675838d5fac9ff7b066d
X-Git-Newrev: 5197dcb6e1a4de06b4c94d599c7dfec9a7cf3c0e
X-Patchwork-Hint: ignore
Message-Id: <20261030141642.D1AC79D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libepoxy: needs
 dynamic library
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4692321493861787006=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4692321493861787006==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5197dcb6e1a4de06b4c94d599c7dfec9a7cf3c0e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Buildroot commit cd2583ca0a993cb44e8822966f101e820ac2619e removed the
dependencies to gl/egl which revealed that libepoxy needs a toolchain
with dynamic library:

../src/dispatch_common.c:166:10: fatal error: dlfcn.h:
 No such file or directory
  166 | #include <dlfcn.h>

This patch disables static builds and propagates reverse dependencies.

Fixes:
https://autobuild.buildroot.net/results/9d5/9d56cb52eb57df61184e26cea9604f1521d135f4/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dc270b1ac31551bbfada680727ad1f743ef5d8cb)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libepoxy/Config.in                        | 4 ++++
 package/libfm/Config.in                           | 4 +++-
 package/libgtk3/Config.in                         | 2 +-
 package/libgtk4/Config.in                         | 4 +++-
 package/menu-cache/Config.in                      | 6 ++++--
 package/pcmanfm/Config.in                         | 4 +++-
 package/qemu/Config.in                            | 8 ++++++++
 package/virglrenderer/Config.in                   | 5 +++--
 package/vte/Config.in                             | 4 +++-
 package/webkitgtk/Config.in                       | 2 +-
 package/wpebackend-fdo/Config.in                  | 2 +-
 package/wpewebkit/Config.in                       | 2 +-
 package/x11r7/xdriver_xf86-video-amdgpu/Config.in | 5 +++--
 package/xscreensaver/Config.in                    | 4 +++-
 14 files changed, 41 insertions(+), 15 deletions(-)

diff --git a/package/libepoxy/Config.in b/package/libepoxy/Config.in
index 4b23497d46..269b43be85 100644
--- a/package/libepoxy/Config.in
+++ b/package/libepoxy/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBEPOXY
 	bool "libepoxy"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	help
 	  Epoxy is a library for handling OpenGL function pointer
@@ -10,3 +11,6 @@ config BR2_PACKAGE_LIBEPOXY
 	  OpenGL entry points at runtime.
 
 	  https://github.com/anholt/libepoxy
+
+comment "libepoxy needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/libfm/Config.in b/package/libfm/Config.in
index 9537a723ff..e4d6528db5 100644
--- a/package/libfm/Config.in
+++ b/package/libfm/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBFM
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk3, libglib2
 	depends on BR2_USE_MMU # libgtk3, libglib2
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk3
+	depends on !BR2_STATIC_LIBS # libepoxy -> libgtk3
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk3
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk3
 	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # libgtk3
@@ -26,11 +27,12 @@ config BR2_PACKAGE_LIBFM
 
 	  http://wiki.lxde.org/en/Libfm
 
-comment "libfm a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "libfm a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 comment "libfm needs X.org with an OpenGL backend"
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index f7618832f1..79f00703fe 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -24,7 +24,7 @@ config BR2_PACKAGE_LIBGTK3
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	depends on BR2_PACKAGE_HAS_LIBEGL || \
 		BR2_PACKAGE_HAS_LIBGL
-	depends on !BR2_STATIC_LIBS # at-spi2-core
+	depends on !BR2_STATIC_LIBS # at-spi2-core, libepoxy
 	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
index 3daa676169..958742ae43 100644
--- a/package/libgtk4/Config.in
+++ b/package/libgtk4/Config.in
@@ -1,9 +1,10 @@
-comment "libgtk4 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "libgtk4 needs a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS
 
 comment "libgtk4 needs an OpenGL(ES) EGL backend"
@@ -18,6 +19,7 @@ config BR2_PACKAGE_LIBGTK4
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, graphene
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on !BR2_STATIC_LIBS # libepoxy
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	# Even in the case of X11/OpenGL, libgtk4 needs epoxy built
diff --git a/package/menu-cache/Config.in b/package/menu-cache/Config.in
index e61ca447c1..3e7137c7a8 100644
--- a/package/menu-cache/Config.in
+++ b/package/menu-cache/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_MENU_CACHE
 	bool "menu-cache"
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on !BR2_STATIC_LIBS # libepoxy -> libfm
 	depends on BR2_USE_MMU # libglib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBFM_EXTRA
@@ -11,6 +12,7 @@ config BR2_PACKAGE_MENU_CACHE
 
 	  http://wiki.lxde.org/
 
-comment "menu-cache needs a toolchain w/ wchar, threads"
+comment "menu-cache needs a toolchain w/ dynamic library, wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index a4522d88f4..7e411b22ac 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PCMANFM
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfm
 	depends on BR2_USE_MMU # libfm
 	depends on BR2_INSTALL_LIBSTDCPP # libfm
+	depends on !BR2_STATIC_LIBS # libepoxy -> libgtk3 -> libfm
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libfm
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libfm
 	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # libfm
@@ -22,11 +23,12 @@ config BR2_PACKAGE_PCMANFM
 
 	  http://wiki.lxde.org/en/PCManFM
 
-comment "pcmanfm a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "pcmanfm a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 comment "pcmanfm needs X.org with an OpenGL backend"
diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index bfb8ccea88..20a7fa3db7 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -115,6 +115,7 @@ config BR2_PACKAGE_QEMU_SDL
 config BR2_PACKAGE_QEMU_OPENGL
 	bool "Enable OpenGL"
 	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
+	depends on !BR2_STATIC_LIBS # libepoxy
 	select BR2_PACKAGE_LIBEPOXY
 	help
 	  Say 'y' to enable OpenGL accelerated display frontend support.
@@ -126,9 +127,13 @@ config BR2_PACKAGE_QEMU_OPENGL
 comment "OpenGL support needs an OpenGL and/or OpenGL EGL backend"
 	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
 
+comment "OpenGL support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_QEMU_VIRGLRENDERER
 	bool "Enable virglrenderer"
 	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
+	depends on !BR2_STATIC_LIBS # libepoxy -> virglrenderer
 	select BR2_PACKAGE_QEMU_OPENGL
 	select BR2_PACKAGE_VIRGLRENDERER
 	help
@@ -147,6 +152,9 @@ comment "virglrenderer needs virgl, venus, or a DRM backend for guest accelerati
 	depends on BR2_PACKAGE_QEMU_VIRGLRENDERER
 	depends on !BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
 
+comment "virglrenderer needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_QEMU_FDT
 	bool "Enable FDT"
 	select BR2_PACKAGE_DTC
diff --git a/package/virglrenderer/Config.in b/package/virglrenderer/Config.in
index 281d99b22f..70b2944664 100644
--- a/package/virglrenderer/Config.in
+++ b/package/virglrenderer/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_VIRGLRENDERER
 	bool "virglrenderer"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # needs gcc >= 4.9 for __sync builtins
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS # libepoxy
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBEPOXY
 	help
@@ -107,8 +108,8 @@ config BR2_PACKAGE_VIRGLRENDERER_VAAPI
 
 endif
 
-comment "virglrenderer needs a toolchain w/ gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+comment "virglrenderer needs a toolchain w/ dynamic library, gcc >= 4.9"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
 	bool
diff --git a/package/vte/Config.in b/package/vte/Config.in
index 8a231a21af..af6bfae890 100644
--- a/package/vte/Config.in
+++ b/package/vte/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_VTE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # libepoxy -> libgtk3
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_USES_MUSL
@@ -22,12 +23,13 @@ config BR2_PACKAGE_VTE
 
 	  http://github.com/GNOME/vte
 
-comment "vte needs a uClibc or glibc toolchain w/ wchar, threads, C++, gcc >= 10"
+comment "vte needs a uClibc or glibc toolchain w/ dynamic library, wchar, threads, C++, gcc >= 10"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
 		BR2_TOOLCHAIN_USES_MUSL
 
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 13a65e57dc..6600ac17cd 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -28,7 +28,7 @@ comment "webkitgtk needs libgtk3 or libgtk4 and a toolchain w/ C++, wchar, NPTL,
 
 config BR2_PACKAGE_WEBKITGTK
 	bool "webkitgtk"
-	depends on !BR2_STATIC_LIBS # wayland
+	depends on !BR2_STATIC_LIBS # libepoxy, wayland
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_HOST_GCC_AT_LEAST_7 # icu
diff --git a/package/wpebackend-fdo/Config.in b/package/wpebackend-fdo/Config.in
index bd0ab5421e..0e59b8df1a 100644
--- a/package/wpebackend-fdo/Config.in
+++ b/package/wpebackend-fdo/Config.in
@@ -4,7 +4,7 @@ comment "wpebackend-fdo needs a toolchain w/ C++, wchar, threads, dynamic librar
 
 config BR2_PACKAGE_WPEBACKEND_FDO
 	bool "wpebackend-fdo"
-	depends on !BR2_STATIC_LIBS # wayland
+	depends on !BR2_STATIC_LIBS # libepoxy, wayland
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, libglib2
 	depends on BR2_USE_WCHAR # libglib2
diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 4a747a22c9..91de3868bb 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -31,7 +31,7 @@ comment "wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend"
 
 config BR2_PACKAGE_WPEWEBKIT
 	bool "wpewebkit"
-	depends on !BR2_STATIC_LIBS # wayland
+	depends on !BR2_STATIC_LIBS # libepoxy, wayland
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_HOST_GCC_AT_LEAST_7 # icu
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu
diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/Config.in b/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
index fb23fc1fdf..e5adb73663 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AMDGPU
 	bool "xf86-video-amdgpu"
+	depends on !BR2_STATIC_LIBS # libepoxy
 	depends on BR2_USE_MMU # libdrm
 	depends on BR2_PACKAGE_HAS_LIBGBM
 	select BR2_PACKAGE_LIBDRM
@@ -10,6 +11,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AMDGPU
 	help
 	  AMD GPU video driver
 
-comment "xf86-video-amdgpu needs GBM"
+comment "xf86-video-amdgpu needs GBM and a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_HAS_LIBGBM
+	depends on !BR2_PACKAGE_HAS_LIBGBM || BR2_STATIC_LIBS
diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index 2bed8f4765..80fb1550f3 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_XSCREENSAVER
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk3, libglib2
 	depends on BR2_USE_MMU # libgtk3, libglib2
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk3
+	depends on !BR2_STATIC_LIBS # libepoxy -> libgtk3
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk3
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk3
 	select BR2_PACKAGE_GDK_PIXBUF
@@ -30,11 +31,12 @@ config BR2_PACKAGE_XSCREENSAVER
 
 	  http://www.jwz.org/xscreensaver/
 
-comment "xscreensaver needs a toolchain w/ wchar, C++, threads, gcc >= 4.9, OpenGL backend"
+comment "xscreensaver needs a toolchain w/ dynamic library, wchar, C++, threads, gcc >= 4.9, OpenGL backend"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		BR2_STATIC_LIBS || \
 		!BR2_USE_WCHAR || !BR2_PACKAGE_HAS_LIBGL

--===============4692321493861787006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4692321493861787006==--
