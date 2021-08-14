Return-Path: <SRS0=c1N3=NF=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BA8C4338F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 11:51:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93B0260F36
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 11:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 93B0260F36
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6207780E85;
	Sat, 14 Aug 2021 11:51:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u5zr1-V2JAKP; Sat, 14 Aug 2021 11:51:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A5E580ED8;
	Sat, 14 Aug 2021 11:51:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EF9E11BF228
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 11:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC2DE605EE
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 11:51:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fQwbhSUIKd2T for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 11:51:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D453605EA
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 11:51:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0D05B1814BC; Sat, 14 Aug 2021 13:51:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1628941861; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=Fn+btHRB7cwsW8kz4wxa++qt/a2kDccG7gfWBlOySHs=;
 b=tq6Mj4gJNVNeioVCI4WJ7iwAPPqcGdEl/ThcDgtX+OlxSebUcQVZPL5AT683XrIciGt05i
 RffhgKDEtbIibhhUs0PTqf6xfZre29txMVtI6Ybtgaez4g0tvR7bU5XWZxo8/PxRnUph1F
 sCnBodaGNQ7pmg2qlVCzyd3nL89vC6c=
To: buildroot@buildroot.org
Date: Sat, 14 Aug 2021 13:50:30 +0200
Message-Id: <20210814115032.7133-2-buildroot@heine.tech>
In-Reply-To: <20210814115032.7133-1-buildroot@heine.tech>
References: <20210814115032.7133-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.2
Subject: [Buildroot] [PATCH 2/2] package/spdlog: bump version to 1.9.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@busybox.net>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Michael Nosthoff <buildroot@heine.tech>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/spdlog/spdlog.hash | 2 +-
 package/spdlog/spdlog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spdlog/spdlog.hash b/package/spdlog/spdlog.hash
index 5d1ff2f520..02756fc98c 100644
--- a/package/spdlog/spdlog.hash
+++ b/package/spdlog/spdlog.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  944d0bd7c763ac721398dca2bb0f3b5ed16f67cef36810ede5061f35a543b4b8  spdlog-1.8.5.tar.gz
+sha256  6fff9215f5cb81760be4cc16d033526d1080427d236e86d70bb02994f85e3d38  spdlog-1.9.2.tar.gz
 sha256  a7241a379cb98d37788f82c2fc2e484c3ae85dae881fd3406f0637644850926f  LICENSE
diff --git a/package/spdlog/spdlog.mk b/package/spdlog/spdlog.mk
index ee875ae560..b5dfc0c7b4 100644
--- a/package/spdlog/spdlog.mk
+++ b/package/spdlog/spdlog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPDLOG_VERSION = 1.8.5
+SPDLOG_VERSION = 1.9.2
 SPDLOG_SITE = $(call github,gabime,spdlog,v$(SPDLOG_VERSION))
 SPDLOG_LICENSE = MIT
 SPDLOG_LICENSE_FILES = LICENSE
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
