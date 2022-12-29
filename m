Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D928FC3DA79
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 23:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A094403F9;
	Thu, 29 Dec 2022 23:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A094403F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZZGrKyorbssD; Thu, 29 Dec 2022 23:58:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CB25403E7;
	Thu, 29 Dec 2022 23:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CB25403E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FD121BF35E
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 23:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A9A981AAC
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 23:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A9A981AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2GkKOdhnPTDU for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 23:58:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B18381A9C
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B18381A9C
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 23:58:37 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id B2nDpo8MkiL39B2nDpTJ1E; Fri, 30 Dec 2022 00:58:35 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 30 Dec 2022 00:58:34 +0100
Message-Id: <20221229235834.321957-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNTyZJWdmcCIpKp2JNd8azgvDK5IVFpAIVfFElG93dnGNHvMujdCR3iIDCDhTN9e5IOX99Lj/jf1WiVb7eb8kpap6g89IFPg9Awb+L2oZPOCbaCUw/Zz
 +AANZbY6iCMgH20C5lz8gzZWXd6/pHlskK6t/u6WtlcB2EBGBzg0Cl0KTq+WwEGlgIfbvepGoSHjqzgpOtt1aG1Buyr3OwKz1ptNTHmh3DT5cSwiONwXT0ui
 NtFf5CjPMBu61jGY45279wVpTmL0fzzDi6SW5f4G51lTftU+n0EU5BaeEDB79XDFrkp06cGKPIvFZnRNllJuRg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1672358315; bh=OqakDXXGRld2FRRiKyLGQiVMummsqGHFCSgIqhFiJhQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=iVqbGjiwrG6c5YKlfQlQD7FpyPVBcPeLgT9ie2bU9nSZE/hD7HtIDktAj1RGZdvMi
 4Krzwq3W4KI3soPlqTbt8NBXS+qMlIlFzcYq3JLeA9jFSCH5FD3ZrAW1rXtehyEWZH
 eecIkZe5k5kTOuzVIfPtwIIAI7+QA4HeRlcm1l1It0GEgNRBdyTCmHkqbI2OXMyHaO
 qtYgvS1DdtvsV19A+6wvFqDmWw+nrahRI24IZDpgnVG1iFPbwL3kOzndZ9HjH3NWaN
 y6ljeFesmm1bUnp+blViK/ha3uG7w6rTBVUQGUFEvzX5eSkz5r6p5/C377pbwt4TJX
 Cc9/kZ7MilLhg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=iVqbGjiw
Subject: [Buildroot] [PATCH] package/xr819-xradio: fix build failure on
 Linux 6.1
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add 2 local patches pending upstream[0] to fix build failure with Linux 6.1

[0]: https://github.com/fifteenhex/xradio/pull/19

Fixes:
Still not produced

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...missing-prandom_u32-with-Linux-6.1.0.patch | 34 +++++++++++++++++++
 ...ailure-due-to-ieee80211_nullfunc_get.patch | 34 +++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 package/xr819-xradio/0001-wsm.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch
 create mode 100644 package/xr819-xradio/0002-ap.c-fix-build-failure-due-to-ieee80211_nullfunc_get.patch

diff --git a/package/xr819-xradio/0001-wsm.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch b/package/xr819-xradio/0001-wsm.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch
new file mode 100644
index 0000000000..ac07074034
--- /dev/null
+++ b/package/xr819-xradio/0001-wsm.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch
@@ -0,0 +1,34 @@
+From d336006f0d9e9663a5ff61d38e98ddd33e175167 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Fri, 30 Dec 2022 00:44:30 +0100
+Subject: [PATCH] wsm.c: fix missing prandom_u32() with Linux >= 6.1.0
+
+prandom_u32() previously was only calling get_random_u32() so it's been
+dropped with Linux 6.1.0. So let's directly call get_random_u32() if Linux
+version >= 6.1.0.
+
+[Upstream status: https://github.com/fifteenhex/xradio/pull/19]
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ wsm.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/wsm.c b/wsm.c
+index 85eeef8..ea73770 100644
+--- a/wsm.c
++++ b/wsm.c
+@@ -2609,7 +2609,11 @@ static int xradio_get_prio_queue(struct xradio_vif *priv,
+ 		edca = &priv->edca.params[i];
+ 		score = ((edca->aifns + edca->cwMin) << 16) +
+ 				(edca->cwMax - edca->cwMin) *
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))
++				(get_random_u32() & 0xFFFF);
++#else
+ 				(prandom_u32() & 0xFFFF);
++#endif
+ 		if (score < best && (winner < 0 || i != 3)) {
+ 			best = score;
+ 			winner = i;
+-- 
+2.34.1
+
diff --git a/package/xr819-xradio/0002-ap.c-fix-build-failure-due-to-ieee80211_nullfunc_get.patch b/package/xr819-xradio/0002-ap.c-fix-build-failure-due-to-ieee80211_nullfunc_get.patch
new file mode 100644
index 0000000000..cb3cab113f
--- /dev/null
+++ b/package/xr819-xradio/0002-ap.c-fix-build-failure-due-to-ieee80211_nullfunc_get.patch
@@ -0,0 +1,34 @@
+From 5f0dd19dc8acad9816bb1b857551f3289e386d32 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Fri, 30 Dec 2022 00:52:30 +0100
+Subject: [PATCH] ap.c: fix build failure due to ieee80211_nullfunc_get()
+ change in Linux 6.1
+
+Starting from Linux 6.1 it's been added 'int link_id' parameter to
+ieee80211_nullfunc_get() to comply to MSO, but this module doesn't support
+it. So let's handle this case by passing default 0 as link_id parameter.
+
+[Upstream status: https://github.com/fifteenhex/xradio/pull/19]
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ ap.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/ap.c b/ap.c
+index 51b8a44..649d6bf 100644
+--- a/ap.c
++++ b/ap.c
+@@ -1145,7 +1145,9 @@ static int xradio_upload_null(struct xradio_vif *priv)
+ 		.rate = 0xFF,
+ 	};
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 14, 17))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))
++	frame.skb = ieee80211_nullfunc_get(priv->hw, priv->vif, 0, false);
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 14, 17))
+ 	frame.skb = ieee80211_nullfunc_get(priv->hw, priv->vif, false);
+ #else
+ 	frame.skb = ieee80211_nullfunc_get(priv->hw, priv->vif);
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
