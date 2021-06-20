Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F0CC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:36:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A085860524
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A085860524
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7269040442;
	Tue,  3 Aug 2021 21:36:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E1VUCOWTUdPg; Tue,  3 Aug 2021 21:36:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D9BC4025C;
	Tue,  3 Aug 2021 21:36:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 472B61BF9C2
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFB7C83A9D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m2MVXlVjRThI for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DB4B8354D
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 63C8786016; Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 20 Jun 2021 15:40:12 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ebda5414d33b11e4e49c9300d50fd24cb840b41c
X-Git-Newrev: 4d85defa7103aadc74223868fb83ed0bed144f4d
X-Patchwork-Hint: ignore
Message-Id: <20210803210953.63C8786016@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libuhttpd: bump
 version to 3.12.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=4d85defa7103aadc74223868fb83ed0bed144f4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

CMake options have been renamed: UHTTPD_ prefix was dropped,
BUILD_STATIC_LIBS renamed to BUILD_STATIC.

Also fix handling of BUILD_STATIC: it should only be given when building
static libs, otherwise no dynamic lib is built.

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libuhttpd/libuhttpd.hash |  2 +-
 package/libuhttpd/libuhttpd.mk   | 40 +++++++++++++++++++++-------------------
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
index 19a02e5be0..98bd6e513b 100644
--- a/package/libuhttpd/libuhttpd.hash
+++ b/package/libuhttpd/libuhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dcd95fac7b29d43f57e942db6e9fb4c8745d4284684cd627d60c8a7f8c76cd32  libuhttpd-3.11.0.tar.gz
+sha256  c234dd3d491c4daa047e28870c6e740529b2eff2dd027dafb6bf02d8dba286b0  libuhttpd-3.12.1.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index 61afec701e..3a99fe0613 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUHTTPD_VERSION = 3.11.0
+LIBUHTTPD_VERSION = 3.12.1
 LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
 LIBUHTTPD_LICENSE = MIT
 LIBUHTTPD_LICENSE_FILES = LICENSE
@@ -14,33 +14,35 @@ LIBUHTTPD_DEPENDENCIES = libev
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBUHTTPD_DEPENDENCIES += openssl
 LIBUHTTPD_CONF_OPTS += \
-	-DUHTTPD_SSL_SUPPORT=ON \
-	-DUHTTPD_USE_MBEDTLS=OFF \
-	-DUHTTPD_USE_OPENSSL=ON \
-	-DUHTTPD_USE_WOLFSSL=OFF
+	-DSSL_SUPPORT=ON \
+	-DUSE_MBEDTLS=OFF \
+	-DUSE_OPENSSL=ON \
+	-DUSE_WOLFSSL=OFF
 else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
 LIBUHTTPD_DEPENDENCIES += wolfssl
 LIBUHTTPD_CONF_OPTS += \
-	-DUHTTPD_SSL_SUPPORT=ON \
-	-DUHTTPD_USE_MBEDTLS=OFF \
-	-DUHTTPD_USE_OPENSSL=OFF \
-	-DUHTTPD_USE_WOLFSSL=ON
+	-DSSL_SUPPORT=ON \
+	-DUSE_MBEDTLS=OFF \
+	-DUSE_OPENSSL=OFF \
+	-DUSE_WOLFSSL=ON
 else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 LIBUHTTPD_DEPENDENCIES += mbedtls
 LIBUHTTPD_CONF_OPTS += \
-	-DUHTTPD_SSL_SUPPORT=ON \
-	-DUHTTPD_USE_MBEDTLS=ON \
-	-DUHTTPD_USE_OPENSSL=OFF \
-	-DUHTTPD_USE_WOLFSSL=OFF
+	-DSSL_SUPPORT=ON \
+	-DUSE_MBEDTLS=ON \
+	-DUSE_OPENSSL=OFF \
+	-DUSE_WOLFSSL=OFF
 else
-LIBUHTTPD_CONF_OPTS += -DUHTTPD_SSL_SUPPORT=OFF
+LIBUHTTPD_CONF_OPTS += \
+	-DSSL_SUPPORT=OFF
 endif
 
-# BUILD_SHARED_LIBS is handled in pkg-cmake.mk as it is a generic cmake variable
-ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-LIBUHTTPD_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
-else ifeq ($(BR2_SHARED_LIBS),y)
-LIBUHTTPD_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
+# BUILD_STATIC builds *only* the static lib, which is not what we want for
+# BR2_SHARED_STATIC.
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBUHTTPD_CONF_OPTS += -DBUILD_STATIC=ON
+else
+LIBUHTTPD_CONF_OPTS += -DBUILD_STATIC=OFF
 endif
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
