Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52861C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 11:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6624607D1;
	Sat, 12 Feb 2022 11:18:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UGy550C9oIEU; Sat, 12 Feb 2022 11:18:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3149D605A3;
	Sat, 12 Feb 2022 11:18:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C56601BF3A4
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 11:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3A69605A3
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 11:18:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AiHxnSIRdS_x for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 11:18:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3BB060590
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 11:18:46 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id f13so8792303ilq.5
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 03:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hKlTZ4Oq5NrESzirRq3rMv1M6izdAzEf5vmkqVVezBc=;
 b=LzTVe0Y4nVVxIcoKet2ybrNs4K51OLHu18n0KfB3k49oA2ZL18g+9r1RlMw4ozeEQd
 2OuDqwxphAEVqcfqnkShQP2Gil8uqyV4tw7z4J+577kNythccflhEsUWm2WNsUggNodu
 30/RqayQvCy/M8goKUS9+EfsQ+vZASWFfI2K/E2FNbP2/UKGoOx9+v9vdX5BkLofejF4
 CLyVPbfvD3cw1EEF7Uw5pHVOaDdjkfz6iPBfmyDK1ncq3kd8ZDp+Lxbi4vd7rtEAyl1m
 Gbe+3llu7FA4O8i9oZC+H5InaFQj3tCYmU468UDaKMC5CCuzn3kn/i3SdLsse3QzXmDQ
 uSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hKlTZ4Oq5NrESzirRq3rMv1M6izdAzEf5vmkqVVezBc=;
 b=HuM4JYkhex0uIIsg1mQV9FIp64Gnf8SvP8Q2KFeki6D5QYJWsXj0nbFL5DwmoOnnsG
 0HgL0/+a4Y7c6euAAli5GbA2Dw0cVZQGBjr/gTXdtWS4inPE5Id2Mzrwxn7Cv743V+zK
 Hd5IoJixnJDPpfZQTKhPJqiVoFpvpCWO0XlU5VpOamp8193MlTsB8qQX2Slhh+IR2pBt
 SG2fzz5PIataaB2B0HEUxRXoxZZ2neHEEmwkj5UUNEOH4HK3zJCbrX5tB4Ln4paFFDzd
 1vrYBeXZWJXmmpj6Ihpno2iDrdwCu/Z+YJVTJVAg3Gtd8yf9Lw0vhcpiGXzpL8/g2nXo
 5Utg==
X-Gm-Message-State: AOAM530q7LegGRfNU7UfYsJqaDvpjnCJLdIUz+1bLBP3seOory6AAhEt
 S4MkNy2102NGe8VXD1JgaGEWuABMq+U=
X-Google-Smtp-Source: ABdhPJy1ZS+dNrxhIY47qmr6VRCC7C1R8WkTZXLwF7PqavGwX0yokqAy68VGItD7s29UFnSiLx9Umw==
X-Received: by 2002:a92:c5b1:: with SMTP id r17mr3087545ilt.320.1644664725451; 
 Sat, 12 Feb 2022 03:18:45 -0800 (PST)
Received: from james-x399.localdomain (97-118-156-98.hlrn.qwest.net.
 [97.118.156.98])
 by smtp.gmail.com with ESMTPSA id q9sm15230277iop.30.2022.02.12.03.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Feb 2022 03:18:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 04:18:43 -0700
Message-Id: <20220212111843.1210441-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to version
 60.8.2
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
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 8df7155d4c..e04235e041 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,4 +1,4 @@
 # From https://pypi.org/pypi/setuptools/json
-md5  082637e8fbc2e1fd9c637665d8fcccd8  setuptools-60.7.0.tar.gz
-sha256  b83cf328a4f6a987c95610e76b29a30778db05174eef71f771776c48f8f25d1b  setuptools-60.7.0.tar.gz
+md5  f47a5750f6084cce3418f213a9d97785  setuptools-60.8.2.tar.gz
+sha256  66b8598da112b8dc8cd941d54cf63ef91d3b50657b374457eda5851f3ff6a899  setuptools-60.8.2.tar.gz
 sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 584f83f7a0..8653c42259 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 60.7.0
+PYTHON_SETUPTOOLS_VERSION = 60.8.2
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/29/dd/48d662bb93e5e51e72265ef612f869947d4ae4126328d7156824cd50d440
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/ae/0b/e458b0d07dced3d7fa2d21d828e708f374ef82040f2012c05d35f47f9af3
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
