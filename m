Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA58C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38E504EEBA;
	Mon, 20 Feb 2023 22:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38E504EEBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0HOfEQyqhKga; Mon, 20 Feb 2023 22:51:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEE7B4F37F;
	Mon, 20 Feb 2023 22:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEE7B4F37F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB5CB1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5012C416FE
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5012C416FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s5tkZSY_zkZ6 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C6B841700
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C6B841700
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7985386495; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 21:46:52 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d47f7279f516ba2bbc6d1fd9dd37636902b9bad3
X-Git-Newrev: 4ab2946dba9d71dcce9297efc05348c87f304a22
X-Patchwork-Hint: ignore
Message-Id: <20230220205217.7985386495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/hostapd: enable
 802.11ax support
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
