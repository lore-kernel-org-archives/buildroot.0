Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1142C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 19:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 562794134A;
	Wed, 16 Apr 2025 19:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Xwoo8kviFWV; Wed, 16 Apr 2025 19:56:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7734241391
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7734241391;
	Wed, 16 Apr 2025 19:56:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F2E166B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8A6A60765
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:56:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LVMOuMh30fnX for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 19:56:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.148;
 helo=smtpdh19-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3F803605CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F803605CD
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F803605CD
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:56:40 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 58s9ulLXLvoVF58s9up9uM; Wed, 16 Apr 2025 21:56:37 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 16 Apr 2025 21:56:36 +0200
Message-Id: <20250416195636.3131473-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDbll8geXI4gQ7E5asl1gSJDjiTM6yiIUqZdpKpv+J4FKhZRcr2Fj+Lkr3AAqE9W5/ph2W2KAFlfY8UoP7D73RYmU9AtDVbUUjpEKUsTrAHRfsgJtFas
 A6+oanBOmY/cfrEWrzm81Bqw2MrcOkGXt9uTcuU4fm21fDeN01h5jUFeoKDFnIvsVc+bcac6fN9ku7B4ex2uYFvkjCBRo364MGDkD1MZ61S9PYnmsoayVd9M
 3sOn1QNu2WQt8YSmWnHTpVjCY8H2e572uSsCbSB15GmQcC60oQkzGPjdIVkx0HHQdnhToc4U81dbi7q87ujhdA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1744833397; bh=eBOwkTWzGBdD98mYnRoPqiugfHA9qJWRbCy9iQhcVFk=;
 h=From:To:Subject:Date:MIME-Version;
 b=P8KBQ8dGxpCp8Rxdnf2XsGghLKQ5CT3+lG6lf3uYwX3gw4Pl0U/DhTwrVs10nZPZO
 zELlNu5iSQ1yjZVnEURU5CIfdE10TaJTMvGl3lU2O7CYnduQ2JvuJrrSfpKIhfLB7a
 ysh2yP3681Ys/RNMPHHNjjaxTdPx17MfsJnIRawPgRO7sffOo7y6nDJFY4ZEk08Fi4
 1kOxXtjRh5YMPGAtcYYuukdjiDSENHg0BNyTU686aYl/ZW/6+5ythkE+aRBLPH8EUL
 wvmAGAdys/CUReiO/RBRDGb4mIoEFGv5aPz1jnJfTy2x9oNexPf/rK9ZxKAjSnQlci
 0LbX0Er2i5WLQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=P8KBQ8dG
Subject: [Buildroot] [PATCH] package/rtl8188eu: fix build failure with Linux
 6.13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patch pending upstream to fix build failure with Linux 6.13

Fixes:
https://autobuild.buildroot.org/results/4a0ebbcd62a2bfc59a7f6183f100f0e111cee750

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0001-Fix-build-with-Linux-6.13.patch      | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/rtl8188eu/0001-Fix-build-with-Linux-6.13.patch

diff --git a/package/rtl8188eu/0001-Fix-build-with-Linux-6.13.patch b/package/rtl8188eu/0001-Fix-build-with-Linux-6.13.patch
new file mode 100644
index 0000000000..3594283ff1
--- /dev/null
+++ b/package/rtl8188eu/0001-Fix-build-with-Linux-6.13.patch
@@ -0,0 +1,35 @@
+From 408ac4abdd1e187624ebef9f6a45ecc437525de5 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 16 Apr 2025 17:34:54 +0200
+Subject: [PATCH] Fix build with Linux 6.13
+
+Commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9c4f830927750a2bf9fd9426a5257f0fdce3b662
+adds struct net_device *dev as argument to set_monitor_channel(), so let's
+add it to cfg80211_rtw_set_monitor_channel() according to Linux version.
+
+Upstream: https://github.com/lwfinger/rtl8188eu/pull/463
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ ioctl_cfg80211.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/ioctl_cfg80211.c b/ioctl_cfg80211.c
+index c6ae5aa..270cfce 100644
+--- a/ioctl_cfg80211.c
++++ b/ioctl_cfg80211.c
+@@ -4404,7 +4404,10 @@ static int	cfg80211_rtw_set_channel(struct wiphy *wiphy
+ }
+ 
+ static int cfg80211_rtw_set_monitor_channel(struct wiphy *wiphy
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 13, 0))
++	, struct net_device *dev
++	, struct cfg80211_chan_def *chandef
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
+ 	, struct cfg80211_chan_def *chandef
+ #else
+ 	, struct ieee80211_channel *chan
+-- 
+2.39.5
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
