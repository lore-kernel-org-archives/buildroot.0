Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621AEC7EE23
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 07:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3E248207E;
	Mon,  5 Jun 2023 07:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3E248207E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jn7x9QNGsHN0; Mon,  5 Jun 2023 07:51:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D18780F03;
	Mon,  5 Jun 2023 07:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D18780F03
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 57D3C1BF356
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30F4960C03
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30F4960C03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YPwpIdHEDWuB for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 07:51:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A72A6005E
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A72A6005E
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 07:51:03 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-777a2ef8d45so29479039f.2
 for <buildroot@buildroot.org>; Mon, 05 Jun 2023 00:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685951462; x=1688543462;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mmxj+XaV9YbPrWgxQjr42YPhE1nsxc27AiTTGNr11SY=;
 b=Q5zcHk2gBDVeMwUP2D0WRSQ8mI98muDxmxpg6kJHyGn8BhL+GdNIHukBmeowDWtcKK
 AHCsoF/uukbX2Gh0Ifsht7qXCgVbFprBkBlbJL8HmI8A/Kn1CAqRSClsUgzspRau4eFz
 idj8RTYmohOe/PH8XvaRB4D6b0lIio9NNSS49/WsWj41i6f/lH47cIzQljawm3Xi2JSi
 ghGBejUgcbQN+JNDUa5twQ6GUSKVqjFPuQNe4wAWLHuTIi8xhx/QpiP2FJQfdUIa9tay
 cguT7YU498NPn+wYrjRi/b+V1wIsllNDdwDpUDeE+sspKpOiS1ldDLmsDQ6nSlyEJMHI
 lJQg==
X-Gm-Message-State: AC+VfDz+Q9n30qMONBtiOuH902meUg5Yz5dqPg6x6KEncW4FyUjAjW1C
 gmm6/H9LzvfijZkFtFubKbZfi8dIFYMTYQ==
X-Google-Smtp-Source: ACHHUZ7+3wnn9poAEmkUFubKxjEYZuAa7qGG4X2vEtlKuhNqEYvW4FUYBbCPsGE8fPIGMXo59oi1oA==
X-Received: by 2002:a5d:884c:0:b0:76d:7522:2658 with SMTP id
 t12-20020a5d884c000000b0076d75222658mr8087125ios.9.1685951462005; 
 Mon, 05 Jun 2023 00:51:02 -0700 (PDT)
Received: from james-x399.localdomain (71-33-129-69.hlrn.qwest.net.
 [71.33.129.69]) by smtp.gmail.com with ESMTPSA id
 j13-20020a02a68d000000b004035b26b6d8sm2063602jam.2.2023.06.05.00.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 00:51:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jun 2023 01:51:00 -0600
Message-Id: <20230605075100.1901700-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685951462; x=1688543462;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mmxj+XaV9YbPrWgxQjr42YPhE1nsxc27AiTTGNr11SY=;
 b=nr9wdKYlbpVpeEX64GrDEWO9PV5zsWNqYdfeuysjzFNpdiXvXHfGJn8XExhMgXZWq8
 nvns6jx/aJmxbHG7QcCo7gLSn/9kn0aKNzNasqp7YU8OjbZzKY6o6xUh8S1uRd3O2SOk
 ka3fJ5d61dbekrZeJr1/TZYoa+VNiiaymcEXQDn5J8mWQoMLI34hVkmN5qeh8HFBVeon
 O9BN4otCy0BHSJ0WdyTUESbcjqbLGVBlSQLEEogPzwmWfWrTTJo7VzD1NbS5B4uKEUkf
 4qkZzKAQCtiwus8zxQ68CzoAqApkKopiCp8Tt7zri495oIhL9r8VgS3yuV3Wxdz8nUzs
 axlQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=nr9wdKYl
Subject: [Buildroot] [PATCH 1/1] package/python-pydal: bump to version
 20230521.1
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydal/python-pydal.hash | 4 ++--
 package/python-pydal/python-pydal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index c55a17a545..8ed25084d1 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydal/json
-md5  eeaf44cdcdb6bd2040713c710a4a04be  pydal-20221110.1.tar.gz
-sha256  7c3e891c70f8d8918e36276f210a1959bb7badf3b276f47191986ffcf5b6a390  pydal-20221110.1.tar.gz
+md5  47f0425745bcd1bb413aa9208cd06b3c  pydal-20230521.1.tar.gz
+sha256  10478a61e627c5b8cb7691f7f7ebf7210845485316493d37d740c297fb6d1845  pydal-20230521.1.tar.gz
 # Locally computed sha256 checksums
 sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index f55c7fc2c5..1cc7e90b11 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 20221110.1
+PYTHON_PYDAL_VERSION = 20230521.1
 PYTHON_PYDAL_SOURCE = pydal-$(PYTHON_PYDAL_VERSION).tar.gz
-PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/73/83/b904c464b6ab060e12b3f406f1fab7deb97bcd9d2021d8c87325e6225c2d
+PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/68/b4/15dc227f965cc0525ca7f432368706cc4087ad6d587a5a05b251d133023e
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
 PYTHON_PYDAL_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
