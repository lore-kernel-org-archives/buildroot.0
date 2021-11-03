Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F8F3C4332F
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:48:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30707608FB
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30707608FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0504680BAF;
	Wed,  3 Nov 2021 17:48:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8jXOK_dxrIZo; Wed,  3 Nov 2021 17:48:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18B9780B99;
	Wed,  3 Nov 2021 17:48:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 120711BF85D
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E22460630
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:48:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bss4aUg7SWhE for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 17:48:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A603E6063D
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 17:48:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5C4C38A399; Wed,  3 Nov 2021 17:44:47 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 18:48:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22abc0cf45354fbd1850924c946de30ccc48e011
X-Git-Newrev: ac49e2b4f610e679e84120b4d6ea96d20833362e
X-Patchwork-Hint: ignore
Message-Id: <20211103174447.5C4C38A399@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libstrophe: bump to version 0.11.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ac49e2b4f610e679e84120b4d6ea96d20833362e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use official tarball (and so drop autoreconf and first patch)
- gnutls is an optional dependency since
  https://github.com/strophe/libstrophe/commit/e490011b680633b3d4b734cd416b4ae2c21b3cc3

https://github.com/strophe/libstrophe/releases/tag/0.11.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libstrophe/0001-make-autoreconfable.patch | 20 --------------------
 package/libstrophe/Config.in                      |  2 +-
 package/libstrophe/libstrophe.hash                |  2 +-
 package/libstrophe/libstrophe.mk                  | 17 ++++++++++++-----
 4 files changed, 14 insertions(+), 27 deletions(-)

diff --git a/package/libstrophe/0001-make-autoreconfable.patch b/package/libstrophe/0001-make-autoreconfable.patch
deleted file mode 100644
index 76ca6f25e8..0000000000
--- a/package/libstrophe/0001-make-autoreconfable.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Make the package autoreconfigurable
-
-Signed-off-by: Denis Bodor <lefinnois@lefinnois.net>
-[Gustavo: update for 0.8.8]
-
-diff -Nura libstrophe-0.8.8.orig/m4/.empty libstrophe-0.8.8/m4/.empty
---- libstrophe-0.8.8.orig/m4/.empty	1969-12-31 21:00:00.000000000 -0300
-+++ libstrophe-0.8.8/m4/.empty	2015-09-23 19:29:37.893688227 -0300
-@@ -0,0 +1,2 @@
-+
-+
-diff -Nura libstrophe-0.8.8.orig/Makefile.am libstrophe-0.8.8/Makefile.am
---- libstrophe-0.8.8.orig/Makefile.am	2015-09-23 19:26:10.960492781 -0300
-+++ libstrophe-0.8.8/Makefile.am	2015-09-23 19:29:17.265970964 -0300
-@@ -1,4 +1,4 @@
--AUTOMAKE_OPTIONS = subdir-objects
-+AUTOMAKE_OPTIONS = subdir-objects foreign
- 
- ACLOCAL_AMFLAGS = -I m4
- AM_CFLAGS = -g -Wall
diff --git a/package/libstrophe/Config.in b/package/libstrophe/Config.in
index 5fdb918d7a..6ddc70b9f9 100644
--- a/package/libstrophe/Config.in
+++ b/package/libstrophe/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBSTROPHE
 	bool "libstrophe"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBXML2 if !BR2_PACKAGE_EXPAT
 	help
 	  libstrophe is a lightweight XMPP client library written in C.
diff --git a/package/libstrophe/libstrophe.hash b/package/libstrophe/libstrophe.hash
index d5f151660f..9551b191c6 100644
--- a/package/libstrophe/libstrophe.hash
+++ b/package/libstrophe/libstrophe.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  5bf0bbc555cb6059008f1b748370d4d2ee1e1fabd3eeab68475263556405ba39  libstrophe-0.10.1.tar.gz
+sha256  feafee545403d26a44aa573d4adf327d6d07ad3f3466370634d22bbac5bd49ee  libstrophe-0.11.0.tar.xz
 sha256  82476f36ffd5e895a176013c0812166ba7b7d99f3d536fc7f5ed2e33e9f74a08  MIT-LICENSE.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-LICENSE.txt
diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index e078eb25cd..04ba0a69d0 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-LIBSTROPHE_VERSION = 0.10.1
-LIBSTROPHE_SITE = $(call github,strophe,libstrophe,$(LIBSTROPHE_VERSION))
-LIBSTROPHE_DEPENDENCIES = openssl host-pkgconf
-# Doesn't ship configure
-LIBSTROPHE_AUTORECONF = YES
+LIBSTROPHE_VERSION = 0.11.0
+LIBSTROPHE_SOURCE = libstrophe-$(LIBSTROPHE_VERSION).tar.xz
+LIBSTROPHE_SITE = https://github.com/strophe/libstrophe/releases/download/$(LIBSTROPHE_VERSION)
+LIBSTROPHE_DEPENDENCIES = host-pkgconf
 LIBSTROPHE_LICENSE = MIT or GPL-3.0
 LIBSTROPHE_LICENSE_FILES = MIT-LICENSE.txt GPL-LICENSE.txt
 LIBSTROPHE_INSTALL_STAGING = YES
@@ -21,4 +20,12 @@ LIBSTROPHE_CONF_OPTS += --with-libxml2
 LIBSTROPHE_DEPENDENCIES += libxml2
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBSTROPHE_CONF_OPTS += --with-tls --without-gnutls
+LIBSTROPHE_DEPENDENCIES += openssl
+else
+LIBSTROPHE_CONF_OPTS += --with-gnutls --without-tls
+LIBSTROPHE_DEPENDENCIES += gnutls
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
