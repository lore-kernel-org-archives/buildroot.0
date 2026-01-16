Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372DAC98301
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 20:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6F36615A2;
	Fri, 16 Jan 2026 20:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rsglny9AE9Eq; Fri, 16 Jan 2026 20:57:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0125B615A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768597073;
	bh=+vdzqu1voFS/weQ+IKH3x+d1yRN3T3Rp6pw2KdRs5Ok=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oYx/91hUvCU2/Lp7EaL0YrORmjjcL8EOww1fPYNPFBTikLbGkrM4XvBZSB/tOXTJo
	 73r9WQkAXS7v1e8xlxJYtKG8zHEORJsz8tcZ68oQBWY84XS4ob2JPET0c+dG/SvyIj
	 DlDvWYu4/udnRhK3dybPPtVQGx5l9lIF/AV6sQzKoO65pQnRDga8H+OVVqGrK6CfbX
	 GYe/tRLjhPhRcTocH5LYDkJmqglzvuVCMZi29hkNk5GiMZmevsgSV1zKaXTBV/cWGx
	 ynzlPG4F1CBKak6TpjGb2I0n37XXd/c5/Zf/RHH38SrK0nHm9XYMI0T3gm5GiwVX+M
	 xzFwRfJ1derjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0125B615A3;
	Fri, 16 Jan 2026 20:57:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BBE07491
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1D6041A3C
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d8-LGA7edlTq for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 20:57:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C90F41A3A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C90F41A3A
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:57:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8602488691; Fri, 16 Jan 2026 20:57:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Jan 2026 21:54:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 598237cb153e29c7d719ddde11d56c6415c7891c
X-Git-Newrev: 8680db4582c5c448e0702409fc18dbdb7faf21a7
X-Patchwork-Hint: ignore
Message-Id: <20260116205748.8602488691@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsvg-cairo: remove package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1406412565243950776=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1406412565243950776==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8680db4582c5c448e0702409fc18dbdb7faf21a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is no longer maintained, no release since 2005, and its
dependency libsvg has build issues as it uses too old XML APIs:

/home/thomas/projets/buildroot/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/include/libxml2/libxml/SAX.h:18:4: warning: #warning "libxml/SAX.h is deprecated" [-Wcpp]
   18 |   #warning "libxml/SAX.h is deprecated"
      |    ^~~~~~~

svgint.h:42:9: error: unknown type name 'xmlParserCtxtPtr'
   42 | typedef xmlParserCtxtPtr svg_xml_parser_context_t;
      |         ^~~~~~~~~~~~~~~~

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                       |  8 ++++++++
 DEVELOPERS                             |  1 -
 package/Config.in                      |  1 -
 package/libsvg-cairo/Config.in         | 11 -----------
 package/libsvg-cairo/libsvg-cairo.hash |  6 ------
 package/libsvg-cairo/libsvg-cairo.mk   | 16 ----------------
 6 files changed, 8 insertions(+), 35 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index b2d618fc2e..0bd6677b50 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_LIBSVG_CAIRO
+	bool "libsvg-cairo package removed"
+	select BR2_LEGACY
+	help
+	  The libsvg-cairo package has been removed. Its latest
+	  upstream release was from 2005, and it wasn't used by any
+	  other Buildroot package.
+
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE
 	bool "xf86-input-mouse removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index c150ab8fc5..d8ee9140fc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -592,7 +592,6 @@ F:	package/sunxi-boards/
 N:	Carsten Schoenert <c.schoenert@gmail.com>
 F:	package/libdvbsi/
 F:	package/libsvg/
-F:	package/libsvg-cairo/
 
 N:	Cédric Chépied <cedric.chepied@gmail.com>
 F:	package/znc/
diff --git a/package/Config.in b/package/Config.in
index 7f93f6568e..13b6f2ece6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1774,7 +1774,6 @@ menu "Graphics"
 	source "package/libraw/Config.in"
 	source "package/librsvg/Config.in"
 	source "package/libsvg/Config.in"
-	source "package/libsvg-cairo/Config.in"
 	source "package/libva/Config.in"
 	source "package/libva-intel-driver/Config.in"
 	source "package/libvdpau/Config.in"
diff --git a/package/libsvg-cairo/Config.in b/package/libsvg-cairo/Config.in
deleted file mode 100644
index 4602e93c2a..0000000000
--- a/package/libsvg-cairo/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_LIBSVG_CAIRO
-	bool "libsvg-cairo"
-	select BR2_PACKAGE_CAIRO
-	select BR2_PACKAGE_CAIRO_PNG
-	select BR2_PACKAGE_LIBSVG
-	help
-	  Libsvg-cairo provides the ability to render SVG content from
-	  files or buffers. All rendering is performed using the cairo
-	  rendering library.
-
-	  http://cairographics.org
diff --git a/package/libsvg-cairo/libsvg-cairo.hash b/package/libsvg-cairo/libsvg-cairo.hash
deleted file mode 100644
index d9cfbffa7a..0000000000
--- a/package/libsvg-cairo/libsvg-cairo.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# From http://cairographics.org/snapshots/libsvg-cairo-0.1.6.tar.gz.md5
-md5  d79da7b3a60ad8c8e4b902c9b3563047  libsvg-cairo-0.1.6.tar.gz
-
-# Locally calculated
-sha256  a380be6a78ec2938100ce904363815a94068fca372c666b8cc82aa8711a0215c  libsvg-cairo-0.1.6.tar.gz
-sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING
diff --git a/package/libsvg-cairo/libsvg-cairo.mk b/package/libsvg-cairo/libsvg-cairo.mk
deleted file mode 100644
index f7a105e03e..0000000000
--- a/package/libsvg-cairo/libsvg-cairo.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# libsvg-cairo
-#
-################################################################################
-
-LIBSVG_CAIRO_VERSION = 0.1.6
-LIBSVG_CAIRO_SITE = http://cairographics.org/snapshots
-LIBSVG_CAIRO_DEPENDENCIES = cairo libsvg
-LIBSVG_CAIRO_INSTALL_STAGING = YES
-LIBSVG_CAIRO_LICENSE = LGPL-2.1+
-LIBSVG_CAIRO_LICENSE_FILES = COPYING
-
-LIBSVG_CAIRO_CONF_OPTS = --without-x
-
-$(eval $(autotools-package))

--===============1406412565243950776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1406412565243950776==--
