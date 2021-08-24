Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A476AC4338F
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 21:58:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47C28613CD
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 21:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47C28613CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1271380F4E;
	Tue, 24 Aug 2021 21:58:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NDZdF7Lnbmyy; Tue, 24 Aug 2021 21:58:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E20781BF4;
	Tue, 24 Aug 2021 21:58:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF25D1BF2A2
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 21:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F5406138E
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 21:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNuQbYwNPniY for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 21:58:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA5DA606BF
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 21:58:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id BB2C71C0008;
 Tue, 24 Aug 2021 21:58:15 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 24 Aug 2021 23:58:12 +0200
Message-Id: <20210824215813.1122744-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] DEVELOPERS: drop Maxime Hadjinlian
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Maxime has not been contributing to Buildroot for several years, so it
doesn't make sense to keep him in the DEVELOPERS file and make us
think that those packages are being maintained and to Cc: him on
patches affecting those packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7d2fbf4cf3..53448dd100 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1876,36 +1876,6 @@ F:	package/postgis/
 F:	package/protozero/
 F:	package/timescaledb/
 
-N:	Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
-F:	package/babeld/
-F:	package/dante/
-F:	package/faifa/
-F:	package/initscripts/
-F:	package/intel-microcode/
-F:	package/iucode-tool/
-F:	package/jasper/
-F:	package/kodi/
-F:	package/libass/
-F:	package/libbluray/
-F:	package/libcdio/
-F:	package/libcofi/
-F:	package/libenca/
-F:	package/libmodplug/
-F:	package/libnfs/
-F:	package/libplist/
-F:	package/libshairplay/
-F:	package/linux-zigbee/
-F:	package/netcat-openbsd/
-F:	package/open-plc-utils/
-F:	package/rpi-firmware/
-F:	package/rpi-userland/
-F:	package/rtmpdump/
-F:	package/skeleton/
-F:	package/systemd/
-F:	package/systemd-bootchart/
-F:	package/tinyalsa/
-F:	package/tinyxml/
-
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
 F:	configs/arcturus_ucp1020_defconfig
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
