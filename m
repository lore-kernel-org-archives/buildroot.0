Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FC3606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lSMIkggQ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FA9160B8C;
	Fri, 30 Oct 2026 14:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id beMKCtn7NQKV; Fri, 30 Oct 2026 14:08:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3E44760B92
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369282;
	b=kHfxJ7gAdnQLJDQbWCEmEhIMLl9UMHFWjFy6ZmNdcgOPrdhoLbqlyINkpUdscayxLkgG
	 krVbuS9Un6XBgMaY0OsKIwYklnNGGo7EL1M6g7w1127+S1BtjImFJr+NiMvuUqF6kBEo2
	 2Od0xOXBYhHXqr8GuFViDMFYcO/XqKoNCyAf5+F7UXEd5MwEwYhsPx0fNyv6FG99LLeRz
	 9rFZPWjhNhlCM/2yGxYUc6qFOEo4QzB3U574GpF+KsbBzW18NpJEJOPAMeYP924Um3n+i
	 D3RruDS4ML+NKXtLUtxz6cefrXxtKxsRs3VAICoXE/pXNluACfsd+9bapoZRflHtDHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369282;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=lEKF+DM7RIHVJzITN9rbcryqjnMdTasVmzFMMDzypmU=;
	b=D+NEK1plehVeNo0s6mJWgaS3fMJv5vggnvZGFsfrSUPDi49y4QdN5SLHoCWLyuPM8PCu
	 uuqQCDL5PV8QShIm+SHcZZ5/3+A1J5+yK0JDVIIMPUyLxuw1BAPTTcXpElX6tjSI5UbLM
	 5sIovVCQYKQ89x8IMcDgIxRkJCyyHd3Lr4IXI3mFvC47ner1D+dgC+XQfPeNkRhZY2CvD
	 B6atJ31OhdwGLHdKgnIJApFrmd775fDqt+DqJfnFVcf7baLcA89gdlD3OIZlR9BjxKfNW
	 1TNdhVrVkEpT+WiftgNGEhoaH5fwFqcwU6gPWytLZuItgykh1GPTge087vaM40B7WNg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369282;
	bh=lEKF+DM7RIHVJzITN9rbcryqjnMdTasVmzFMMDzypmU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lSMIkggQKAVJCVmFlXQIrgA839su6+Pds11YYlvrVelGXdYQPnaON9CQWgkyhEH1B
	 StPvGLn+njbVTas8uSuY9JPysXYOadT/sEPxmmDa5TZIUly1WQVSgw9BAm0KsgSZAN
	 scm3nWmEtm9R50Wg5bm9+QJZIQFDwoZV6x51953o3y+SQTWBmCf4XIaWyBbmX+PEjb
	 Go0i2LpsGLx3a0TrpQef9XqiZSCmf05b7G20Z7Jg/7N0nA+a6BzQ3hbJ1yLXCQdHP0
	 pixMx7ewhiT/+/uOGcWnQY7yAfFPZkFazq2UyQ8NZ6GdVbnL7DFU1eeXDaG6Ncl1lZ
	 oqg0pnW0TEPKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E44760B92;
	Fri, 30 Oct 2026 14:08:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7888E362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66D0181180
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XuwV3oRLFBsq for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 64CBD81136
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369167;
 b=U30bvVmQR/aFthxxa4iRuM5WJnF/srZfyOI6GToxGKLlBmIcMkluWupdKs8Tf/C0lMw7
 uNpkmtbhl467C3EwQFUR1N6YdAa225kpsrmfFIy0oYGPfaxbmXtyzEWmvpGiGUQ/gIU4v
 OFNBdLlPAIbwcIE9AZxj0ug6irA4ArXywwfdAK4qOqENFXOGe2z2Jl7P1lwvFB77Cohvd
 PZ3BG0EPigaoSkxjS9r/OjBakywIhxJhQbV/+SLRPOI3i8RWpgIgNtGL3fUyG0XoOXOrM
 zAJxkRZKtg9i+IzoUXRSlEkZT2TAr4xYQAgkEuxEOFhueNGvbjotNFlZu3pLxTiiJRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369167;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KgelcUmqmBedTQ0e9PR8jbeaeXtf8fYDUNnraJpBlC8=;
 b=Evs56RTlRN2ApQm/Z8Eu+HKLWyop+PXIwVuv8yPuLpDzA8ifU0QZ5zYaX4rZT7JsEb0Z
 J6HC6U4t6YHQV0lozmj+CaySZbwc/rFJ21PvROP310BulPReXd9Vfhp+1U11jdYYZRvxt
 2lpThw1FoPfizxC7kM4rty4Rv1An2b9VYdLKDR4NtHyYq3tkaFeVnnvEeiDvm6u3djmK0
 h1c6M+wOT6NU8MT21xIh7GP7vxHyfUuMTGPox2Q/TfQGjrio3ODL1EnGrCxZoJsNs3IPR
 ihIlaRh0WiQb1c2SCPCMBmclGz16JYEj7yVZecvxpIaWOxVc70IO34KhIP2KEvdT1FA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64CBD81136
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 824AB9D389; Fri, 30 Oct 2026 14:04:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:00 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6f8daa05a02fb73e9fa470a3aab834cf9d9e772d
X-Git-Newrev: 8605f7585dd02ded3a7a6c2d50ac9af9182fbb4d
X-Patchwork-Hint: ignore
Message-Id: <20261030140439.824AB9D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libepoxy: needs
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
Content-Type: multipart/mixed; boundary="===============0439993427321861335=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0439993427321861335==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8605f7585dd02ded3a7a6c2d50ac9af9182fbb4d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
[
Raphaël: fix conflicts.
qemu and virglrenderer hunks dropped (not in 2025.02.x).
libfm/pcmanfm/xscreensaver/menu-cache hunks dropped (still on libgtk2)
]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libepoxy/Config.in                        | 4 ++++
 package/libgtk3/Config.in                         | 2 +-
 package/libgtk4/Config.in                         | 4 +++-
 package/vte/Config.in                             | 4 +++-
 package/webkitgtk/Config.in                       | 2 +-
 package/wpebackend-fdo/Config.in                  | 2 +-
 package/wpewebkit/Config.in                       | 2 +-
 package/x11r7/xdriver_xf86-video-amdgpu/Config.in | 5 +++--
 8 files changed, 17 insertions(+), 8 deletions(-)

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
index 0092e1043f..5a9c5700b1 100644
--- a/package/libgtk4/Config.in
+++ b/package/libgtk4/Config.in
@@ -1,8 +1,9 @@
-comment "libgtk4 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "libgtk4 needs a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS
 
 comment "libgtk4 needs an OpenGL(ES) EGL backend"
@@ -16,6 +17,7 @@ config BR2_PACKAGE_LIBGTK4
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, graphene
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on !BR2_STATIC_LIBS # libepoxy
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	# Even in the case of X11/OpenGL, libgtk4 needs epoxy built
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
index 8d07092d22..50a3a49aff 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -28,7 +28,7 @@ comment "webkitgtk needs libgtk3 or libgtk4 and a toolchain w/ C++, wchar, NPTL,
 
 config BR2_PACKAGE_WEBKITGTK
 	bool "webkitgtk"
-	depends on !BR2_STATIC_LIBS # wayland
+	depends on !BR2_STATIC_LIBS # libepoxy, wayland
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
diff --git a/package/wpebackend-fdo/Config.in b/package/wpebackend-fdo/Config.in
index 9b4dd28741..026a18e8ed 100644
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
index ace1771ee5..c4fac4e6a1 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -31,7 +31,7 @@ comment "wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend"
 
 config BR2_PACKAGE_WPEWEBKIT
 	bool "wpewebkit"
-	depends on !BR2_STATIC_LIBS # wayland
+	depends on !BR2_STATIC_LIBS # libepoxy, wayland
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
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

--===============0439993427321861335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0439993427321861335==--
