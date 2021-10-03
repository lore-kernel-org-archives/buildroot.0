Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C50CEC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:14:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78B3F61222
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 78B3F61222
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0948B40493;
	Sun,  3 Oct 2021 20:14:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ry8V7Mg0RKJD; Sun,  3 Oct 2021 20:14:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2781F4018E;
	Sun,  3 Oct 2021 20:14:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C667F1BF44A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B588940512
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:14:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WrztBE2oq-gG for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 20:14:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23ADA4050F
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 20:14:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6D99187E83; Sun,  3 Oct 2021 20:12:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 22:13:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b97e8a79f955812284e52ad3c0b6d41a41142d47
X-Git-Newrev: 56933c402e37bf74f074e3bfbb90a8fc5dd88dd1
X-Patchwork-Hint: ignore
Message-Id: <20211003201207.6D99187E83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpewebkit: remove
 gst1-plugins-good from dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=56933c402e37bf74f074e3bfbb90a8fc5dd88dd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is only a runtime dependency not a build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Adrian perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wpewebkit/wpewebkit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 5c5e6625f8..50714b4366 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -39,7 +39,7 @@ ifeq ($(BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA),y)
 WPEWEBKIT_CONF_OPTS += \
 	-DENABLE_VIDEO=ON \
 	-DENABLE_WEB_AUDIO=ON
-WPEWEBKIT_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-base gst1-plugins-good
+WPEWEBKIT_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-base
 else
 WPEWEBKIT_CONF_OPTS += \
 	-DENABLE_VIDEO=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
