Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3174C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 20:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D9864168A;
	Thu, 12 May 2022 20:52:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ugo_PRsihqOi; Thu, 12 May 2022 20:52:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 652F7409FA;
	Thu, 12 May 2022 20:52:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D3BC1BF3A4
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7FBC40462
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oVZO1mXljb_z for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 20:51:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7ED740393
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:51:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 0DD0A85D87; Thu, 12 May 2022 20:41:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 22:38:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00a046e455c88dd352c9bda3b93b8e6ed60d492c
X-Git-Newrev: 91b10ec79a65fe6bb9668e66c4a37b8e568ee15e
X-Patchwork-Hint: ignore
Message-Id: <20220512204101.0DD0A85D87@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnutls: remove redundant
 --enable-openssl-compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=91b10ec79a65fe6bb9668e66c4a37b8e568ee15e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The option is set a few lines below depending on
BR2_PACKAGE_GNUTLS_OPENSSL.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[yann.morin.1998@free.fr: move it all under a single conditional block]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
