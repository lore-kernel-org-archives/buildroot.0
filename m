Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34540C636D3
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 12:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D079F8140B;
	Sun,  5 Feb 2023 12:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D079F8140B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q219qItMVlF4; Sun,  5 Feb 2023 12:33:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E66618140D;
	Sun,  5 Feb 2023 12:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E66618140D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8FF0F1BF364
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67EE68140D
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67EE68140D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8mqrYsvMcWAn for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 12:33:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 479208140B
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 12:33:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 479208140B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 371E2837A4; Sun,  5 Feb 2023 12:33:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 13:30:51 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 70485003c5a6e8a3508760db46a98d2d9b20df2a
X-Git-Newrev: 3909dfbb818c8fc25def5c136fa8d4620f7f4a1d
X-Patchwork-Hint: ignore
Message-Id: <20230205123313.371E2837A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/ssdp-responder:
 fix misspelled define directive
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

commit: https://git.buildroot.net/buildroot/commit/?id=3909dfbb818c8fc25def5c136fa8d4620f7f4a1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6e0ba6bfc2d28a8079d336a18cc50f0825952ec2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ssdp-responder/ssdp-responder.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ssdp-responder/ssdp-responder.mk b/package/ssdp-responder/ssdp-responder.mk
index 3fee4c2006..d878e3c629 100644
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
