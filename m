Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EC0C83F03
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 17:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BC7583B85;
	Thu,  3 Jul 2025 17:11:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PEvnr_QBVhP2; Thu,  3 Jul 2025 17:11:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C43583B8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C43583B8C;
	Thu,  3 Jul 2025 17:11:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2528C15F
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 17:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B43460FA6
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 17:11:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W-0qLe7f8ivI for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 17:11:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AF2F61178
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AF2F61178
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 17:11:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08FAD85C2D; Thu,  3 Jul 2025 17:11:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Jul 2025 19:05:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4db67464dd046d4ce9ea5d0e57f40bd5c702531d
X-Git-Newrev: 3ea1225d4f73025e8ce42264835303a8790c0d01
X-Patchwork-Hint: ignore
Message-Id: <20250703171143.08FAD85C2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gvfs: bump to v1.57.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ea1225d4f73025e8ce42264835303a8790c0d01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump includes 23 minor or patch-level releases, mostly containing
bugfixes, and improvements on many filesystem backends and translations.

Specifically for the Buildroot package:

- Switch from libsoup (v2) to libsoup3, since gvfs v1.49.90
- Drop patch applied upstream
- Explicitely disable goa (gnome-online-accounts) which is enabled by default
  in meson_options.txt

See the upstream changelog:
https://gitlab.gnome.org/GNOME/gvfs/-/blob/1.57.2/NEWS

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[Julien: remove .checkpackageignore entry to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 ...Remove-incorrect-i18n.merge_file-argument.patch | 33 ----------------------
 package/gvfs/gvfs.hash                             |  4 +--
 package/gvfs/gvfs.mk                               |  9 +++---
 4 files changed, 7 insertions(+), 40 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index de311a232f..dbe0963ca2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -531,7 +531,6 @@ package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch lib_patch.Upstre
 package/gumbo-parser/0001-configure.ac-fix-build-without-C.patch lib_patch.Upstream
 package/gutenprint/0001-use-pregen-xmli18n-header.patch lib_patch.Upstream
 package/gutenprint/0002-cups-support-replaces-static-with-static-libtool-lib.patch lib_patch.Upstream
-package/gvfs/0001-build-Remove-incorrect-i18n.merge_file-argument.patch lib_patch.Upstream
 package/harfbuzz/0001-meson.build-check-for-pthread.h.patch lib_patch.Upstream
 package/haserl/0001-add-haserl_lualib.inc.patch lib_patch.Upstream
 package/haveged/S21haveged Shellcheck lib_sysv.Variables
diff --git a/package/gvfs/0001-build-Remove-incorrect-i18n.merge_file-argument.patch b/package/gvfs/0001-build-Remove-incorrect-i18n.merge_file-argument.patch
deleted file mode 100644
index a85a1a374e..0000000000
--- a/package/gvfs/0001-build-Remove-incorrect-i18n.merge_file-argument.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 17a067b9b823a0d54e061eae45ff8e2c7e4a88d0 Mon Sep 17 00:00:00 2001
-From: Ondrej Holy <oholy@redhat.com>
-Date: Fri, 21 Jan 2022 08:32:31 +0100
-Subject: [PATCH] build: Remove incorrect i18n.merge_file argument
-
-The positional argument was being silently ignored until meson 0.60.0 where
-it fails with "ERROR: Function does not take positional arguments".
-
-Related: https://github.com/mesonbuild/meson/issues/9441
-Fixes: https://gitlab.gnome.org/GNOME/gvfs/-/issues/599
-
-[Retrieved (and backported) from:
-https://gitlab.gnome.org/GNOME/gvfs/-/commit/17a067b9b823a0d54e061eae45ff8e2c7e4a88d0]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- daemon/meson.build | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/daemon/meson.build b/daemon/meson.build
-index 5f9559aa..e20ada29 100644
---- a/daemon/meson.build
-+++ b/daemon/meson.build
-@@ -360,7 +360,6 @@ if enable_admin
-   )
- 
-   i18n.merge_file(
--    policy,
-     input: policy_in,
-     output: '@BASENAME@',
-     po_dir: po_dir,
--- 
-GitLab
-
diff --git a/package/gvfs/gvfs.hash b/package/gvfs/gvfs.hash
index fc068ddb94..4f81421af6 100644
--- a/package/gvfs/gvfs.hash
+++ b/package/gvfs/gvfs.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gvfs/1.48/gvfs-1.48.1.sha256sum
-sha256  b2ea4f271aad2711f16b43c03151e2ec5a9874ff1a21142ef6d6406486a19dc2  gvfs-1.48.1.tar.xz
+# From https://download.gnome.org/sources/gvfs/1.57/gvfs-1.57.2.sha256sum
+sha256  f16bef8eca1fd6c117e85db011d21e915669790d55867349c5f1b291299e9585  gvfs-1.57.2.tar.xz
 
 # Hash for license file
 sha256  45cf336e2e48176993babc5aabf44437390f40e6a86a472c6abfc7ce9c035db4  COPYING
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 50efed1abb..b46b438dc6 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GVFS_VERSION_MAJOR = 1.48
-GVFS_VERSION = $(GVFS_VERSION_MAJOR).1
+GVFS_VERSION_MAJOR = 1.57
+GVFS_VERSION = $(GVFS_VERSION_MAJOR).2
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
 GVFS_SITE = https://download.gnome.org/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
@@ -28,6 +28,7 @@ GVFS_CONF_OPTS = \
 	-Dafc=false \
 	-Dgoa=false \
 	-Dgoogle=false \
+	-Donedrive=false \
 	-Dmtp=false \
 	-Dsftp=false \
 	-Dudisks2=false
@@ -125,8 +126,8 @@ else
 GVFS_CONF_OPTS += -Dkeyring=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIBSOUP)$(BR2_PACKAGE_LIBXML2),yy)
-GVFS_DEPENDENCIES += libsoup libxml2
+ifeq ($(BR2_PACKAGE_LIBSOUP3)$(BR2_PACKAGE_LIBXML2),yy)
+GVFS_DEPENDENCIES += libsoup3 libxml2
 GVFS_CONF_OPTS += -Dhttp=true
 else
 GVFS_CONF_OPTS += -Dhttp=false
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
