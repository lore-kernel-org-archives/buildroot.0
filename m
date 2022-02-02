Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA53C433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 03:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5B2E41645;
	Wed,  2 Feb 2022 03:17:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ABAdmoCd5Id6; Wed,  2 Feb 2022 03:17:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBDC441643;
	Wed,  2 Feb 2022 03:17:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 92F281BF95D
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 03:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FE1741643
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 03:17:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0F-hxksJlll8 for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 03:17:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55B2A41642
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 03:17:13 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id d3so15938347ilr.10
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 19:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2zdBeZNOZ3MiZ/4tILffqs/QoS4Jz8p7ke049WNw2dg=;
 b=iaNgNNXo52KZ4HjJCyDpDaXAuhh2BCVds8vcq04N3KOek6LvskoHtXfwU+T12va8L8
 lNEHbUgGMa7uxslAx0icF5ITtwDlvB5L74c79Mrqd1AaT+4dBsg1cTXmen9i+Z0r19pt
 OCHuEGkjNz/NJmZOyfhaRJx/DmD44bLR51vrk/lXI2dqZ5PzWCjzk8ozNuJGRFMDrhZ3
 7itfwNJL2f8/7NiP9lD68gxKHDEtN+blSYQLE0s66tmqK9ncLvrjzxZOMbEfvSYhvHpM
 B+bkcX9Kg2JJ6ZubBOcknLo0gDf83d3kjQ/TjBQJEDrciHPa9ZkTftch7aLoj7c/eWZ2
 tuZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2zdBeZNOZ3MiZ/4tILffqs/QoS4Jz8p7ke049WNw2dg=;
 b=XmitpuiynrXjS+aloz7EKXQwn0F4q0c2dl9k9dldXmK/NVPngFNq1ojNYQH8GgGRsB
 toPwJUIUAwHCtHf6aYhHg9Aq9ukFEsrInz7zpfIluB45eZoSEkU2zWxEPJuMk9ntw5Q1
 QU5tHTSkz9zkZx1+iIwETuXL+qhnBi26pVLs2+etgVO4FcT5ao3ajif/vX5ktwdsVRAG
 8/JrulA3cNVB7ktKideK3GiuXOqDKKyzpquVH3GfrMf7Fmx8whycStxWOjwHjM/sxk9g
 ZxYJqk7wlwgu0B4BAgMcemL2AZKouwKVfc2kduTA/EAIO5sOWVYZ4PljCvABS/epuR7S
 WnLw==
X-Gm-Message-State: AOAM5304WWCS3TsM6NAhj3bM7dcm+HI36hDzWLQGOxklCayR9/mbJgtd
 mzhnTyzTjjD+QAD0CReP8MJVjSxlWbs=
X-Google-Smtp-Source: ABdhPJyhYO4/Xcx6cEr1KnLcIAbmdTVrpxm6/NulWoBRXiR3c4TxXnZtsNUO1DAcRSsn5VoUpqQ6Xw==
X-Received: by 2002:a92:c011:: with SMTP id q17mr15568227ild.165.1643771832271; 
 Tue, 01 Feb 2022 19:17:12 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id w17sm4344341ilj.1.2022.02.01.19.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 19:17:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 20:17:09 -0700
Message-Id: <20220202031709.2181778-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-cbor2: bump to version
 5.4.2.post1
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
 package/python-cbor2/python-cbor2.hash | 4 ++--
 package/python-cbor2/python-cbor2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
index 9910e632a2..8858fc72d3 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cbor2/json
-md5  b3a6085ee1a9e11ddec305f7a7bc5956  cbor2-5.4.2.tar.gz
-sha256  e283e70b55a049ff364cc5e648fde587e4d9b0e87e4b2664c69e639135e6b3b8  cbor2-5.4.2.tar.gz
+md5  a9518fd435d9eafd91063b3bf10d5c5b  cbor2-5.4.2.post1.tar.gz
+sha256  9cf21d59604b9529d7877c8e0342a2ebaae1a07fe8ff5683dc75fec15847c797  cbor2-5.4.2.post1.tar.gz
 # Locally computed sha256 checksums
 sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 4cc09a219f..dd007217d1 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 5.4.2
+PYTHON_CBOR2_VERSION = 5.4.2.post1
 PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/d4/ca/b96be94f694155ce58823c38cf8fd1aa620bdc91e2c801713cdb4167b6aa
+PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/49/74/2b9f9b76e2831f54d70e177a4e602e72cb86441632d1bcc15be1f04a73f6
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
