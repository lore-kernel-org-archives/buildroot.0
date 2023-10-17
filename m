Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F7BCDB474
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 14:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C94741E3C;
	Tue, 17 Oct 2023 14:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C94741E3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kb3VqK1tY7Wl; Tue, 17 Oct 2023 14:43:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7548341E35;
	Tue, 17 Oct 2023 14:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7548341E35
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C96FA1BF300
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 14:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0A7740167
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 14:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0A7740167
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 13RVJgYtSGai for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 14:43:06 +0000 (UTC)
Received: from dd5108.kasserver.com (dd5108.kasserver.com [85.13.130.47])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36B46400C5
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 14:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36B46400C5
Received: from wslxew206.ultratronik.de (mail.ultratronik.de [82.100.224.114])
 by dd5108.kasserver.com (Postfix) with ESMTPA id E3160524418C;
 Tue, 17 Oct 2023 16:34:26 +0200 (CEST)
From: Andreas Naumann <anaumann@ultratronik.de>
To: buildroot@buildroot.org
Date: Tue, 17 Oct 2023 16:34:24 +0200
Message-Id: <20231017143424.430007-2-anaumann@ultratronik.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017143424.430007-1-anaumann@ultratronik.de>
References: <20231017143424.430007-1-anaumann@ultratronik.de>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/libgpiod: Bumped to Version 2.0.2
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
Cc: bstruempfl@ultratronik.de, Boerge Struempfel <bstruempfel@ultratronik.de>,
 Andreas Naumann <anaumann@ultratronik.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Boerge Struempfel <bstruempfel@ultratronik.de>

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 ...nfigure-switch-for-building-examples.patch | 91 -------------------
 package/libgpiod/libgpiod.hash                |  4 +-
 package/libgpiod/libgpiod.mk                  |  2 +-
 3 files changed, 3 insertions(+), 94 deletions(-)
 delete mode 100644 package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch

diff --git a/package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch b/package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch
deleted file mode 100644
index a21c767006..0000000000
--- a/package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 5e9e7223a3633ee82b557d21b1f18aa15becd450 Mon Sep 17 00:00:00 2001
-From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
-Date: Mon, 7 Dec 2020 20:38:30 +0100
-Subject: build: add a configure switch for building examples
-
-Example code for bindings is currently always built if bindings are
-enabled. Make it conditional with a new configure switch.
-
-Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
-Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
-[Retrieved from:
-https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?id=5e9e7223a3633ee82b557d21b1f18aa15becd450]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- bindings/cxx/Makefile.am    |  8 +++++++-
- bindings/python/Makefile.am | 10 ++++++++--
- configure.ac                |  6 ++++++
- 3 files changed, 21 insertions(+), 3 deletions(-)
-
-diff --git a/bindings/cxx/Makefile.am b/bindings/cxx/Makefile.am
-index 5c40ceb..87463b0 100644
---- a/bindings/cxx/Makefile.am
-+++ b/bindings/cxx/Makefile.am
-@@ -18,10 +18,16 @@ include_HEADERS = gpiod.hpp
- pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = libgpiodcxx.pc
- 
--SUBDIRS = . examples
-+SUBDIRS = .
- 
- if WITH_TESTS
- 
- SUBDIRS += tests
- 
- endif
-+
-+if WITH_EXAMPLES
-+
-+SUBDIRS += examples
-+
-+endif
-diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
-index 124f152..5403bcb 100644
---- a/bindings/python/Makefile.am
-+++ b/bindings/python/Makefile.am
-@@ -6,8 +6,6 @@
- # Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- #
- 
--SUBDIRS = . examples
--
- pyexec_LTLIBRARIES = gpiod.la
- 
- gpiod_la_SOURCES = gpiodmodule.c
-@@ -17,8 +15,16 @@ gpiod_la_CFLAGS += -Wall -Wextra -g -std=gnu89 $(PYTHON_CPPFLAGS)
- gpiod_la_LDFLAGS = -module -avoid-version
- gpiod_la_LIBADD = $(top_builddir)/lib/libgpiod.la $(PYTHON_LIBS)
- 
-+SUBDIRS = .
-+
- if WITH_TESTS
- 
- SUBDIRS += tests
- 
- endif
-+
-+if WITH_EXAMPLES
-+
-+SUBDIRS += examples
-+
-+endif
-diff --git a/configure.ac b/configure.ac
-index 57c99a8..90a6324 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -155,6 +155,12 @@ then
- 	fi
- fi
- 
-+AC_ARG_ENABLE([examples],
-+	[AS_HELP_STRING([--enable-examples], [enable building code examples[default=no]])],
-+	[if test "x$enableval" = xyes; then with_examples=true; fi],
-+	[with_examples=false])
-+AM_CONDITIONAL([WITH_EXAMPLES], [test "x$with_examples" = xtrue])
-+
- AC_ARG_ENABLE([bindings-cxx],
- 	[AS_HELP_STRING([--enable-bindings-cxx],[enable C++ bindings [default=no]])],
- 	[if test "x$enableval" = xyes; then with_bindings_cxx=true; fi],
--- 
-cgit 1.2.3-1.el7
-
diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index f0803cab36..d257ccaf7d 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256  841be9d788f00bab08ef22c4be5c39866f0e46cb100a3ae49ed816ac9c5dddc7  libgpiod-1.6.3.tar.xz
+sha256  c3c923dc63b7b1b02639c9179c81e3d9febf0887bbaa59775990229cdbedb88b  libgpiod-2.0.2.tar.xz
 # Hash for license file
-sha256  ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING
+sha256  eb17a56966db5d986bec449ee44ed61f01f9e3fafa952e527db67a8f9594fd11  COPYING
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index 35d003fa33..dce2db71cd 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -6,7 +6,7 @@
 
 # Be careful when bumping versions.
 # Dependency on kernel header versions may change.
-LIBGPIOD_VERSION = 1.6.3
+LIBGPIOD_VERSION = 2.0.2
 LIBGPIOD_SOURCE = libgpiod-$(LIBGPIOD_VERSION).tar.xz
 LIBGPIOD_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
