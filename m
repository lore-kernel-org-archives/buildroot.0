Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A3DC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 17:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B314C83267;
	Thu, 11 Aug 2022 17:35:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B314C83267
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IJa9pstTeE1u; Thu, 11 Aug 2022 17:35:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E388F831BD;
	Thu, 11 Aug 2022 17:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E388F831BD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 59F891C1190
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 17:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4134260B15
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 17:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4134260B15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yVkjd_qMCljc for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 17:33:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74E1E60AEE
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 17:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74E1E60AEE
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BC1C38718E; Thu, 11 Aug 2022 17:19:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 19:31:58 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 97e19b306b7f41dc1bebd08c71418dd6ab0af9ea
X-Git-Newrev: 088028edbcc0d2266aa7c8aeaae47e08d2b66f24
X-Patchwork-Hint: ignore
Message-Id: <20220811171922.BC1C38718E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/bind: drop
 unrecognized options
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

commit: https://git.buildroot.net/buildroot/commit/?id=088028edbcc0d2266aa7c8aeaae47e08d2b66f24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

--enable-threads, --with-randomdev, --enable-filter-aaaa, --with-ecdsa,
--with-eddsa, --with-aes, --with-gost are all unrecognized since bump to
version 9.16.26 in commit 8adeaec8afacbc680edebae91524f6144926ac92:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --disable-dependency-tracking, --enable-ipv6, --enable-nls, --enable-threads, --with-randomdev, --enable-filter-aaaa, --with-ecdsa, --with-eddsa, --with-aes, --with-gost

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9e6e84f0c62a0f529bcc61ed2142212ead7ee4bb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
