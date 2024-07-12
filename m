Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62975C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 21:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6127441325;
	Fri, 12 Jul 2024 21:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sRP4imEfq3_H; Fri, 12 Jul 2024 21:07:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 435DF419B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 435DF419B8;
	Fri, 12 Jul 2024 21:07:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 197A31BF3C4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 21:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01814810A8
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 21:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Maeqgj6JOahy for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 21:07:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 400D38057F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 400D38057F
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 21:07:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24DF186267; Fri, 12 Jul 2024 21:07:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 23:06:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f458cd6c2940267655f673b3ae5f14334f12859
X-Git-Newrev: afbe0fe8f5907f8d5eb4fde428af54721313a4cd
X-Patchwork-Hint: ignore
Message-Id: <20240712210746.24DF186267@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpewebkit: use libavif if enabled
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

commit: https://git.buildroot.net/buildroot/commit/?id=afbe0fe8f5907f8d5eb4fde428af54721313a4cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make wpewebkit pick a value for the USE_AVIF option depending
on BR2_PACKAGE_LIBAVIF.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpewebkit/wpewebkit.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index ecb3b3e352..1355b65f61 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -28,8 +28,7 @@ WPEWEBKIT_CONF_OPTS = \
 	-DENABLE_INTROSPECTION=OFF \
 	-DENABLE_MINIBROWSER=OFF \
 	-DENABLE_WEB_RTC=OFF \
-	-DUSE_ATK=OFF \
-	-DUSE_AVIF=OFF
+	-DUSE_ATK=OFF
 
 ifeq ($(BR2_PACKAGE_WPEWEBKIT_SANDBOX),y)
 WPEWEBKIT_CONF_OPTS += \
@@ -61,6 +60,13 @@ else
 WPEWEBKIT_CONF_OPTS += -DENABLE_MEDIA_STREAM=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBAVIF),y)
+WPEWEBKIT_CONF_OPTS += -DUSE_AVIF=ON
+WPEWEBKIT_DEPENDENCIES += libavif
+else
+WPEWEBKIT_CONF_OPTS += -DUSE_AVIF=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL),y)
 WPEWEBKIT_CONF_OPTS += -DUSE_GSTREAMER_GL=ON
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
