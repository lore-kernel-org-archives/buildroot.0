Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB0C1077603
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 18:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6012B60BDF;
	Wed, 18 Mar 2026 18:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uVMSBAeHrhMd; Wed, 18 Mar 2026 18:44:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73D1260B72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773859493;
	bh=shYp6pKR5yJtDunV9aQMhdDisQpJx5/A1/702RtT8dQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KUutXbEovxPgdwPLhGBwCsjX2atQD1Am7vYKphfnXNV/AM7C8a3ZcgxmG1rqcEslX
	 7StX/z+n8hRzwcRWXC6mDgOKuKO90DT7Mo/MtLkUKRDElrqEZHH+jKaOhYtK4b89Sn
	 rIMXYtqbQgwVUuhXdzChKlvOowdI7lNdNNU/0djmbw7x5sz29QE6zXyaPcDGVHD+gE
	 CeZFhvNKAwI8MDZuI26cGgLUdqWBObO5V27RAPkzVafc22VTMU+eWVV7Amgt8z593I
	 3NXFuXzGW8IZM5EAUf1vqo0RPlZV35WNQUuHaR99Np/W9hApIZ6nW1lB9EEm2s4roo
	 SrImsUlG7iMeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73D1260B72;
	Wed, 18 Mar 2026 18:44:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DEB71BD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F95D40C56
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YnBRqDPyj1rO for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 18:44:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6021240C59
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6021240C59
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:44:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 09CE6849B1; Wed, 18 Mar 2026 18:36:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Mar 2026 19:31:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f341554ee617a466fd3129c8448a9012aaadeb44
X-Git-Newrev: 63364f08142de9433874e34dfcf5e90206ef40b9
X-Patchwork-Hint: ignore
Message-Id: <20260318183603.09CE6849B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/drm-info: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/63364f08142de9433874e34dfcf5e90206ef40b9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

drm_info is a small utility to dump info about DRM devices.

