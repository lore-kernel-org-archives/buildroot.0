Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720AEC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11CDC60EC1;
	Sun, 17 Jul 2022 13:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11CDC60EC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P7Tx44aIzlbY; Sun, 17 Jul 2022 13:02:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09C4360BF5;
	Sun, 17 Jul 2022 13:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09C4360BF5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F312E1BF97A
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBF6C408B4
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:02:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBF6C408B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J-C4giwr_TRs for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:02:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D86C140106
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:02:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D86C140106
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A76E583A8F; Sun, 17 Jul 2022 12:49:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 15:01:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 891bba3ce22ba56be7b124179c368401d57a1568
X-Git-Newrev: d6319d97a7864314088dcc6d1199f35029cfcecb
X-Patchwork-Hint: ignore
Message-Id: <20220717124917.A76E583A8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libwebsockets: add wolfssl
 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6319d97a7864314088dcc6d1199f35029cfcecb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wolfssl is an optional dependency since version 1.5.1 and
https://github.com/warmcat/libwebsockets/commit/c3bcb89d01da0c3ce9915cd73451399ec005b535

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
