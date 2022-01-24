Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC6BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 16:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4F7484B61;
	Mon, 24 Jan 2022 16:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 86kMFy848XD3; Mon, 24 Jan 2022 16:55:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1399784B56;
	Mon, 24 Jan 2022 16:55:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E42DB1BF2CA
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 16:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2BD284B59
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 16:55:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mbRAomw6uKMQ for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 16:55:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED1D084B53
 for <buildroot@busybox.net>; Mon, 24 Jan 2022 16:55:51 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k18so14763557wrg.11
 for <buildroot@busybox.net>; Mon, 24 Jan 2022 08:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WwS3niyksL7xXNCoMDgRbFOqLkSeITlbpe4hXpAmTJs=;
 b=jUggri/VbKPmn92cwLXuJF9W9W6VhOL4pq7TeP7YGALKC7geT1tyN/xX9gNxM5s8oN
 JPWw1ed6SnGq0AHOqxVlAhb3OSLtmTMIaoGiRd771Xl0HCZ8J2zMLW7uSwXxgEOdUin7
 Dqjy2Qo4+mOvuXTYUCZI1mHTs6m1W5s/9L6zF5tbdkx1mRCxhvjEDlDNIjzrUhvxi02T
 ls5jqvFFvfgQehpTfyweQQFaf2rWrF3145tgq92YX6hsm8zAPxXcYf4JEnZwsuAAiT5O
 m149fOso7mLAMRM/Gi76qbQYLsV8+sIL+LbtNm2NzHDvDYBZFAZgHJTj9uyoVL7esQTS
 /zOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WwS3niyksL7xXNCoMDgRbFOqLkSeITlbpe4hXpAmTJs=;
 b=pyAzvaZzf2opnL7Nq3FHsCo6/bsJT3t7rsMkuO9UAczLiVALpFp+KOLmqXNkyQeMnV
 /PI1L0WJYhWbqg9PqYm8rqUkpoATfC/t1VyEOjtc3krBfv66u68Etum25tABPh2lk6MA
 uiUfn+mVPbirJ3s/SZfDUpNOqTzt0fQs6NRcR5AEgAf1xamdZ4lSn9iOIM+p81TOisBk
 3wvKLhsVFwXRSldNl7BNMY244kwIfrtpQZ7cj2onzkcl+A3ZslwrvuxAa4OjkbhiLbPU
 trarryR+dgOKXrYdDiCbEpgK89oQPp8jkYlY0C1doE7TO497vqSl0EWn/ZIo0bVh/CC+
 i3Wg==
X-Gm-Message-State: AOAM530ho82YOF5lYGknO72rAGKk+5mxYzsS6/yFthxvUZitKftnrPAA
 hWDkpbOdln3cPZZugq+jkY3RufTufqc=
X-Google-Smtp-Source: ABdhPJxxkRvbQR2PZc5Q+ttZA2uAUMD56cMIgoVHNg3EGJrY+RTPC0jM1nxefh9K9TP2px1rGIqJxQ==
X-Received: by 2002:a5d:4b0c:: with SMTP id v12mr12980820wrq.390.1643043350075; 
 Mon, 24 Jan 2022 08:55:50 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id t5sm14786001wrw.92.2022.01.24.08.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 08:55:49 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 24 Jan 2022 17:55:39 +0100
Message-Id: <20220124165539.778030-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/sqlite: bump to version 3.37.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 604275ebf..deb8d4c14 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  40f22a13bf38bbcd4c7ac79bcfb42a72d5aa40930c1f3f822e30ccce295f0f2e  sqlite-autoconf-3370100.tar.gz
+sha256  4089a8d9b467537b3f246f217b84cd76e00b1d1a971fe5aca1e30e230e46b2d8  sqlite-autoconf-3370200.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 59b76ce16..b702139f6 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.37.1
-SQLITE_TAR_VERSION = 3370100
+SQLITE_VERSION = 3.37.2
+SQLITE_TAR_VERSION = 3370200
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
-SQLITE_SITE = https://www.sqlite.org/2021
+SQLITE_SITE = https://www.sqlite.org/2022
 SQLITE_LICENSE = Public domain
 SQLITE_LICENSE_FILES = tea/license.terms
 SQLITE_CPE_ID_VENDOR = sqlite
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
