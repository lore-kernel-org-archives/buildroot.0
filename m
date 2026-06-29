Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C063C43602
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 10:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3DD340303;
	Mon, 29 Jun 2026 10:55:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 18wol_4Gng7k; Mon, 29 Jun 2026 10:55:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E8B440330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782730526;
	bh=liDCs0x0+2G2HazVTZ/48oBNWXLLdPpYbSk9Maa6vSA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d4JAAKkFAsby4xBlNuJZzp5vaN+Art7C51y+jL/iOjiXvJ+udFoZcQ4r5ZLIG01Cq
	 73aENOuwPY+5GqI6aSRHuDqKf5I6+j/RwQ8oQumDK+s3cWyfpKVJnuDs1Chufu+uNK
	 pF2rOnXCqL2WVujZ+HQBmG2zbVHXvknzA0V39yEfK6xxKMHbOZIiJ+S0421rlD4YgU
	 8c+WTZhK0kLAfkn/neYcQLebs2zYysb6DwRNQtqzYypW8GOyOAyk+2Nja5Q0qx4A/b
	 sWsZFJzsiSAkEsooIW/b41sHHa118oYyVqjMNSVC9te7+P4HXQAhbdPG1TSbKxQ0eX
	 VNDj+l+emUp/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E8B440330;
	Mon, 29 Jun 2026 10:55:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A50B2D3
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 10:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2047E40302
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 10:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SCUVZccGwxHe for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 10:55:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57836402E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57836402E6
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 10:55:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E120D86E67; Mon, 29 Jun 2026 10:54:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 Jun 2026 12:53:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 866462e8dd79311c34b7318a988e920372080928
X-Git-Newrev: c9fabfcb9fe93fdf9fdf7fb0eabcb927c90182b7
X-Patchwork-Hint: ignore
Message-Id: <20260629105455.E120D86E67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglib2: drop unused
 0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c9fabfcb9fe93fdf9fdf7fb0eabcb927c90182b7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

In 11aa1cfa5af9a77a0a9f726bd38f1b7db659c0bf the patch was accidentally
moved into a versioned directory with the wrong version (2.82.0
instead of 2.82.4) and thus not applied. However, there have been no
issues reported.

The patch description mentions being needed to fix build errors in
package/atk and package/libnice. It was originally added in
b094f88a4d501101bfba9b65491209e6a0fe0397, and amended for libnice in
2c916b400bc608512db790d97df010ca666b6dd2. package/atk was removed in
2c3ca7bea1de76163aeef432412eb14551ed0581, because atk has been merged
into at-spi2-core. Both at-spi2-core and libnice are Meson packages,
as was atk at the time of its removal.

Both current packages build with the following configuration (tested
using utils/test-pkg):

BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_GOBJECT_INTROSPECTION=y
BR2_PACKAGE_LIBNICE=y
BR2_PACKAGE_AT_SPI2_CORE=y

Evidently the patch is no longer needed, presumably because the
correct search path for GIR files is set by other means, and we can
remove it instead of fixing the version number of the patch directory.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Tested-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch | 53 ----------------------
 package/libglib2/libglib2-bootstrap/2.82.0         |  1 -
 2 files changed, 54 deletions(-)

diff --git a/package/libglib2/2.82.0/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch b/package/libglib2/2.82.0/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
deleted file mode 100644
index c6135b15a1..0000000000
--- a/package/libglib2/2.82.0/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 3fcd5f431dee9909b6bcbd9b8b61d4b1fe4b5f92 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 12 Nov 2021 18:01:05 +0100
-Subject: [PATCH] meson.build: add girdir to gio-2.0.pc and glib-2.0.pc
-
-Add girdir to gio-2.0.pc and glib-2.0.pc to fix the following build
-failure with atk or libnice:
-
-/home/giuliobenetti/autobuild/run/instance-1/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler atk/Atk-1.0.gir --output atk/Atk-1.0.typelib --includedir=/usr/share/gir-1.0
-Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
-
-Fixes:
- - http://autobuild.buildroot.org/results/2716929db638977e6bf665352a08bd580e1dd0ae
- - http://autobuild.buildroot.org/results/3088ef32b03e0bb984291b1227b187f1ff816eb7
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-[Fiona: refresh for glib 2.80.4]
-Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
-Upstream: Never submitted
----
- gio/meson.build  | 1 +
- glib/meson.build | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/gio/meson.build b/gio/meson.build
-index 59c2b0f..5120537 100644
---- a/gio/meson.build
-+++ b/gio/meson.build
-@@ -885,6 +885,7 @@ pkg.generate(libgio,
-   variables : [
-     'schemasdir=' + '${datadir}' / schemas_subdir,
-     'dtdsdir=' + '${datadir}' / dtds_subdir,
-+    'girdir=' + join_paths('${libdir}', '../share/gir-1.0'),
-     'giomoduledir=' + pkgconfig_giomodulesdir,
-     'gio=' + '${bindir}' / 'gio',
-     'gio_querymodules=' + pkgconfig_multiarch_bindir / 'gio-querymodules',
-diff --git a/glib/meson.build b/glib/meson.build
-index d2efeba..a69532b 100644
---- a/glib/meson.build
-+++ b/glib/meson.build
-@@ -447,6 +447,7 @@ pkg.generate(libglib,
-   subdirs : ['glib-2.0'],
-   extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
-   variables : [
-+    'girdir=' + join_paths('${libdir}', '../share/gir-1.0'),
-     'glib_genmarshal=' + '${bindir}' / 'glib-genmarshal',
-     'gobject_query=' + '${bindir}' / 'gobject-query',
-     'glib_mkenums=' + '${bindir}' / 'glib-mkenums',
--- 
-2.45.2
-
diff --git a/package/libglib2/libglib2-bootstrap/2.82.0 b/package/libglib2/libglib2-bootstrap/2.82.0
deleted file mode 120000
index 28b180f102..0000000000
--- a/package/libglib2/libglib2-bootstrap/2.82.0
+++ /dev/null
@@ -1 +0,0 @@
-../2.82.0
\ No newline at end of file
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
