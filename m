Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76F2C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 713F0838B3;
	Fri, 16 May 2025 10:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kO26Kr7i1v4M; Fri, 16 May 2025 10:17:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9088C8385D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9088C8385D;
	Fri, 16 May 2025 10:17:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C46E185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 591CD8385D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d2dUE2K-PjOd for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:17:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.131;
 helo=smtpcmd12131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 400A583760
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 400A583760
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 400A583760
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:17:50 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id Fs8Ru09tGDWj0Fs8RugEdo; Fri, 16 May 2025 12:17:48 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 16 May 2025 12:17:47 +0200
Message-Id: <20250516101747.2942959-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGnAVdZLIxc0M4Jj1Pwh2FMDQtoMcQXVROFPa08b/5a1GMZkKUdYrLHzf0z47qSibYz+XXCiLaYT+YM9zXBIvu35Lr76UP2kWpiTsz/WfHZXMWmFCbhJ
 6f8bBMNufyKIuoZ731mIBlb8SoKTuxgIuRebUKUGEL3HPp1ku/AMwCE7iEvZHDTpf4sckNEkMwh2DxH5c8jZTrtVlB6MJW6y0EuD2Lc9ZRgEPMUgIP1FY0VS
 8LkpmBWJM76W9pgavb4mmnKYqlMMgiHoG486OhBGGNBD1EzuIARbQI6mohF4J+L1Zuyo87xKionK1TX2zYjHsg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1747390668; bh=45iaXIkzNgdC3H92UpWI5EhSBd9jfl5y0MXeyaN2M4M=;
 h=From:To:Subject:Date:MIME-Version;
 b=iFr3cRiUqBvqTLgTSz2Nshsw0xhXAvcKd5ZRlWf89wUt7gDJ1iBuVpJeuLpno/PsX
 0v+ebrsukt7t2drlY14qbSoH6+TL6WOOUjKPLEo2EBYt28DDovXubFDMNmKa2mszB0
 KW9Xbl6R6jbnplLqVQ9MjDpJ4rO9HXKrxyB60ta4IPp/II55wmxNUykpv8VR+3lhPO
 KEAb0Bm3ocBNqs+Ul6Nd54mi9OdnAZSvj4uGwKnP8bFqagxt/onvLkHX4xyiQ+ocE5
 51/4seSfbyb4LXxNu2cMHAd7ErMxAp/fvK45UtDZFg97OWW7OOeZfVmiS2M1ijWuVf
 qMTGU+N9O5how==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=iFr3cRiU
Subject: [Buildroot] [PATCH v2] package/rtl8188eu: fix building with Linux
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

Add local patch pending upstream to fix build failure with Linux 6.14.

Fixes:
https://autobuild.buildroot.org/results/065b9afc1c6f9f5561547b12171269adc8c12275

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* fix Subject prefix as pointed by Luca Ceresoli
---
 .../0002-Fix-build-with-Linux-6.14.patch      | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/rtl8188eu/0002-Fix-build-with-Linux-6.14.patch

diff --git a/package/rtl8188eu/0002-Fix-build-with-Linux-6.14.patch b/package/rtl8188eu/0002-Fix-build-with-Linux-6.14.patch
new file mode 100644
index 0000000000..a05a760d22
--- /dev/null
+++ b/package/rtl8188eu/0002-Fix-build-with-Linux-6.14.patch
@@ -0,0 +1,33 @@
+From 0363681349f683050bc9a265db8310e8c4eb6534 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Thu, 15 May 2025 22:32:48 +0200
+Subject: [PATCH] Fix build with Linux 6.14
+
+Commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7a53af85d3bbdbe06cd47b81a6d99a04dc0a3963
+adds argument "unsigned int link_id" to get_tx_power(), so let's add it to
+cfg80211_rtw_get_txpower() according to Linux version.
+
+Upstream: https://github.com/lwfinger/rtl8188eu/pull/464
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ ioctl_cfg80211.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/ioctl_cfg80211.c b/ioctl_cfg80211.c
+index 270cfce..04434fa 100644
+--- a/ioctl_cfg80211.c
++++ b/ioctl_cfg80211.c
+@@ -3240,6 +3240,9 @@ static int cfg80211_rtw_set_txpower(struct wiphy *wiphy,
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
