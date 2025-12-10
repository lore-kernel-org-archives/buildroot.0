Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48342D3E780
	for <buildroot@archiver.kernel.org>; Wed, 10 Dec 2025 22:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E52C440DAF;
	Wed, 10 Dec 2025 22:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nSQPsjt-RuWA; Wed, 10 Dec 2025 22:00:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E64FB40E02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765404036;
	bh=5O2NlRiLB4YZiHp8NdvbQ6Qxx6gVdqKxHlr9mgxlRLw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E/zIGKjKDRl0o92zMi7cFNpjHfIn98pHm7rbY02pb14hfcYOvBKxSs/gZi4eCWEoA
	 wsNqVs+7Sxiwjkjk/eaZe03G5+YSBO1w6NYcQ85kp+SQttKYOok9PVYbH2lGgnhtl+
	 eZuZ6zoAhli7Mr+0m+7fReWTLvysDAziul82V4671Ej3R36IhiHf2ekk19EFdvqhE0
	 O+/Og+2APlFx4asolCxVaaAkE4jkjfXx8G0dEaUFS1UPsW7ZtzAJNi7G3uybdqgk7z
	 T59JAbL1eYLilgsEuf3il/kQCnieKL77wmtOiybfA7EW1SDtlNWTE9vz0F0+ZcVDwE
	 P5pUVQ174klFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E64FB40E02;
	Wed, 10 Dec 2025 22:00:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 65950E7
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 22:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57C4E6178C
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 22:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4qVTC-fxXLBx for <buildroot@buildroot.org>;
 Wed, 10 Dec 2025 22:00:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CA016144B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CA016144B
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 22:00:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AC0186A2A; Wed, 10 Dec 2025 22:00:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Dec 2025 22:52:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9e9fb093804738434f5f429d2ce59546e4eb8147
X-Git-Newrev: dc69440be9573e3b009a70544bb564746875ced7
X-Patchwork-Hint: ignore
Message-Id: <20251210220033.5AC0186A2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gcr: bump version to
 4.4.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc69440be9573e3b009a70544bb564746875ced7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes: https://gitlab.gnome.org/GNOME/gcr/-/blob/4.4.0.1/NEWS

Removed patch which is included in this release.

Added dependency to libsecret and switched to gtk4.

Added configure options for vapi support which depends on
gobject-introspection:
https://gitlab.gnome.org/GNOME/gcr/-/commit/5970a456465b6b6a6a3f4c215e1926c3c3c3f5cb

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 ...unknown-kw-argument-in-gnome.generate_gir.patch | 64 ----------------------
 package/gcr/Config.in                              |  1 +
 package/gcr/gcr.hash                               |  5 +-
 package/gcr/gcr.mk                                 | 23 ++++----
 5 files changed, 16 insertions(+), 78 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b902157fae..4d1dcc81a7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -403,7 +403,6 @@ package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch lib_patch.Upstream
 package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch lib_patch.Upstream
 package/gcc/8.4.0/0003-libsanitizer-Remove-cyclades-from-libsanitizer.patch lib_patch.Upstream
 package/gcc/8.4.0/0004-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
-package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch lib_patch.Upstream
 package/gdb/14.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch lib_patch.Upstream
 package/gdb/14.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch lib_patch.Upstream
 package/gdb/14.2/0003-use-asm-sgidefs.h.patch lib_patch.Upstream
