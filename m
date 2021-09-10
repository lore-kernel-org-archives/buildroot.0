Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC1AC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 09:44:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 340AC6105A
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 09:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 340AC6105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D67E983139;
	Fri, 10 Sep 2021 09:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aNWvtZMy9lXz; Fri, 10 Sep 2021 09:44:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F6368102A;
	Fri, 10 Sep 2021 09:44:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 79A381BF2AE
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 09:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7585C606A0
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 09:44:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a8JCxyyoYUTf for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 09:44:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABD20605CE
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 09:44:20 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id q22so1433467pfu.0
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 02:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9vTN492fvKbwekQyjIuickOjyc0Om2faR/1ZPq11qzs=;
 b=3jNTjPPqKTw+l0aryuLWQpvDVKMQniwn7WIVS0L/VV/mfHl0of2iUdnhg/1baf70ak
 j3xZOBRpqNLdK8Meox2H59Q9n9J/CsfPsQYEGyKxC0m3J5A/xGuPfHGtPF13D0FT7V5a
 6RLrDIc6NvmFzcfB/oZWXjEKxS2eAmZmEdfpR0SJ1VQOMfeSqjwPK4ViN03/LD9LjaPB
 +0p/j7ivXeWZFCdMy3Fz4agRRfV0kMXBky7zdL9+UBotxeNw2f7AISFq/mZgOH6yVpnW
 kdKSSXYRNigIQp0npx0Zrt8M5m7D6LvR6Ev0T6l5WotMOmFkLyE7QNR5d6DlPjb7Qg2l
 Ybkw==
X-Gm-Message-State: AOAM532DdhACRkCNQuhrW6vjXNSf7EJ+b3NWZqPvtaJGS6y5FiNqQ15i
 bLZ1k/XvCLjfp6BkIqMfGdQom+szlKMZ2Q==
X-Google-Smtp-Source: ABdhPJxPef2XbEYk+7FhMmUhT8jXOO/TdixP+g8TM6/l8BoHFznJR9tyUbnkd5eWlN/hSya0re3d8A==
X-Received: by 2002:a05:6a00:21c7:b0:412:bb0b:850d with SMTP id
 t7-20020a056a0021c700b00412bb0b850dmr7420129pfj.33.1631267059701; 
 Fri, 10 Sep 2021 02:44:19 -0700 (PDT)
Received: from localhost.localdomain (ip68-6-75-194.sb.sd.cox.net.
 [68.6.75.194])
 by smtp.gmail.com with ESMTPSA id b16sm4673181pjb.40.2021.09.10.02.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 02:44:19 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 02:44:14 -0700
Message-Id: <20210910094414.191178-1-christian@paral.in>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/go: security bump to 1.17.1
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

The fix for CVE-2021-33196 can be bypassed by crafted inputs. As a result, the
NewReader and OpenReader functions in archive/zip can still cause a panic or an
unrecoverable fatal error when reading an archive that claims to contain a large
number of files, regardless of its actual size.

This is CVE-2021-39293.

https://golang.org/doc/devel/release.html#go1.16.minor

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index d35d6ed572..9560eae30b 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  3a70e5055509f347c0fb831ca07a2bf3b531068f349b14a3c652e9b5b67beb5d  go1.17.src.tar.gz
+sha256  49dc08339770acd5613312db8c141eaf61779995577b89d93b541ef83067e5b1  go1.17.1.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 09d9f60cd4..8e68dc3711 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.17
+GO_VERSION = 1.17.1
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
