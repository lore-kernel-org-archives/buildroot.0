Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D71C7EE23
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 20:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E47540BB7;
	Sat, 25 Feb 2023 20:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E47540BB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id stWFI0MQDqBa; Sat, 25 Feb 2023 20:54:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B407F40BB5;
	Sat, 25 Feb 2023 20:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B407F40BB5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D7141BF3EE
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 20:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32223606ED
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 20:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32223606ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Wb2WPT3EWzX for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 20:53:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32C0260750
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 20:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32C0260750
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2117686AE6; Sat, 25 Feb 2023 20:53:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 21:47:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11ba2c5b8d23e086d589e025b7a31cdd7bae14a5
X-Git-Newrev: 7e608885a2df51ba77378f210f4c0e8cb59d5b8b
X-Patchwork-Hint: ignore
Message-Id: <20230225205333.2117686AE6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtty: bump to version 8.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e608885a2df51ba77378f210f4c0e8cb59d5b8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failure with wolfssl raised, at
least, since bump of wolfssl to version 5.5.0 in commit
1891419db38e4d85595b2111db448f68eef684b8:

/tmp/instance-18/output-1/build/rtty-7.4.0/src/ssl.c:75:5: error: unknown type name 'SSL_CTX'
   75 |     SSL_CTX *ctx;
      |     ^~~~~~~

https://github.com/zhaojh329/rtty/compare/v7.4.0...v8.1.0

Fixes:
 - http://autobuild.buildroot.org/results/d045d85890ca97accfcea6c13c94757485d867c2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtty/rtty.hash |  2 +-
 package/rtty/rtty.mk   | 28 ++++++++++++++--------------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/package/rtty/rtty.hash b/package/rtty/rtty.hash
index b2e9db2436..a6ccb5c2e6 100644
--- a/package/rtty/rtty.hash
+++ b/package/rtty/rtty.hash
@@ -1,2 +1,2 @@
-sha256  9bc5d30dfa9bd664a62711b6229f47505b83adb364907f24e3a404aad52a4802  rtty-7.4.0.tar.gz
+sha256  e634939bae62bf3d52ceebae5df00179629d214634b93464eeb2294406512b30  rtty-8.1.0.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
index 4ec220394c..964ec04ec4 100644
--- a/package/rtty/rtty.mk
+++ b/package/rtty/rtty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTTY_VERSION = 7.4.0
+RTTY_VERSION = 8.1.0
 RTTY_SITE = https://github.com/zhaojh329/rtty/releases/download/v$(RTTY_VERSION)
 RTTY_LICENSE = MIT
 RTTY_LICENSE_FILES = LICENSE
@@ -13,26 +13,26 @@ RTTY_DEPENDENCIES = libev
 ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 RTTY_DEPENDENCIES += mbedtls
 RTTY_CONF_OPTS += \
-	-DRTTY_SSL_SUPPORT=ON \
-	-DRTTY_USE_MBEDTLS=ON \
-	-DRTTY_USE_OPENSSL=OFF \
-	-DRTTY_USE_WOLFSSL=OFF
+	-DSSL_SUPPORT=ON \
+	-DUSE_MBEDTLS=ON \
+	-DUSE_OPENSSL=OFF \
+	-DUSE_WOLFSSL=OFF
 else ifeq ($(BR2_PACKAGE_OPENSSL),y)
 RTTY_DEPENDENCIES += host-pkgconf openssl
 RTTY_CONF_OPTS += \
-	-DRTTY_SSL_SUPPORT=ON \
-	-DRTTY_USE_MBEDTLS=OFF \
-	-DRTTY_USE_OPENSSL=ON \
-	-DRTTY_USE_WOLFSSL=OFF
+	-DSSL_SUPPORT=ON \
+	-DUSE_MBEDTLS=OFF \
+	-DUSE_OPENSSL=ON \
+	-DUSE_WOLFSSL=OFF
 else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
 RTTY_DEPENDENCIES += wolfssl
 RTTY_CONF_OPTS += \
-	-DRTTY_SSL_SUPPORT=ON \
-	-DRTTY_USE_MBEDTLS=OFF \
-	-DRTTY_USE_OPENSSL=OFF \
-	-DRTTY_USE_WOLFSSL=ON
+	-DSSL_SUPPORT=ON \
+	-DUSE_MBEDTLS=OFF \
+	-DUSE_OPENSSL=OFF \
+	-DUSE_WOLFSSL=ON
 else
-RTTY_CONF_OPTS += -DRTTY_SSL_SUPPORT=OFF
+RTTY_CONF_OPTS += -DSSL_SUPPORT=OFF
 endif
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
