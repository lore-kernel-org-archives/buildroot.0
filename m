Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDB1606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 17:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SxekjxH0
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 555DE605E0;
	Sun, 25 Oct 2026 17:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WOEiiy_1-0ii; Sun, 25 Oct 2026 17:33:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3BBBF605F9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792949634;
	b=AQsCfJPF1MfTccKRM4r2zcqWO/QDvNPNwlCfbK1OLRL1Y7WsL2T/No9w5eXVVK+JvzD8
	 lZAzcMghv/hWn1sXLnuhUceswBcQVU/STIejYop7Zvl8oQwV5fhQKm80MrXuhhhIu5jnl
	 0tfbhvFNiGtk99YLAz9VXSuDDcvltlRQe7mU6cYLcI2McKB8YAWgEF5gUCDV0Y0XuABkb
	 uvjTy/EHEOtr/XrZNPPJ8SjytB2+lekLhJkS/RdQvQFVEC2G54JfYYi0BhaGrGfuY7mg7
	 7YZwelaVYrHbn+nqVOwn+V09M4c3iLmPUHaCiWnDfgG4+iH3Q+ZmeXj+f6c/4lVoNEQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792949634;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KbXulmg38wUsa2DP14ytXMKP9OJAwopdAujezyTaGdY=;
	b=MdE/tjZW+zQEAK1LrU/IjOQJ4bshBclav1GIx//TWPFSFVKw9sLiRtBDwBT7FZx1BAlC
	 LEL2MsNtdjSgl+IU6I8OS0j27xX/x7elTuJXNdeKqZsUr3DDTtkAEY6RfSUq8Rk47My4+
	 kn6aIXrsizAZyKuXJF8Ex4rqYeVCfkuMPKAIdm7vX5Ys/JpzF9txtmVjtBFpDCItiuSLO
	 1CQbeuBehzoFivuO4RwD3lcVNP3wk6wxf+JDgvu/04qGpRAKvW+7weoAnlXY81oUQM/Ta
	 rH5x/NTJOqe5JRO4lHyRw/sX0AT+Ep4thdfVTE7fzubNwwAZEhzS5geM8OLgPgV/HnQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792949634;
	bh=KbXulmg38wUsa2DP14ytXMKP9OJAwopdAujezyTaGdY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SxekjxH0IBlJA1SeG+mwU8cMdaKRN0AfxebJDoKZhJFjxcA+n0cZwy3txmx3Fjxuw
	 Xl7PY9phbq+4rjcabbAXf2KXiXst1CdBGLSoNVMDpHLMaS3jxDpibPLC1XRRq1mM/H
	 ZQXE+6sckPfug8qtYmnmoDwXnq1U3NBlk8oOio55DcKt0vdcTkN+l1ANQe3Itck3do
	 n8yIg7rCIP/zVc9gxTKec7NTM0nRRIZgOaGSSgw01C+ccGYKZmlCxos7DwtpQxCy5t
	 +mKcR/1EWA5YwQfBy3bziclmsWiiN7vh0jQsbf7eghVYIpaof/MdsLAHCoumn+TKK+
	 DtwaPAR3+GAIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BBBF605F9;
	Sun, 25 Oct 2026 17:33:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F9A5356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B4C6404F4
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RjXBCTWYCvrT for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 17:33:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1FE24404C8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792949631;
 b=Yux8CloSjSjpB2V2MFzxxl5wwT/tlBHOWfnx4yzJZrsfGwBwx9suJYUIwbf6uh3ziUNh
 tB5HOt3ed8I5USzgQF3p3mOxtiE60izLTuJBwOftU3C4wGqV/wydISXYZ7O6BvAgi++b9
 ogfZxfS+ALMDneNXkvEKsAKxTeJ4nBsJUB/5I+Hb68DBH6G4gwIyaXU3ktPX7kUq5A7J4
 jL1U+LKl2dTn4FpqgJvEfzQ+VVOQ6iipVOB9ekrLWX+9a47YSTHtMisvxgh0bbEfAqefM
 hfQqZMTkLFndGP1UBnX2nb1DUOkmATt1W4Jyzy0pirPObIgZTF3pW3GT0ibAJfKv0Aw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792949631;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=PxLYxaLFhZNNp7FiJrraYwUKO2LDKdVtzu3ZSwyL5IU=;
 b=KQc3RrHTw21ckIRSy8iupfzMJnI+vn0gJmTolki1R/f+6KGJDLdwgMPtebHoEjx/uYHA
 3Z9KFuYbhdi98UR2eUy+rQVcBddLx/t2kqnkMS27jGcQx3ZNhOmjir4gdqEByK+eU67Ey
 jKD3t8uXR/UJPZX/Xl/jLmFTc8xu7/WCQ1jrvdHntd4E5/QNUjz7Po75MHfUUBe/WzWLR
 zh7O9mGa5Q3TadGNRuCM4BbG94NkFSee35OFsY+51DbZvL/8ZWymGjiW4wg1rHy9pEOC5
 229BMuLO/9TXihCG9OpNTDXmeydaOdJMgHd75M77xcBxjrDwGX2d/ZazAwwi/qOHXuw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FE24404C8
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:33:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88CF7996B0; Sun, 25 Oct 2026 17:32:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 18:29:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d91f8d7df30250a92afefda697530ced4d8bc22
X-Git-Newrev: 58434cefcbadfcc5854de47fe42db0ab68bc118d
X-Patchwork-Hint: ignore
Message-Id: <20261025173225.88CF7996B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpiod2: fix static build
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/58434cefcbadfcc5854de47fe42db0ab68bc118d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
