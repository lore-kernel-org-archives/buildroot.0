Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E54C433F5
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 20:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7847041813;
	Thu,  5 May 2022 20:12:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id awg9rdstP0wz; Thu,  5 May 2022 20:12:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FB6E40A06;
	Thu,  5 May 2022 20:12:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44E4C1BF342
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2F2C60B8B
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nby0cwCNnlR1 for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 20:12:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BBC160B8D
 for <buildroot@buildroot.org>; Thu,  5 May 2022 20:12:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 565CD85B30; Thu,  5 May 2022 20:02:05 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 May 2022 22:11:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 64f67ede01699c47ca3c8801ae5dd440295f1874
X-Git-Newrev: 27ac6619aa48eee2e05a70d5b2a38e62e20840dd
X-Patchwork-Hint: ignore
Message-Id: <20220505200205.565CD85B30@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ola: add missing dependencies to
 libusb
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

commit: https://git.buildroot.net/buildroot/commit/?id=27ac6619aa48eee2e05a70d5b2a38e62e20840dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
- http://autobuild.buildroot.net/results/97d07f84cf8e34a697bd332c360ce353b96b2e26/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ola/ola.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 1fd6d6a592..6600de797e 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -203,6 +203,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_OLA_PLUGIN_STAGEPROFI),y)
 OLA_CONF_OPTS += --enable-stageprofi --enable-libusb
+OLA_DEPENDENCIES += libusb
 else
 OLA_CONF_OPTS += --disable-stageprofi
 endif
@@ -215,12 +216,14 @@ endif
 
 ifeq ($(BR2_PACKAGE_OLA_PLUGIN_USBDMX),y)
 OLA_CONF_OPTS += --enable-usbdmx --enable-libusb
+OLA_DEPENDENCIES += libusb
 else
 OLA_CONF_OPTS += --disable-usbdmx
 endif
 
 ifeq ($(BR2_PACKAGE_OLA_PLUGIN_USBPRO),y)
 OLA_CONF_OPTS += --enable-usbpro --enable-libusb
+OLA_DEPENDENCIES += libusb
 else
 OLA_CONF_OPTS += --disable-usbpro
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
