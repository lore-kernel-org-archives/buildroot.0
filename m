Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EDEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 18:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F3D4400CC;
	Thu, 27 Jan 2022 18:07:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lduSrArONgs5; Thu, 27 Jan 2022 18:07:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFDD1408AC;
	Thu, 27 Jan 2022 18:06:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 471321BF3EA
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 344F284D37
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:06:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h3B-LY8z639L for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 18:06:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC3F984D36
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 18:06:44 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id v123so2531282wme.2
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 10:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6I9+3t+2DVfktJ9hvmyHwG8mq4qL5x5sCcxDRTaw5ao=;
 b=NKkyt71J8DHRSbHNNRLZyFejrjdYXE0ShSTzExHgzbPGJ7I9jEt3dvm0nDaqrfLld4
 /i5+f3mKINtTLxNVEXdOluMQC62QDzahqRa3G2ExojVPCpOC6uAohqY+a3HQCPkav8cR
 hU2Zz4W05418SNdmmw8878F/85A+sphQ30nwoTwka9AVnWQi2tyTD4bd9+pF7Fcfdgxv
 HHo1pH4NGOF/W8A75SVffhMInvEerwH6pyp1oWKxQc3NL2mjam+8uBnTWAccPxJn9emw
 jJG9nTk+1U4Gyzd7dedP69/Hi3spmtUJY++ZrtkCyyGGHaKXoViXg57Pk9K0DV4F99zO
 q4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6I9+3t+2DVfktJ9hvmyHwG8mq4qL5x5sCcxDRTaw5ao=;
 b=7fWc4PI1gW4gw6a3FUaXTeYonHd+5iOCcOgodTTOazlVTdib+rmlKz024c0wEPrJyV
 cLQ69KkjuWJC88SYLsGHSCsce1j2BH3vIoZASQny08YYs+qyusYGJ3KiNdLrDL/orIGw
 lR3wPiER2jt4It+gl7uMSWqr/scjQxrsOeYkNoWLw/dg3XAxp9VGro7KS5HjDGM9rS2c
 r8E2NqwZ1rZO3BRVaORtXw6O76anK9s+fxkX2EOLaablPQYOndro/bgnuQDUVEecMnKZ
 rogEbxvA7ftl0ODl2pZlNO09ZP9M2AxI4o3RUJHvaeOCUZzsxoQoyV6vT1lTeZP8WjHH
 6f/A==
X-Gm-Message-State: AOAM530GBbY4V9AcOhc5no0AE9KUhXyZzg2SLw5L28cIs7kj1staz4NX
 LtenUgLwFKV5AEYEB5A5z5wvY7FT8Zk=
X-Google-Smtp-Source: ABdhPJyKwWaMPIJLLyHJDqL3fXz15VAaebp0PtWMetBy/IwvVyFChOYinyxepT1Ld+W/fi+RhYMb7Q==
X-Received: by 2002:a05:600c:3005:: with SMTP id
 j5mr4168306wmh.35.1643306802872; 
 Thu, 27 Jan 2022 10:06:42 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id t1sm3288262wre.45.2022.01.27.10.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 10:06:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 19:04:56 +0100
Message-Id: <20220127180456.2338773-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127180456.2338773-1-fontaine.fabrice@gmail.com>
References: <20220127180456.2338773-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/jasper: bump to version 2.0.33
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
Cc: Michael Vetter <jubalh@iodoru.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/jasper-software/jasper/blob/version-2.0.33/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jasper/jasper.hash | 2 +-
 package/jasper/jasper.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index 67653a8e88..410bcfc683 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6b4e5f682be0ab1a5acb0eeb6bf41d6ce17a658bb8e2dbda95de40100939cc88  jasper-2.0.28.tar.gz
+sha256  28d28290cc2eaf70c8756d391ed8bcc8ab809a895b9a67ea6e89da23a611801a  jasper-2.0.33.tar.gz
 sha256  4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 59c5b3d66a..05168db763 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-JASPER_VERSION = 2.0.28
-JASPER_SITE = $(call github,jasper-software,jasper,version-$(JASPER_VERSION))
+JASPER_VERSION = 2.0.33
+JASPER_SITE = https://github.com/jasper-software/jasper/releases/download/version-$(JASPER_VERSION)
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer-2.0
 JASPER_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
