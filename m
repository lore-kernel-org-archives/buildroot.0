Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0B2C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 10:45:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FD0E6054F
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 10:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3FD0E6054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 105E060B42;
	Fri, 10 Sep 2021 10:45:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ZgaDJvLqmx2; Fri, 10 Sep 2021 10:45:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DD2960B30;
	Fri, 10 Sep 2021 10:45:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F28121BF591
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 10:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E065260B30
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 10:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uEIFCgvnw_0M for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 10:45:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3DC2960786
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 10:45:49 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 c13-20020a17090a558d00b00198e6497a4fso1175570pji.4
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 03:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b37+l2Qa0yDz0ntvUHz8S45mdwzhz15SFvPzuZY2FcU=;
 b=jpw4UPO0DsVaUDZokeq68YbxBxS9Qli3Dpwn7xYrC9v6msrnWpfNzzCyBiANE8Bj7p
 tlWpyi3aOIRUr9aS/cPlrrQI7Ao7nUH4M1QSSizRYxFrbP9XGplJSnZKKZxXgekrg3O4
 NjhWOOY/gHNX3634lWwyPfALe6wSH5jdQtQqjYDdDissPpS7zzb/g8m1AKabJHgEk5+F
 PnXSKTdcAosUrudNvRnS+wFmVnIqw9rDUXCQ5gL65/c4Q9f7NFH1FPz4Ku8l+U32Yxvl
 W8AvGWbyG70CNXL3cm5an3xcvDr9uq2iAKj/TWeiGbGpAltSIdBQ/fmMHtJqAVV7iFMO
 qlNw==
X-Gm-Message-State: AOAM531+f8eAykvedJcmJcnzC5h4URJ5gxJEs31ultnLGTg6uQVAQ8EW
 cePQ9VaDtS5aKRfwvedBLNmHrbOK1Awv5Q==
X-Google-Smtp-Source: ABdhPJwi1BqK2BvxBdASTOWfiVNk3N0hhkngeLddgR2rEfMaRCC/IrF0hgd9qqcGah3P2yFpO0UHZg==
X-Received: by 2002:a17:90a:dc15:: with SMTP id
 i21mr8685277pjv.64.1631270748477; 
 Fri, 10 Sep 2021 03:45:48 -0700 (PDT)
Received: from localhost.localdomain (ip68-6-75-194.sb.sd.cox.net.
 [68.6.75.194])
 by smtp.gmail.com with ESMTPSA id cl16sm4499637pjb.23.2021.09.10.03.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 03:45:48 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 03:45:45 -0700
Message-Id: <20210910104545.518321-1-christian@paral.in>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/go: security bump version to 1.16.8
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@lists.buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

go1.16.8 (released 2021-09-09) includes a security fix to the archive/zip
package, as well as bug fixes to the archive/zip, go/internal/gccgoimporter,
html/template, net/http, and runtime/pprof packages.

https://golang.org/doc/devel/release#go1.16.minor

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 0db83167ee..bc828f41c8 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  1a9f2894d3d878729f7045072f30becebe243524cf2fce4e0a7b248b1e0654ac  go1.16.7.src.tar.gz
+sha256  8f2a8c24b793375b3243df82fdb0c8387486dcc8a892ca1c991aa99ace086b98  go1.16.8.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 69e9fdb3c7..8b99916f90 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.16.7
+GO_VERSION = 1.16.8
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
