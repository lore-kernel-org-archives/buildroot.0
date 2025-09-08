Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50157CAC581
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 19:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F706409C6;
	Mon,  8 Sep 2025 19:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0QavpVwEZ96N; Mon,  8 Sep 2025 19:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA156409D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA156409D9;
	Mon,  8 Sep 2025 19:24:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D8F31D9
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 19:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E985260B65
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 19:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8b5B-e7YPst for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 19:24:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.147;
 helo=smtpcmd13147.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 14ACA60B64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14ACA60B64
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14ACA60B64
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 19:24:38 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id vhTgurtBI6z5ZvhThunOaQ; Mon, 08 Sep 2025 21:24:37 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kris Bahnsen <kris@embeddedTS.com>, Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon,  8 Sep 2025 21:24:33 +0200
Message-ID: <20250908192435.214306-4-giulio.benetti@benettiengineering.com>
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
 t=1757359477; bh=GgG0Tss6ERMOaBUe5GFYgqtVpX24eY1HHPCq4mrhtKg=;
 h=From:To:Subject:Date:MIME-Version;
 b=XwHqADYsakbCX1cd3x2VUo5IQi55El4LCeLUO+09/mqHwC2EFqNVSVEPIJ6A8CdEC
 cDNzW7eB6p3pq9110Yph1EQbHiZSVMZRUPEivvZCMtEO9N9W5skUFgc3zOOLrvnakT
 sZ81CKj1esO75h4emcvlJ9V6AAVrY8gZCQHXDc1cqiJ/XwH3gAjl31Ig2QAaGjE0UC
 Mk6L4JF3YKqQRZzTdSro3axfWzRI5mWhCCFZo4rdjqhPb2ZGc0A7JRxSEGWY12F4jH
 0ffnLOohfshCjd4nsucSehtxnhENh+/fmKkik+4k58MVfOdCthgbLtEvCHji9Q4z27
 pTQO3PMgU+T2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=XwHqADYs
Subject: [Buildroot] [PATCH] package/rtl8821cu: fix build failure with Linux
 6.16
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

Add local patch pending upstream to fix build failure with Linux 6.16

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0001-Fix-build-for-kernel-6.16.patch      | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/rtl8821cu/0001-Fix-build-for-kernel-6.16.patch

diff --git a/package/rtl8821cu/0001-Fix-build-for-kernel-6.16.patch b/package/rtl8821cu/0001-Fix-build-for-kernel-6.16.patch
new file mode 100644
index 0000000000..311d4fcd4c
--- /dev/null
+++ b/package/rtl8821cu/0001-Fix-build-for-kernel-6.16.patch
@@ -0,0 +1,34 @@
+From 13f85e370c265b782a801cd22f86cea6f6cda876 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 8 Sep 2025 21:04:30 +0200
+Subject: [PATCH] Fix build for kernel 6.16
+
+With commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=41cb08555c4164996d67c78b3bf1c658075b75f1
+from_timer() has been renamed to timer_container_of() so let's rename
+according to linux version >= 6.16.
+
+Upstream: https://github.com/morrownr/8821cu-20210916/pull/187
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ include/osdep_service_linux.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/include/osdep_service_linux.h b/include/osdep_service_linux.h
+index ed1e19b..c25f6a2 100644
+--- a/include/osdep_service_linux.h
++++ b/include/osdep_service_linux.h
+@@ -210,6 +210,10 @@ typedef void	*thread_context;
+ typedef void timer_hdl_return;
+ typedef void *timer_hdl_context;
+ 
++#if (LINUX_VERSION_CODE > KERNEL_VERSION(6, 16, 0))
++#define from_timer     timer_container_of
++#endif
++
+ #if (LINUX_VERSION_CODE > KERNEL_VERSION(2, 5, 41))
+ 	typedef struct work_struct _workitem;
+ #else
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
