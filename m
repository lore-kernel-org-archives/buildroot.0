Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491C3606A332
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 17:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=W5jyqaEE
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ED9D40704;
	Fri,  6 Nov 2026 17:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OiCE0xA3M4x7; Fri,  6 Nov 2026 17:26:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F22EA40719
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793985983;
	b=c2u6dOi/nebEbRVOY2g2YFXJbzdMF7bKw8gqiPmuUvQipha0a6rXsOULeQCnkld1R2wX
	 5CpWeWHnbzoEb0CZEYvebefvK24BBXWeYJODIYykjheObYT5anfn44Zglv1OIS0f66vtc
	 pTJ29XaKMUdggk100P7sXTM+rDJA6nB05OPFBahxuc+iSjXhHOC/nPA7M0c+lXdl7PxU9
	 Fai/R+1DfFfphVD5Q5XlHhSlhZGwkvVXwQbFOluqtjvGPJqypufgOoDs1BMolXqjIWX3n
	 c3/PddCPNziBScY4yiB3grS/KqrCJp6UTTl7ht1b33h/c4RDuC8WYb+NRbP4U65rzcg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793985983;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qrBU7afYDaVGU3KHUcLBrbGgz+LWdqn+tIQSwrrkpts=;
	b=ppR3eVA1XUr3nBLYMjCeD38kaDMjXow7nFOvSwDirS5Ys7vIuKAHtZ0iyraPLNIG+hgQ
	 6bmEyflQV6IDmEF89+/vdjkHK7rim9HAsl8SEMTBmnbKMcYXsQbx4aEt3RW/mTLYek9ZJ
	 53D1AVHCqebMiTRQDqkEF5Trs/RcLDgc6625IwLIlA+z4nWUDJZGWn8VnEtVIjb9hJRd6
	 LV2BTVls6LhagWEN3bTZTVtn6FTgznNEQpHbAIIMxL7Ooje24RLXWiZZqER5zRiGlJdGS
	 z0NR3QMYhCYxsdZA4V5ZYO1qhtlF0j82NrBCinnh83H2tiHKzQFY7st26CZ2v0dZfUQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793985983;
	bh=qrBU7afYDaVGU3KHUcLBrbGgz+LWdqn+tIQSwrrkpts=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W5jyqaEEfRtZn2SXLtH3aJ06aXA24vWg8WOFoH2Lf4iq6e04fgUGvs//6vdPS73wp
	 zaTvRHaViPGQTZLnPadJX3oKEeURKffGEy+1bBppgS/NrMRsEV3jQJu3xLjXrVr4OY
	 Z6nTEfJUxeSOa6zSkfXgcoIgjCxOT1/lrVHq4ULVTekiFcYAOH1wf609yWsYGQ18Rc
	 bkfBcD/hu4sl4mwsLKCLQDhK1twFqescQ/wIrECe0n+G86imKNNMibP3Ec7k/XD9re
	 JYFUbK8ZN+HQcO+jTzzM9zrcH+MzDC3u3y4sX9lTCFdXc0jbMNFOCLxyknbXPL5hZl
	 oba8z13xBMlpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F22EA40719;
	Fri,  6 Nov 2026 17:26:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AEDB34D
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CB1440719
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:26:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bkO3oCdKobYd for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 17:26:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E962940704
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E962940704
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:26:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F3C29E0BB; Fri,  6 Nov 2026 17:24:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 18:25:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2131698e11948a2158ad45abf1026d8d5cf81ccf
X-Git-Newrev: 9362e608cfcb8e045c4b02c40b859614f93330a7
X-Patchwork-Hint: ignore
Message-Id: <20261106172449.1F3C29E0BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpiod2: bump to version 2.3.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9362e608cfcb8e045c4b02c40b859614f93330a7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Drop both patches, which are included in this release:
- 0001 as upstream commit 6276b2514c8f ("build: do not require a C++
  compiler if it is not needed")
- 0002 as upstream commit fd67984496dc ("build: honor default_library
  for the installed libraries")

Release notes:
https://web.git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v2.3.2

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...t-require-a-C-compiler-if-it-is-not-neede.patch |  46 -------
 ...-default_library-for-the-installed-librar.patch | 138 ---------------------
 package/libgpiod2/libgpiod2.hash                   |   2 +-
 package/libgpiod2/libgpiod2.mk                     |   2 +-
 4 files changed, 2 insertions(+), 186 deletions(-)

diff --git a/package/libgpiod2/0001-build-do-not-require-a-C-compiler-if-it-is-not-neede.patch b/package/libgpiod2/0001-build-do-not-require-a-C-compiler-if-it-is-not-neede.patch
deleted file mode 100644
index ccc4430a8c..0000000000
--- a/package/libgpiod2/0001-build-do-not-require-a-C-compiler-if-it-is-not-neede.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From fce6b611e2530602c44fd914222529028173c509 Mon Sep 17 00:00:00 2001
-From: Edgar Bonet <bonet@grenoble.cnrs.fr>
-Date: Wed, 19 Aug 2026 18:15:25 +0200
-Subject: [PATCH] build: do not require a C++ compiler if it is not needed
-
-Languages specified in the meson project() function are considered hard
-dependencies. When trying to build libgpiod in an environment lacking a
-C++ compiler, the build fails with an obscure error message ("ERROR:
-Unable to get gcc pre-processor defines").
-
-As the C++ compiler is only needed for building the C++ bindings, do not
-require it unless the option bindings-cxx is enabled.
-
-Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
-Upstream: https://lore.kernel.org/linux-gpio/0eb5c26d-731c-4ebb-be34-76466cf57720@grenoble.cnrs.fr/
----
- meson.build | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index c030b50..fed612f 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1,7 +1,7 @@
- # SPDX-License-Identifier: GPL-2.0-or-later
- # SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
- 
--project('libgpiod', ['c', 'cpp'],
-+project('libgpiod', 'c',
-   version: '2.3.1',
-   license: 'LGPL-2.1-or-later',
-   default_options: [
-@@ -56,6 +56,10 @@ opt_dbus                = get_option('dbus')
- opt_introspection       = get_option('introspection')
- opt_systemd             = get_option('systemd')
- 
-+if opt_bindings_cxx.allowed()
-+  add_languages('cpp')
-+endif
-+
- if get_option('profiling')
-   profiling_c_args    = ['-fprofile-arcs', '-ftest-coverage']
-   profiling_link_args = ['-lgcov']
--- 
-2.43.0
-
diff --git a/package/libgpiod2/0002-build-honor-default_library-for-the-installed-librar.patch b/package/libgpiod2/0002-build-honor-default_library-for-the-installed-librar.patch
deleted file mode 100644
index f369ee4248..0000000000
--- a/package/libgpiod2/0002-build-honor-default_library-for-the-installed-librar.patch
+++ /dev/null
@@ -1,138 +0,0 @@
-From a92938c5d7bbb5a918937657a8940dc6072929ca Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Sat, 24 Oct 2026 10:28:49 +0200
-Subject: [PATCH] build: honor default_library for the installed
- libraries
-
-The installed libraries (libgpiod, libgpiodcxx, libgpiod-glib and
-libgpiodbus) are built with both_libraries(), so the shared variant is
-always built, even with -Ddefault_library=static. When the toolchain
-or the environment requests a fully static link (e.g. LDFLAGS=-static,
-as done by Buildroot for static-only builds), linking the shared
-library then fails:
-
-  FAILED: lib/libgpiod.so.3.1.2
-  [...] crtbeginT.o: relocation R_ARC_32_ME against `__TMC_END__' can not be used when making a shared object; recompile with -fPIC
-
-Use library() instead, which follows default_library, and set
-default_library=both in the project's default options, so that a
-default build still installs both the shared and static libraries. As
-library() returns an object behaving like the shared library when both
-are built, the users of these objects (link_with, pkgconfig.generate,
-generate_gir, full_path) keep working as before.
-
-With a default build, the only change in the installed files is that
-libgpiotools, already declared with library(), is now also installed as
-a static library, like the other libraries.
-
-Fixes: 97bab4cc87dd ("build: replace autotools with meson & ninja")
-Assisted-by: Claude:claude-opus-5-5
-Upstream: https://lore.kernel.org/linux-gpio/20261024123124.3700266-1-yegorslists@googlemail.com/
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- bindings/cxx/meson.build  | 3 +--
- bindings/glib/meson.build | 3 +--
- dbus/lib/meson.build      | 3 +--
- lib/meson.build           | 3 +--
- meson.build               | 1 +
- 5 files changed, 5 insertions(+), 8 deletions(-)
-
-diff --git a/bindings/cxx/meson.build b/bindings/cxx/meson.build
-index 92625b5..a23c70a 100644
---- a/bindings/cxx/meson.build
-+++ b/bindings/cxx/meson.build
-@@ -3,7 +3,7 @@
- 
- cxx_inc = include_directories('.', '../../include')
- 
--libgpiodcxx_both = both_libraries('gpiodcxx',
-+libgpiodcxx_lib = library('gpiodcxx',
-   sources: [
-     'chip.cpp',
-     'chip-info.cpp',
-@@ -29,7 +29,6 @@ libgpiodcxx_both = both_libraries('gpiodcxx',
-   soversion: libgpiodcxx_soversion,
-   install: true,
- )
--libgpiodcxx_lib = libgpiodcxx_both.get_shared_lib()
- 
- install_headers('gpiod.hpp')
- 
-diff --git a/bindings/glib/meson.build b/bindings/glib/meson.build
-index 0ccd8e8..17e071c 100644
---- a/bindings/glib/meson.build
-+++ b/bindings/glib/meson.build
-@@ -61,7 +61,7 @@ glib_public_headers = files(
- 
- glib_inc = include_directories('.', '../../include')
- 
--libgpiod_glib_both = both_libraries('gpiod-glib',
-+libgpiod_glib_lib = library('gpiod-glib',
-   sources: glib_sources + [gen_enum_c, gen_enum_h],
-   include_directories: glib_inc,
-   c_args: ['-DG_LOG_DOMAIN="gpiod-glib"', '-DGPIODGLIB_COMPILATION'] + profiling_c_args,
-@@ -71,7 +71,6 @@ libgpiod_glib_both = both_libraries('gpiod-glib',
-   soversion: libgpiod_glib_soversion,
-   install: true,
- )
--libgpiod_glib_lib = libgpiod_glib_both.get_shared_lib()
- 
- install_headers('gpiod-glib.h')
- 
-diff --git a/dbus/lib/meson.build b/dbus/lib/meson.build
-index 9acf5e1..12cff4a 100644
---- a/dbus/lib/meson.build
-+++ b/dbus/lib/meson.build
-@@ -14,7 +14,7 @@ generated_dbus = gnome.gdbus_codegen('generated-gpiodbus',
- 
- dbus_lib_inc = include_directories('.', '../../include')
- 
--libgpiodbus_both = both_libraries('gpiodbus',
-+libgpiodbus_lib = library('gpiodbus',
-   sources: ['gpiodbus.h', generated_dbus],
-   include_directories: dbus_lib_inc,
-   c_args: ['-DG_LOG_DOMAIN="gpiodbus"'],
-@@ -22,7 +22,6 @@ libgpiodbus_both = both_libraries('gpiodbus',
-   soversion: 1,
-   install: true,
- )
--libgpiodbus_lib = libgpiodbus_both.get_shared_lib()
- 
- install_data('io.gpiod1.xml',
-   install_dir: get_option('datadir') / 'dbus-1' / 'interfaces',
-diff --git a/lib/meson.build b/lib/meson.build
-index ea1d92c..fb09b71 100644
---- a/lib/meson.build
-+++ b/lib/meson.build
-@@ -1,7 +1,7 @@
- # SPDX-License-Identifier: GPL-2.0-or-later
- # SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
- 
--libgpiod_both = both_libraries('gpiod',
-+libgpiod_lib = library('gpiod',
-   sources: [
-     'chip.c',
-     'chip-info.c',
-@@ -22,7 +22,6 @@ libgpiod_both = both_libraries('gpiod',
-   soversion: libgpiod_soversion,
-   install: true,
- )
--libgpiod_lib = libgpiod_both.get_shared_lib()
- 
- pkgconfig = import('pkgconfig')
- pkgconfig.generate(libgpiod_lib,
-diff --git a/meson.build b/meson.build
-index 7045d29..7633702 100644
---- a/meson.build
-+++ b/meson.build
-@@ -6,6 +6,7 @@ project('libgpiod', 'c',
-   license: 'LGPL-2.1-or-later',
-   default_options: [
-     'c_std=gnu89',
-+    'default_library=both',
-     'cpp_std=gnu++17',
-     'warning_level=2',
-   ],
--- 
-2.34.1
-
diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
index 48f7c77855..baa8fe3cad 100644
--- a/package/libgpiod2/libgpiod2.hash
+++ b/package/libgpiod2/libgpiod2.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256  e3a358a90a9204ff16f92b6f4028ed91460b1926f10589eb54b3566484650a30  libgpiod-2.3.1.tar.xz
+sha256  dc48fb87cd72019745acb201599caf559556b5d913844df0ed011067d19e9a6b  libgpiod-2.3.2.tar.xz
 # Hash for license file
 sha256  f646ad5159efb51c1130a4b43c31f0759750b1e254d2acf510f368ee2e2085c3  COPYING
diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
index d74c98684c..0372344fe4 100644
--- a/package/libgpiod2/libgpiod2.mk
+++ b/package/libgpiod2/libgpiod2.mk
@@ -6,7 +6,7 @@
 
 # Be careful when bumping versions.
 # Dependency on kernel header versions may change.
-LIBGPIOD2_VERSION = 2.3.1
+LIBGPIOD2_VERSION = 2.3.2
 LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
 LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD2_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
