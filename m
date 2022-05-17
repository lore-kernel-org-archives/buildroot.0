Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08129C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 19:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8874160B85;
	Tue, 17 May 2022 19:32:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HW2tET9fBd9E; Tue, 17 May 2022 19:32:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A46BB60A9C;
	Tue, 17 May 2022 19:32:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46AFA1BF403
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 19:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42C46416E5
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 19:32:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J-DF2J7aebU8 for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 19:32:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E0C0402D1
 for <buildroot@buildroot.org>; Tue, 17 May 2022 19:32:25 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id h85so20369091iof.12
 for <buildroot@buildroot.org>; Tue, 17 May 2022 12:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WLYr/3laFGW3WZY3LCKYwkSJ0QYFMY9fJ+UMtCsAKog=;
 b=oszmflqUZGzxbUqFJpfukOGMSwJFzyj7ckJktb6ajx4dktcU/f2zp0oUMAnvKy3KpL
 UBTQ/JmqlonrSpLS/CQP5uVSMgSdRx2u2y3kO0oKYtEA0HIr+2GMDsNbpBNUVnm6ww2n
 Jo4hBkt69owhLexHlDSnPtWKyU35yyNgQfxAdmJDTnQbmuqOX6GtiGqhZuf/Z358MhEV
 yNSy387rYJkE8+1YkNXyw5LIVGLqjux4ihPPg1UKhkSFfzDx9w3ELbdQD1C1XKZPSxu7
 LxFUC+/KujwJ8hJEJUyPuHGzuj2EnHBUCKRQyJTO4Qgs/1GrPiTVZbEL272rwJSYmkCO
 9t/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WLYr/3laFGW3WZY3LCKYwkSJ0QYFMY9fJ+UMtCsAKog=;
 b=BjzTpMdcic4dNMtvQk11uAQoQbXPXWfXW0vvCXXcwilQmihFuiwzWShAZ0Deurftq6
 7uoBOPqTMQ9Tzvpwzj0b6ydZUBqZoasYYLvtzr8UmZkl4uPVBoMBcjuO89OUXjNHNJ2m
 ZOYp8rXvjPeMDls7QtOIleWAEUu/houqiCgjdiK76O2b+Vz+KZ6PCSuYN1T2BbjxLffB
 JDHR+Er12ltnhp5ZeFNtBJfJlha03T4hXsF46rMdCzJU4zHq4kUwEuHPz1haAYlXRUOD
 6SM/6e9+4SC7VdXBbbneszYssm+JAepmA4PixoM/0YNeOT6jIb6VPwQCQz6+YwrXAHon
 lHew==
X-Gm-Message-State: AOAM532SgoMzg+Z+F3aQJxpfJK2wBMWPObUmryBOmx8z1YvcqLRgNE6R
 9cc7Jp+WCDHVc9xygCpDxer4Fy0iT4s=
X-Google-Smtp-Source: ABdhPJxISemN8qV6o04mIExoDzvpCLcT9XWVq3skasYviQ24RW+4et156OyNx+60qShH9+Lzgdhipg==
X-Received: by 2002:a05:6602:1542:b0:65a:bc5d:db78 with SMTP id
 h2-20020a056602154200b0065abc5ddb78mr10739153iow.128.1652815943892; 
 Tue, 17 May 2022 12:32:23 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 u15-20020a92600f000000b002cde6e352d3sm42908ilb.29.2022.05.17.12.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 12:32:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 13:31:39 -0600
Message-Id: <20220517193139.1827192-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bpftool: bump to version 6.8.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/bpftool/bpftool.hash | 2 +-
 package/bpftool/bpftool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bpftool/bpftool.hash b/package/bpftool/bpftool.hash
index 2e414b8eb8..5fbc25adb7 100644
--- a/package/bpftool/bpftool.hash
+++ b/package/bpftool/bpftool.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  e4ce219d3b87dd70d8dbfb8f02bd356f70c010f739f17baca1c8912199a8a72b  bpftool-v6.7.0-br1.tar.gz
+sha256  f8f8cabc001823d270898ea3a635d1eb88e067bc24eed06f74e58d2650b32312  bpftool-v6.8.0-br1.tar.gz
 sha256  7c588754d5e81e92e2a12e47cf78949d485c9c22b4850f12d21b3835c85947d1  LICENSE
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSE.BSD-2-Clause
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0
diff --git a/package/bpftool/bpftool.mk b/package/bpftool/bpftool.mk
index 8742917253..bb1e4ccdff 100644
--- a/package/bpftool/bpftool.mk
+++ b/package/bpftool/bpftool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BPFTOOL_VERSION = v6.7.0
+BPFTOOL_VERSION = v6.8.0
 BPFTOOL_SITE = https://github.com/libbpf/bpftool
 BPFTOOL_SITE_METHOD = git
 BPFTOOL_GIT_SUBMODULES = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
