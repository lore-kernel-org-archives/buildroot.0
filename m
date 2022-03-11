Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC77C4332F
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 22:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2D0641A6D;
	Fri, 11 Mar 2022 22:51:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GV3mc4dKnMEB; Fri, 11 Mar 2022 22:51:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EDEB41A67;
	Fri, 11 Mar 2022 22:51:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 844B51BF3CB
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 22:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EC7D41A67
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 22:51:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FHc3c4ic2J6v for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 22:51:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 471E641A66
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 22:51:04 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id x9so437871ilc.3
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 14:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wwzDqkNvnVxrecb8mqnaZj3emWd000bHs0OGiB1xITo=;
 b=Ki1Y/P3ypelA19mBUJlpVBJ4jaR7ClgeqOhCcNR8Wu1SjSMYy14XzbO7vUh3BrCMXs
 qQGXI8zK396ARiRW/MwEOhEMz5ZTkyK5ipDJWh+2dkCZEYOcG0ohItn4F1aEYEhDSDYx
 yRuMKYamcVrvNcwU0ZoL9/0h4x/lHu2s26E2w6rtcGKpMVaoaJn9YSiwrUZ4yvKDs49A
 JCJBH/qoiyXWnU76JcooqbzinemQZpncv02+sTiCBlBSMsX0WdG63pUkORRndGdVdvnS
 c5eaI4XIPpa3xwdetto9khIzIl93HH1U+IR8g6f3lg0Xukx4zDZU3baejs7ioKvMKm0s
 KiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wwzDqkNvnVxrecb8mqnaZj3emWd000bHs0OGiB1xITo=;
 b=Wt57lToFu5y3ZtqnwbY2yEYUaW7jSjIaANCM3cYDma/6fKfMpWWSThU4ATN3ThwgZF
 xAwKOcF96oHFPHVB/2whAaF8uAbC77Tq3oSiM/LwV5DTD9yT4UvmBcxXRLVeoL/xsZaZ
 uoNYaOUsTEUKCnHm4zxBT+pBDu2X6nU2MiAOWpMW22iPejQSP0xj+37p80u6wymS3CXJ
 Uy+F7FHqGaOxvtb4u2Zgsio3e5FNJ5bFj7G3fUi6dZsDM0vrdWGS6S8Zg47GBPcIGS2q
 tvLM9xSaAvTjfRydOpViLTJ19EqUZ7QJ9uZh0f68OoYF7YhHFNNI9GtIoP8ehRUdTTQf
 j6mQ==
X-Gm-Message-State: AOAM533Y4fxv39BLKSNxZVzK9DfH4KTKLRLWmzuZQzBfN+MQ7FVhTd4z
 yCmTUyuIX76v5TsCommaERgHYRh7drY=
X-Google-Smtp-Source: ABdhPJweYmHYRtc2yTgk/yB0Oc4g0HI0opNZdjQySc7tk6E+hUc/UwioLQncmXeh4NOUpqstsSmZtw==
X-Received: by 2002:a05:6e02:17c8:b0:2c6:576b:d6cc with SMTP id
 z8-20020a056e0217c800b002c6576bd6ccmr9752256ilu.209.1647039062841; 
 Fri, 11 Mar 2022 14:51:02 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-247.hlrn.qwest.net.
 [97.118.243.247]) by smtp.gmail.com with ESMTPSA id
 j15-20020a92ca0f000000b002c67acd2b3fsm4454161ils.79.2022.03.11.14.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 14:51:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Mar 2022 15:50:53 -0700
Message-Id: <20220311225053.3970847-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-cssselect2: bump to version
 0.5.0
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

Migrate to new flit based build.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cssselect2/python-cssselect2.hash | 4 ++--
 package/python-cssselect2/python-cssselect2.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-cssselect2/python-cssselect2.hash b/package/python-cssselect2/python-cssselect2.hash
index ed5b863302..fd892e297f 100644
--- a/package/python-cssselect2/python-cssselect2.hash
+++ b/package/python-cssselect2/python-cssselect2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssselect2/json
-md5  6dfd5963c8a5d85f2634d1650b1ddfe1  cssselect2-0.4.1.tar.gz
-sha256  93fbb9af860e95dd40bf18c3b2b6ed99189a07c0f29ba76f9c5be71344664ec8  cssselect2-0.4.1.tar.gz
+md5  6206ebccfdd9fc02196f60e830fa7b1f  cssselect2-0.5.0.tar.gz
+sha256  d98a7bbdd8ebc46093279195d669a3359bd5a23f90c19e82c19d9eeef333e617  cssselect2-0.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6fd97229a1d1b0f6a8b41e109f413426dbc0874b1e03746d66cc33282601c2c2  LICENSE
diff --git a/package/python-cssselect2/python-cssselect2.mk b/package/python-cssselect2/python-cssselect2.mk
index 18e0fba839..b3ddf41fef 100644
--- a/package/python-cssselect2/python-cssselect2.mk
+++ b/package/python-cssselect2/python-cssselect2.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_CSSSELECT2_VERSION = 0.4.1
+PYTHON_CSSSELECT2_VERSION = 0.5.0
 PYTHON_CSSSELECT2_SOURCE = cssselect2-$(PYTHON_CSSSELECT2_VERSION).tar.gz
-PYTHON_CSSSELECT2_SITE = https://files.pythonhosted.org/packages/ad/3d/fb764303deb34cbc1a32fcecdfd239367cb16323920c88390b2f5ad751f0
-PYTHON_CSSSELECT2_SETUP_TYPE = distutils
+PYTHON_CSSSELECT2_SITE = https://files.pythonhosted.org/packages/ce/e7/1333b9042beb33a9bb425900b6d9b59035b98c31c950a323d14ceca1275e
+PYTHON_CSSSELECT2_SETUP_TYPE = flit
 PYTHON_CSSSELECT2_LICENSE = BSD-3-Clause
 PYTHON_CSSSELECT2_LICENSE_FILES = LICENSE
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
