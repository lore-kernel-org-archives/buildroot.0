Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E18C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 09:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32EEE82AB6;
	Sat, 15 Jan 2022 09:14:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Lg0GnmWbEIn; Sat, 15 Jan 2022 09:14:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8877D82A87;
	Sat, 15 Jan 2022 09:14:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E38A71BF34B
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D15E182A87
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s1dJQle8V_ZV for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 09:14:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3088B82A7F
 for <buildroot@busybox.net>; Sat, 15 Jan 2022 09:14:15 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 c126-20020a1c9a84000000b00346f9ebee43so10118402wme.4
 for <buildroot@busybox.net>; Sat, 15 Jan 2022 01:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TvLU4FQcbKLypzGzIPzxQt8zSFx5gXJvbEe1Gzhg57M=;
 b=RU8dKvb0I0xqC41GNsATFSL1cE6bBFNo8J5zHafR5MYfV+Q9Tkx7o15FV9RDom5FUT
 w0q4ya1mLEIDIeSy+S0uuEgxVF8Yv4xS+hyNVnJYMgmY/9zX1cgBALe5DaNRzEJNObH0
 p4oN8Ml3nhDkBqr90RlSC/BrTAcjTg/K/GUZfDtozbNZS/dHw6T0aG+Js2/cn9Rdaeb6
 wWJ1qJ2IVJVf67ZMwwlS782Yw7R/dRdfphYkfVYZ9m7Z93p741ibNr9WFIUAazVN/chk
 uOkquBYpy12C8c9zrKtPfn0YwYOuYyvvlBZJeNaXGjPcZmVPpikMz0/DNVPuIXL3Z27y
 9Sog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TvLU4FQcbKLypzGzIPzxQt8zSFx5gXJvbEe1Gzhg57M=;
 b=aTN+rRVw7Y7ZfMzw8jNj+MBBGR52WNS2swtSiZhU5/ZLvTxW/Kz+qoQmwkQ7LpIILn
 72963SIjKmAPHYrNVK6aEN2b2bESUMaZOeI2//RDwiOvuzZb+Gxl7s3r9VqGV8c+rJiY
 7d8r3y0nlpqAjWWfdZk39sUIIoxmgFbFLKBJDZlKbPB5pntKVaRR3jCfpCJUZl4RGoQA
 hxmKaUFYhATrP/YxoA6P5ZWsbXtFJiJ85ohsZLjI98uJzIfFUV6eQRYyj8qjTp5tZero
 PoMzWH2vuRjoeYen4Ih123QEZftX3GEYOOwCKBVPvMSKIjjshuyQflIhUzdkWgCi3mPW
 x+9Q==
X-Gm-Message-State: AOAM530yg/MhdPQn0P9VAfkzlSDhQBJlWpINSKGQ5lGmUsabvrPMvm4/
 lG7sh0t6N2yOJbDYN4XYuP1uLnJjyzc=
X-Google-Smtp-Source: ABdhPJxUx7h8HT3PMvcdlmrQE3T37JxpfNlnaja5NiUrKEOamMJDeHhd4+xOnLeKY7opcIOimdEO1w==
X-Received: by 2002:a7b:ca42:: with SMTP id m2mr11567748wml.144.1642238053267; 
 Sat, 15 Jan 2022 01:14:13 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id a6sm7751398wrq.22.2022.01.15.01.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 01:14:13 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 15 Jan 2022 10:13:54 +0100
Message-Id: <20220115091354.60566-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/janet: bump to version 1.19.2
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
 package/janet/janet.hash | 2 +-
 package/janet/janet.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index 8e78d9a4d..50e6b1fef 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  bfc29c11a070cc175666f74eb99ea992276d6e269701ba9558a72cef05ac80b4  janet-1.18.1.tar.gz
+sha256  02ff892f4bfc060a8a37f4a5c3e659bf34ba5f1f1c5eb07d60dc2642c5cf0476  janet-1.19.2.tar.gz
 
 # Locally calculated
 sha256  e2d2ae8360d95386af751ac7d1a3da36ea8ceb230e5f0eba7eb762547b1c58c9  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index b00f82846..5b6a9a182 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.18.1
+JANET_VERSION = 1.19.2
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
