Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56606C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 13:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3B07402CD;
	Tue, 26 Dec 2023 13:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3B07402CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZYr-aueuaGtU; Tue, 26 Dec 2023 13:59:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC568402FD;
	Tue, 26 Dec 2023 13:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC568402FD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 624C41BF228
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 13:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B9D68139E
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 13:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B9D68139E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1qLPVX5BMzBo for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 13:59:45 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F282801EC
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 13:59:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F282801EC
Received: by mail.gandi.net (Postfix) with ESMTPA id E6CD4E0003;
 Tue, 26 Dec 2023 13:59:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 14:59:39 +0100
Message-ID: <20231226135941.2784505-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703599184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/wGbz6SJv5OQhk8gxJm+1eQai/aVCCT0jLJncZ9Wwis=;
 b=EJfZDfSzYpQMdrTUELdhenqxr+tqID4ClpP+RB6nmtLD6FV9JZGem6AdWqV5AUMatZFNAt
 icoq+CM33IL0iN83/9V2DoE/0rn8soy4FRsOGNz78HgqOwA42c2h1yxfJ1S7OKb5JJOpsS
 9P8+shjEKYgQ1RC+xcUkOJfxewZaKqUbEyk97eY7FCDbXic244gEwHUuHNx/gujAJLQ05c
 yYWt/oBSYj5FpTL8zETfBpaZ/kCsrKyS8L2r3pcI2oyjLA9g4hexT5ky290LEoB4cmC2P7
 Dwhsovm9ZEPVc8f6E2D9v3sd8Di5zFlU4WmYcXZFw5oDjlMLGNPpSIaqhKQhtw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EJfZDfSz
Subject: [Buildroot] [PATCH v2 1/2] package/gmpc: remove package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is unmaintained upstream:

- The URL in our Config.in,
  http://gmpcwiki.sarine.nl/index.php?title=GMPC, no longer works

- https://github.com/DaveDavenport/gmpc says it's unmaintained

- The official lists of MPD clients at
  https://www.musicpd.org/clients/ says it's maintained, and points at
  http://gmpclient.org/, which is no longer owned by the developers of
  GMPC.

- It still uses libsoup (2) which we want to get rid of at some
  point.

- It was added by Gustavo Zacarias, and no version bumped occurred
  since 2011.

So let's kill this package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy       |  7 +++++++
 package/Config.in      |  1 -
 package/gmpc/Config.in | 26 --------------------------
 package/gmpc/gmpc.hash |  3 ---
 package/gmpc/gmpc.mk   | 18 ------------------
 5 files changed, 7 insertions(+), 48 deletions(-)
 delete mode 100644 package/gmpc/Config.in
 delete mode 100644 package/gmpc/gmpc.hash
 delete mode 100644 package/gmpc/gmpc.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index d46bd97442..0ab9dcadff 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.11"
 
+config BR2_PACKAGE_GMPC
+	bool "gmpc package was removed"
+	select BR2_LEGACY
+	help
+	  The gmpc package was removed because it was unmaintained,
+	  and still using the old libsoup2 library.
+
 config BR2_PACKAGE_ONEVPL
 	bool "onevpl package was renamed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 98653ff29d..34efaf29e5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -405,7 +405,6 @@ comment "X applications"
 	source "package/dillo/Config.in"
 	source "package/docker/Config.in"
 	source "package/feh/Config.in"
-	source "package/gmpc/Config.in"
 	source "package/gtkperf/Config.in"
 	source "package/leafpad/Config.in"
 	source "package/mupdf/Config.in"
diff --git a/package/gmpc/Config.in b/package/gmpc/Config.in
deleted file mode 100644
index 1aa74251f0..0000000000
--- a/package/gmpc/Config.in
+++ /dev/null
@@ -1,26 +0,0 @@
-config BR2_PACKAGE_GMPC
-	bool "gmpc"
-	depends on BR2_PACKAGE_LIBGTK2
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_LIBMPD
-	select BR2_PACKAGE_LIBSOUP
-	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_SQLITE
-	select BR2_PACKAGE_XLIB_LIBICE
-	select BR2_PACKAGE_XLIB_LIBSM
-	select BR2_PACKAGE_XLIB_LIBX11
-	help
-	  Gnome Music Player Client is a GNOME/GTK2.2 client for
-	  Music Player Daemon.
-
-	  http://gmpcwiki.sarine.nl/index.php?title=GMPC
-
-comment "gmpc needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_XORG7 && BR2_PACKAGE_LIBGTK2
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gmpc/gmpc.hash b/package/gmpc/gmpc.hash
deleted file mode 100644
index 66de8b6226..0000000000
--- a/package/gmpc/gmpc.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  a69414f35396846733632ca9619921d7acda537ffd6d49bd84b444945cb76b2c  gmpc-11.8.16.tar.gz
-sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/gmpc/gmpc.mk b/package/gmpc/gmpc.mk
deleted file mode 100644
index 40b77eb189..0000000000
--- a/package/gmpc/gmpc.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# gmpc
-#
-################################################################################
-
-GMPC_VERSION = 11.8.16
-GMPC_SITE = http://download.sarine.nl/Programs/gmpc/$(GMPC_VERSION)
-GMPC_CONF_ENV = ac_cv_path_GOB2=$(GOB2_HOST_BINARY)
-GMPC_CONF_OPTS = --disable-mmkeys --disable-unique
-GMPC_LICENSE = GPL-2.0+
-GMPC_LICENSE_FILES = COPYING
-GMPC_DEPENDENCIES = host-gob2 host-intltool host-pkgconf host-vala \
-	libglib2 libgtk2 libmpd libsoup sqlite \
-	xlib_libICE xlib_libSM xlib_libX11 \
-	$(TARGET_NLS_DEPENDENCIES)
-
-$(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