diff --git a/package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch b/package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch
deleted file mode 100644
index a1d4e1b46f..0000000000
--- a/package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8 Mon Sep 17 00:00:00 2001
-From: Jakub Jirutka <jakub@jirutka.cz>
-Date: Wed, 12 Jan 2022 00:24:20 +0100
-Subject: [PATCH] meson: Fix unknown kw argument in gnome.generate_gir
-
-This argument has been removed in Meson 0.61.0:
-
-    gck/meson.build:130:2: ERROR: gnome.generate_gir got unknown keyword arguments "packages"
-
-https://github.com/mesonbuild/meson/commit/f8fc5cb860465718fe7c79a1bf1fe00659f138de:
-
-> The packages argument to gnome.generate_gir was allowed, but never did anything, so stop passing it.
-
-Fixes #89
-
-[aperez@igalia.com: backport from upstream]
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-[yann.morin.1998@free.fr: make it an actual backport]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- gck/meson.build | 1 -
- gcr/meson.build | 1 -
- ui/meson.build  | 1 -
- 3 files changed, 3 deletions(-)
-
-diff --git a/gck/meson.build b/gck/meson.build
-index 756b486..a21a1e9 100644
---- a/gck/meson.build
-+++ b/gck/meson.build
-@@ -131,7 +131,6 @@ if get_option('introspection')
-     sources: gck_gir_sources,
-     namespace: 'Gck',
-     nsversion: '@0@'.format(gck_major_version),
--    packages: gck_deps,
-     export_packages: 'gck-@0@'.format(gck_major_version),
-     includes: [ 'GObject-2.0', 'Gio-2.0' ],
-     header: 'gck/gck.h',
-diff --git a/gcr/meson.build b/gcr/meson.build
-index 2233a44..c83641b 100644
---- a/gcr/meson.build
-+++ b/gcr/meson.build
-@@ -190,7 +190,6 @@ if get_option('introspection')
-     sources: [ gcr_base_public_sources, gcr_base_headers ],
-     namespace: 'Gcr',
-     nsversion: '@0@'.format(gcr_major_version),
--    packages: gcr_base_deps,
-     export_packages: 'gcr-base-@0@'.format(gcr_major_version),
-     includes: [
-       'GObject-2.0',
-diff --git a/ui/meson.build b/ui/meson.build
-index e656ea2..32ee057 100644
---- a/ui/meson.build
-+++ b/ui/meson.build
-@@ -152,7 +152,6 @@ if get_option('introspection')
-     export_packages: 'gcr-ui-@0@'.format(gcr_major_version),
-     identifier_prefix: 'Gcr',
-     symbol_prefix: 'gcr',
--    packages: gcr_ui_deps,
-     includes: [
-       'GObject-2.0',
-       'Gio-2.0',
--- 
-2.25.1
-
diff --git a/package/gcr/Config.in b/package/gcr/Config.in
index dbc22cf478..751accb723 100644
--- a/package/gcr/Config.in
+++ b/package/gcr/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_GCR
 	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2_DEPENDS # runtime
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBSECRET
 	select BR2_PACKAGE_P11_KIT
 	help
 	  Library for cryptographic UIs and accessing PKCS#11 modules.
diff --git a/package/gcr/gcr.hash b/package/gcr/gcr.hash
index f6cc44e97d..1a67849f86 100644
--- a/package/gcr/gcr.hash
+++ b/package/gcr/gcr.hash
@@ -1,3 +1,4 @@
-# From https://download.gnome.org/sources/gcr/3.40/gcr-3.40.0.sha256sum
-sha256  b9d3645a5fd953a54285cc64d4fc046736463dbd4dcc25caf5c7b59bed3027f5  gcr-3.40.0.tar.xz
+# From https://download.gnome.org/sources/gcr/4.4/gcr-4.4.0.1.sha256sum
+sha256  0c3c341e49f9f4f2532a4884509804190a0c2663e6120360bb298c5d174a8098  gcr-4.4.0.1.tar.xz
+# Locally computed
 sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING
diff --git a/package/gcr/gcr.mk b/package/gcr/gcr.mk
index 3a8c01729f..a3be8ecdf2 100644
--- a/package/gcr/gcr.mk
+++ b/package/gcr/gcr.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-GCR_VERSION_MAJOR = 3.40
-GCR_VERSION = $(GCR_VERSION_MAJOR).0
+GCR_VERSION_MAJOR = 4.4
+GCR_VERSION = $(GCR_VERSION_MAJOR).0.1
 GCR_SITE = https://download.gnome.org/sources/gcr/$(GCR_VERSION_MAJOR)
 GCR_SOURCE = gcr-$(GCR_VERSION).tar.xz
 GCR_DEPENDENCIES = \
 	host-pkgconf \
 	libgcrypt \
 	libglib2 \
+	libsecret \
 	p11-kit \
 	$(TARGET_NLS_DEPENDENCIES)
 GCR_INSTALL_STAGING = YES
@@ -29,19 +30,19 @@ endif
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 GCR_DEPENDENCIES += gobject-introspection host-libxslt host-vala
-GCR_CONF_OPTS += -Dintrospection=true
+GCR_CONF_OPTS += -Dintrospection=true -Dvapi=true
 else
-GCR_CONF_OPTS += -Dintrospection=false
+GCR_CONF_OPTS += -Dintrospection=false -Dvapi=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
-GCR_DEPENDENCIES += libgtk3
-GCR_CONF_OPTS += -Dgtk=true
-else ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
-GCR_DEPENDENCIES += libgtk3
-GCR_CONF_OPTS += -Dgtk=true
+ifeq ($(BR2_PACKAGE_LIBGTK4_X11),y)
+GCR_DEPENDENCIES += libgtk4
+GCR_CONF_OPTS += -Dgtk4=true
+else ifeq ($(BR2_PACKAGE_LIBGTK4_WAYLAND),y)
+GCR_DEPENDENCIES += libgtk4
+GCR_CONF_OPTS += -Dgtk4=true
 else
-GCR_CONF_OPTS += -Dgtk=false
+GCR_CONF_OPTS += -Dgtk4=false
 endif
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
