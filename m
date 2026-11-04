Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722CA606C5AD
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 20:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=p5jiJch7
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC6E660850;
	Wed,  4 Nov 2026 20:52:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MsM-u5nQ0TmF; Wed,  4 Nov 2026 20:52:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 46562607FA
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793825558;
	b=KJzQVwpsHhUNXw/mj7zlAdQG5d2A5piU0DBhiTIsgTVt5bpjx+IZ8iQy88YWJRdGyNTT
	 FGTiiUKv6O7N6+aw0c8FTXhZLIXBmZfCGfqHUJbWDxFQ9+FZr9OzR202dQN2aJgW0rJIz
	 7jkz/fBWuR2kx+zOGKBIZ3hP8eAP4wC7/35qMq2HuTJO8F0iESsiae9aZwl+WDm28hqQs
	 RpDMKzCRd/PUJFpoktLfG2YFVzK5GqZ8iBTz/vJQCRdSJn6As1kJDyvlcDMmaIIV5Vjiq
	 Jo9uPrlV3RsK549Axk7YDouBllsFylH7aVQ7x6PAFmRJeA0sSPYz1oMV1n7gYtUXN9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793825558;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PFzJtkapxm989REEt2ZIBxLkU0IuchvF4HhP+xn86ZQ=;
	b=f9X71ov9Mz/u+sYs8KwPnwwCNGQF07Rx3QQXRnxUIruagZrY+cXBAMwAtFHTCaY9EmYM
	 Mf5pf9mVuiFJXlNLjejWOipNn9md9PaHfE+Rat8vcCII0TWrTHKw7F9er20CgTj6txl6I
	 rFi/GXiMnMW/1dz3lsX3C3LJp1BsgMF3kX9r5OOk3JBxbCbBzrIBcxoNW7BX8CTtStg9b
	 hDNKJ+Bnf7jdxwLMxD6Bcr6s2ONaaJJe6z3NFmVSRbe8nAcYdGNL5Kh79x4N+DOlvwbQq
	 MHuv6+EtofCobDX4Y8Al836Dorai7JIAg/VDCQRXQO52jypn3wtoj68B8Vq2VPTeLOw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793825558;
	bh=PFzJtkapxm989REEt2ZIBxLkU0IuchvF4HhP+xn86ZQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=p5jiJch74jZ4iSagTm5JSLqrytKJAQRGWsmzJauWb4sTuqd/Lq7do+iwOUL6UC6xF
	 a240Ue2apqqixIzL2JS040G56E01UgZe3GwT2rvXdJhXpXP7kbuSnGn4Mf76Fg4x2z
	 8p+VemxFNv6/g55hxV5rTjbST33zd8/nCQKtukszDUef8sDRgZsQSoX/gry2uQkMug
	 XzkMQhY5cYMOTDwkIktvwdjt4vmnxdCX+bueN2hzKu/ab/jDwyaw6BhhFnY/RqGdcr
	 HWro2he4lmBmB/WRyfSalkA5at2SASSK5BCMdML+Pct56oDMJDWezoSeL/m8VDtE4g
	 ji3rxpuUkgWiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46562607FA;
	Wed,  4 Nov 2026 20:52:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3400177E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90462810E7
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kG_g_rBcH6QW for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 20:52:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7812E8108C
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7812E8108C
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:52:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 975389DC0C; Wed,  4 Nov 2026 20:51:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 21:52:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bbdf77c6c87d930594f2cb0b5029c671cde2408f
X-Git-Newrev: 689e3813dfa4b6b84843b496f93165e3de63d212
X-Patchwork-Hint: ignore
Message-Id: <20261104205103.975389DC0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgtk4: bump to version 4.24.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/689e3813dfa4b6b84843b496f93165e3de63d212
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://gitlab.gnome.org/GNOME/gtk/-/blob/4.24.1/NEWS

