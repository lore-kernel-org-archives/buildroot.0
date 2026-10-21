Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B1B606A31B
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 21:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=n2XHMOKf
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55CD281514;
	Wed, 21 Oct 2026 21:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ttUAvLgR_4Ws; Wed, 21 Oct 2026 21:15:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C06A78146E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792617302;
	b=MZ1x+YmCu2Gwy0HTYwvISQt6PFCvyZlc1WrmwnSXTnHNorYVCGoXyGwffc1dMZBQSuvh
	 +7Cxcu1MDEpp/GIFHAnDlUGFrmX9jnHlz/FdKzulKEJf5Y+77pWikS6ZhrW0l0cFE18rh
	 Ve3Q8blliSzbDWjEwbCupLGJW8ZjG2Yomcz+UseOjCdaEssJVrvzfibcRuFK27lBdRoF+
	 i1KjL2Q1YyJHsP39059iSI+MDPm3/9x/RM7QPlqd0mTj2SbN+RS4HprLy6tqJBQAJz/rH
	 NdOqLLkwnFBcldQPuon4BkAHcxu7ra68Y+TIgIhWN4T99p7yhAIc+jBBTUY5KU6eIQA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792617302;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qAGJ+BnjVSw4gLwUdFN5Q2JqX/8hFAWrQ0Ht9cNF/mo=;
	b=j0r8nxSOkX81pGViIWvSd6bmC/1BGDL0w1N5idJqxxSOI6bW5vlL+ZKecDB5wgJBYb1E
	 dhtUxYQXQVGzJsdNZpC5qWv4BtGPNfJUF25/S1bB3WL5WnPE2f9B8+NdtEqulyYJft4LN
	 NjlbeaSsfu5gmZKNXIh/IkqLSCd6q0wsAMlf8zzlN7jw41Dhd/AQZ7ROJF941m5x7uuQw
	 HMqRjnat8o04kNpPq2q7CTQ8V3hO7XZUs5705I4eE+SLSrXPnlcT5xfdCxTCpGqBoX7cF
	 iGJ3+U22qLxWo/Envhhhs4zbSHemYDVdf3USkFpPafXGW6iTWvZ29PCUjb9l7EX70tQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792617302;
	bh=qAGJ+BnjVSw4gLwUdFN5Q2JqX/8hFAWrQ0Ht9cNF/mo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=n2XHMOKfrhS1Ok7ouz8x+sQBmWDNzW/NJNZp8QXPpAg9sjFgBUn5jXsDWdO1mARaZ
	 KEKM6YF14P5zzz5xrJ/PicXlQuPyWndrNOcaBtmC351XW8gLwqA8KDBgd7Gj4pl7FP
	 XyrcBBFEijW5cCQ38pk3gDEK3kfV/RHkHkNNfeF6N7xkN7YJNJEHkqpXLdU1MgaJAm
	 VJoZYOh3afNmqGzMu6wiiTNDNHGaaYVPm8zn5Aj3VszuMhArS3H4Qo3ogqTIHYvSpk
	 u4agOOTBvr04oMq/x9niZlRwc/fuFhv0iR/iwb2BtLg4YC2Y7+tm5sqpSYfor8eEkf
	 KMHKwHhM9PTUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C06A78146E;
	Wed, 21 Oct 2026 21:15:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A8E1B1AB
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AA5581467
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:14:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gymAOF0_mdju for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 21:14:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 727B5813EB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792617297;
 b=kuW7sIFUj0+Yze5tI+TruOqaI9uw+yDrkVZebTiM/Jbgfsma1YE6v2mBGmSIr6ShOwmS
 govMYELDmFKlUtzifH5kUWaYTP48KeMVQsmZhIRqIBPeDdVlrfrhrS0UsmLpu8si/iR3q
 qvAU5hSkhOK5srqwGAAMAg2AVSf8/yBuTqanytykYPRCrlgfVtaqlhAGfceuF92+rbjX+
 iXwoszlq0I+fey3MtiNkwIUrXyVoVfN6NB0DGtzTe12gocB1DeyhCjkkUOVzRTyvbot8m
 7ntCciXgJMhOQtPeH1ZfEeyfR7fC6Z1l8Wlb96m0DpuaxBEx7dGcBt3ANCEEZ4bVd/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792617297;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=n15/fV1PBXQjexqhJyXbzhB8uu1PZais/Ga/LzE6SaE=;
 b=L8zBnAC4yrV2Kawv9cERyTzxODy+SVXppX4ndC0AGT7U3iWq/6l/qe6kYMx26d3r4htf
 qMY8VWsZHuhvMUrbXsdfVREWJwvQZNR5zYbZNQMfYOeTyTzeKXmuw5jce06dYx/Mxa3KE
 lMJx5E66j8FJck92cRhw8TS0q7zJodjahseyXtU+sYgY0EmmLoxCRYetIGAvEu3wEXWPZ
 B8jtU0w5cot3TNZ4MRbwG+Q8xgnoy2EFegncK8R89cQ9abNMWRn2iynGLc9vopJcJDJSb
 KMFq3VsH+aKXCdcLU4n5GkAg53hngaaAksOMjT/03fwKnLDTk6zXGWfa69qoG8n0g3A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 727B5813EB
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:14:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF8DD99B4A; Wed, 21 Oct 2026 21:13:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 23:14:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de806f0700dc67b2025cbf704d27eeffcbb7b69c
X-Git-Newrev: dc270b1ac31551bbfada680727ad1f743ef5d8cb
X-Patchwork-Hint: ignore
Message-Id: <20261021211333.AF8DD99B4A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libepoxy: needs dynamic library
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dc270b1ac31551bbfada680727ad1f743ef5d8cb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
