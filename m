Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E164C47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 20:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7225E403FF;
	Sun,  7 Jan 2024 20:35:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7225E403FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q153F_CIlCfC; Sun,  7 Jan 2024 20:35:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BAA940414;
	Sun,  7 Jan 2024 20:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BAA940414
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 306701BF2EF
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 20:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05FB340414
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 20:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05FB340414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4p-dN-X9L9w6 for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 20:35:20 +0000 (UTC)
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 932B0403FF
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 20:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 932B0403FF
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-7bc32b04dc9so55249139f.2
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 12:35:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704659719; x=1705264519;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lr1dbM55ddUH2m2XSDM8+7UR6kBlvkdACAbpcILzslM=;
 b=EmOCbVeyUfiWAVL3gaGaRTEdB2ZXrR83ZargCS2JCNeou1yMSJMemidE4tE0N9a64S
 r9jMUm0wgYYW+rsNlt5gxiDqOV+ZL0g2NLxSLTtY3vsMurvgj7hUUUM5CZE+4jwNH/2a
 eWKii3OmNuJS15HZFqHFMQAtstLoWcem/wzuHuJSKQfdMxh+HTsa9OUX0pqDkL1FBxa4
 fvxcKNUK/WJDI0oLiNkVbVc+TEd2bRfsgE12PHHPERG47Ts084Z8MzYFLPM42hBPsUMH
 jJet79hO56Gxnzc6V911lGz7avR8Zg1ClvVvT7qtoIbPtHGisSrKbDWon7Zm2pXimf9p
 34/g==
X-Gm-Message-State: AOJu0Yx1+5Upr11g1VAGiMBp4n4HndDqV8/e0g5C7MkFc88xnrgAbkEK
 RN/ETUTOKPOPY+EA+HdEZaJJCGNt1TPdtQ==
X-Google-Smtp-Source: AGHT+IGBxmUc5c6Wme2nRFDCEyd3efJwRpkyahSecaJM2HxKi5nhQTtrmu4h4QkST0Z+dtRV7W9VPg==
X-Received: by 2002:a05:6602:148a:b0:7bc:185b:c687 with SMTP id
 a10-20020a056602148a00b007bc185bc687mr5170090iow.38.1704659719053; 
 Sun, 07 Jan 2024 12:35:19 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 q19-20020a0566380ed300b0046d6b3edd2asm1837595jas.132.2024.01.07.12.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 12:35:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jan 2024 13:35:17 -0700
Message-Id: <20240107203517.3310719-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704659719; x=1705264519; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lr1dbM55ddUH2m2XSDM8+7UR6kBlvkdACAbpcILzslM=;
 b=FLZHsNLRcYwNqMv6vzUeUAjnyKMpRTEjVwZ82jh2MhAeH41pv2FhRpRmJLgIlM10B9
 QHQA0fJvNDkRJ4JcQfRWRMp2T7QhwjZVhng1uyxr0YBgmG/SCmeTy4z6ul+qvF4FZV/p
 dYINZ9rx8MtgVKw2WSQi6imrm2+XHb49yFf/3uCrMHlCQD+Kfyf+lbIvAhZcvN4oXMMu
 px6/9BSkY6OHiInN7X1T8hVro18ztSF0D/rQektHpVzNg1hFbCw3BjeKmPLvrP+g61Hs
 LKr0g+31TcI/Mlr9vstjEzx7xkW+xZaggSdX/n/xwBHxrHrW2iM45rKCdM5xHhL4Id1L
 V/hQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FLZHsNLR
Subject: [Buildroot] [PATCH 1/1] package/python-aioconsole: bump to version
 0.7.0
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
 package/python-aioconsole/python-aioconsole.hash | 4 ++--
 package/python-aioconsole/python-aioconsole.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aioconsole/python-aioconsole.hash b/package/python-aioconsole/python-aioconsole.hash
index b8237ed76c..b52140cca5 100644
--- a/package/python-aioconsole/python-aioconsole.hash
+++ b/package/python-aioconsole/python-aioconsole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioconsole/json
-md5  0f7e4db85113d1ffdc5f0fa1dc0a37de  aioconsole-0.6.2.tar.gz
-sha256  bac11286f1062613d2523ceee1ba81c676cd269812b865b66b907448a7b5f63e  aioconsole-0.6.2.tar.gz
+md5  e8cb2e4dc434e20a3e75acb54d89bdf3  aioconsole-0.7.0.tar.gz
+sha256  c702d24406378d37d9873f91e03ce71520bac503d5ab03f81d8b563ff010bd54  aioconsole-0.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e1c0ad728983d8a57335e52cf1064f1affd1d454173d8cebd3ed8b4a72b48704  LICENSE
diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
index 602564c290..b109d8e358 100644
--- a/package/python-aioconsole/python-aioconsole.mk
+++ b/package/python-aioconsole/python-aioconsole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCONSOLE_VERSION = 0.6.2
+PYTHON_AIOCONSOLE_VERSION = 0.7.0
 PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
-PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/5f/14/e5c634fad6a95ffd602fbbd1aa107f05a8ffb79d33ec0d0477f3b137f8a9
+PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/85/da/6a238a72274fa338b2ff20007f026944a6721245fa65d3bd4adeb83be419
 PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
 PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
 PYTHON_AIOCONSOLE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
