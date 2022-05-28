Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57F8C433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 11:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 791CB844E8;
	Sat, 28 May 2022 11:06:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m4JsxSgOQgrp; Sat, 28 May 2022 11:06:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FCD3843BD;
	Sat, 28 May 2022 11:06:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E0E001BF95F
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 11:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C0E44019A
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 11:05:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id srQWXUFyBNie for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 11:05:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D293840B60
 for <buildroot@buildroot.org>; Sat, 28 May 2022 11:05:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7B95A84BCC; Sat, 28 May 2022 10:53:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 12:54:03 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2987ca064becdfb1ca4aa3907f2e2feb6245a3e6
X-Git-Newrev: 1819ab9622a89d8c7c80ad15be884a2a28b48331
X-Patchwork-Hint: ignore
Message-Id: <20220528105354.7B95A84BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/gnutls: remove
 redundant --enable-openssl-compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=1819ab9622a89d8c7c80ad15be884a2a28b48331
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The option is set a few lines below depending on
BR2_PACKAGE_GNUTLS_OPENSSL.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[yann.morin.1998@free.fr: move it all under a single conditional block]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 91b10ec79a65fe6bb9668e66c4a37b8e568ee15e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/gnutls.mk | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 79e7d529b1..2d37cfc65f 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -12,11 +12,6 @@ GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
 GNUTLS_LICENSE_FILES = doc/COPYING.LESSER
 
-ifeq ($(BR2_PACKAGE_GNUTLS_OPENSSL),y)
-GNUTLS_LICENSE += , GPL-3.0+ (gnutls-openssl library)
-GNUTLS_LICENSE_FILES += doc/COPYING
-endif
-
 GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 nettle
 GNUTLS_CPE_ID_VENDOR = gnu
 GNUTLS_CONF_OPTS = \
@@ -25,7 +20,6 @@ GNUTLS_CONF_OPTS = \
 	--disable-libdane \
 	--disable-rpath \
 	--disable-tests \
-	--enable-openssl-compatibility \
 	--without-libcrypto-prefix \
 	--without-libdl-prefix \
 	--without-libev-prefix \
@@ -36,7 +30,6 @@ GNUTLS_CONF_OPTS = \
 	--without-librt-prefix \
 	--without-libz-prefix \
 	--without-tpm \
-	$(if $(BR2_PACKAGE_GNUTLS_OPENSSL),--enable,--disable)-openssl-compatibility \
 	$(if $(BR2_PACKAGE_GNUTLS_TOOLS),--enable-tools,--disable-tools) \
 	$(if $(BR2_PACKAGE_GNUTLS_ENABLE_SSL2),--enable,--disable)-ssl2-support \
 	$(if $(BR2_PACKAGE_GNUTLS_ENABLE_GOST),--enable,--disable)-gost
@@ -47,6 +40,14 @@ GNUTLS_CONF_ENV = gl_cv_socket_ipv6=yes \
 	gl_cv_func_gettimeofday_clobber=no
 GNUTLS_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_GNUTLS_OPENSSL),y)
+GNUTLS_LICENSE += , GPL-3.0+ (gnutls-openssl library)
+GNUTLS_LICENSE_FILES += doc/COPYING
+GNUTLS_CONF_OPTS += --enable-openssl-compatibility
+else
+GNUTLS_CONF_OPTS += --disable-openssl-compatibility
+endif
+
 ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
 GNUTLS_CONF_OPTS += --enable-cryptodev
 GNUTLS_DEPENDENCIES += cryptodev-linux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
