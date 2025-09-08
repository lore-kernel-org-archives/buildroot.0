Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C6FCA1016
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 19:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B95780CE0;
	Mon,  8 Sep 2025 19:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZgabPwmX580i; Mon,  8 Sep 2025 19:24:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D65680C8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D65680C8D;
	Mon,  8 Sep 2025 19:24:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10286234
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 19:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D630360B62
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 19:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1V7CcBZnIUMj for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 19:24:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.147;
 helo=smtpcmd13147.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3859060B67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3859060B67
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3859060B67
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 19:24:39 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id vhTgurtBI6z5ZvhThunOaa; Mon, 08 Sep 2025 21:24:37 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kris Bahnsen <kris@embeddedTS.com>, Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon,  8 Sep 2025 21:24:34 +0200
Message-ID: <20250908192435.214306-5-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908192435.214306-1-giulio.benetti@benettiengineering.com>
References: <20250908192435.214306-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfI91JVxf31JyvtVlFGtcy7PD1RiyzdtWj4t5othCyAEAKTRBBA9u/Np1rp9nwKQ5tuQSNTrCKKLDly5UHhzoodJNnxyKHa4FLbhriO4Xzy5W1BgaVHXn
 QKqB13j6gFp+52jmwkKIuHh55PCcFhKpO8sa7wfds5Yw0crCLaRn/CYXEDYpBaHV995smfCqDIqARmJ13P6fDWtpyBA4hNS+/0uS0MJ3R9oL5bVnPJVc93uB
 bxF65eVqNW6dwR35GBKe1Ig+Y2qIF/lbe1wHhSpM5fHE7evsbF1N5hWGlCnuXnWQDewQhMFxZzaDDyMZHbhGf5PuiGK89rQtermdu56Gm6e/vwHY+olwz37w
 ezASyjjBKlFTJIt9x0AxtQippTH9sXDbEN2JMn7Tjx0AIKSKLqDVkefgCU/kHoyecTHqrNzM
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1757359477; bh=5a1JsqvWUChDlS4xfH9S3K9SsXYEzTEBQNlVJyPhlcg=;
 h=From:To:Subject:Date:MIME-Version;
 b=T318gVdnoOaSFpRPru0uBRrnUm0kaOWs6SnTQ3cCy5UFLKQ4yQt629i+TYuxg7/K4
 Gcn6dvSI80ABJ3eV78Y4xDhWn61u22TUgwa3JN21PPO9ik4zazfe/DiP7MU9LIJrPx
 Sa6wdt5NTAfxWnBsXH5DTqr/EgTz7N+HpqP32rdC51op76vOSvdILvCxE81011LABP
 d9exuodSAQIzUWRHJQc0FIC5wvNynvZtsuUQXwacIWbCFt75fMFPD5WpIKWeAhL+Mc
 VYfIGHm9UQQbu8uv3L8i3dk/YM39jxp7t7c5o/Rf8ukqqr2pf6r6ATUS56fMEgEeFn
 ZI9QC1P5KJTwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=T318gVdn
Subject: [Buildroot] [PATCH] package/wilc-driver: fix build failure with
 Linux 6.16
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

Add a local patch pending upstream to fix build failure with Linux 6.16

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0014-Fix-build-for-kernel-6.16.patch      | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/wilc-driver/0014-Fix-build-for-kernel-6.16.patch

diff --git a/package/wilc-driver/0014-Fix-build-for-kernel-6.16.patch b/package/wilc-driver/0014-Fix-build-for-kernel-6.16.patch
new file mode 100644
index 0000000000..bf4a8106af
--- /dev/null
+++ b/package/wilc-driver/0014-Fix-build-for-kernel-6.16.patch
@@ -0,0 +1,34 @@
+From 8ee37436cfa1bdac354ff63e17b647e7b5fb20f9 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 8 Sep 2025 21:14:22 +0200
+Subject: [PATCH] Fix build for kernel 6.16
+
+With commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=41cb08555c4164996d67c78b3bf1c658075b75f1
+from_timer() has been renamed to timer_container_of() so let's rename
+according to linux version >= 6.16.
+
+Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/10
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ netdev.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/netdev.h b/netdev.h
+index 607a3b5..33708ad 100644
+--- a/netdev.h
++++ b/netdev.h
+@@ -15,6 +15,10 @@
+ #include <linux/gpio/consumer.h>
+ #include <linux/version.h>
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 16, 0))
++#define from_timer	timer_container_of
++#endif
++
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 15, 0))
+ static inline int del_timer_sync(struct timer_list *timer)
+ {
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
