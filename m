Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69ECDC433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 09:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB1D04160A;
	Thu,  2 Jun 2022 09:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UbJ_CYm_fPrL; Thu,  2 Jun 2022 09:00:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4982410BD;
	Thu,  2 Jun 2022 09:00:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 247371BF3AD
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 09:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20D6460E92
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 09:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tiqlRjnGiZwQ for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 09:00:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A4BD60AA5
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 09:00:17 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 54A4F4000E;
 Thu,  2 Jun 2022 09:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654160415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mZ1yzHJIOayGhseiL+jCN67u9GOwz5HBXy3WFz8IqL4=;
 b=mmO2N4P5VFQBbW/wbNGFdfbyrDVRBI59HZsbR4ZeDgLBwXzVazxarNN0ziA14yA1+4fuuA
 PJlCSUdn4PQNZqYLss6nSFD65EQpKOYBftJtPrOw13AwhHzLHpii5l7s+PrniYTX557vDC
 insB3UFohRc1CSaWFWwfMhk34EgH58BIbVSu1vMHHfeLR/VgeDUA4OyhKmgn+7HGpUQkIg
 5K9/+SK8vgSO7Sl5HIBCFf7XDWjcldDoHQvgMuhxyo1mw6hyAhis5TJZpVaQI3r3HrTQey
 0pMQ4V/1q7GgvNoIhedHYbXIpQfA3lOrIzm/ZN9BOJK81FTbqN1QtcN1E486ow==
To: buildroot@buildroot.org
Date: Thu,  2 Jun 2022 11:00:11 +0200
Message-Id: <20220602090012.2008381-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-pillow: enable host package
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: kory.maincent@bootlin.com
Cc: Kory Maincent <kory.maincent@bootlin.com>, etienne.carriere@linaro.org,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kory Maincent <kory.maincent@bootlin.com>

Enable host package, needed for the build of specific optee-os package
version.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 package/python-pillow/python-pillow.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 1105326799..2abe5e04ef 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -72,3 +72,4 @@ PYTHON_PILLOW_BUILD_OPTS += --disable-webp --disable-webpmux
 endif
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
