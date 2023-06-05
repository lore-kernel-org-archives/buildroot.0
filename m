Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19516C77B73
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 07:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C939414A1;
	Mon,  5 Jun 2023 07:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C939414A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rl2JkJOVPTxN; Mon,  5 Jun 2023 07:09:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37F8B4148F;
	Mon,  5 Jun 2023 07:09:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37F8B4148F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A5A11BF356
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 035FB60C03
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 035FB60C03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AMDmRaY0nH9i for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 07:09:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC37960864
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC37960864
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 07:09:02 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-777ac169033so18472139f.0
 for <buildroot@buildroot.org>; Mon, 05 Jun 2023 00:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685948942; x=1688540942;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UFqQ4BCe/ih+ShLEmM+VF7SJZusCVKzy4YMGjvyfYxM=;
 b=kVReRdo6aMjXVgzqbM8XEL3fPtkwfiSGF09xOhCUC+snlcgrwdpIw1CiZuBYHLLvSF
 nGuTMNAs2LjL949j0sB4yUEfjpfNRUqgkdeOuDpblOEYjf0Q9F7MNzbUWmMSxQk9FFvB
 1bc+GfxEs8+pNBPcx+sfuQpruHSy+DchUDCUhz0P6pnjVycBT4UCmLo/X9YoCTam8rk9
 Owqp9fYoCdNwpn0oy8ipyq0bYIrUfq8s7BMNaAl0AFiZQMs1TyPqO3iuLfKnwYnJxiBJ
 kutbwLSCBnzANdHE5RTcKs8HcCAi7wjX8gk1CIFvV+wfj3XMUpYAvABOEST2D2TU8xxY
 0IMg==
X-Gm-Message-State: AC+VfDzYc5jyfFU4T/KlwlpBeg8pLxXeROuSuv0pjs7vanhyChpBiWwQ
 5FHkNcult2lY/vbDhbThlzDzV08Pei4jIg==
X-Google-Smtp-Source: ACHHUZ6v/BYgCneglUiVwlfCI4Ei1YAWmMO/r0LcgIsJYt1kqvjipP935YFRYUAmenNA3N/NtJlAXQ==
X-Received: by 2002:a05:6e02:ef0:b0:337:d335:6469 with SMTP id
 j16-20020a056e020ef000b00337d3356469mr8558453ilk.5.1685948941854; 
 Mon, 05 Jun 2023 00:09:01 -0700 (PDT)
Received: from james-x399.localdomain (71-33-129-69.hlrn.qwest.net.
 [71.33.129.69]) by smtp.gmail.com with ESMTPSA id
 f6-20020a02a806000000b004145ebbf193sm2033363jaj.51.2023.06.05.00.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 00:09:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jun 2023 01:08:59 -0600
Message-Id: <20230605070859.1877231-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685948942; x=1688540942;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UFqQ4BCe/ih+ShLEmM+VF7SJZusCVKzy4YMGjvyfYxM=;
 b=k154NmBnRYwcvqUO1la2wPuL+T9W5n4nYb2pL0PULHMk8We0Iy6a7hcW4KPKsmJ74b
 mbwRfnwT+UC+7KwEo34INK1LHil/ZgpNe//FenudzEk/ucU3hVkrj/+kea3Liz4ZlYjl
 eTLVqsdlMX5LEIxXlnw5R5Cw0q6bNCaiKMvzU+AB+bHRrOzxK4kRs+USCMFZcPWdUqxK
 Ezk4dhVMrKRYNQEl7GavxmZbJToGJTW3464t4QTvI7zfUbBdMbGEglYC1Hyn4fbRxCx6
 efROgWTmEGeBGnAhvynpqL/+r2eQl/QUNS1K9HuCDxBjMmK9khu3iqJiF7i5+4MkRP3A
 4o+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=k154NmBn
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to version
 67.8.0
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

License hash changed due to name removal:
https://github.com/pypa/setuptools/commit/5957d58266e479f124b31f30e4322e798fdf386b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setuptools/python-setuptools.hash | 6 +++---
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 76ad1ba1ce..be13063728 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,4 +1,4 @@
 # From https://pypi.org/pypi/setuptools/json
-md5  1fd8bd04b0bed95ad6c81f03b1c080bc  setuptools-65.6.3.tar.gz
-sha256  a7620757bf984b58deaf32fc8a4577a9bbc0850cf92c20e1ce41c38c19e5fb75  setuptools-65.6.3.tar.gz
-sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
+md5  628ab1ae7d14185e5e536740ea31b5ce  setuptools-67.8.0.tar.gz
+sha256  62642358adc77ffa87233bc4d2354c4b2682d214048f500964dbe760ccedf102  setuptools-67.8.0.tar.gz
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 226ef2b479..6d10172cdc 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 65.6.3
+PYTHON_SETUPTOOLS_VERSION = 67.8.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b6/21/cb9a8d0b2c8597c83fce8e9c02884bce3d4951e41e807fc35791c6b23d9a
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/03/20/630783571e76e5fa5f3e9f29398ca3ace377207b8196b54e0ffdf09f12c1
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
