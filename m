Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B89606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=A/9XBouR
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B522540E25;
	Fri, 30 Oct 2026 14:20:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M98ejtonmAQQ; Fri, 30 Oct 2026 14:20:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A894D40E26
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370051;
	b=PpKWz8StXKuSE8VXi39y7F7EhasBGNc+foyTuhPePeC3aDEUeiFMwYA2fxK+sUqbJZCi
	 VGGEC9g5rt0CtpoTwtcK1pz9nqNuM+kiJSFboWLzgF1mtCx9xJAdZEFbq1+4KLH51uV+b
	 GbCc0QeeySom/mLN9iAoUXXaaKWJNj3tvjtMhFCACrVLesMHEvdf/BRU7u2n6lv2kHi4S
	 3Oe2xZxtkcCUMbj96VjnFFXdAJIYqokHHSX2fdiSh3WuRcq1rOhOEmPNaiJFupv5G86Nu
	 ugxKEwAEawtHvqrjQ4YS3XtbA643L2CXwub84AQVncOeCYP2p5eB20Z1OX2LFl7oHCA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370051;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=RtAX4FirJ2ROnd2gM1wwttlZCwFv3KP2FkRtWbNIGl8=;
	b=OYseTG4OSpfk8GXp6GMC30Epjx7J7hg6C3yyZUvKq/pyU1zGYlAa3w0a5q8A/sFbw0NZ
	 Ts66GinxrjNku3zlIui1YY+UBCmJpWpo6rL7Pi/zgyX9J2xkKTSDXn0uN//fDuf5HfP0H
	 y3W2+RoSX4pdlxGa7G1r1+109KFYSdld+tK+IzX/67BMkd+lXmvhwZ4wCbNenn8N18cpK
	 WrkJUhnQ/P3NLmT6cvX83wzVpTRN7lGCc3IuaKk1qR2YJ3SuWzN8Rntgso5x3tHvI22g8
	 UDIpkzhAHD49YcKMkFwyM21DG8NFCD4M8YTzxYT17oPeMgrFVxqOGZqqt/FVFXREpcg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370051;
	bh=RtAX4FirJ2ROnd2gM1wwttlZCwFv3KP2FkRtWbNIGl8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A/9XBouRpBwlcUXwDEOsbFLNr3IiQX4xUGxVNstKelAiykkarSbfV/4NTibTtJ2uM
	 9UTyNKk6xbmaDa55VPQ2vPO65dtmZUCusbWfbzVzQE+3SUBPqrGoIWXXhca26zISdb
	 Uuo6Wlbah9r3wOMhpeNl0AKjwdpZpBWpW0tFZSpi4KOAtProQjH0E0FsPhVp5byrrp
	 +S9V2NzrdWfY1WpTlyymwZVFM/3HI0XVweotrQ4X5x9EMYhkDmV9m7TjyuMyb3vrq1
	 yWBOprwis8OGmwXlbrOFUuSUCQg7/QZmiV6pl7tRJGnY/tWKKplRwf3XL0mhlmwEsr
	 GLjLfVUZqN11w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A894D40E26;
	Fri, 30 Oct 2026 14:20:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB1D1362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B12BC812F1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C2wNYyHw8xyD for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1360D8136F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369896;
 b=cikfbrAk2FY9RiSkNlJc4d4EUzrxDjj0PBzzA5gYc1M16ZCorphQkiaJ4QvaQD6leTyT
 mt2VK3ETfox9u1yaLPOLinsMi3gxyO205XBBOXh2RMiW9UrhxqddZBVOGvcfG8wZkddjv
 6kg+llK6vlnL6NDe+KntXDomYxB4ykbLvvkfPl+gyf8GqJDbKbkyfsDasP3JvMh0QOqwT
 UAGwmDAf0p1IKeNHMc3B+C2da16pmzrR0OFZALPXFZS7L1ljR1SeBfjpsVV3v7xY7TVBn
 yhdl5NmVRtM4H2nT2Ee0ueKruyGn8G/twFfj+BHmoxfSD712+B3TlATlPKTOIiBVO1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369896;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=o1zKYYj2BTSEWl7QQxjbTZPjwETjO1flcjnpjswUnY4=;
 b=erainYIB9gUaLQpVBqGZ8oXNKzap9gvgkIASfBunF9IXRjeZlEeCCNx0jbCCLu5onso1
 SePgtdipjtP6IixpksdgkPdyJ9eZOzKtBquGkT7j0gzm8mwo5KpmeftWwssYiINJdHQMS
 ifQplpvMCcvYDFcb6q8ZXPZXQ98kXYuQuDaN9WcTFIBxqN/9rjeHCTs2IWFjI5gFAHcwF
 ciyaF2eC0R6ESGa+5ld3o1TWRSTDVE024uE24XcJHUFpUhqSfk+noZDf5YKInsvU4WSEa
 +VJQF8VPU6wKoHWEEQB45c2EQr+pM7B51mwSs5z+soUCuUnIj2SXjFMA9pg+xwYHp5A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1360D8136F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 326FF9D388; Fri, 30 Oct 2026 14:16:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:11 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 83f2b5b51b11543c4e80f1d22e177473e4bcba39
