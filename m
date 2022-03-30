Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5325C433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 22:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48CF4612A0;
	Wed, 30 Mar 2022 22:45:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CfF-U1ewplhk; Wed, 30 Mar 2022 22:45:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B91A610DE;
	Wed, 30 Mar 2022 22:45:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D03511BF359
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 22:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE439610DE
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 22:45:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WGdB9obvBQSP for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 22:45:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 264D06059D
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 22:45:36 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id x9so15546646ilc.3
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 15:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OvqJG+F/p6oAh0HQHV3qnQA2MnKaCbA6apRvH4UTbUE=;
 b=Y2jaFTzdKG6JDI/9NtCn6gI3mZvBGsiyHT6GozLRjpzxRd4gQUTXOrRsBkmGoHrXkV
 LppFQdr547eeYzzCp1jc33DMoASW7u4Hze1+KriGpR3HoC4p265AeJ65fTOZ0tEw2ZE8
 T8W1kBZdGFNgzEChVVZrr2n4m8v1m0Q9Z1MLhxTo/tpwNUCSm0ddobNpo+UFC2L/Y50o
 uCDaWhRAuOoz7UmAzWsrJWEo77odLz/5UK9BxmO3dosIqWaQj0y38m1Q1B2b1d/f/aqm
 GvNY0+qLEfr8NiQHcCYMsz9/OXwlfWsHtmfp501Lf45w95Nljv9lM5LiUhh7KV9ID47b
 h1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OvqJG+F/p6oAh0HQHV3qnQA2MnKaCbA6apRvH4UTbUE=;
 b=cs/MVrLN7dXhrcs2wOpu+zJS39k10ddv67K8dTndnbVNGqG7jkDAw3n7Z7DQDkK5jc
 f2TPC08DZrmBn4wbPvxhb8j5Oe7/8fcDmcAXFNTyovkrf4Gs4qJG2oRNzGyabhuiYm2W
 RqDocMMtl76oScgHSv9kPMUxcXprjaJa4Khso0iteEfHjA7kSE50hkrk+O/KKbpSEeOs
 YitBp0+3Rt6OMx/NU2DmIrwlEPua3/Vxrb/hRyMNFV4fbcntLmpZrChv0TBzlIctvW7r
 VjB2hBvacRNghh3LCkd8+3v2nZ5zc6bZNkN0q+VAXYtBp8wivu2QaCdi29raaPnEggji
 2F0g==
X-Gm-Message-State: AOAM5338T6LOFWjMDziVozuymQOVOkPuj3w5LV1UbI7GKrmoBQ00rWOm
 Mq/PlTGzj+G8AkKOmXu7NQNpQdEpBJ9qAg==
X-Google-Smtp-Source: ABdhPJy7eDnQAImxqq/9T1PZmAsHQPvbSic4u29bkkF5t2lm7s426+0Qgj85Dw/mHJ+8efBInmJ0Rw==
X-Received: by 2002:a05:6e02:16c9:b0:2c9:bae7:7d6c with SMTP id
 9-20020a056e0216c900b002c9bae77d6cmr8878018ilx.313.1648680335022; 
 Wed, 30 Mar 2022 15:45:35 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 i11-20020a056e020d8b00b002c79690d56esm11166410ilj.10.2022.03.30.15.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 15:45:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 30 Mar 2022 16:45:21 -0600
Message-Id: <20220330224521.4142504-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/pkg-python.mk: fix PEP517 paths
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
Cc: Emile Cormier <emile.cormier.jr@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Emile Cormier <emile.cormier.jr@gmail.com>

Use /usr target/staging prefix and / host prefix.

This allows the Python interpreter to find packages built via the new
Flit infrastructure and fixes bug #14721.

Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - fixup formatting
  - fix all pep517 prefix paths
---
 package/pkg-python.mk | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 52ce402281..867341fc7b 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -127,16 +127,16 @@ PKG_PYTHON_PEP517_ENV = \
 PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
 	--interpreter=/usr/bin/python \
 	--script-kind=posix \
-	--purelib=$(TARGET_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
-	--headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
+	--purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
+	--headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--scripts=$(TARGET_DIR)/usr/bin \
 	--data=$(TARGET_DIR)/usr
 
 PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
 	--interpreter=/usr/bin/python \
 	--script-kind=posix \
-	--purelib=$(STAGING_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
-	--headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
+	--purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
+	--headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--scripts=$(STAGING_DIR)/usr/bin \
 	--data=$(STAGING_DIR)/usr
 
@@ -147,12 +147,12 @@ HOST_PKG_PYTHON_PEP517_ENV = \
 	$(HOST_CONFIGURE_OPTS)
 
 HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
-	--interpreter=/usr/bin/python \
+	--interpreter=/bin/python \
 	--script-kind=posix \
 	--purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
-	--headers=$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
-	--scripts=$(HOST_DIR)/usr/bin \
-	--data=$(HOST_DIR)/usr
+	--headers=$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR) \
+	--scripts=$(HOST_DIR)/bin \
+	--data=$(HOST_DIR)
 
 ################################################################################
 # inner-python-package -- defines how the configuration, compilation
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
