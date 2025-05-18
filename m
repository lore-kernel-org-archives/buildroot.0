Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F331FC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 17:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9AC8406F1;
	Sun, 18 May 2025 17:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IvfSDy88AKgq; Sun, 18 May 2025 17:47:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D74B64071E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D74B64071E;
	Sun, 18 May 2025 17:47:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 54F19E4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4665F41054
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Th5Qz6iqZxW for <buildroot@buildroot.org>;
 Sun, 18 May 2025 17:47:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 728F540589
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 728F540589
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 728F540589
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:47:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a067b.dip0.t-ipconnect.de [91.58.6.123])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 54E2FA4C21A8;
 Sun, 18 May 2025 19:46:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38314)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uGi5m-000000003tB-2FXI;
 Sun, 18 May 2025 17:46:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Bogdan Radulescu <bogdan@nimblex.net>,
 Joachim Wiberg <troglobit@gmail.com>, Steve Kenton <skenton@ou.edu>,
 Wade Berrier <wberrier@gmail.com>
Date: Sun, 18 May 2025 19:46:29 +0200
Message-Id: <20250518174630.2149476-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250518174630.2149476-1-bernd@kuhls.net>
References: <20250518174630.2149476-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747590391;
 bh=UwS6SjfMhyzegV45k3p91GIjCQgxBWRiLU9SoAR9LGs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iUT7IzNOtst6OSAJc2D+yK+kBrSSvMOgHzeoaGWEHrC5ktUoJDYPrwVWr2XqUGhde
 tZ/2UmvcSL4BdL2nxVNZDNKnCnzSuO1LqevNpCZslQbVcbaEHlUWI0TTCwXuI0hJLx
 gl+0ePWP3WDLoIQ7Ki7QWZ56XQ3BOf9F1HUK0zy0SJg9iyB57dTiW6Os9HjAjkXV4r
 xpNuFkkdSx+hd/LGIGpLXKgHsazWpPPRujpvHPP6yIqVWF5dQxFJRW1tWOrLh/CZmb
 4XvIsXMMYh5xq8af8xfQt1oenigd/Ylh5xSH+JbnEcREbdJqIgADHzBOUEapcFQ8VL
 gtPkonPW1USEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=iUT7IzNO
Subject: [Buildroot] [PATCH 4/5] package/ngrep: fix build with gcc-15.x
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ngrep/0005-gcc15.patch | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/ngrep/0005-gcc15.patch

diff --git a/package/ngrep/0005-gcc15.patch b/package/ngrep/0005-gcc15.patch
new file mode 100644
index 0000000000..e1dd7785b8
--- /dev/null
+++ b/package/ngrep/0005-gcc15.patch
@@ -0,0 +1,34 @@
+From 742424ddd76e15bd151e40834e8f1fad65900b65 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Mon, 9 Dec 2024 09:44:12 +0000
+Subject: [PATCH] fix build with gcc-15
+
+Upstream: https://github.com/jpr5/ngrep/commit/742424ddd76e15bd151e40834e8f1fad65900b65
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ngrep.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ngrep.c b/ngrep.c
+index 3df9389..57b4ddd 100644
+--- a/ngrep.c
++++ b/ngrep.c
+@@ -146,7 +146,7 @@ struct re_pattern_buffer pattern;
+ 
+ char *match_data = NULL, *bin_data = NULL;
+ uint16_t match_len = 0;
+-int8_t (*match_func)() = &blank_match_func;
++int8_t (*match_func)(unsigned char *, uint32_t, uint16_t *, uint16_t *) = &blank_match_func;
+ 
+ int8_t dump_single = 0;
+ void (*dump_func)(unsigned char *, uint32_t, uint16_t, uint16_t) = &dump_formatted;
+@@ -177,7 +177,7 @@ FD_SET delay_fds;
+ SOCKET delay_socket = 0;
+ #endif
+ 
+-void (*print_time)() = NULL, (*dump_delay)() = dump_delay_proc_init;
++void (*print_time)(struct pcap_pkthdr *) = NULL, (*dump_delay)(struct pcap_pkthdr *) = dump_delay_proc_init;
+ 
+ 
+ /*
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
