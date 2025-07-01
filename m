Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C81C83038
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 19:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01A3361204;
	Tue,  1 Jul 2025 19:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5rJyV8oS6fu; Tue,  1 Jul 2025 19:08:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0DB0611EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0DB0611EF;
	Tue,  1 Jul 2025 19:08:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D9D5179
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D18C40B26
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VXsHEA6vF6-V for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 19:08:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.132;
 helo=smtpcmd12132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 02A7341740
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02A7341740
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02A7341740
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:08:45 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id WgLSuTx4S8eo9WgLTuLwxg; Tue, 01 Jul 2025 21:08:43 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Kris Bahnsen <kris@embeddedTS.com>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue,  1 Jul 2025 21:08:39 +0200
Message-Id: <20250701190841.714026-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250701190841.714026-1-giulio.benetti@benettiengineering.com>
References: <20250701190841.714026-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPaetpRX+Y9vzvURDsmOV4hcOQ/rzwSKlnxnMojitVJLGI73DfFBWuqTnjko41fmInFHdC7WqWwYU7QZHD2PES03qJyTqw+Lpm0S84XOEeiTYb4k0lP4
 /Uj7r1Gj/dxsYILd9irGIJB0xbpyGViNujdpRCQZ8iIntgv6X5EtyU+1NRNVeG86C910NJ1g45q20tyteoFcpImBUmk2pB4+dY6T8zlXvsJn39Ykl+TPVHty
 wVuv0V7jOcfIYwSC1RCNCCJqGswl1q7mH02ZhlGrtdoXLkpfIUJGEq0oIHW6H108tgpv9J92WUUBNTUa5PsJWy/3gUhEMt78uUdGG9Q9XOviuf83HNuNPcfv
 551DdfuINBRJN/R7m0+0ThEpSXT/DJ0kbHf7MejDzv/4CVVQ1QxkqK3upQnKk6UC7hoghr0m
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1751396923; bh=eTimHLdyIgjfJ+FGKQOmnfOaX7F4g6SMpMq/D+5Wfh8=;
 h=From:To:Subject:Date:MIME-Version;
 b=ZsPFOT/T9TqyMQx9KqGniMAa1VoGVLCevLAf77ExnePVxXmv2ARCfpnDyBQulx7fz
 rU2baU5TQ3dDGzga5cRieoXgrBjrDfj5tSOuQNObnsjYNoUo3N0E73syL+K2LS+FTW
 JydmwsdbA0/sUCRsTpAPvv3CixHpx5dC/H9ndB1kuzS2wMDJNd6UJRVMVOOCAH1Pzp
 G/stLyVi5selxTIgRSu6B1IMWnBQxfVGp9pKKviWJz9BJ5YWpNDSCK61WeySw1H8Om
 KELq7tSJ4lW8RJ7fpaQoUmkMjorT5CFmYLi7i7bonTUX+M2NnN770x5tidvW2zmiDZ
 xgCZN/SmLyVbA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=ZsPFOT/T
Subject: [Buildroot] [PATCH] package/rtl8189es: fix build failure with Linux
 6.15
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

Add local patch pending upstream to fix build failure with Linux 6.15

Fixes:
still not occured.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0001-Fix-build-with-Linux-6.15.patch      | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/xr819-xradio/0001-Fix-build-with-Linux-6.15.patch

diff --git a/package/xr819-xradio/0001-Fix-build-with-Linux-6.15.patch b/package/xr819-xradio/0001-Fix-build-with-Linux-6.15.patch
new file mode 100644
index 0000000000..ce0b3f3908
--- /dev/null
+++ b/package/xr819-xradio/0001-Fix-build-with-Linux-6.15.patch
@@ -0,0 +1,38 @@
+From 6e170c96bf50a1088d5dd85fdfd67dc7f83e4eb9 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Tue, 1 Jul 2025 20:51:40 +0200
+Subject: [PATCH] Fix build with Linux 6.15
+
+Commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8fa7292fee5c5240402371ea89
+ab285ec856c916
+drops del_timer_sync() in favor of timer_delete_sync() so let's backport
+locally functions del_timer_sync() when Linux version is 6.15.0 or later.
+
+Upstream: https://github.com/fifteenhex/xradio/pull/26
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ xradio.h | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/xradio.h b/xradio.h
+index e7f60f6..9506986 100644
+--- a/xradio.h
++++ b/xradio.h
+@@ -47,6 +47,13 @@
+ #include "pm.h"
+ #include "fwio.h"
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 15, 0))
++static inline int del_timer_sync(struct timer_list *timer)
++{
++	return timer_delete_sync(timer);
++}
++#endif
++
+ /* #define ROC_DEBUG */
+ /* hidden ssid is only supported when separate probe resp IE
+    configuration is supported */
+-- 
+2.39.5
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
