Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D35C433EF
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 10:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A11F34033B;
	Mon,  3 Jan 2022 10:44:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8rrrnTQ6CE22; Mon,  3 Jan 2022 10:44:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBBA64031F;
	Mon,  3 Jan 2022 10:44:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 51BFD1BF95E
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 10:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EBCA81315
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 10:44:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PYstHtKCAxgs for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 10:44:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B69381313
 for <buildroot@busybox.net>; Mon,  3 Jan 2022 10:44:16 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id n30so22201730eda.13
 for <buildroot@busybox.net>; Mon, 03 Jan 2022 02:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QZu/jwSXAd2GBx6boYiihaWWGlj6T13IfEHr15PqNm0=;
 b=QLk48bGKyArElwDbC3uyuotuC4OYzdAMdCON1NQnCwwD1twDo1l4UxXDGcWg9x2kD5
 ys80Oo8q22CCo9CxxxoTAo8ozgbhazx54I2Jrtip3PRGbSUQdJxobO6Pp0uSsUf9pHjL
 OwUnaugE+FNl8RpUWnh3mlbfdft/xBoo3G0NARG7qulfWh6LV1NnvPc4kTqmsrjb4jzt
 siAxMgupqpd5g8nnQj6Fq6nG2FOV45WxjQh2jdNfxVzi/o77mDotLpvpz5lcazc2W4DW
 QvYYYaPtNkZDdXHEUbfbXNf0+be5gWn393jWMfA5ppT/qMkBnXERb70cQbyzvuTbmLIC
 v+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QZu/jwSXAd2GBx6boYiihaWWGlj6T13IfEHr15PqNm0=;
 b=byPSbZCp0yk34bRcgFmhIfYDkK+hHN8nhuHDleSxuuyN+e9wnTHc1U8e7EW6iiuYqR
 hJGrqNBR7i6OyMacs12qbqeAfG1zFq+9AuFadT0e9SEfVqnI5+vuFeUBG3KbqthL2VSx
 k2bKWRynzZ2ScJiuj1PTugrgcIKcdbhrCj9EUodE76/USNvrCRLVwKFp87szIFQnSX4w
 f4WHE1wsjhjH1rPtkxMOH+lSFE5auJTf1/ejVWx442WS5p0/yguwrKZMK2BFwpPvMsPu
 /ZsGuv1T06kEJoNwuQw9w8sDa5GXN1LVjQvU3e4ZuAC6F1PVM0WamBqYIEkhiKzBY9Iu
 UmXA==
X-Gm-Message-State: AOAM531LxUeOn+GFgZAPlRBsXulgC7NpCwXHcEJBhPTWZJd6IcHhEfrk
 /6VUHKafPVYfvurBWke+axS8yofOmO0=
X-Google-Smtp-Source: ABdhPJxx4L39vWI3Kgd2wKIkqMqlJw8IcXh9BMEaI3s6BfcbtaHgkbZBUnafxUWTONjykAjVXgc3+A==
X-Received: by 2002:a17:907:3f8d:: with SMTP id
 hr13mr34949161ejc.397.1641206654664; 
 Mon, 03 Jan 2022 02:44:14 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id t20sm13361575edv.81.2022.01.03.02.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 02:44:14 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  3 Jan 2022 11:44:07 +0100
Message-Id: <20220103104407.16085-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/sqlite: bump to version 3.37.1
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
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 94f0127d1..604275ebf 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  731a4651d4d4b36fc7d21db586b2de4dd00af31fd54fb5a9a4b7f492057479f7  sqlite-autoconf-3370000.tar.gz
+sha256  40f22a13bf38bbcd4c7ac79bcfb42a72d5aa40930c1f3f822e30ccce295f0f2e  sqlite-autoconf-3370100.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index be060c311..59b76ce16 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.37.0
-SQLITE_TAR_VERSION = 3370000
+SQLITE_VERSION = 3.37.1
+SQLITE_TAR_VERSION = 3370100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2021
 SQLITE_LICENSE = Public domain
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
