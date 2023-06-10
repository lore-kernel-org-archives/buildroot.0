Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B12EC77B7A
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 18:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7632F83B02;
	Sat, 10 Jun 2023 18:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7632F83B02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XXzks_H_-yun; Sat, 10 Jun 2023 18:19:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5B1A83A63;
	Sat, 10 Jun 2023 18:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5B1A83A63
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F2A11BF354
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 18:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 141F0417A7
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 18:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 141F0417A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xqZDN4FWSxEF for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 18:19:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E10534177A
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E10534177A
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 18:19:17 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-33e75ca0b23so13131835ab.1
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 11:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686421157; x=1689013157;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Qf/YEBUqLw1WzrOaGoMvskcfXOD7Teddes+3WT+/g4=;
 b=RNV7x3+7ww7w8znNdgEw9mkmmPalHrlTc4El+MbzWBkzqfrPw/N13oa51wvZgSU+Dx
 mbeFXQ5lWw+GUhVuBjOsa4sWhoM+Chqf494XbuGmA+D6v/lpjw+Ak7wksx68uBfDWpMl
 YKKgTdyfHx6/mp2fltIXcs3N4Y4pDgYi1DVpsP1JURmBwSLYm8lECf1EEP+vHJbCybco
 oZ8symgi+qTwMb1U9DG9bfUL3HInPQGQCh6HhyhmzymnkGRdusvEPi2/80D4oyDCiF+G
 CtYbIjN6O4yvCYBrxJhheruin08x97x9IBUHIe2Q3u4WBSO6qFxNtHJIZT8YdAC6gwan
 xnJw==
X-Gm-Message-State: AC+VfDx2kkxCN5lCgdSULT+crPY3c1bKVwqLQZ0UPqe2Q6BRLn+l7w9T
 PcKlWF2YuC/8vk0ph0Kz2QUAJjWlSKI=
X-Google-Smtp-Source: ACHHUZ57VBO2lIsXgYomEi6Xf7w8Ng79mJBWUbwUzOB0VHlevMKJubvPkNW5TQRF5QUjqlwwZ211qg==
X-Received: by 2002:a92:c98d:0:b0:33e:7269:bb7b with SMTP id
 y13-20020a92c98d000000b0033e7269bb7bmr3792174iln.3.1686421156596; 
 Sat, 10 Jun 2023 11:19:16 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-19.hlrn.qwest.net.
 [71.33.133.19]) by smtp.gmail.com with ESMTPSA id
 h14-20020a0566380f0e00b0041cea93e589sm1653570jas.152.2023.06.10.11.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jun 2023 11:19:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 12:19:14 -0600
Message-Id: <20230610181914.541374-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686421157; x=1689013157;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3Qf/YEBUqLw1WzrOaGoMvskcfXOD7Teddes+3WT+/g4=;
 b=W1VOOP09TTjp1a9hBzE5hTHW00Pbs9Q2AndBAmn0qLRpfZu+b8Crgb2Ih5uRb2g/nc
 VTLbwthI35vtjpK/kYmQ6MFzh9tiUdoe2gItVHMHJfJMiDzqUn6KMiGB2CHv8oyoAuT4
 aIoE8GjeJlLp4N1v2vL/+r+Qypgakk/wJ/CZBbt5fWjcO6g527tQpKvJjdde3Sic218Z
 7RKraEOHgccQKf9wYjWI/UBNd9bVE+vw4Riz4wdlkazdDjdH6vJgKB+hGvhUNruowW4Y
 CpMjQEbn3JZNaSjlR4Pfw0Sa8VjLHI65XkBN2fa6emoDZtw0VgdZWCnO4173Q4KVe9H6
 y2Jg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=W1VOOP09
Subject: [Buildroot] [PATCH 1/1] package/strace: use bundled headers
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Details: https://github.com/strace/strace/issues/253

Fixes:
 - http://autobuild.buildroot.net/results/867/8675aeca53653d9d792182be61a28ea550dc530d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/strace/strace.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 6514bfe354..9f6b333318 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -10,7 +10,7 @@ STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSI
 STRACE_LICENSE = LGPL-2.1+
 STRACE_LICENSE_FILES = COPYING LGPL-2.1-or-later
 STRACE_CPE_ID_VENDOR = strace_project
-STRACE_CONF_OPTS = --enable-mpers=no
+STRACE_CONF_OPTS = --enable-bundled=yes --enable-mpers=no
 
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 STRACE_DEPENDENCIES += libunwind
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
