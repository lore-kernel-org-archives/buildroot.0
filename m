Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85363C6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A69E40BFC;
	Sun, 11 Sep 2022 09:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A69E40BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YfvzKzinqNlJ; Sun, 11 Sep 2022 09:18:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5759740BB8;
	Sun, 11 Sep 2022 09:18:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5759740BB8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 53BC01BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57A346FB4F
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57A346FB4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gowVIrh3XVMA for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDD1660B2C
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDD1660B2C
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id ABB238361F; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 22:47:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d73bc1eb3a559c96310359cbb2cc7fb1792037df
X-Git-Newrev: 028611be7195b4e616ea1910126aae36e62d33bf
X-Patchwork-Hint: ignore
Message-Id: <20220911084826.ABB238361F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webkitgtk: support game
 controllers via libmanette
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

commit: https://git.buildroot.net/buildroot/commit/?id=028611be7195b4e616ea1910126aae36e62d33bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for the Gamepad API in webkitgtk, depending on
libmanette, which is used for implementing access to game
controllers.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/webkitgtk/webkitgtk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 8949cb2b1c..0dbb72f970 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -18,7 +18,6 @@ WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf \
 	libtasn1 libxml2 libxslt openjpeg sqlite webp woff2
 WEBKITGTK_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \
-	-DENABLE_GAMEPAD=OFF \
 	-DENABLE_GEOLOCATION=OFF \
 	-DENABLE_GTKDOC=OFF \
 	-DENABLE_MINIBROWSER=ON \
@@ -71,6 +70,13 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_INTROSPECTION=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBMANETTE),y)
+WEBKITGTK_CONF_OPTS += -DENABLE_GAMEPAD=ON
+WEBKITGTK_DEPENDENCIES += libmanette
+else
+WEBKITGTK_CONF_OPTS += -DENABLE_GAMEPAD=OFF
+endif
+
 # Only one target platform can be built, assume X11 > Wayland
 
 # GTK3-X11 target gives OpenGL from newer libgtk3 versions
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
