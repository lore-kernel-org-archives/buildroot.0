Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187C8C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 19:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99B4F408E2;
	Tue, 14 Dec 2021 19:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CSMKhZ_MOAN0; Tue, 14 Dec 2021 19:55:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA98B409A8;
	Tue, 14 Dec 2021 19:55:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC54C1BF5DD
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6EE781773
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:53:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JJLbBUvyE28t for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 19:53:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA37D817C3
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 19:53:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EDA2F81E74; Tue, 14 Dec 2021 19:48:41 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 20:52:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cde3151534e702f34dd359fdd48a7de6da57ec9e
X-Git-Newrev: 2fde6bc32234c01b99b0245daa1455cdbcc86271
X-Patchwork-Hint: ignore
Message-Id: <20211214194841.EDA2F81E74@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcoap: bump to version 4.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2fde6bc32234c01b99b0245daa1455cdbcc86271
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- disable examples source which is enabled by default since
  https://github.com/obgm/libcoap/commit/feb8c15b4572569716cf1c037092edb4717ca537
- mbedtls is an optional dependency since
  https://github.com/obgm/libcoap/commit/f601ddbf78720a74f29acb704256bc2655c4aeaa
- Add Apache-2.0 for mbedtls to LICENSE:
  https://github.com/obgm/libcoap/commit/0fccf2e71347af0ef3973ac565fca110ec3d4f40

Since mbedtls is not bundled but comes from the Buildroot package, we
don't need to declare the Apache-2.0 license for libcoap. It only
applies to mbedtls.

https://github.com/obgm/libcoap/blob/v4.3.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libcoap/libcoap.hash |  4 ++--
 package/libcoap/libcoap.mk   | 15 +++++++++++----
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/package/libcoap/libcoap.hash b/package/libcoap/libcoap.hash
index 3472006224..4a5bcaa7ff 100644
--- a/package/libcoap/libcoap.hash
+++ b/package/libcoap/libcoap.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  29a0394a265d3febee41e5e2dc03d34292a0aede37f5f80334e529ac0dab2321  libcoap-4.2.1.tar.gz
+sha256  1a195adacd6188d3b71c476e7b21706fef7f3663ab1fb138652e8da49a9ec556  libcoap-4.3.0.tar.gz
 sha256  09dd86a017bad210527085008cbf706609c58210897b69845af14099577e7eb7  COPYING
-sha256  c51e85271aca3fbdd79bb4ee45dcfd854724538dad83b70afbbdfc62415e3e7f  LICENSE
+sha256  c5625e704d52deade1c9b2d7931ac8593be147ba63af62b53b8c7e309b7eaeb9  LICENSE
diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index 9a5e04d4fd..8a85ff3a2e 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -4,21 +4,28 @@
 #
 ################################################################################
 
-LIBCOAP_VERSION = 4.2.1
+LIBCOAP_VERSION = 4.3.0
 LIBCOAP_SITE = $(call github,obgm,libcoap,v$(LIBCOAP_VERSION))
 LIBCOAP_INSTALL_STAGING = YES
 LIBCOAP_LICENSE = BSD-2-Clause
 LIBCOAP_LICENSE_FILES = COPYING LICENSE
 LIBCOAP_DEPENDENCIES = host-pkgconf
-LIBCOAP_CONF_OPTS = --disable-examples --without-tinydtls
+LIBCOAP_CONF_OPTS = \
+	--disable-examples --disable-examples-source --without-tinydtls
 LIBCOAP_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LIBCOAP_DEPENDENCIES += gnutls
-LIBCOAP_CONF_OPTS += --enable-dtls --with-gnutls --without-openssl
+LIBCOAP_CONF_OPTS += \
+	--enable-dtls --with-gnutls --without-mbedtls --without-openssl
 else ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBCOAP_DEPENDENCIES += openssl
-LIBCOAP_CONF_OPTS += --enable-dtls --without-gnutls --with-openssl
+LIBCOAP_CONF_OPTS += \
+	--enable-dtls --without-gnutls --without-mbedtls --with-openssl
+else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+LIBCOAP_DEPENDENCIES += mbedtls
+LIBCOAP_CONF_OPTS += \
+	--enable-dtls --without-gnutls --with-mbedtls --without-openssl
 else
 LIBCOAP_CONF_OPTS += --disable-dtls
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