X-Git-Newrev: 5ad6a78f17ea109411f693b57615d0d97df5753b
X-Patchwork-Hint: ignore
Message-Id: <20261030141648.326FF9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libgpiod2: fix
 static build
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
Content-Type: multipart/mixed; boundary="===============8525049681852786570=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8525049681852786570==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5ad6a78f17ea109411f693b57615d0d97df5753b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

libgpiod 2.3 switched to meson, and builds its libraries with
both_libraries(), so the shared library is always built, even with
-Ddefault_library=static. With BR2_STATIC_LIBS, linking it with -static
then fails, e.g. on ARC:

  FAILED: [code=1] lib/libgpiod.so.3.1.2
  [...] crtbeginT.o: relocation R_ARC_32_ME against `__TMC_END__' can not be used when making a shared object; recompile with -fPIC
  [...] BFD (GNU Binutils) 2.47.20260726 assertion fail elf32-arc.c:1815
  collect2: fatal error: ld terminated with signal 11 [Segmentation fault], core dumped

Add a patch, sent upstream, using library() instead, so that the
libraries follow default_library and only the static ones are built.
As a side effect, shared builds no longer install the unused static
libraries to staging.

This issue has been present since commit 1d132d04fc0e
("package/libgpiod2: bump to version 2.3.1"), which switched to the
meson build system. It therefore affects 2026.08 and later.

Fixes:
https://autobuild.buildroot.org/results/7dc84554b75a370136bfa2451f4b4c3dde0d92e8

Fixes: 1d132d04fc0ecac014be003b7e1662c47672328b ("package/libgpiod2: bump to version 2.3.1")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 58434cefcbadfcc5854de47fe42db0ab68bc118d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...-default_library-for-the-installed-librar.patch | 138 +++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/package/libgpiod2/0002-build-honor-default_library-for-the-installed-librar.patch b/package/libgpiod2/0002-build-honor-default_library-for-the-installed-librar.patch
new file mode 100644
index 0000000000..f369ee4248
--- /dev/null
+++ b/package/libgpiod2/0002-build-honor-default_library-for-the-installed-librar.patch
@@ -0,0 +1,138 @@
+From a92938c5d7bbb5a918937657a8940dc6072929ca Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Sat, 24 Oct 2026 10:28:49 +0200
+Subject: [PATCH] build: honor default_library for the installed
+ libraries
+
+The installed libraries (libgpiod, libgpiodcxx, libgpiod-glib and
+libgpiodbus) are built with both_libraries(), so the shared variant is
+always built, even with -Ddefault_library=static. When the toolchain
+or the environment requests a fully static link (e.g. LDFLAGS=-static,
+as done by Buildroot for static-only builds), linking the shared
+library then fails:
+
+  FAILED: lib/libgpiod.so.3.1.2
+  [...] crtbeginT.o: relocation R_ARC_32_ME against `__TMC_END__' can not be used when making a shared object; recompile with -fPIC
+
+Use library() instead, which follows default_library, and set
+default_library=both in the project's default options, so that a
+default build still installs both the shared and static libraries. As
+library() returns an object behaving like the shared library when both
+are built, the users of these objects (link_with, pkgconfig.generate,
+generate_gir, full_path) keep working as before.
+
+With a default build, the only change in the installed files is that
+libgpiotools, already declared with library(), is now also installed as
+a static library, like the other libraries.
+
+Fixes: 97bab4cc87dd ("build: replace autotools with meson & ninja")
+Assisted-by: Claude:claude-opus-5-5
+Upstream: https://lore.kernel.org/linux-gpio/20261024123124.3700266-1-yegorslists@googlemail.com/
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ bindings/cxx/meson.build  | 3 +--
+ bindings/glib/meson.build | 3 +--
+ dbus/lib/meson.build      | 3 +--
+ lib/meson.build           | 3 +--
+ meson.build               | 1 +
+ 5 files changed, 5 insertions(+), 8 deletions(-)
+
+diff --git a/bindings/cxx/meson.build b/bindings/cxx/meson.build
+index 92625b5..a23c70a 100644
+--- a/bindings/cxx/meson.build
++++ b/bindings/cxx/meson.build
+@@ -3,7 +3,7 @@
+ 
+ cxx_inc = include_directories('.', '../../include')
+ 
+-libgpiodcxx_both = both_libraries('gpiodcxx',
++libgpiodcxx_lib = library('gpiodcxx',
+   sources: [
+     'chip.cpp',
+     'chip-info.cpp',
+@@ -29,7 +29,6 @@ libgpiodcxx_both = both_libraries('gpiodcxx',
+   soversion: libgpiodcxx_soversion,
+   install: true,
+ )
+-libgpiodcxx_lib = libgpiodcxx_both.get_shared_lib()
+ 
+ install_headers('gpiod.hpp')
+ 
+diff --git a/bindings/glib/meson.build b/bindings/glib/meson.build
+index 0ccd8e8..17e071c 100644
+--- a/bindings/glib/meson.build
++++ b/bindings/glib/meson.build
+@@ -61,7 +61,7 @@ glib_public_headers = files(
+ 
+ glib_inc = include_directories('.', '../../include')
+ 
+-libgpiod_glib_both = both_libraries('gpiod-glib',
++libgpiod_glib_lib = library('gpiod-glib',
+   sources: glib_sources + [gen_enum_c, gen_enum_h],
+   include_directories: glib_inc,
+   c_args: ['-DG_LOG_DOMAIN="gpiod-glib"', '-DGPIODGLIB_COMPILATION'] + profiling_c_args,
+@@ -71,7 +71,6 @@ libgpiod_glib_both = both_libraries('gpiod-glib',
+   soversion: libgpiod_glib_soversion,
+   install: true,
+ )
+-libgpiod_glib_lib = libgpiod_glib_both.get_shared_lib()
+ 
+ install_headers('gpiod-glib.h')
+ 
+diff --git a/dbus/lib/meson.build b/dbus/lib/meson.build
+index 9acf5e1..12cff4a 100644
+--- a/dbus/lib/meson.build
++++ b/dbus/lib/meson.build
+@@ -14,7 +14,7 @@ generated_dbus = gnome.gdbus_codegen('generated-gpiodbus',
+ 
+ dbus_lib_inc = include_directories('.', '../../include')
+ 
+-libgpiodbus_both = both_libraries('gpiodbus',
++libgpiodbus_lib = library('gpiodbus',
+   sources: ['gpiodbus.h', generated_dbus],
+   include_directories: dbus_lib_inc,
+   c_args: ['-DG_LOG_DOMAIN="gpiodbus"'],
+@@ -22,7 +22,6 @@ libgpiodbus_both = both_libraries('gpiodbus',
+   soversion: 1,
+   install: true,
+ )
+-libgpiodbus_lib = libgpiodbus_both.get_shared_lib()
+ 
+ install_data('io.gpiod1.xml',
+   install_dir: get_option('datadir') / 'dbus-1' / 'interfaces',
+diff --git a/lib/meson.build b/lib/meson.build
+index ea1d92c..fb09b71 100644
+--- a/lib/meson.build
++++ b/lib/meson.build
+@@ -1,7 +1,7 @@
+ # SPDX-License-Identifier: GPL-2.0-or-later
+ # SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+ 
+-libgpiod_both = both_libraries('gpiod',
++libgpiod_lib = library('gpiod',
+   sources: [
+     'chip.c',
+     'chip-info.c',
+@@ -22,7 +22,6 @@ libgpiod_both = both_libraries('gpiod',
+   soversion: libgpiod_soversion,
+   install: true,
+ )
+-libgpiod_lib = libgpiod_both.get_shared_lib()
+ 
+ pkgconfig = import('pkgconfig')
+ pkgconfig.generate(libgpiod_lib,
+diff --git a/meson.build b/meson.build
+index 7045d29..7633702 100644
+--- a/meson.build
++++ b/meson.build
+@@ -6,6 +6,7 @@ project('libgpiod', 'c',
+   license: 'LGPL-2.1-or-later',
+   default_options: [
+     'c_std=gnu89',
++    'default_library=both',
+     'cpp_std=gnu++17',
+     'warning_level=2',
+   ],
+-- 
+2.34.1
+

--===============8525049681852786570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8525049681852786570==--
