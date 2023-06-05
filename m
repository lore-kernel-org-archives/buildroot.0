Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F37C77B73
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 07:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D90C415F8;
	Mon,  5 Jun 2023 07:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D90C415F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WINPw6IoYH9R; Mon,  5 Jun 2023 07:13:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32559415E0;
	Mon,  5 Jun 2023 07:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32559415E0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8330D1BF356
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5533A415E0
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5533A415E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NYwwdv4oXqqy for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 07:13:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28271415D1
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28271415D1
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 07:13:54 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7606d460da7so112417139f.1
 for <buildroot@buildroot.org>; Mon, 05 Jun 2023 00:13:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685949233; x=1688541233;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MCxpVOZvPFsCqD3bVdHG407XpAd7pOr99Ex6d9pQ0LE=;
 b=I6I3B1WdOB736PWgVbzBHDUOg40Zqvrl6ZWT3oaobFC8vZxCaX70h1vE3qwq1qvRTK
 JTc/cElz2DdqfJZRybmq/bNIT61ijNXdtlEqjQ/yWOy3NzJvDiC6OPbPyx85RemYPOJG
 uIjEyGZh/PbTsYvfWG14cHHrDmjNlz0acwbqBtSr8hQ319CV2B96d7OCU2KQj0klplz+
 5YD3w59SbgOskVPZzhKfIe3400Azx0XSXN8+9k8sKIMQDTBUTtooTTD7Wuw4UHB9a9y9
 AB5wLZSPTvg4IQYVY1GXNPd26WEbeXig18fOIJ3ycoYv1zkziBgKJBz25uc2IUbtA2KF
 ffTw==
X-Gm-Message-State: AC+VfDx/JAt4fdF9iuFISdEsvUHRYQu56T7WFO2VIfa9CSWGs+DbR7tH
 IrnrCy/uyRM8cmASz6G1N0yrdq4fEVXurw==
X-Google-Smtp-Source: ACHHUZ6LHG6dIARAnTvbfPZrBhPOJBNI6TnKPyTsl3Xt5rq1d9CbHQQAMOgE5+qASZFssDLJVlGghA==
X-Received: by 2002:a05:6602:24c5:b0:774:8a30:a92a with SMTP id
 h5-20020a05660224c500b007748a30a92amr7990263ioe.4.1685949232921; 
 Mon, 05 Jun 2023 00:13:52 -0700 (PDT)
Received: from james-x399.localdomain (71-33-129-69.hlrn.qwest.net.
 [71.33.129.69]) by smtp.gmail.com with ESMTPSA id
 q8-20020a0566380ec800b0041f4c9f2064sm1095451jas.178.2023.06.05.00.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 00:13:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jun 2023 01:13:51 -0600
Message-Id: <20230605071351.1879583-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685949233; x=1688541233;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MCxpVOZvPFsCqD3bVdHG407XpAd7pOr99Ex6d9pQ0LE=;
 b=LKOdhrDt73dU7zTLZjKCkmIvMSE1ApsM22xQ6MiENn5ESmTsGbHIKNMGpusniDYOXN
 rqPVzYeOCS+gQbbgYz5vmIPjn1Hl1B0GXCfuccgqpNggCx7nxOuymEmqLlnrxmMISJgO
 ZtlwZ/H2rzNw8NijG5PWNawza5Eia7EiqfyIKoh6p2e552gz2EdeHh1zOdnRTnjbXNps
 nrXNWCnH5X57dbhYYyT36zxP/so83xVNkkjX9t8HqXXSgOGTaWrc+9dZUVmkRDHMyNhs
 /1UqcJnxs2FcwCUm95jYGDIFCgoPO1//nIVauaPYNymAS5wlZNRCRNAH2lWuYEBrbQ4m
 4xDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=LKOdhrDt
Subject: [Buildroot] [PATCH 1/1] package/python-txaio: bump to version 23.1.1
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License has changed due to company name update:
https://github.com/crossbario/txaio/commit/91dace6ad1ddef3741d8c4db70d0e8728db046f0

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-txaio/python-txaio.hash | 6 +++---
 package/python-txaio/python-txaio.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-txaio/python-txaio.hash b/package/python-txaio/python-txaio.hash
index f06c14b21f..d561cec635 100644
--- a/package/python-txaio/python-txaio.hash
+++ b/package/python-txaio/python-txaio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/txaio/json
-md5  9b692af4c4fce73cadd36374c138936b  txaio-22.2.1.tar.gz
-sha256  2e4582b70f04b2345908254684a984206c0d9b50e3074a24a4c55aba21d24d01  txaio-22.2.1.tar.gz
+md5  297409f2dff8e71bad24467374aa8775  txaio-23.1.1.tar.gz
+sha256  f9a9216e976e5e3246dfd112ad7ad55ca915606b60b84a757ac769bd404ff704  txaio-23.1.1.tar.gz
 # Locally computed sha256 checksums
-sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
+sha256  ab1dd7a42dbdae302346c5a4571f2149691cc1ec06836232bf4923527e3fe41c  LICENSE
diff --git a/package/python-txaio/python-txaio.mk b/package/python-txaio/python-txaio.mk
index 1a8a888963..585b3a5f57 100644
--- a/package/python-txaio/python-txaio.mk
+++ b/package/python-txaio/python-txaio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXAIO_VERSION = 22.2.1
+PYTHON_TXAIO_VERSION = 23.1.1
 PYTHON_TXAIO_SOURCE = txaio-$(PYTHON_TXAIO_VERSION).tar.gz
-PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/6d/4b/28313388dfb2bdedb71b35b900459c56ba08ccb7ad2885487df037808c06
+PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/51/91/bc9fd5aa84703f874dea27313b11fde505d343f3ef3ad702bddbe20bfd6e
 PYTHON_TXAIO_LICENSE = MIT
 PYTHON_TXAIO_LICENSE_FILES = LICENSE
 PYTHON_TXAIO_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
