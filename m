Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8937BC433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 21:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 294B2813A4;
	Fri, 11 Mar 2022 21:35:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dPzjdf32zRLv; Fri, 11 Mar 2022 21:35:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A53B812E8;
	Fri, 11 Mar 2022 21:35:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C56A1BF38E
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 21:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AAD4812E8
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 21:35:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KlUreA3jJ4Sm for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 21:34:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A54E2812DE
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 21:34:59 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id p2so6910063ile.2
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 13:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZhdBevuWJ/29xKEQP2aike2FlKGwE33Tx453ZdGGpLE=;
 b=JlN3ITPV9QdipeGI1Tr35RhQGlxa8DlZA0QP+UXaTpbUtbIyk/IjLdgvW5k/+UTeOo
 yUZJnJn8BLK0zdC1Bzc82z7Xs0aaAyNBjeelR6z378X12sROCF1N/4ADC9ubRzRNe8Mu
 bQTMYCk09T+RiZR3PhyJzFvlM0qEPUeWTVCneJgu1o7OlW+PemV33xT1KzPfgfYCrL4N
 H8Y169x3/QSznJo1a9Fj+tni0T233nlCSDnXc8G1jUvrcGEzdOJio8WJkCBu7d/G5MW4
 fn+ppjwjvNGQJDz02x6tPzVidYUBaygVLyfcqAawvNCs61wc0T0D71w1/W3IslsF3vzO
 NyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZhdBevuWJ/29xKEQP2aike2FlKGwE33Tx453ZdGGpLE=;
 b=fN9RpH4FeNXnWBgjWpRHtF9GtqibMaO2x+M6MC8bp0uPoipqUUcCqQCoEJoTBPSGSU
 jxAgSyywXSzoopiCz76uljTWraY3pmsU+6gclJjpgPNbQcrqDEsuQekthnimQqMvdD8U
 AlyU/+ENYQ/aAIntu5PdOuxtu4Yh22VdqV+neAWoStn3NCyhbN7mWYMNlR1+JZtBDTC7
 9I+7ocSKVDG7/paBfCquw1rOHVneJO6glJV/JVrz9qptGEqa5NdiL67l6+0gB+DcHgpN
 olt51U6pdkM/y+OR+y1r6mqVyZH5r7sseIo1fjVV3Mjlzwtz11yVwiyFKuOkPnUcys0M
 IFxQ==
X-Gm-Message-State: AOAM532Mk/LGvcz1Hbjnvfnf3H879dMYSDkp8nFfIBC2e7QRijTrNrSN
 gVg4tAaFj2xDsLjmiSHvjXYUEh5HSBM=
X-Google-Smtp-Source: ABdhPJw6aanuGk2K9MfthBobpRyDRef/fW0OFNL6mYgZMyIYPtU7LLSbwV/JyG7h6Lg+rtyZ/VwSqQ==
X-Received: by 2002:a92:d201:0:b0:2c6:4b38:634e with SMTP id
 y1-20020a92d201000000b002c64b38634emr9865348ily.148.1647034498590; 
 Fri, 11 Mar 2022 13:34:58 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-247.hlrn.qwest.net.
 [97.118.243.247]) by smtp.gmail.com with ESMTPSA id
 s3-20020a056e02216300b002c271c73e76sm5039041ilv.41.2022.03.11.13.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 13:34:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Mar 2022 14:34:52 -0700
Message-Id: <20220311213452.3961421-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-flit-core: bump to version
 3.7.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flit-core/python-flit-core.hash | 4 ++--
 package/python-flit-core/python-flit-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flit-core/python-flit-core.hash b/package/python-flit-core/python-flit-core.hash
index bd47fd4f6b..135be93660 100644
--- a/package/python-flit-core/python-flit-core.hash
+++ b/package/python-flit-core/python-flit-core.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/flit_core/json
-md5  82143536b81f148851a0213305838e53  flit_core-3.6.0.tar.gz
-sha256  5892962ab8b8ea945835b3a288fe9dd69316f1903d5288c3f5cafdcdd04756ad  flit_core-3.6.0.tar.gz
+md5  4a4791e97f3a8c9a1645064a35636ee6  flit_core-3.7.1.tar.gz
+sha256  14955af340c43035dbfa96b5ee47407e377ee337f69e70f73064940d27d0a44f  flit_core-3.7.1.tar.gz
diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
index 8971223d1f..0e058a1f17 100644
--- a/package/python-flit-core/python-flit-core.mk
+++ b/package/python-flit-core/python-flit-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLIT_CORE_VERSION = 3.6.0
+PYTHON_FLIT_CORE_VERSION = 3.7.1
 PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
-PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/08/e9/0653f7783ba2ec2f954f19442878427f1d5bfccb01842d354453c2809b22
+PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/15/d1/d8798b83e953fd6f86ca9b50f93eec464a9305b0661469c8234e61095481
 PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
 PYTHON_FLIT_CORE_SETUP_TYPE = pep517
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
