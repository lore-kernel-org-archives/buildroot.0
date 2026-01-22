Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796E8D3F083
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 17:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E270409A0;
	Wed, 28 Jan 2026 17:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWq3R6K9Hsxo; Wed, 28 Jan 2026 17:20:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62445408F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769620843;
	bh=A+GU2B/EsPU9qB4cngSfuxoVeEJdvxzKhneP+Avl4eA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fWij3xYq8JapqUk0jO+lxzVfdkjbpKk9hij49nmyPxHfn+4wgXpM0m+71UQs+rbKz
	 SdtS2mHb+I2G5+sorFYO7LOqLOi6btQByiMCHzwcJX5jxEAE1sqWIHpriS+Lr+7nWj
	 AGbBxMs2fOLd7mUMOhNp3K+YELDbNo/CAxtAdAQptF7jhtp+O/+wH7h19iFjMCkmvl
	 kXp4Y4aybHzYGfg/g4OXA9ZUtGTjROzA1wPoO5EX0SEtzn6j1D5tCwWvjx8LQkxPaj
	 Q+EQhTQPPW17G4LP+tQbZ1W6fZx2ca89hZKHQtPle7sINnCYiSybiEnE26mqNP9ajm
	 DTSbbjv6iNEbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62445408F1;
	Wed, 28 Jan 2026 17:20:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BB898118
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAA7540350
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7LDe_hfQrk5c for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 17:20:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 440DF40345
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 440DF40345
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:20:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DA7380749; Wed, 28 Jan 2026 17:20:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 15:46:55 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ff8dd4cc898d0796e2350a30e8246668a8891dca
X-Git-Newrev: 46ee38572e4cc8d5577e23667000dd2d259fdee0
X-Patchwork-Hint: ignore
Message-Id: <20260128172037.2DA7380749@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libsvg-cairo:
 remove package
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6917983629496897792=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6917983629496897792==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=46ee38572e4cc8d5577e23667000dd2d259fdee0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
(cherry picked from commit 8680db4582c5c448e0702409fc18dbdb7faf21a7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Config.in.legacy                       | 10 ++++++++++
 DEVELOPERS                             |  1 -
 package/Config.in                      |  1 -
 package/libsvg-cairo/Config.in         | 11 -----------
 package/libsvg-cairo/libsvg-cairo.hash |  6 ------
 package/libsvg-cairo/libsvg-cairo.mk   | 16 ----------------
 6 files changed, 10 insertions(+), 35 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9416e9d114..fc8b1d6951 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,16 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2025.02.11"
+
+config BR2_PACKAGE_LIBSVG_CAIRO
+	bool "libsvg-cairo package removed"
+	select BR2_LEGACY
+	help
+	  The libsvg-cairo package has been removed. Its latest
+	  upstream release was from 2005, and it wasn't used by any
+	  other Buildroot package.
+
 comment "Legacy options removed in 2025.02.10"
 
 config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
diff --git a/DEVELOPERS b/DEVELOPERS
index 2308af08d3..9554279545 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -574,7 +574,6 @@ N:	Carsten Schoenert <c.schoenert@gmail.com>
 F:	package/dvbsnoop/
 F:	package/libdvbsi/
 F:	package/libsvg/
-F:	package/libsvg-cairo/
 
 N:	Cédric Chépied <cedric.chepied@gmail.com>
 F:	package/znc/
diff --git a/package/Config.in b/package/Config.in
index 4ebfab7a82..f8cf1c7742 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1754,7 +1754,6 @@ menu "Graphics"
 	source "package/libraw/Config.in"
 	source "package/librsvg/Config.in"
 	source "package/libsvg/Config.in"
-	source "package/libsvg-cairo/Config.in"
 	source "package/libsvgtiny/Config.in"
 	source "package/libva/Config.in"
 	source "package/libva-intel-driver/Config.in"
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

--===============6917983629496897792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6917983629496897792==--
