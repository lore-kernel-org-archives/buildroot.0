Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70851C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 17:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A1BA4091E;
	Mon,  3 Jun 2024 17:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nbjfy1mnDd9M; Mon,  3 Jun 2024 17:32:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D805540922
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D805540922;
	Mon,  3 Jun 2024 17:32:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACE781BF232
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 17:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4FA782207
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 17:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9rRLanhDGHO for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 17:32:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 87CAF821E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87CAF821E7
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87CAF821E7
 for <buildroot@busybox.net>; Mon,  3 Jun 2024 17:32:18 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a691bbb7031so138128666b.1
 for <buildroot@busybox.net>; Mon, 03 Jun 2024 10:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717435936; x=1718040736;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DVJc/RwleCFKQStw9sl9rwRaGqf9Z++NPAWrfkbgIsQ=;
 b=qtvPxl0+o5gatZvKI4/Qa1QPrg7wj2LZtICrcRM+z9LJ+V0WbzeZSor8WsSWqgItDa
 tz6S4N4RuknfXZuEVwPL3QEXigPQGdbu/MiBukKN9Lwmy+nEREfnDU0RO71ogz4yHNdU
 SAVTB2y3BBiPlULPV3nIyt79utB15Ae4iUZeg1Yqt6i99jbrfwQ6GguvCm7Up+t3cg7X
 bCJDlJc/mToj3JpEIDJEuVq4GbFKeiNzpz1EM9+ZT4ilPQhOTCQRAfrHQPemY0O33pty
 m2Z8FxGCrybwyusvcRQlCg7Bl00cKnTHChYPR0KEOT56/kjvfsigu6tyZsiA6bsYrvoR
 9rZA==
X-Gm-Message-State: AOJu0Ywp07FBMYMrYdP87hysNSWI2k/WpV1xVqaSS1KFDwFkr2ORPf9F
 73MRGFsa4nNmAzFBAhS23EWvu39lY9kmsCVFrg7Y1T6/dnpCJE0gqDYT1+XOstT81YXDmieyyAP
 NXA==
X-Google-Smtp-Source: AGHT+IHEQSbM+KO7nMxQYl9Sj9YWluaiseMGdcb6oE21fZQDZC4FfxEeLjncjlrFrPzFMpNpQ1nrAQ==
X-Received: by 2002:a17:906:e084:b0:a68:bb1b:4de0 with SMTP id
 a640c23a62f3a-a68bb1b4f42mr491857966b.7.1717435935964; 
 Mon, 03 Jun 2024 10:32:15 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.24]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a690ba63a95sm185659366b.148.2024.06.03.10.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 10:32:14 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  3 Jun 2024 19:32:09 +0200
Message-Id: <20240603173209.48126-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1717435936; x=1718040736; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DVJc/RwleCFKQStw9sl9rwRaGqf9Z++NPAWrfkbgIsQ=;
 b=WU0qDWwMZ/cOIfTe0TycEjUvMepjfdHHwdxJCxAKE+Z7+JAJysai44V/h+W3Tx/Gb+
 WL6Kb/im9eI7hwiMPQ1wXBpWtv1ZWXGfMEMn6fpFm33exq3MFH+oqSnN4cR81FUrgbMm
 Au1wzRWf26USTZtOAoXa837kUHuWX45wdTxARWBdgGtCJrkin+wR7KbJL7bZFbGYO1Oy
 Mh1eSnvYciQex26qnl6PdYkHeTKCjU2sNlxSjd0W4OaEFvxPeQm3BJTrNfttbenpSkKa
 FVfra/4dkIE0G590KxXrgkRF8rzkQIBF2LE608/EqFEMXxkczkZ7qvVEAVYXksgCjUTO
 34xA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=WU0qDWwM
Subject: [Buildroot] [PATCH] package/libgpg-error: bump to version 1.49
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
 package/libgpg-error/libgpg-error.hash | 4 ++--
 package/libgpg-error/libgpg-error.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index 3b3464592..f87accdd9 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  8bdb504750b4da9e7daffa164cf1ed9900671f32  libgpg-error-1.48.tar.bz2
-sha256  89ce1ae893e122924b858de84dc4f67aae29ffa610ebf668d5aa539045663d6f  libgpg-error-1.48.tar.bz2
+sha1  28668dc3f693dfd8fa6724c702559e45ab5b15c0  libgpg-error-1.49.tar.bz2
+sha256  8b79d54639dbf4abc08b5406fb2f37e669a2dec091dd024fb87dd367131c63a9  libgpg-error-1.49.tar.bz2
 
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 3dd0ec94d..9f60b7bc8 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.48
+LIBGPG_ERROR_VERSION = 1.49
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
