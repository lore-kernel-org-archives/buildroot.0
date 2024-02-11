Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CCCC4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7431184557;
	Sun, 11 Feb 2024 21:32:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WKwshQxVzPE1; Sun, 11 Feb 2024 21:32:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64683850E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64683850E4;
	Sun, 11 Feb 2024 21:32:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9BD351BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88A79850E4
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:32:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z-8LZSBeLfZW for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:32:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FBE484557
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FBE484557
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:32:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06FA887791; Sun, 11 Feb 2024 21:32:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 22:30:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96a7db5a4b7526ecf744d89d9c19986b91626325
X-Git-Newrev: 632d8f25b7a36708cddf9628dfaa92d84acc5151
X-Patchwork-Hint: ignore
Message-Id: <20240211213233.06FA887791@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpng: bump version to 1.6.42
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=632d8f25b7a36708cddf9628dfaa92d84acc5151
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://raw.githubusercontent.com/pnggroup/libpng/v1.6.42/ANNOUNCE

Removed patch which disabled pngfix and png-fix-itxt tools and use the
new upstream-provided configure option --disable-tools instead:
https://github.com/pnggroup/libpng/commit/22ad62c25e7355b20d1486da301cb69159db0915
https://github.com/pnggroup/libpng/commit/71475b064f3e628e55a2f89f55e873945650afe9

Updated license hash due to copyright year bump:
https://github.com/pnggroup/libpng/commit/0dfe422e9f872d3a851d52fc45047bdfd6da0cf4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 .../0001-Disable-pngfix-and-png-fix-itxt.patch     | 47 ----------------------
 package/libpng/libpng.hash                         |  6 +--
 package/libpng/libpng.mk                           |  3 +-
 4 files changed, 5 insertions(+), 52 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index d099fd3761..5948492d07 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -676,7 +676,6 @@ package/liboping/0004-Fix-compile-error-on-GCC-7.patch Upstream
 package/liboping/0005-src-oping.c-always-use-s-style-format-for-printf-sty.patch Upstream
 package/libp11/0001-src-p11_attr.c-fix-build-with-gcc-4.8.patch Upstream
 package/libplatform/0001-cmake-require-c-11-as-the-minimum-standard.patch Upstream
-package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch Upstream
 package/libpthsem/0001-fix-build-on-linux-3.x-host.patch Upstream
 package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch Upstream
 package/libroxml/0001-src-roxml_mem.h-add-missing-extern.patch Upstream
diff --git a/package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch b/package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch
deleted file mode 100644
index d16bdb2b11..0000000000
--- a/package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 60c3ee917c8e7a4760b1ef7c3dc2b44a615150d3 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Thu, 26 May 2016 16:26:18 -0300
-Subject: [PATCH] Disable pngfix and png-fix-itxt
-
-Disable the new pngfix and png-fix-itxt tools: they take up space, fail
-to build on some oddball toolchain configurations and aren't
-expected/needed in a non-interactive embedded system.
-
-[Julien: update for 1.6.25]
-Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- Makefile.am | 2 +-
- Makefile.in | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 7212951..3430dca 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -18,7 +18,7 @@ check_PROGRAMS += timepng
- endif
- 
- # Utilities - installed
--bin_PROGRAMS= pngfix png-fix-itxt
-+bin_PROGRAMS=
- 
- # This ensures that pnglibconf.h gets built at the start of 'make all' or
- # 'make check', but it does not add dependencies to the individual programs,
-diff --git a/Makefile.in b/Makefile.in
-index a66f6aa..4e67782 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -104,7 +104,7 @@ check_PROGRAMS = pngtest$(EXEEXT) pngunknown$(EXEEXT) \
- 	pngstest$(EXEEXT) pngvalid$(EXEEXT) pngimage$(EXEEXT) \
- 	pngcp$(EXEEXT) $(am__EXEEXT_1)
- @HAVE_CLOCK_GETTIME_TRUE@am__append_1 = timepng
--bin_PROGRAMS = pngfix$(EXEEXT) png-fix-itxt$(EXEEXT)
-+bin_PROGRAMS =
- @PNG_ARM_NEON_TRUE@am__append_2 = arm/arm_init.c\
- @PNG_ARM_NEON_TRUE@	arm/filter_neon.S arm/filter_neon_intrinsics.c \
- @PNG_ARM_NEON_TRUE@	arm/palette_neon_intrinsics.c
--- 
-2.7.3
-
diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index d864850b06..fbae14c51d 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/png-mng/mailman/message/37860896/
-sha256  535b479b2467ff231a3ec6d92a525906fb8ef27978be4f66dbe05d3f3a01b3a1  libpng-1.6.40.tar.xz
+# From https://sourceforge.net/p/png-mng/mailman/message/58731120/
+sha256  c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450  libpng-1.6.42.tar.xz
 # Locally computed:
-sha256  5c0bb4b05b1354ae7c173532b6702ea68b611047ff9b91c4d3af77da39c195d9  LICENSE
+sha256  7317e078e2d3b5d7ba5a6159e650945153262b44b76f6700f8e9edb261c5143e  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index b7bacd9217..c4da9f89c7 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.40
+LIBPNG_VERSION = 1.6.42
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
@@ -15,6 +15,7 @@ LIBPNG_INSTALL_STAGING = YES
 LIBPNG_DEPENDENCIES = host-pkgconf zlib
 HOST_LIBPNG_DEPENDENCIES = host-pkgconf host-zlib
 LIBPNG_CONFIG_SCRIPTS = libpng$(LIBPNG_SERIES)-config libpng-config
+LIBPNG_CONF_OPTS = --disable-tools
 
 ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_aarch64),y)
 LIBPNG_CONF_OPTS += --enable-arm-neon
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
