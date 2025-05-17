Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5903FC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 23:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F01BB407DA;
	Sat, 17 May 2025 23:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7b4DRopjHf4g; Sat, 17 May 2025 23:30:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F4E7407DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F4E7407DC;
	Sat, 17 May 2025 23:30:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF035204
 for <buildroot@buildroot.org>; Sat, 17 May 2025 23:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C51AF407DC
 for <buildroot@buildroot.org>; Sat, 17 May 2025 23:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FG2_7ElPRUh1 for <buildroot@buildroot.org>;
 Sat, 17 May 2025 23:30:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.116;
 helo=smtpdh17-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 32065407DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32065407DA
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32065407DA
 for <buildroot@buildroot.org>; Sat, 17 May 2025 23:30:46 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id GQzLuytattfOnGQzLuuIqA; Sun, 18 May 2025 01:30:43 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 18 May 2025 01:30:42 +0200
Message-Id: <20250517233042.3444293-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfERYfIIZLLvNV9LvU+ucKamMZGum+4IHxZcfxGZDA9jQZATlxs92cY5+M5swlhOAAv1DdnQZa7QAng4C93LzBxVUlM1SiIM+7M2mx7KNCYiV4SKcZXH+
 mBBiaCc2mfiNCKkr9iLI1DEXAYwnHcSioEKjigRciQGtmi5uBLnajkbv/nawr4rCiZ+6uMKWS/O2w7pRpIyRJnqQy464am5hZaJZOIfOpIc5U1NzotxhM/W8
 AtssW/9x5tGIKsgAi9YeqpQVqixN7gxhrh2VgVFU0aGf7pHoT7GdoYuOa0fwG2yxHbe3hEIpcO6YFp1lIn/EBQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1747524643; bh=P9Rw4rjWLsMnvAyLI+BKxZ2BZobYVPKPmWtuX6Mbwgg=;
 h=From:To:Subject:Date:MIME-Version;
 b=Hp+GDjPdOYNwhq2CmIYgNEjXC1nFO/+qypxwUlgGDmxjXk+2Jse8Wgl6WLeMrF2kG
 tyMmlAgLQJRb0ewXtcr1TSpS1euXwTXr1hcrMzeYHodGlhuNaX6vDOngE9JAMcmpTL
 I+uU4yUBoETNaQrMqYIcc3q8696OcDj1pJRJWRwu/ZXz8LYsm98W4xyV1+903TLpMa
 VFDa6nsJaR93gvlI/TKAJLFqeYQz+tB5qMWW1AcBbNrj07IWqhgCG2oTkD1zZ3M2NB
 Tw1eArFtXqJmnZaTtQQsoIrE+GkKQC3dsWt5bPLc0xqV4bvp9GntzNYkrgmtWv9YGy
 oNeb5kFvTdogQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Hp+GDjPd
Subject: [Buildroot] [PATCH] package/rtl8723ds: fix build failure with Linux
 6.14
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

Add local patch pending upstream to fix build failure with Linux 6.14

Fixes:
https://autobuild.buildroot.org/results/f6421f9669934686e1ff881b9618198afc9e1259/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0002-Fix-build-with-Linux-6.14.patch      | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/rtl8723ds/0002-Fix-build-with-Linux-6.14.patch

diff --git a/package/rtl8723ds/0002-Fix-build-with-Linux-6.14.patch b/package/rtl8723ds/0002-Fix-build-with-Linux-6.14.patch
new file mode 100644
index 0000000000..3027489e33
--- /dev/null
+++ b/package/rtl8723ds/0002-Fix-build-with-Linux-6.14.patch
@@ -0,0 +1,33 @@
+From d75e35dea1b2551c12e54d5997a1db946ab06080 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sun, 18 May 2025 01:24:26 +0200
+Subject: [PATCH] Fix build with Linux 6.14
+
+Commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7a53af85d3bbdbe06cd47b81a6d99a04dc0a3963
+adds argument "unsigned int link_id" to get_tx_power(), so let's add it to
+cfg80211_rtw_get_txpower() according to Linux version.
+
+Upstream: https://github.com/lwfinger/rtl8723ds/pull/52/commits/d75e35dea1b2551c12e54d5997a1db946ab06080
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ os_dep/linux/ioctl_cfg80211.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/os_dep/linux/ioctl_cfg80211.c b/os_dep/linux/ioctl_cfg80211.c
+index 75391e7..adc1fec 100644
+--- a/os_dep/linux/ioctl_cfg80211.c
++++ b/os_dep/linux/ioctl_cfg80211.c
+@@ -3362,6 +3362,9 @@ static int cfg80211_rtw_set_txpower(struct wiphy *wiphy,
+ static int cfg80211_rtw_get_txpower(struct wiphy *wiphy,
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
+ 	struct wireless_dev *wdev,
++#endif
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 14, 0))
++	unsigned int link_id,
+ #endif
+ 	int *dbm)
+ {
+-- 
+2.39.5
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
