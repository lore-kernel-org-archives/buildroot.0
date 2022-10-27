Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5FBFA3740
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 20:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A65FA81466;
	Thu, 27 Oct 2022 20:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A65FA81466
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ua_yHswnsUuC; Thu, 27 Oct 2022 20:30:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA85A81455;
	Thu, 27 Oct 2022 20:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA85A81455
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5FF481BF343
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 20:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39F21410B7
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 20:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39F21410B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iwji94X2WX-I for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 20:30:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DB29409DB
Received: from lexington.centerclick.org (lexington.centerclick.org
 [IPv6:2620:9a:e000:100::2])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DB29409DB
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 20:30:44 +0000 (UTC)
Received: from alliance.centerclick.org (alliance.centerclick.org
 [IPv6:2620:9a:e000:1060::10])
 by lexington.centerclick.org (Postfix) with ESMTPS id 0E759619D;
 Thu, 27 Oct 2022 16:30:43 -0400 (EDT)
Received: from pmg by alliance.centerclick.org with local (Exim 4.94.2)
 (envelope-from <pmg@alliance.centerclick.org>)
 id 1oo9WU-004DNV-N6; Thu, 27 Oct 2022 16:30:42 -0400
To: buildroot@buildroot.org
Date: Thu, 27 Oct 2022 16:30:39 -0400
Message-Id: <20221027203039.1004439-1-dave-git@centerclick.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=centerclick.org; 
 s=lexington; t=1666902643;
 bh=oitCz25kd2xpJXRkVNpWtH2C9W1FD1xkqB6qFpuv61E=;
 h=From:To:Cc:Subject:Date:From;
 b=E/yOWdajgF1xP1vWvY1cm85MrIRTZSSYzxE2LlkoneYfCTjCM8eo4cAb0rHuMrF0y
 n4fyUKbgf0JjyjPu8HH79t2lMJJp036WfOcbAVEmnEPRPwfhxPowdvJ4IAIonpasw/
 rRzzynvj2j0hTq5GkLXFH1jO+Z/ng8DJXBBnhcZ0MnM4vrjzcYbEYYZB6Fp5h2Ou/8
 5QWT8qM2nmXiES18AvBs63HfI3aTMsIuNIbmz1noQkPKDVMawPe1uzDnfAEqrtMshk
 L8XLoHx9pAQSF4/WyP7KWmHupK7jSZsVFr7nA4QlJ5EmLopJ2Oxs2LEE4ihsWnG08H
 mNAh6PlLJKlhw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=centerclick.org header.i=@centerclick.org
 header.a=rsa-sha256 header.s=lexington header.b=E/yOWdaj
Subject: [Buildroot] [PATCH 1/1] package/tzdata: install leap-seconds.list
 into results
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
From: David Johnson via buildroot <buildroot@buildroot.org>
Reply-To: David Johnson <dave-git@centerclick.org>
Cc: David Johnson <dave-git@centerclick.org>, Martin Bark <martin@barkynet.com>,
 Richard Braun <rbraun@sceen.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

add leap-seconds.list to installed files so it can be used by other packages

specifically, ntpd's ntp.conf can now include:
leapfile /usr/share/zoneinfo/leap-seconds.list

Signed-off-by: David Johnson <dave-git@centerclick.org>
---
 package/tzdata/tzdata.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 21ea94ecad..7a1a77fcd9 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -59,7 +59,7 @@ endef
 
 define HOST_TZDATA_INSTALL_CMDS
 	$(INSTALL) -d -m 0755 $(HOST_DIR)/share/zoneinfo
-	cp -a $(@D)/_output/* $(@D)/*.tab $(HOST_DIR)/share/zoneinfo
+	cp -a $(@D)/_output/* $(@D)/*.tab $(@D)/leap-seconds.list $(HOST_DIR)/share/zoneinfo
 endef
 
 $(eval $(generic-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
