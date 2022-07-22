Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E453C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 20:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD8B38498A;
	Fri, 22 Jul 2022 20:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD8B38498A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pD1lMDmraJZo; Fri, 22 Jul 2022 20:22:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA20284987;
	Fri, 22 Jul 2022 20:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA20284987
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9A741BF3DE
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4CD28497A
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4CD28497A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PUE_5d5qrgxc for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 20:22:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D461284977
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D461284977
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 20:22:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id A1AE2240006;
 Fri, 22 Jul 2022 20:22:00 +0000 (UTC)
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Fri, 22 Jul 2022 22:21:46 +0200
Message-Id: <20220722202151.76235-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220722202151.76235-1-thomas.petazzoni@bootlin.com>
References: <20220722202151.76235-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658521321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=coP4kd784ltwYu3gVgc46w82wI89JMQFh6hkZgQgdb4=;
 b=h9kYAHY6I9RN+Fh8SLukq0RRS2jpccCaMF8ghMvfzgHK9zMoTw7VEWTxo7Ux+4MPcF2m7t
 NN5Tfg4hARuCXecSdtBJBe5WWibVtczLyfWBQInFUaF4tHQFIOIEjccZi57PYc2CA0sMD7
 xWTGT3HIlu82/hs6FNCjDPjbhG9/9CAwaX7yTZiEsvPk68QOwsTdRIIZmyXoofGiLuNdge
 +aZ5WNGbgtnQX70JWiWH4npLOPAjCCVVVHYBTqlK8noBbj/gzM/LVOsN8K8JZOmqRBiQT6
 JDAxU2i+AA9Usy7o7t1iRnrGwqFzekbtSL21WNg83qp6s/0tlQ+ZrhOyk4P0Gg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h9kYAHY6
Subject: [Buildroot] [PATCH 4/8] board/orangepi/orangepi-r1/genimage.cfg:
 remove double quotes around partition-type-uuid values
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This allows to comply with the recently specified genimage.cfg writing
rules.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/orangepi/orangepi-r1/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-r1/genimage.cfg b/board/orangepi/orangepi-r1/genimage.cfg
index e93e802bd9..61d13fe7fc 100644
--- a/board/orangepi/orangepi-r1/genimage.cfg
+++ b/board/orangepi/orangepi-r1/genimage.cfg
@@ -28,7 +28,7 @@ image sdcard.img {
 	}
 
 	partition boot {
-		partition-type-uuid = "U"
+		partition-type-uuid = U
 		bootable = "true"
 		image = "boot.vfat"
 	}
@@ -36,7 +36,7 @@ image sdcard.img {
 	# 'rootfs' will be used as the partition label, used
 	# with root=PARTLABEL=rootfs kernel command line
 	partition rootfs {
-		partition-type-uuid = "L"
+		partition-type-uuid = L
 		image = "rootfs.ext4"
 		size = 512M
 	}
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
