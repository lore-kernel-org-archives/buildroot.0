Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BBBC7EE24
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 08:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95C878224B;
	Mon,  5 Jun 2023 08:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95C878224B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8nrAfvPrH770; Mon,  5 Jun 2023 08:21:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B36D0820C8;
	Mon,  5 Jun 2023 08:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B36D0820C8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0F4F1BF4E7
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 08:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFEAB417C5
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 08:21:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFEAB417C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id St-faUMwwdxt for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 08:21:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92BCF417C3
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92BCF417C3
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 08:21:33 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-33b3fa03738so22624225ab.1
 for <buildroot@buildroot.org>; Mon, 05 Jun 2023 01:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685953292; x=1688545292;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7v7T5YymBAdfdlGAicuep2rrKHbwR44bzZLKsKDO4Tg=;
 b=bq8142nQSooUX7M/nzvieyjBizBj1Rq8AZ644gtds7QqMhJVRNi5Xr12F6fryHsYn5
 dNPdPYRFi8bHmA9KFfK8iIjpaNYIXzwAv2W8dAUCx0yDoVVw+I/RYZMOMisjJF5VyCqj
 D4zIV6Q6RiTRhHbsQ/PfuJ6e9lZtztGrOhxxUROv/EWMnzy01+ObPVOX+CME6xI2wORW
 Qpjgx5x5Pe/4k3gFRBPWimYVd2OL+lhuGBWiLCKo0xs+MOqRkfAgsfr8Vep3ptoWibaA
 PMt/F3yCB+2MFDzXOD2YtLn7Isgt8Cy/gTNh29OvGtUPfehwsX+6dYKKPSQqoQgzjv7h
 0qLw==
X-Gm-Message-State: AC+VfDzXbRm0iO77Rc/imnqp24OP5fU5yw7lBNmlFfURY71b+a3QMG7j
 5uVJbWteqj0bvLLdEm2kFrl/zzbiR0BKkQ==
X-Google-Smtp-Source: ACHHUZ7DZEksC2jQQuDcSDeoDPJc/rRmDNrhDryKCgK07hDcy7g8udIKuvdIzttNVSy4Sou1EdG+Qw==
X-Received: by 2002:a92:db51:0:b0:330:f7b3:ead with SMTP id
 w17-20020a92db51000000b00330f7b30eadmr19066909ilq.12.1685953292476; 
 Mon, 05 Jun 2023 01:21:32 -0700 (PDT)
Received: from james-x399.localdomain (71-33-129-69.hlrn.qwest.net.
 [71.33.129.69]) by smtp.gmail.com with ESMTPSA id
 v10-20020a92c6ca000000b0032c999af7ecsm2209381ilm.7.2023.06.05.01.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 01:21:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jun 2023 02:21:30 -0600
Message-Id: <20230605082130.2142774-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685953292; x=1688545292;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7v7T5YymBAdfdlGAicuep2rrKHbwR44bzZLKsKDO4Tg=;
 b=ZfaoFze78UfJsDTLXmVDDRCvaDjc9FFRLSx+OnMzLxmLao/L8HmXR9xVhcEVGkUVrr
 91rJ0PWWV4x8n+Txi2fSBcA2tjb1JJWHcYVvkO8S2wFaOx34PoYGO8Rt5p9rkPjFyO4T
 y+2UTsNbXLmwLVxJwY/5oF/+VElhNMFyR62dkOZBLxxT8K7IwL/yYT0CmDZdeFAlSNrL
 4p3244nhrWGFhyg56PWNVkIWWX6cg3KVqMJASJvih708uPT/A3gS+NnRT0f1Vp7kqel2
 b36EXzvtFBY1a+FnOkMckCgyc0hwoN8JhnACi54Engwh3ctJiLPUTvI4HPH4UiSibA0B
 l8ug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ZfaoFze7
Subject: [Buildroot] [PATCH 1/1] package/python-cython: bump to version
 0.29.35
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index e7e86264d2..dc75d098d3 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  bd42c555cb2298b8a94fa8de7ee679ba  Cython-0.29.33.tar.gz
-sha256  5040764c4a4d2ce964a395da24f0d1ae58144995dab92c6b96f44c3f4d72286a  Cython-0.29.33.tar.gz
+md5  138dba31e20e178b431a2e403154f906  Cython-0.29.35.tar.gz
+sha256  6e381fa0bf08b3c26ec2f616b19ae852c06f5750f4290118bf986b6f85c8c527  Cython-0.29.35.tar.gz
 # Locally computed sha256 checksums
 sha256  a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index b11d75b33d..145e804bd7 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 0.29.33
+PYTHON_CYTHON_VERSION = 0.29.35
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/dc/f6/e8e302f9942cbebede88b1a0c33d0be3a738c3ac37abae87254d58ffc51c
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/da/a0/298340fb8412574a0b00a0d9856aa27e7038da429b9e31d6825173d1e6bd
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
