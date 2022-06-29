Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE61EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Jun 2022 22:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18490402D7;
	Wed, 29 Jun 2022 22:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18490402D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gA-XQVt2ZH97; Wed, 29 Jun 2022 22:10:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E3A3402E5;
	Wed, 29 Jun 2022 22:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E3A3402E5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE04E1BF3AF
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 22:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7B3A402D7
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 22:10:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7B3A402D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Zmw2M4wHMu7 for <buildroot@lists.busybox.net>;
 Wed, 29 Jun 2022 22:10:02 +0000 (UTC)
X-Greylist: delayed 00:05:52 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF13C40131
Received: from smtp-out3.electric.net (smtp-out3.electric.net [208.70.128.181])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF13C40131
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 22:10:02 +0000 (UTC)
Received: from 1o6fn6-0001Ja-UA by out3b.electric.net with emc1-ok (Exim
 4.94.2) (envelope-from <kris@embeddedTS.com>)
 id 1o6fn7-0001L3-Tc; Wed, 29 Jun 2022 15:04:09 -0700
Received: by emcmailer; Wed, 29 Jun 2022 15:04:09 -0700
Received: from [66.210.251.27] (helo=mail.embeddedts.com)
 by out3b.electric.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <kris@embeddedTS.com>)
 id 1o6fn6-0001Ja-UA; Wed, 29 Jun 2022 15:04:08 -0700
Received: from tsdebian.Massive (97-120-89-198.ptld.qwest.net [97.120.89.198])
 by mail.embeddedts.com (Postfix) with ESMTPSA id A893318C22;
 Wed, 29 Jun 2022 15:04:07 -0700 (MST)
To: buildroot@buildroot.org
Date: Wed, 29 Jun 2022 15:03:32 -0700
Message-Id: <20220629220332.14157-1-kris@embeddedTS.com>
X-Mailer: git-send-email 2.11.0
X-Outbound-IP: 66.210.251.27
X-Env-From: kris@embeddedTS.com
X-Proto: esmtps
X-Revdns: wsip-66-210-251-27.ph.ph.cox.net
X-HELO: mail.embeddedts.com
X-TLS: TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256
X-Authenticated_ID: 
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (b)
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=embeddedTS.com; s=mailanyone20220121;
 h=Message-Id:Date:To:From; bh=KOVyv5EjKFtQH4DAHiOeNxNKKvJyHrNtRa6KI7bc7B0=;
 b=PdZj+341f4xNqqzhgNrSFJHprAflpaL8iUQTkp9OQypXmeTQPb2Fst0DLH2/qtomScTFRZA5k4ZJczXf+pd/nWVKu/O4wNl0GeOHYmdjIVM4VU4wm7m8mCDNzijNnodkLQaUs1LOrr23toKhk9QUIpeO26H5QkhZtcNJi9Hloo1e1Z1BdvFP3v+J4y38fulYdxM3Nke6XB7E/QUrVLO6FtuRsfwWNLGPRyb/oyAEdkviLeSVQgsgkucTaeEokOz5VKoLcCQKLShGDNTACyLcRxIG98YNdSyUrtjxToMK1IG6/CupvynzKsHpcJ2GYz2BzYlI5y2yd1gKBlUzeAbwIg==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=embeddedTS.com header.i=@embeddedTS.com
 header.a=rsa-sha256 header.s=mailanyone20220121 header.b=PdZj+341
Subject: [Buildroot] [PATCH 1/1] package/wilc-firmware: bump version to 15.7
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
From: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Reply-To: Kris Bahnsen <kris@embeddedTS.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Kris Bahnsen <kris@embeddedTS.com>, Mark Featherston <mark@embeddedTS.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
---
 package/wilc-firmware/wilc-firmware.hash | 2 +-
 package/wilc-firmware/wilc-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wilc-firmware/wilc-firmware.hash b/package/wilc-firmware/wilc-firmware.hash
index 874766aec0..6e7850df16 100644
--- a/package/wilc-firmware/wilc-firmware.hash
+++ b/package/wilc-firmware/wilc-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  29bb5739136cdb4088cb52af59badce05cc7e562bca40e9f29fef7f8f7c19cb8  wilc-firmware-wilc_linux_15_6.tar.gz
+sha256  2c2e2927a65fe4d7ec2f9872fca35c6b7bf12090ac62116d63c5f17b95a3a786  wilc-firmware-wilc_linux_15_7.tar.gz
 sha256  71355eee947a312594dbdaac039827544f93d23949b65c356b7b0ce09e2600fb  LICENSE.wilc_fw
diff --git a/package/wilc-firmware/wilc-firmware.mk b/package/wilc-firmware/wilc-firmware.mk
index 1a7ceca18e..e31829d430 100644
--- a/package/wilc-firmware/wilc-firmware.mk
+++ b/package/wilc-firmware/wilc-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WILC_FIRMWARE_VERSION = wilc_linux_15_6
+WILC_FIRMWARE_VERSION = wilc_linux_15_7
 WILC_FIRMWARE_SITE = $(call github,linux4wilc,firmware,$(WILC_FIRMWARE_VERSION))
 
 WILC_FIRMWARE_LICENSE = PROPRIETARY
-- 
2.11.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