Link: https://gitlab.freedesktop.org/emersion/drm_info
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[Julien:
 - sort selected packages in Config.in alphabetically
 - remove comment for license in hash file
 - move "v" from _VERSION to _SITE
 - switch _SITE to use gitlab release archives and add _SOURCE
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-Revert-Find-drm_fourcc.h-in-sysroot.patch | 47 ++++++++++++++++++++++
 package/drm-info/Config.in                         | 12 ++++++
 package/drm-info/drm-info.hash                     |  3 ++
 package/drm-info/drm-info.mk                       | 16 ++++++++
 6 files changed, 80 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8c9b89c249..6f5008ab89 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2103,6 +2103,7 @@ F:	board/octavo/osd32mp1-brk/
 F:	board/octavo/osd32mp1-red/
 F:	configs/octavo_osd32mp1_brk_defconfig
 F:	configs/octavo_osd32mp1_red_defconfig
+F:	package/drm-info/
 
 N:	Kris Bahnsen <kris@embeddedTS.com>
 F:	package/wilc-firmware/
diff --git a/package/Config.in b/package/Config.in
index 49ff5e957c..d7791bdd3d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -306,6 +306,7 @@ menu "Graphic libraries and applications (graphic/text)"
 comment "Graphic applications"
 	source "package/cage/Config.in"
 	source "package/cog/Config.in"
+	source "package/drm-info/Config.in"
 	source "package/flutter-packages/Config.in"
 	source "package/flutter-pi/Config.in"
 	source "package/foot/Config.in"
diff --git a/package/drm-info/0001-Revert-Find-drm_fourcc.h-in-sysroot.patch b/package/drm-info/0001-Revert-Find-drm_fourcc.h-in-sysroot.patch
new file mode 100644
index 0000000000..3e70f3d1cf
--- /dev/null
+++ b/package/drm-info/0001-Revert-Find-drm_fourcc.h-in-sysroot.patch
@@ -0,0 +1,47 @@
+From c94d00730d0c25a4a4c46abfcf27823919ac9854 Mon Sep 17 00:00:00 2001
+From: Kory Maincent <kory.maincent@bootlin.com>
+Date: Mon, 16 Mar 2026 18:50:09 +0100
+Subject: [PATCH] Revert "Find drm_fourcc.h in sysroot"
+
+This reverts commit cde94140f08775dc4df7eaac766556218d9e1321
+
+When cross-compiling, pkg-config's includedir variable already returns
+an absolute path that includes the sysroot prefix (e.g.
+/sysroot/usr/include). Prepending pc_sysrootdir to it duplicates the
+prefix and produces a broken path.
+
+The reverted commit introduced the double-prefix issue. Drop pc_sysrootdir
+and use includedir directly, which already carries the correct absolute
+path.
+
+The workaround was only needed for the legacy pkg-config 0.29 (2017)
+project, which did not apply PKG_CONFIG_SYSROOT_DIR to includedir.
+The actively maintained pkgconf project handles this correctly, and
+the legacy tool is no longer in widespread use.
+
+You can verify the behavior with:
+  $ PKG_CONFIG_SYSROOT_DIR="/bla" pkg-config --variable=includedir libdrm
+  /bla/usr/include
+
+Upstream: https://gitlab.freedesktop.org/emersion/drm_info/-/merge_requests/114
+Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 1f80024..e4ce03e 100644
+--- a/meson.build
++++ b/meson.build
+@@ -68,7 +68,7 @@ if libdrm.version().version_compare('<2.4.130')
+ elif libdrm.type_name() == 'internal'
+   fourcc_h = meson.current_source_dir() / 'subprojects/libdrm/include/drm/drm_fourcc.h'
+ else
+-  fourcc_h = libdrm.get_variable(pkgconfig: 'pc_sysrootdir') + libdrm.get_variable(pkgconfig: 'includedir') / 'libdrm/drm_fourcc.h'
++  fourcc_h = libdrm.get_variable(pkgconfig: 'includedir') / 'libdrm/drm_fourcc.h'
+ endif
+ 
+ # The DRM_BUS_FAUX bus and its information is included in libdrm v2.4.127
+-- 
+2.43.0
+
diff --git a/package/drm-info/Config.in b/package/drm-info/Config.in
new file mode 100644
index 0000000000..49b8fd6f2c
--- /dev/null
+++ b/package/drm-info/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_DRM_INFO
+	bool "drm_info"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
+	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_LIBDRM
+	help
+	  Small utility to dump info about DRM devices.
+
+	  https://gitlab.freedesktop.org/emersion/drm_info
+
+comment "drm_info needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/drm-info/drm-info.hash b/package/drm-info/drm-info.hash
new file mode 100644
index 0000000000..de852cb5eb
--- /dev/null
+++ b/package/drm-info/drm-info.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  53ef974ac657a0b4b9d7424a65b7f92e6ca26c15e8356f4146ae8bb9cae2db44  drm_info-2.9.0.tar.gz
+sha256  05a54b690d8851143a8b923cfe8ac48f49050f9d2166e7eb0c1d340242d7f46a  LICENSE
diff --git a/package/drm-info/drm-info.mk b/package/drm-info/drm-info.mk
new file mode 100644
index 0000000000..25deb18f00
--- /dev/null
+++ b/package/drm-info/drm-info.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# drm-info
+#
+################################################################################
+
+DRM_INFO_VERSION = 2.9.0
+DRM_INFO_SITE = https://gitlab.freedesktop.org/emersion/drm_info/-/releases/v$(DRM_INFO_VERSION)/downloads
+DRM_INFO_SOURCE = drm_info-$(DRM_INFO_VERSION).tar.gz
+DRM_INFO_LICENSE = MIT
+DRM_INFO_LICENSE_FILES = LICENSE
+DRM_INFO_DEPENDENCIES = \
+	json-c \
+	libdrm
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