Highlights of the changes since 4.21.0:
 - librsvg is no longer a dependency, as GTK can now render SVG
   images natively; this also drops the rustc host requirement
 - New GtkSvgWidget for displaying (interactive) SVG, used for all
   SVG icons and GtkSpinner
 - Wayland: support for text protocol v3.2 and
   xdg-session-management-v1
 - GSK: 10bit image formats support, rewritten cache allocator,
   clip masks to reduce the number of offscreens
 - Session saving support is back

Drop librsvg from the dependencies, together with the host rustc
architecture requirement that came with it.

Also add a patch to fix the build on uclibc toolchains, which lack
fenv.h.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...eson-fix-compilation-if-fenv.h-is-missing.patch | 119 +++++++++++++++++++++
 package/libgtk4/Config.in                          |   3 -
 package/libgtk4/libgtk4.hash                       |   4 +-
 package/libgtk4/libgtk4.mk                         |   5 +-
 4 files changed, 123 insertions(+), 8 deletions(-)

diff --git a/package/libgtk4/0001-meson-fix-compilation-if-fenv.h-is-missing.patch b/package/libgtk4/0001-meson-fix-compilation-if-fenv.h-is-missing.patch
new file mode 100644
index 0000000000..475453a6bd
--- /dev/null
+++ b/package/libgtk4/0001-meson-fix-compilation-if-fenv.h-is-missing.patch
@@ -0,0 +1,119 @@
+From e0f3bec0fdf037dffb0bd6570c00a6de37c1fef3 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Fri, 15 Nov 2024 08:22:23 +0100
+Subject: [PATCH] meson: fix compilation if fenv.h is missing
+
+../gtk/gtkcssnumbervalue.c:29:10: fatal error: fenv.h: No such file or directory
+   29 | #include <fenv.h>
+      |
+
+Upstream: https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/7925
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ gtk/gtkcssnumbervalue.c | 59 ++++++++++++++++++++++++++++++++---------
+ meson.build             |  1 +
+ 2 files changed, 48 insertions(+), 12 deletions(-)
+
+diff --git a/gtk/gtkcssnumbervalue.c b/gtk/gtkcssnumbervalue.c
+index 1181c1a802..03cf30262a 100644
+--- a/gtk/gtkcssnumbervalue.c
++++ b/gtk/gtkcssnumbervalue.c
+@@ -26,7 +26,9 @@
+ #include "gtkcssstyleprivate.h"
+ #include "gtkprivate.h"
+ 
++#ifdef HAVE_FENV_H
+ #include <fenv.h>
++#endif
+ 
+ #define RAD_TO_DEG(x) ((x) * 180.0 / G_PI)
+ #define DEG_TO_RAD(x) ((x) * G_PI / 180.0)
+@@ -1846,13 +1848,25 @@ gtk_css_dimension_value_is_zero (const GtkCssValue *value)
+   return value->dimension.value == 0;
+ }
+ 
+-static double
+-_round (guint mode, double a, double b)
++#ifdef HAVE_FENV_H
++static inline double
++_round_fenv (int mode, double a, double b)
+ {
+-  int old_mode;
+-  int modes[] = { FE_TONEAREST, FE_UPWARD, FE_DOWNWARD, FE_TOWARDZERO };
+   double result;
++  int old_mode;
+ 
++  old_mode = fegetround ();
++  fesetround (mode);
++  result = nearbyint (a/b) * b;
++  fesetround (old_mode);
++
++  return result;
++}
++#endif
++
++static double
++_round (guint mode, double a, double b)
++{
+   if (b == 0)
+     return NAN;
+ 
+@@ -1880,14 +1894,35 @@ _round (guint mode, double a, double b)
+         }
+     }
+ 
+-  old_mode = fegetround ();
+-  fesetround (modes[mode]);
+-
+-  result = nearbyint (a/b) * b;
+-
+-  fesetround (old_mode);
+-
+-  return result;
++  switch (mode)
++    {
++    case ROUND_NEAREST:
++#ifdef FE_TONEAREST
++      return _round_fenv (FE_TONEAREST, a, b);
++#else
++      return round (a/b) * b;
++#endif
++    case ROUND_UP:
++#ifdef FE_UPWARD
++      return _round_fenv (FE_UPWARD, a, b);
++#else
++      return (((a/b) >= 0) ? ceil (a/b) : floor (a/b)) * b;
++#endif
++    case ROUND_DOWN:
++#ifdef FE_DOWNWARD
++      return _round_fenv (FE_DOWNWARD, a, b);
++#else
++      return (((a/b) >= 0) ? floor (a/b) : ceil (a/b)) * b;
++#endif
++    case ROUND_TO_ZERO:
++#ifdef FE_TOWARDZERO
++      return _round_fenv (FE_TOWARDZERO, a, b);
++#else
++      return (((a/b) >= 0) ? floor (a/b) : ceil (a/b)) * b;
++#endif
++    default:
++      g_assert_not_reached ();
++    }
+ }
+ 
+ static double
+diff --git a/meson.build b/meson.build
+index f8a6d35e3c..ca8e63b93d 100644
+--- a/meson.build
++++ b/meson.build
+@@ -198,6 +198,7 @@ cdata.set_quoted('SYMBOL_VISIBILITY', get_option('symbol-visibility'))
+ 
+ check_headers = [
+   'dev/evdev/input.h',
++  'fenv.h',
+   'ftw.h',
+   'linux/input.h',
+   'sys/mman.h',
+-- 
+2.43.0
+
diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
index 13494fb692..e06df5b487 100644
--- a/package/libgtk4/Config.in
+++ b/package/libgtk4/Config.in
@@ -1,5 +1,4 @@
 comment "libgtk4 needs a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 4.9"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
@@ -14,7 +13,6 @@ comment "libgtk4 needs an OpenGL(ES) EGL backend"
 
 config BR2_PACKAGE_LIBGTK4
 	bool "libgtk4"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # librsvg
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, graphene, libepoxy
 	depends on BR2_USE_MMU # glib2
@@ -36,7 +34,6 @@ config BR2_PACKAGE_LIBGTK4
 	select BR2_PACKAGE_LIBFRIBIDI
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_TIFF
 	# At least one backend is required
diff --git a/package/libgtk4/libgtk4.hash b/package/libgtk4/libgtk4.hash
index dff32c57b4..ffa90911e5 100644
--- a/package/libgtk4/libgtk4.hash
+++ b/package/libgtk4/libgtk4.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk/4.21/gtk-4.21.0.sha256sum
-sha256  f52475c5041dfd02cc4eed22ee94f12ec310c16a68fda9203dc54ffd5daa6e6f  gtk-4.21.0.tar.xz
+# From https://download.gnome.org/sources/gtk/4.24/gtk-4.24.1.sha256sum
+sha256  e98abe720e16129c8c0f50761dee0a2e9ae2478055e31018f6cf977fcf6513e9  gtk-4.24.1.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
index 395e850de0..001cfc00ef 100644
--- a/package/libgtk4/libgtk4.mk
+++ b/package/libgtk4/libgtk4.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGTK4_VERSION_MAJOR = 4.21
-LIBGTK4_VERSION = $(LIBGTK4_VERSION_MAJOR).0
+LIBGTK4_VERSION_MAJOR = 4.24
+LIBGTK4_VERSION = $(LIBGTK4_VERSION_MAJOR).1
 LIBGTK4_SOURCE = gtk-$(LIBGTK4_VERSION).tar.xz
 LIBGTK4_SITE = https://download.gnome.org/sources/gtk/$(LIBGTK4_VERSION_MAJOR)
 LIBGTK4_LICENSE = LGPL-2.0+
@@ -27,7 +27,6 @@ LIBGTK4_DEPENDENCIES = \
 	libfribidi \
 	libglib2 \
 	libpng \
-	librsvg \
 	pango \
 	tiff \
 	$(TARGET_NLS_DEPENDENCIES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
