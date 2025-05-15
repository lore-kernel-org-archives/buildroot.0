Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC189C3ABDD
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 20:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B06341702;
	Thu, 15 May 2025 20:37:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yn6s1HftuTnH; Thu, 15 May 2025 20:37:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A78B416FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A78B416FF;
	Thu, 15 May 2025 20:37:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 821BE185
 for <buildroot@buildroot.org>; Thu, 15 May 2025 20:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66939606E8
 for <buildroot@buildroot.org>; Thu, 15 May 2025 20:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEl-H2sudtns for <buildroot@buildroot.org>;
 Thu, 15 May 2025 20:37:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.146;
 helo=smtpcmd13146.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0994B60846
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0994B60846
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0994B60846
 for <buildroot@buildroot.org>; Thu, 15 May 2025 20:37:42 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id FfKlufWpf6z5ZFfKluQt4o; Thu, 15 May 2025 22:37:40 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 15 May 2025 22:37:39 +0200
Message-Id: <20250515203739.1238211-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJi57DD38j2w4CZTYQf25xwArr8UWMUEAotSBEEx147GYMb2KQP+TBktNGe6bRQMvztvXJqyf/FcN2UCTQXACtMGpgkx6JL+JhIE2XkkO3FnZJb+jIaH
 /0EkGd+01kkrDHGTtX1GotMUwf3JFziC/eAxnA/7lSmW5kEi7rgAtu3Aax9qs5zCNzGcf88N9L6QvCnn4shbLzf/iog6gAN8EksdiYl159S7G7o72i0JsB3o
 b2TH1M5DeqTqTZtXUctHV0czaYukNHGhzdX23R/2+oHaJ8VOIb87zQliI19STAi2jIrW175+dmmVEDTGDrUvAA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1747341460; bh=kLIQjT+352y5oxHU9GezCAQRPAr4yHvHVaLEK/+O+fo=;
 h=From:To:Subject:Date:MIME-Version;
 b=dB/LCYweqtN/yxnSLz82Adf/XhhuLkbuwRbRtG4TN7l9xnHXqSJjASkFfxMy3eTL/
 FRf0w6bARpd4H8Zn2z3tHreI02BfWzRNmd1RyKjv/ebQ+ggeMEjbMoeM3CUtsPD5OT
 fHyjqrJDVSrWwm7LQmK215XT/99NQMtDGvWgXojhfiDc79fJyG1PhgenegpzaRTsaI
 jKFop3sE3ouOm491UA/zwX5uNY+FIOx2CHOiW1pSWyiC+MPB+vy6l6ARKSzfzT6/at
 2PIDOC/6MGmDaAplDTGDbfKfz/V6OweYDa02iHuk5zgiAG3qTMWhDSwGFriigzm7nt
 qxPcEempN2UqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=dB/LCYwe
Subject: [Buildroot] [PATCH] Fix building with Linux 6.14
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
