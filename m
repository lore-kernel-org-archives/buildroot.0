Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4B1C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 22:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A1A440422;
	Wed, 28 Dec 2022 22:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A1A440422
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fl5CR-wk1AyK; Wed, 28 Dec 2022 22:01:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 386954035D;
	Wed, 28 Dec 2022 22:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 386954035D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0618B1BF3D1
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 22:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2B2C40182
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 22:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2B2C40182
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bxdpAf2z0n5i for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 22:01:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4CD740179
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 22:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4CD740179
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCF6F86F75; Wed, 28 Dec 2022 22:01:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 21:46:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d47f7279f516ba2bbc6d1fd9dd37636902b9bad3
X-Git-Newrev: 4ab2946dba9d71dcce9297efc05348c87f304a22
X-Patchwork-Hint: ignore
Message-Id: <20221228220147.BCF6F86F75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hostapd: enable 802.11ax support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4ab2946dba9d71dcce9297efc05348c87f304a22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Hostapd has 802.11ax support, however it is currently disabled by
default, so let's enable it as it adds only 2 KB to the overall size
of the hostapd package.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hostapd/hostapd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 4420142fbd..8981d9247e 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -53,6 +53,7 @@ endif
 ifeq ($(BR2_PACKAGE_HOSTAPD_HAS_WIFI_DRIVERS),y)
 HOSTAPD_CONFIG_ENABLE += \
 	CONFIG_HS20 \
+	CONFIG_IEEE80211AX \
 	CONFIG_IEEE80211AC \
 	CONFIG_IEEE80211N \
 	CONFIG_IEEE80211R \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
