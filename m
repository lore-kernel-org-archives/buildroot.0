Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A92C433F5
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 11:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4183C610D1;
	Wed, 11 May 2022 11:40:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lgB-uQUAxS1V; Wed, 11 May 2022 11:40:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 541EF6109C;
	Wed, 11 May 2022 11:40:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 869631BF2BE
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 11:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7551E60D5F
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 11:40:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0qgyRNZ78feq for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 11:40:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E87E6109C
 for <buildroot@buildroot.org>; Wed, 11 May 2022 11:40:18 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so1821162pjh.4
 for <buildroot@buildroot.org>; Wed, 11 May 2022 04:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tNxmcbibirF4XJBcM7VvuLIwiourcfLQuXhnCc2FDpM=;
 b=H/ZLGCGici0d+JJFfxJsywdw44MlzpYShipGjTgR28vyjR9aJbYsRKCXr7XD4rNAgo
 8rbv01m8DFmhaKfZ7XFeKfBK7iwaXqz1in/hbR+jpvPthwrKucvAOyoZlZqP1XCFKdRm
 hHD/Pt0/xeb6D5Mjo62DJ6cGmf87h/4+wP9B2vmoovsBq1Co+UsEL0afuFi2qASjwqLp
 GTFNwF9Q4MedETzQExm7bXt+U+67zIzrqBcCpin2pCg5KrXx4GrtZ+BvNgu8mrzsUDIh
 wqqlzRP1SO4yE4WWVZYo3f6VNh5Xa5P4kfXvfo7CFmAd0+gcmj68eS+WAtG5ZKa5gzDt
 eDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=tNxmcbibirF4XJBcM7VvuLIwiourcfLQuXhnCc2FDpM=;
 b=TDhzCg9FI/80hIi2ehprpwz938TpWfuizr9gU9p+NzEe+UJyDX7VvQ3zU7EWVGIxrE
 lDKJAatrYyeqJ619rbzApGC07QMnvEifvARZovBGVPUpiIIe9pZbMPaWFnX/4BqP/8yZ
 YAGCprOlcBAKi/f3Y6IIIPwga7kv23XSHbEZCBRKSrpgdVCA0p3nTjMq66/lru1KfE81
 jui3bQ2jwSqYMPxDwHRskR/SwkvIqNKQgXOfDT0z92EiUT1Mltn6q/bJGKdyatobmptw
 j2X+qZ6XphFd+kGbUX1viWAYHosQ5WUWf7k4ozut+6T4C0hpJrqn+PmlrYt7EYmk9dnh
 HKkQ==
X-Gm-Message-State: AOAM532iO25+U99dTZ9eYcHc2HlL4n3Ox1uOearfy6SbKAhxbT+MLCBZ
 YHFinXMXJIFX+K5VTwXY6dEVll/6qNI=
X-Google-Smtp-Source: ABdhPJzkgL/mXaKSFt2JvGm5lx5/1e3+ALda7jP3WprVg1VVJ71FlnbrMRafvnxEDznB/N39tEjbIA==
X-Received: by 2002:a17:90a:2e83:b0:1da:3273:53ab with SMTP id
 r3-20020a17090a2e8300b001da327353abmr4936879pjd.14.1652269217110; 
 Wed, 11 May 2022 04:40:17 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 lw11-20020a17090b180b00b001d9acbc3b4esm1655024pjb.47.2022.05.11.04.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 04:40:16 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org
Date: Wed, 11 May 2022 21:10:02 +0930
Message-Id: <20220511114003.162006-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/go: Bump to v1.18.2
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
Cc: Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Minor version bump to the latest release.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 37c34b8b6468..6a9480ff9960 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  efd43e0f1402e083b73a03d444b7b6576bb4c539ac46208b63a916b69aca4088  go1.18.1.src.tar.gz
+sha256  2c44d03ea2c34092137ab919ba602f2c261a038d08eb468528a3f3a28e5667e2  go1.18.2.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index cf90ac876540..817363d8ff11 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.18.1
+GO_VERSION = 1.18.2
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
