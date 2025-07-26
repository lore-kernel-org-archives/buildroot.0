Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DBEC87FCA
	for <buildroot@archiver.kernel.org>; Sat, 26 Jul 2025 12:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 475A640D2D;
	Sat, 26 Jul 2025 12:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dNlNRXEzhtOO; Sat, 26 Jul 2025 12:04:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ED7A40D3C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ED7A40D3C;
	Sat, 26 Jul 2025 12:04:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F3ABDA
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 12:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 015546080F
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 12:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r_qlsILHh9hV for <buildroot@buildroot.org>;
 Sat, 26 Jul 2025 12:04:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10B926068D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10B926068D
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 12:04:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0791286AD9; Sat, 26 Jul 2025 12:04:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Jul 2025 13:54:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cd8a7d748bdbde26a48fe1da056a4802525b2a6
X-Git-Newrev: 7de76ae8d110e9eef9be060e8b62ccb46b99f07d
X-Patchwork-Hint: ignore
Message-Id: <20250726120444.0791286AD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/libva: fix build error"
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

commit: https://git.buildroot.net/buildroot/commit/?id=7de76ae8d110e9eef9be060e8b62ccb46b99f07d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit c41f953ab9ba262324484a2efe1151d8f543eebd.

This commit broke gst1-vaapi:
https://lists.buildroot.org/pipermail/buildroot/2025-July/782786.html

Reported-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...001-va-remove-older-0.32-and-0.33-support.patch | 239 ---------------------
 1 file changed, 239 deletions(-)

