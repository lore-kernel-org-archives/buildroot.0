Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37269C43334
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 17:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93FFE417C4;
	Wed, 22 Jun 2022 17:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93FFE417C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KMeozMOv-uaG; Wed, 22 Jun 2022 17:12:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 550D7409E5;
	Wed, 22 Jun 2022 17:12:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 550D7409E5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E5CB1BF34D
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 17:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E41060BFA
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 17:12:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E41060BFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K8wI9yf54Uwa for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 17:12:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B248860B9B
Received: from smtp-outgoing-1801.laposte.net (smtp-outgoing-1801.laposte.net
 [160.92.124.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B248860B9B
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 17:12:31 +0000 (UTC)
X-mail-filterd: {"version":"1.4.3", "queueID":"4LSqgt44nmzWf0V",
 "contextId":"1a192077-2ba3-42fc-8883-912cb1309686"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0107.laposte.net (SMTP Server) with ESMTP id 4LSqgt44nmzWf0V;
 Wed, 22 Jun 2022 19:12:26 +0200 (CEST)
X-mail-filterd: {"version":"1.4.3", "queueID":"4LSqgt2lBtzWf0T",
 "contextId":"dba51a78-9041-48bc-9b7d-d8d45e179cc7"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 50
X-lpn-spamlevel: not-spam
Received: from localhost.localdomain (unknown [88.121.255.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mlpnf0107.laposte.net (SMTP Server) with ESMTPSA id 4LSqgt2lBtzWf0T;
 Wed, 22 Jun 2022 19:12:26 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 22 Jun 2022 19:11:29 +0200
Message-Id: <20220622171129.31658-1-ni.poirot@laposte.net>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=laposte.net; s=lpn-wlmd; t=1655917949;
 bh=bbDHY2oZ0QYyFJICdpFDv+qRXERRrAnHJmE3foptGq8=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
 b=HE9woyJLLLnAvbO4cyFYrIOgGIPXyq7zcrnFbPKgpvd5UX70c7/dJyE+CXA+dKyCsbTnEeRZKEpa0pXyzJLJgyHNb4zJp8XxTjG7B/kXulFd1KOtn8AYYSWFdWUXg0Y7bzHL1aRCwAJ4DFyxUgp3pw9id+hx3tL9oRSDygBSss6okf0HTqnEfUx0x+GsnWTepDPPMfY6BALYpbhOEQYjF8yp1kdO1IKFFUeJ8qjqCmjHhr+0dCDofAvV/KC4S4FouyK7vX1inrMQG6+YsPdkka8NXRJn0rnjnHlDohyDypWuhNyUP6nEPnHIlePJqR3Tav21aaJCCSuq7jDptdeBjw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net
 header.a=rsa-sha256 header.s=lpn-wlmd header.b=HE9woyJL
Subject: [Buildroot] [PATCH 1/1] docs/manual: fix configurations listing
 command
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
From: Nicolas POIROT via buildroot <buildroot@buildroot.org>
Reply-To: Nicolas POIROT <ni.poirot@laposte.net>
Cc: Nicolas POIROT <ni.poirot@laposte.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Nicolas POIROT <ni.poirot@laposte.net>
---
 docs/manual/customize-configuration.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/customize-configuration.txt b/docs/manual/customize-configuration.txt
index ae6cebe6c4..fa8f454674 100644
--- a/docs/manual/customize-configuration.txt
+++ b/docs/manual/customize-configuration.txt
@@ -15,8 +15,8 @@ make with +make savedefconfig BR2_DEFCONFIG=<path-to-defconfig>+.
 
 The recommended place to store this defconfig is
 +configs/<boardname>_defconfig+. If you follow this recommendation, the
-configuration will be listed in +make help+ and can be set again by
-running +make <boardname>_defconfig+.
+configuration will be listed in +make list-defconfigs+ and can be set
+again by running +make <boardname>_defconfig+.
 
 Alternatively, you can copy the file to any other place and rebuild with
 +make defconfig BR2_DEFCONFIG=<path-to-defconfig-file>+.
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
