Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C872C6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E47A283F4B;
	Mon, 20 Feb 2023 23:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E47A283F4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i_2W3OlYq6h0; Mon, 20 Feb 2023 23:37:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E7EF8374F;
	Mon, 20 Feb 2023 23:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E7EF8374F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A1DCA1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84FB541741
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84FB541741
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bYoKDWlZAxDT for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8F1641762
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8F1641762
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B90228648F; Mon, 20 Feb 2023 20:52:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 23 Jan 2023 07:25:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e6789e8b8b5f39e0efb9f4a9af492de416c121c8
X-Git-Newrev: 6e0ba6bfc2d28a8079d336a18cc50f0825952ec2
X-Patchwork-Hint: ignore
Message-Id: <20230220205239.B90228648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ssdp-responder: fix
 misspelled define directive
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e0ba6bfc2d28a8079d336a18cc50f0825952ec2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ssdp-responder/ssdp-responder.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ssdp-responder/ssdp-responder.mk b/package/ssdp-responder/ssdp-responder.mk
index fd7b1ea44b..d40f6f8c57 100644
--- a/package/ssdp-responder/ssdp-responder.mk
+++ b/package/ssdp-responder/ssdp-responder.mk
@@ -25,7 +25,7 @@ define SSDP_RESPONDER_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50ssdpd
 endef
 
-define SSDP-RESPONDER_INSTALL_INIT_SYSTEMD
+define SSDP_RESPONDER_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 $(@D)/ssdp-responder.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/ssdp-responder.service
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
