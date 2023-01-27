Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C193C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAFB2612CF;
	Tue, 21 Feb 2023 01:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAFB2612CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j23Wh9aCpLmf; Tue, 21 Feb 2023 01:14:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B35D6F963;
	Tue, 21 Feb 2023 01:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B35D6F963
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC4321BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 117E5610B2
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 117E5610B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Fu7WDZxEgkm for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED1C36FBC3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED1C36FBC3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB2D3828C8; Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 13:43:56 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1e3d5b7c6d6f7f1be82010c2d18e64f72f950aef
X-Git-Newrev: 33703b32bf5fbb18a25546403527e7140292eba0
X-Patchwork-Hint: ignore
Message-Id: <20230220205240.EB2D3828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libpsl: bump to
 version 0.21.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=33703b32bf5fbb18a25546403527e7140292eba0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Drop patch (already in version)
- Update hash of COPYING (update in year:
  https://github.com/rockdaboot/libpsl/commit/927b202c69bcd9be4c30ba51c74925f2575e1a69)
- builtin is a boolean since
  https://github.com/rockdaboot/libpsl/commit/aa4909766c24c17bd1d9000ca419f6dc6b32c238

https://github.com/rockdaboot/libpsl/releases/tag/0.21.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-Add-libiconv-dep-to-meson-build-again.patch | 60 ----------------------
 package/libpsl/libpsl.hash                         |  4 +-
 package/libpsl/libpsl.mk                           |  9 ++--
 3 files changed, 7 insertions(+), 66 deletions(-)

diff --git a/package/libpsl/0001-Add-libiconv-dep-to-meson-build-again.patch b/package/libpsl/0001-Add-libiconv-dep-to-meson-build-again.patch
deleted file mode 100644
index 72f50aa593..0000000000
--- a/package/libpsl/0001-Add-libiconv-dep-to-meson-build-again.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 5b63816e82287808e81b8603a528af3cc6fab354 Mon Sep 17 00:00:00 2001
-From: Zhao Zhili <zhilizhao@tencent.com>
-Date: Thu, 7 Jan 2021 20:59:17 +0800
-Subject: [PATCH] Add libiconv dep to meson build again
-
-Build success on macOS and ubuntu.
-
-[Retrieved from:
-https://github.com/rockdaboot/libpsl/commit/5b63816e82287808e81b8603a528af3cc6fab354]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- meson.build     | 14 ++++++++++++++
- src/meson.build |  2 +-
- 2 files changed, 15 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index f248171..fb2de31 100644
---- a/meson.build
-+++ b/meson.build
-@@ -20,6 +20,7 @@ libicu_dep = notfound
- libidn_dep = notfound
- libunistring = notfound
- networking_deps = notfound
-+libiconv_dep = notfound
- 
- # FIXME: Cleanup this when Meson gets 'feature-combo':
- # https://github.com/mesonbuild/meson/issues/4566
-@@ -86,6 +87,19 @@ endif
- if libidn2_dep.found() or libidn_dep.found()
-   # Check for libunistring, we need it for psl_str_to_utf8lower()
-   libunistring = cc.find_library('unistring')
-+  found_iconv = false
-+  if cc.has_function('iconv_open')
-+    libiconv_dep = []
-+    found_iconv = true
-+  endif
-+  if not found_iconv and cc.has_header_symbol('iconv.h', 'iconv_open')
-+    libiconv_dep = [cc.find_library('iconv')]
-+    found_iconv = true
-+  endif
-+
-+  if not found_iconv
-+    error('iconv implementation not found')
-+  endif
- endif
- 
- if host_machine.system() == 'windows'
-diff --git a/src/meson.build b/src/meson.build
-index 0d1dcdf..746bf44 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -19,7 +19,7 @@ cargs = [
- libpsl = library('psl', sources, suffixes_dafsa_h,
-   include_directories : [configinc, includedir],
-   c_args : cargs,
--  dependencies : [libidn2_dep, libidn_dep, libicu_dep, libunistring, networking_deps],
-+  dependencies : [libidn2_dep, libidn_dep, libicu_dep, libunistring, networking_deps, libiconv_dep],
-   version: lt_version,
-   install: true,
- )
diff --git a/package/libpsl/libpsl.hash b/package/libpsl/libpsl.hash
index 552935e9ec..a35a609ff2 100644
--- a/package/libpsl/libpsl.hash
+++ b/package/libpsl/libpsl.hash
@@ -1,6 +1,6 @@
 # Locally generated
-sha256  ac6ce1e1fbd4d0254c4ddb9d37f1fa99dec83619c1253328155206b896210d4c  libpsl-0.21.1.tar.gz
+sha256  e35991b6e17001afa2c0ca3b10c357650602b92596209b7492802f3768a6285f  libpsl-0.21.2.tar.gz
 
 # Hashes for license files:
-sha256  7903413e7aa0bbcb77aa19150a3f1034edc0a760cff174f9a53efe4de6f056a4  COPYING
+sha256  776cd11d54f0ea3e5efdd25ff1a0d952a1744215bb5858ea7aeb91808e70c9f7  COPYING
 sha256  1d7f52747a9169751cdf2641a8299c0098e9ecdf9429296ffd55bdb14c9ed5b3  src/LICENSE.chromium
diff --git a/package/libpsl/libpsl.mk b/package/libpsl/libpsl.mk
index 742117e8ea..ef3c524b4f 100644
--- a/package/libpsl/libpsl.mk
+++ b/package/libpsl/libpsl.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-LIBPSL_VERSION = 0.21.1
+LIBPSL_VERSION = 0.21.2
 LIBPSL_SITE = https://github.com/rockdaboot/libpsl/releases/download/$(LIBPSL_VERSION)
 LIBPSL_LICENSE = MIT, BSD-3-Clause
 LIBPSL_LICENSE_FILES = COPYING src/LICENSE.chromium
+LIBPSL_CONF_OPTS = -Dbuiltin=true
 LIBPSL_DEPENDENCIES = host-pkgconf
 LIBPSL_INSTALL_STAGING = YES
 
@@ -17,13 +18,13 @@ endif
 
 # The order of checks is the same as done by libpsl when configured.
 ifeq ($(BR2_PACKAGE_LIBIDN2)$(BR2_PACKAGE_LIBUNISTRING),yy)
-LIBPSL_CONF_OPTS += -Druntime=libidn2 -Dbuiltin=libidn2
+LIBPSL_CONF_OPTS += -Druntime=libidn2
 LIBPSL_DEPENDENCIES += libidn2 libunistring
 else ifeq ($(BR2_PACKAGE_ICU),y)
-LIBPSL_CONF_OPTS += -Druntime=libicu -Dbuiltin=libicu
+LIBPSL_CONF_OPTS += -Druntime=libicu
 LIBPSL_DEPENDENCIES += icu
 else
-LIBPSL_CONF_OPTS += -Druntime=libidn -Dbuiltin=libidn
+LIBPSL_CONF_OPTS += -Druntime=libidn
 LIBPSL_DEPENDENCIES += libidn libunistring
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
