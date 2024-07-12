Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383F2C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 15:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE2BD412D2;
	Fri, 12 Jul 2024 15:52:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFOoPzK0pnN1; Fri, 12 Jul 2024 15:52:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F34F2410FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F34F2410FB;
	Fri, 12 Jul 2024 15:52:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C3F21BF5D7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07F9D41A3D
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lrJ1FK7gs1jE for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 15:52:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5FD141A03
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5FD141A03
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:52:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B096D860CC; Fri, 12 Jul 2024 15:52:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 17:51:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70319b47f646f74f407ed3355baf5b581a10518a
X-Git-Newrev: 0d57555407f2a0708515e7c377f57a6466c78b1b
X-Patchwork-Hint: ignore
Message-Id: <20240712155211.B096D860CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysprof: update to version 46.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0d57555407f2a0708515e7c377f57a6466c78b1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bring Sysprof twelve years into the future by updating it to the most
recent release. The GUI now uses GTK4, for which there is not yet a
package, so for now the option is removed.

Obviously, many things changed:

- Build system moved to meson
- License moved from GPLv2 to GPLv3
- Many new dependencies

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                               |  1 -
 package/sysprof/0001-define-NT_GNU_BUILD_ID.patch | 22 -------------
 package/sysprof/Config.in                         | 40 +++++++++++------------
 package/sysprof/sysprof.hash                      |  8 +++--
 package/sysprof/sysprof.mk                        | 26 +++++++++++----
 5 files changed, 43 insertions(+), 54 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 3866c4b146..2c0f265d96 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1344,7 +1344,6 @@ package/suricata/0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
 package/suricata/S99suricata Shellcheck
 package/swupdate/swupdate.sh Shellcheck
 package/sylpheed/0001-harden-link-checker-before-accepting-click.patch lib_patch.Upstream
-package/sysprof/0001-define-NT_GNU_BUILD_ID.patch lib_patch.Upstream
 package/sysrepo/S51sysrepo-plugind Shellcheck lib_sysv.Indent
 package/sysvinit/0001-Makefile-disable-stack-protector-strong.patch lib_patch.Upstream
 package/tar/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch lib_patch.Upstream
diff --git a/package/sysprof/0001-define-NT_GNU_BUILD_ID.patch b/package/sysprof/0001-define-NT_GNU_BUILD_ID.patch
deleted file mode 100644
index dcc2cbe67c..0000000000
--- a/package/sysprof/0001-define-NT_GNU_BUILD_ID.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-On uclibc elf.h does not have GNU extentions but we need this define
-so we define it locally if its not getting it from elf.h
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
-Index: git/elfparser.h
-===================================================================
---- git.orig/elfparser.h	2011-07-16 18:57:41.000000000 -0700
-+++ git/elfparser.h	2011-07-16 20:28:54.733829895 -0700
-@@ -17,6 +17,10 @@
-  */
- #include <glib.h>
- 
-+#ifndef NT_GNU_BUILD_ID
-+#define NT_GNU_BUILD_ID 3
-+#endif
-+
- typedef struct ElfSym ElfSym;
- typedef struct ElfParser ElfParser;
- 
diff --git a/package/sysprof/Config.in b/package/sysprof/Config.in
index 3913274be4..1d1b2fa264 100644
--- a/package/sysprof/Config.in
+++ b/package/sysprof/Config.in
@@ -1,31 +1,29 @@
 config BR2_PACKAGE_SYSPROF
 	bool "sysprof"
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	# In its util.h file, sysprof contains architecture-specific
-	# code
-	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_sh4a || BR2_sh4aeb
+	depends on BR2_USE_WCHAR # glib2, libdex, json-glib
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, libdex, json-glib, polkit
+	depends on BR2_USE_MMU # glib2, libdex, json-glib
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libunwind, polkit
+	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS # libunwind, polkit
+	depends on !BR2_OPTIMIZE_FAST # polkit
+	select BR2_PACKAGE_JSON_GLIB
+	select BR2_PACKAGE_LIBDEX
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBUNWIND
+	select BR2_PACKAGE_POLKIT
 	help
 	  Sysprof is a statistical, system-wide profiler that can
 	  profile user and kernel code using the perf API.
 
 	  http://sysprof.com
 
-if BR2_PACKAGE_SYSPROF
-
-config BR2_PACKAGE_SYSPROF_GUI
-	bool "sysprof GUI"
-	depends on BR2_PACKAGE_LIBGTK2
-	select BR2_PACKAGE_LIBGLADE
-	select BR2_PACKAGE_GDK_PIXBUF
-	help
-	  GUI for the sysprof system-wide statistical profiler.
-
-endif
-
-comment "sysprof needs a toolchain w/ wchar, threads"
+comment "sysprof needs a toolchain w/ dynamic libraray, wchar, threads, gcc >= 7"
 	depends on BR2_USE_MMU
-	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_sh4a || BR2_sh4aeb
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		BR2_STATIC_LIBS
+
+comment "sysprof can't be built with Optimize for fast"
+	depends on BR2_OPTIMIZE_FAST
diff --git a/package/sysprof/sysprof.hash b/package/sysprof/sysprof.hash
index 4ce206be0b..f21e7621e1 100644
--- a/package/sysprof/sysprof.hash
+++ b/package/sysprof/sysprof.hash
@@ -1,3 +1,5 @@
-# Locally calculated
-sha256  baf03c6fc01a845c705873e6fc7927aa89539dcda6963f9ec4c8eb4c086a64f1  sysprof-1.2.0.tar.gz
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+# From https://download.gnome.org/sources/sysprof/46/sysprof-46.0.sha256sum
+sha256  73aa7e75ebab3e4e0946a05a723df7e6ee4249e3b9e884dba35500aba2a1d176  sysprof-46.0.tar.xz
+
+# License files
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
index 9823416e3f..8e69a7044e 100644
--- a/package/sysprof/sysprof.mk
+++ b/package/sysprof/sysprof.mk
@@ -4,14 +4,26 @@
 #
 ################################################################################
 
-SYSPROF_VERSION = 1.2.0
-SYSPROF_SITE = http://sysprof.com
-SYSPROF_DEPENDENCIES = libglib2
-SYSPROF_LICENSE = GPL-2.0+
+SYSPROF_VERSION_MAJOR = 46
+SYSPROF_VERSION = $(SYSPROF_VERSION_MAJOR).0
+SYSPROF_SOURCE = sysprof-$(SYSPROF_VERSION).tar.xz
+SYSPROF_SITE = https://download.gnome.org/sources/sysprof/$(SYSPROF_VERSION_MAJOR)
+SYSPROF_LICENSE = GPL-3.0+
 SYSPROF_LICENSE_FILES = COPYING
+SYSPROF_DEPENDENCIES = libglib2 libdex libunwind json-glib polkit
+SYSPROF_CONF_OPTS = \
+	-Ddevelopment=false \
+	-Dexamples=false \
+	-Dgtk=false \
+	-Dhelp=false \
+	-Dinstall-static=false \
+	-Dlibsysprof=true \
+	-Dtests=false \
+	-Dtools=true \
+	-Dsystemdunitdir=/usr/lib/systemd/system
 
-ifeq ($(BR2_PACKAGE_SYSPROF_GUI),y)
-SYSPROF_DEPENDENCIES += libgtk2 libglade gdk-pixbuf
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+SYSPROF_DEPENDENCIES += systemd
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
