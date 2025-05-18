Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC1CC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 17:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F8E480E2C;
	Sun, 18 May 2025 17:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hmJZMl4DG_kC; Sun, 18 May 2025 17:46:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F75881160
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F75881160;
	Sun, 18 May 2025 17:46:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 55B421BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B2E44063C
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cuN5siczJWFs for <buildroot@buildroot.org>;
 Sun, 18 May 2025 17:46:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5BA22405F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BA22405F7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BA22405F7
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:46:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a067b.dip0.t-ipconnect.de [91.58.6.123])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 48C5BA4C21A4;
 Sun, 18 May 2025 19:46:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38314)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uGi5m-000000003tB-1x8A;
 Sun, 18 May 2025 17:46:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Bogdan Radulescu <bogdan@nimblex.net>,
 Joachim Wiberg <troglobit@gmail.com>, Steve Kenton <skenton@ou.edu>,
 Wade Berrier <wberrier@gmail.com>
Date: Sun, 18 May 2025 19:46:28 +0200
Message-Id: <20250518174630.2149476-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250518174630.2149476-1-bernd@kuhls.net>
References: <20250518174630.2149476-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747590391;
 bh=AYiuZywYkKJADzz2Y2ChCJy4Sx/ae0V3c917eskuKes=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G8lncgQ+ykgT9IhQod+mk97DS74yojEv4WBeP3Af4J/XgD0kKxUJZaSqelpd2DseF
 mOfMYRV1aHUFFV5WkFMocJ7tYRu8yo92RxvTLQbYFb6s8NJVAd6KVVSfJDwJKvOhhB
 bf0kNewGfb6zAr+b5Fk1rf1SdPb7yg0M3wfMO0yHDDHZVcczPcKGCeL9RcYSj4acQh
 N/h9XQIEQ190hwuNNTXWhCH4n480QsPLmcwxeAy2ZgMDcg/Y4nImcqd1t4GmVf8LOn
 oN6U4UOPaMlccn2xsW5N2v6ELWaWrEt79+qgzwd+FOoivg4/Ho2n+HnWp090yZhAgx
 Ql0O7sJn5q10Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=G8lncgQ+
Subject: [Buildroot] [PATCH 3/5] package/mrouted: fix build with gcc-15.x
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
 package/mrouted/0001-gcc15.patch | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/mrouted/0001-gcc15.patch

diff --git a/package/mrouted/0001-gcc15.patch b/package/mrouted/0001-gcc15.patch
new file mode 100644
index 0000000000..781f83f5c7
--- /dev/null
+++ b/package/mrouted/0001-gcc15.patch
@@ -0,0 +1,33 @@
+From cdb388c8dc6e661d2a23f1e9b79102bc68e89af5 Mon Sep 17 00:00:00 2001
+From: Philippe Troin <phil+github-commits@fifi.org>
+Date: Wed, 23 Apr 2025 16:04:20 -0700
+Subject: [PATCH] C23 compatibility.
+
+bool is a keyword in C23.
+
+Upstream: https://github.com/troglobit/mrouted/pull/65
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/kern.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/kern.c b/src/kern.c
+index 27f8dd4..04f1c36 100644
+--- a/src/kern.c
++++ b/src/kern.c
+@@ -104,11 +104,11 @@ void k_set_rcvbuf(int bufsize, int minsize)
+  * in the kernel and "panic". The kernel patch for netinet/ip_raw.c
+  * coming with this distribution fixes it.
+  */
+-void k_hdr_include(int bool)
++void k_hdr_include(int flag)
+ {
+ #ifdef IP_HDRINCL
+-    if (setsockopt(igmp_socket, IPPROTO_IP, IP_HDRINCL, &bool, sizeof(bool)) < 0)
+-        logit(LOG_ERR, errno, "Failed setting socket IP_HDRINCL %u", bool);
++    if (setsockopt(igmp_socket, IPPROTO_IP, IP_HDRINCL, &flag, sizeof(flag)) < 0)
++        logit(LOG_ERR, errno, "Failed setting socket IP_HDRINCL %u", flag);
+ #endif
+ }
+ 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
