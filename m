Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10440C64EC4
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 20:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E4FC60AE2;
	Tue, 28 Feb 2023 20:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E4FC60AE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8kHafBXLGIrG; Tue, 28 Feb 2023 20:36:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0DB260AD5;
	Tue, 28 Feb 2023 20:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0DB260AD5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 702C21BF293
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 20:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5870C400D8
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 20:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5870C400D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Y8Ic2DMomWv for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 20:35:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98325400FC
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 20:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98325400FC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8342F86DB0; Tue, 28 Feb 2023 20:35:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 21:34:30 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 72697a95c72d02cf852a1f59d9d48351deff2f08
X-Git-Newrev: 1d613d478ee2e4f16cf68e508451d1a26a7a612a
X-Patchwork-Hint: ignore
Message-Id: <20230228203520.8342F86DB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/ssdp-responder;
 drop systemd unit installation, not needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=1d613d478ee2e4f16cf68e508451d1a26a7a612a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

When systemd is enabled the ssdp-responder build system already installs
the unit file, with the correct name, so we can safely drop this.

This fixes the recurring autobuilder problems that cropped up the last
week+ or so after fixing the spelling error in 6e0ba6b.

 - http://autobuild.buildroot.net/results/f6912d6f79155c5d12811beeb6cb43860e37e7e7
 - http://autobuild.buildroot.net/results/7ee4ed26de7e45b52a9f6f36b839e578d2319247
 - http://autobuild.buildroot.net/results/33d9c10ea58a7cd3b3e2ed75d586007a92ccdaf0
 - http://autobuild.buildroot.net/results/f1238081fc94e3004aebb8e849fdd567a92a2d39
 - http://autobuild.buildroot.net/results/f7f2cf790f51e6224dca258c52bd31d21d621074

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d6e3d36a85f19acedd2ed58f5b8616dbf24f57a4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ssdp-responder/ssdp-responder.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/ssdp-responder/ssdp-responder.mk b/package/ssdp-responder/ssdp-responder.mk
index d878e3c629..9b477e48cc 100644
--- a/package/ssdp-responder/ssdp-responder.mk
+++ b/package/ssdp-responder/ssdp-responder.mk
@@ -25,9 +25,4 @@ define SSDP_RESPONDER_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50ssdpd
 endef
 
-define SSDP_RESPONDER_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 $(@D)/ssdp-responder.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/ssdp-responder.service
-endef
-
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
