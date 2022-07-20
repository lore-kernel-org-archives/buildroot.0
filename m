Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2778CC43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 21:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C506B41B63;
	Wed, 20 Jul 2022 21:35:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C506B41B63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K6Umh-lhsUR2; Wed, 20 Jul 2022 21:35:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A67241B64;
	Wed, 20 Jul 2022 21:35:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A67241B64
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F12AA1BF3A1
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB23A612C3
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB23A612C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id acD2Uo6AeQVD for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 21:35:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2471160B4E
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 21:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2471160B4E
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 46D7B840EF; Wed, 20 Jul 2022 21:22:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Jul 2022 23:25:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8358ae1787f661e19dfe968993492c06afaa7b3
X-Git-Newrev: 9e6e84f0c62a0f529bcc61ed2142212ead7ee4bb
X-Patchwork-Hint: ignore
Message-Id: <20220720212204.46D7B840EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bind: drop unrecognized options
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9e6e84f0c62a0f529bcc61ed2142212ead7ee4bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--enable-threads, --with-randomdev, --enable-filter-aaaa, --with-ecdsa,
--with-eddsa, --with-aes, --with-gost are all unrecognized since bump to
version 9.16.26 in commit 8adeaec8afacbc680edebae91524f6144926ac92:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --disable-dependency-tracking, --enable-ipv6, --enable-nls, --enable-threads, --with-randomdev, --enable-filter-aaaa, --with-ecdsa, --with-eddsa, --with-aes, --with-gost

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bind/bind.mk | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 5164001ab5..0ce78d08cb 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -31,17 +31,11 @@ BIND_CONF_ENV = \
 	BUILD_CFLAGS="$(TARGET_CFLAGS)" \
 	LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 BIND_CONF_OPTS = \
-	$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-threads,--disable-threads) \
 	--without-lmdb \
 	--with-json-c=no \
-	--with-randomdev=/dev/urandom \
 	--enable-epoll \
-	--enable-filter-aaaa \
 	--disable-backtrace \
-	--with-openssl=$(STAGING_DIR)/usr \
-	--with-ecdsa=yes \
-	--with-eddsa=no \
-	--with-aes=yes
+	--with-openssl=$(STAGING_DIR)/usr
 
 BIND_DEPENDENCIES = host-pkgconf libuv openssl
 
@@ -73,13 +67,6 @@ else
 BIND_CONF_OPTS += --with-libxml2=no
 endif
 
-# GOST cipher support requires openssl extra engines
-ifeq ($(BR2_PACKAGE_OPENSSL_ENGINES),y)
-BIND_CONF_OPTS += --with-gost=yes
-else
-BIND_CONF_OPTS += --with-gost=no
-endif
-
 # Used by dnssec-keymgr
 ifeq ($(BR2_PACKAGE_PYTHON_PLY),y)
 BIND_DEPENDENCIES += host-python-ply
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