diff --git a/package/libva/0001-va-remove-older-0.32-and-0.33-support.patch b/package/libva/0001-va-remove-older-0.32-and-0.33-support.patch
deleted file mode 100644
index 75fb8c9499..0000000000
--- a/package/libva/0001-va-remove-older-0.32-and-0.33-support.patch
+++ /dev/null
@@ -1,239 +0,0 @@
-From 0340bca0ee4f7d66fe029ce4c7fece01c896f00a Mon Sep 17 00:00:00 2001
-From: Carl Zhang <carl.zhang@intel.com>
-Date: Mon, 13 May 2024 16:19:13 +0800
-Subject: [PATCH] va: remove older 0.32 and 0.33 support
-
-libva version 2.x should be compatible with 2.x series , not 1.x series
-and 0.x series
-reserve va_compat.h , because maybe some existing usage refer this file
-
-Upstream: https://github.com/intel/libva/pull/812
-
-Signed-off-by: Carl Zhang <carl.zhang@intel.com>
-[Bernd: rebased after upstream commit
- https://github.com/intel/libva/commit/a6192260e7cde16ceb9db80eec02b44192087590]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- va/Makefile.am |  4 ---
- va/libva.syms  |  9 -------
- va/meson.build |  8 ------
- va/va_compat.c | 45 -------------------------------
- va/va_compat.h | 73 +-------------------------------------------------
- 5 files changed, 1 insertion(+), 138 deletions(-)
- delete mode 100644 va/libva.syms
- delete mode 100644 va/va_compat.c
-
-diff --git a/va/Makefile.am b/va/Makefile.am
-index 8d16d422c..4ebf8f09a 100644
---- a/va/Makefile.am
-+++ b/va/Makefile.am
-@@ -32,7 +32,6 @@ LDADD = \
- 
- libva_source_c = \
- 	va.c			\
--	va_compat.c		\
- 	va_str.c		\
- 	va_trace.c		\
- 	$(NULL)
-@@ -75,7 +74,6 @@ libva_source_h_priv = \
- 
- libva_ldflags = \
- 	$(LDADD) -no-undefined	\
--	-Wl,-version-script,${srcdir}/libva.syms \
- 	$(NULL)
- 
- libva_cflags = \
-@@ -91,7 +89,6 @@ noinst_HEADERS			= $(libva_source_h_priv)
- libva_la_SOURCES		= $(libva_source_c)
- libva_la_CFLAGS			= $(libva_cflags)
- libva_la_LDFLAGS		= $(libva_ldflags)
--libva_la_DEPENDENCIES		= libva.syms
- libva_la_LIBADD			= $(LIBVA_LIBS)
- 
- if USE_DRM
-@@ -146,7 +143,6 @@ DISTCLEANFILES = \
- 	$(NULL)
- 
- EXTRA_DIST = \
--	libva.syms		\
- 	va_version.h.in		\
- 	meson.build		\
-         libva.def               \
-diff --git a/va/libva.syms b/va/libva.syms
-deleted file mode 100644
-index b3f91f935..000000000
---- a/va/libva.syms
-+++ /dev/null
-@@ -1,9 +0,0 @@
--VA_API_0.32.0 {
--    local:
--        vaCreateSurfaces_0_32_0;
--};
--
--VA_API_0.33.0 {
--    global:
--        vaCreateSurfaces;
--} VA_API_0.32.0;
-diff --git a/va/meson.build b/va/meson.build
-index e15f8fe3e..43db2a3ef 100644
---- a/va/meson.build
-+++ b/va/meson.build
-@@ -11,7 +11,6 @@ version_file = configure_file(
- 
- libva_sources = [
-   'va.c',
--  'va_compat.c',
-   'va_str.c',
-   'va_trace.c',
- ]
-@@ -55,15 +54,8 @@ libva_headers_priv = [
-   'va_trace.h',
- ]
- 
--libva_sym = 'libva.syms'
--libva_sym_arg = '-Wl,-version-script,' + '@0@/@1@'.format(meson.current_source_dir(), libva_sym)
--
- libva_link_args = []
- libva_link_depends = []
--if cc.links('void vaCreateSurfaces_0_32_0(void) {} void vaCreateSurfaces() {}', name: '-Wl,--version-script', args: ['-shared', libva_sym_arg])
--  libva_link_args = libva_sym_arg
--  libva_link_depends = libva_sym
--endif
- 
- install_headers(libva_headers, subdir : 'va')
- 
-diff --git a/va/va_compat.c b/va/va_compat.c
-deleted file mode 100644
-index 44d69562b..000000000
---- a/va/va_compat.c
-+++ /dev/null
-@@ -1,45 +0,0 @@
--/*
-- * Copyright (c) 2007-2011 Intel Corporation. All Rights Reserved.
-- *
-- * Permission is hereby granted, free of charge, to any person obtaining a
-- * copy of this software and associated documentation files (the
-- * "Software"), to deal in the Software without restriction, including
-- * without limitation the rights to use, copy, modify, merge, publish,
-- * distribute, sub license, and/or sell copies of the Software, and to
-- * permit persons to whom the Software is furnished to do so, subject to
-- * the following conditions:
-- *
-- * The above copyright notice and this permission notice (including the
-- * next paragraph) shall be included in all copies or substantial portions
-- * of the Software.
-- *
-- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-- * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT.
-- * IN NO EVENT SHALL INTEL AND/OR ITS SUPPLIERS BE LIABLE FOR
-- * ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
-- * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-- */
--
--#define VA_COMPAT_DISABLED 1
--#include "sysdeps.h"
--#include "va.h"
--#include "va_compat.h"
--
--VAStatus
--vaCreateSurfaces_0_32_0(
--    VADisplay    dpy,
--    int          width,
--    int          height,
--    int          format,
--    int          num_surfaces,
--    VASurfaceID *surfaces
--)
--{
--    return vaCreateSurfaces(dpy, format, width, height, surfaces, num_surfaces,
--                            NULL, 0);
--}
--#if !defined(_WIN32)
--VA_CPP_HELPER_ALIAS(vaCreateSurfaces, 0, 32, 0);
--#endif
-diff --git a/va/va_compat.h b/va/va_compat.h
-index 41a3f73e7..02cf5667e 100644
---- a/va/va_compat.h
-+++ b/va/va_compat.h
-@@ -36,78 +36,7 @@
- extern "C" {
- #endif
- 
--/**
-- * \defgroup api_compat Compatibility API
-- *
-- * The Compatibility API allows older programs that are not ported to
-- * the current API to still build and run correctly. In particular,
-- * this exposes older API to allow for backwards source compatibility.
-- *
-- * @{
-- */
--
--/**
-- * Makes a string literal out of the macro argument
-- */
--#define VA_CPP_HELPER_STRINGIFY(x) \
--    VA_CPP_HELPER_STRINGIFY_(x)
--#define VA_CPP_HELPER_STRINGIFY_(x) \
--    #x
--
--/**
-- * Concatenates two macro arguments at preprocessing time.
-- */
--#define VA_CPP_HELPER_CONCAT(a, b) \
--    VA_CPP_HELPER_CONCAT_(a, b)
--#define VA_CPP_HELPER_CONCAT_(a, b) \
--    a ## b
--
--/**
-- * Generates the number of macro arguments at preprocessing time.
-- * <http://groups.google.com/group/comp.std.c/browse_thread/thread/77ee8c8f92e4a3fb/346fc464319b1ee5>
-- *
-- * Note: this doesn't work for macros with no arguments
-- */
--#define VA_CPP_HELPER_N_ARGS(...) \
--    VA_CPP_HELPER_N_ARGS_(__VA_ARGS__, VA_CPP_HELPER_N_ARGS_LIST_REV())
--#define VA_CPP_HELPER_N_ARGS_(...) \
--    VA_CPP_HELPER_N_ARGS_LIST(__VA_ARGS__)
--#define VA_CPP_HELPER_N_ARGS_LIST(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a12, a13, a14, a15, a16, N, ...) N
--#define VA_CPP_HELPER_N_ARGS_LIST_REV() \
--    15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0
--
--/**
-- * Generates a versioned function alias.
-- *
-- * VA_CPP_HELPER_ALIAS(vaSomeFunction, 0,32,0) will generate
-- *   .symber vaSomeFunction_0_32_0, vaSomeFunction@VA_API_0.32.0
-- */
--#define VA_CPP_HELPER_ALIAS(func, major, minor, micro) \
--    VA_CPP_HELPER_ALIAS_(func, major, minor, micro, "@")
--#define VA_CPP_HELPER_ALIAS_DEFAULT(func, major, minor, micro) \
--    VA_CPP_HELPER_ALIAS_(func, major, minor, micro, "@@")
--#define VA_CPP_HELPER_ALIAS_(func, major, minor, micro, binding)        \
--    asm(".symver " #func "_" #major "_" #minor "_" #micro ", "          \
--        #func binding "VA_API_" #major "." #minor "." #micro)
--
--/* vaCreateSurfaces() */
--
--#ifndef VA_COMPAT_DISABLED
--#define vaCreateSurfaces(dpy, ...)                                      \
--    VA_CPP_HELPER_CONCAT(vaCreateSurfaces,                              \
--                         VA_CPP_HELPER_N_ARGS(dpy, __VA_ARGS__))        \
--    (dpy, __VA_ARGS__)
--#endif
--
--#define vaCreateSurfaces6(dpy, width, height, format, num_surfaces, surfaces) \
--    (vaCreateSurfaces)(dpy, format, width, height, surfaces, num_surfaces, \
--                       NULL, 0)
--
--#define vaCreateSurfaces8(dpy, format, width, height, surfaces, num_surfaces, attribs, num_attribs) \
--    (vaCreateSurfaces)(dpy, format, width, height, surfaces, num_surfaces, \
--                       attribs, num_attribs)
--
--/*@}*/
-+#warning deprecated, keep a empty file because some application may include it
- 
- #ifdef __cplusplus
- }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
