Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58675C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 10:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA2B081385;
	Wed, 10 Aug 2022 10:28:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA2B081385
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PnqtJvx11XUC; Wed, 10 Aug 2022 10:28:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21D868134D;
	Wed, 10 Aug 2022 10:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21D868134D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 83DA11BF48C
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 10:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F3A340B9A
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 10:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F3A340B9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zyUe3LK4dKfU for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 10:28:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A14A40B99
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 10:28:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A14A40B99
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CC24887029; Wed, 10 Aug 2022 10:14:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 12:24:52 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: aab9b61957be5a9f424574b5b668e6dc129ea743
X-Git-Newrev: b77f52662091441b0cd0708f6c21239322ee0d18
X-Patchwork-Hint: ignore
Message-Id: <20220810101415.CC24887029@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libwebsockets:
 add wolfssl optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=b77f52662091441b0cd0708f6c21239322ee0d18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

wolfssl is an optional dependency since version 1.5.1 and
https://github.com/warmcat/libwebsockets/commit/c3bcb89d01da0c3ce9915cd73451399ec005b535

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d6319d97a7864314088dcc6d1199f35029cfcecb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libwebsockets/libwebsockets.mk | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index f5cde37109..79624948a5 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -34,16 +34,25 @@ ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBWEBSOCKETS_DEPENDENCIES += openssl host-openssl
 LIBWEBSOCKETS_CONF_OPTS += \
 	-DLWS_WITH_SSL=ON \
-	-DLWS_WITH_MBEDTLS=OFF
+	-DLWS_WITH_MBEDTLS=OFF \
+	-DLWS_WITH_WOLFSSL=OFF
 else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 LIBWEBSOCKETS_DEPENDENCIES += mbedtls
 LIBWEBSOCKETS_CONF_OPTS += \
 	-DLWS_WITH_SSL=ON \
-	-DLWS_WITH_MBEDTLS=ON
+	-DLWS_WITH_MBEDTLS=ON \
+	-DLWS_WITH_WOLFSSL=OFF
+else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
+LIBWEBSOCKETS_DEPENDENCIES += host-pkgconf wolfssl
+LIBWEBSOCKETS_CONF_OPTS += \
+	-DLWS_WITH_SSL=ON \
+	-DLWS_WITH_MBEDTLS=OFF \
+	-DLWS_WITH_WOLFSSL=ON
 else
 LIBWEBSOCKETS_CONF_OPTS += \
 	-DLWS_WITH_SSL=OFF \
-	-DLWS_WITH_MBEDTLS=OFF
+	-DLWS_WITH_MBEDTLS=OFF \
+	-DLWS_WITH_WOLFSSL=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEV),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
