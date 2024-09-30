Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA444CEB2C2
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 22:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84A996070B;
	Mon, 30 Sep 2024 22:44:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOYGP1lOqFDK; Mon, 30 Sep 2024 22:44:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8230A6071D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8230A6071D;
	Mon, 30 Sep 2024 22:44:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FE011BF34F
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 22:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F73F8112B
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 22:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46nMSaaJjSqZ for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 22:44:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3FAF38104F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FAF38104F
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FAF38104F
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 22:44:52 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-82aa7c3b482so182367339f.2
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 15:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727736291; x=1728341091;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G7BUQeJOhq+iK3eFjxefGKiRKhey+OgFltcCenYU9PQ=;
 b=e6+FXYImWjlDpxm6o8O7mNeoE972p+ZnJaIaxNQb42zj5TN1sTYPdmllD82o5uHskB
 hTE1H+JYqb2xaWotRMB7mCMpHKwPe+b6VhEP7cWjJZmYjeEod1/cUPvGcknqVVbp/XOl
 QfeL8voXpiq5djeagKTnIQ2WyzH8I4EGqhUcjRcojlT1liCNIflldlVCl/VBdMlDxy2N
 yQ1tcMWFcXBZs57XtvmQx00xB/5HSep9iOtzKfYqgrI55WC0YkPgvQB91bFtl17QQs4Q
 IkYGWh2UPEecPmdMWJvuOfTCV9So8cuLwJIMICK+13hDsM8Uxu16ifQOLtKsPlB/hKWX
 Vx2Q==
X-Gm-Message-State: AOJu0Yx4wlTEtmT6WQqKp+Kp0XgLhwaPT3GgQXpZWlbvtn/4SVTrkCEE
 jXFLKguDPrkWBvBL6DHuSvl8Tl7LqeBa6YuY+3EycKF9RTwi2oeYPKapQw==
X-Google-Smtp-Source: AGHT+IF2o9+opai9gecvOzsKnMOj5xifTq9biZRSq0wfG0uYBmF7GVgBvMt2FIMe3yrtEa6pAyoUxQ==
X-Received: by 2002:a05:6602:2b06:b0:82c:fa71:2326 with SMTP id
 ca18e2360f4ac-834931e5178mr1410167039f.8.1727736290919; 
 Mon, 30 Sep 2024 15:44:50 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d8888c33f8sm2356672173.89.2024.09.30.15.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 15:44:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 Sep 2024 16:44:49 -0600
Message-Id: <20240930224449.1207958-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727736291; x=1728341091; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G7BUQeJOhq+iK3eFjxefGKiRKhey+OgFltcCenYU9PQ=;
 b=DxcUJ0a0eaoJUrOJmnalIDcMAiUB60225HcowN+UDoChvFXS+3GW2aOCNwyfNagvuZ
 Z5oMfQCOo9evpDqHMF8bugm1fOCy+h2xUdY5AG2y0bV7YBAEKwglNc88Ny3yRTAiGBEm
 +lmM5OWe+Q1E+GyWwArs1obcAOuHTNenN5QtVA22QTqkftyEbnqMY6kvOTwPJiTgO8I4
 t4lq2VkquMm3IwgLDEsatiLiZY6trM/PiRbiUkAGvtI/W+Ki1RfSl8M+2phwCtQjFCZk
 +F83NNmhhU0cEgQ4iL6TCG59MSeKLyE2mkBJOegNZYJ+2vlPpbsVg4V+dttewBM9fmGt
 o8wQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DxcUJ0a0
Subject: [Buildroot] [PATCH 1/1] package/python-multipart: bump to version
 0.0.12
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
 package/python-multipart/python-multipart.hash | 4 ++--
 package/python-multipart/python-multipart.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multipart/python-multipart.hash b/package/python-multipart/python-multipart.hash
index df4f8df193..3437f58da0 100644
--- a/package/python-multipart/python-multipart.hash
+++ b/package/python-multipart/python-multipart.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-multipart/json
-md5  151f86bc8501cd0f299c70ef1ed8a3b6  python_multipart-0.0.10.tar.gz
-sha256  46eb3c6ce6fdda5fb1a03c7e11d490e407c6930a2703fe7aef4da71c374688fa  python_multipart-0.0.10.tar.gz
+md5  bdcec8f36709ac1206769c2114f7dfd0  python_multipart-0.0.12.tar.gz
+sha256  045e1f98d719c1ce085ed7f7e1ef9d8ccc8c02ba02b5566d5f7521410ced58cb  python_multipart-0.0.12.tar.gz
 # Locally computed sha256 checksums
 sha256  a8e833176cd617daf00b9d6d39fa15ca8edebc6d1643079cd2f4893c0c289be2  LICENSE.txt
diff --git a/package/python-multipart/python-multipart.mk b/package/python-multipart/python-multipart.mk
index 925a72ebac..22b21db922 100644
--- a/package/python-multipart/python-multipart.mk
+++ b/package/python-multipart/python-multipart.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIPART_VERSION = 0.0.10
+PYTHON_MULTIPART_VERSION = 0.0.12
 PYTHON_MULTIPART_SOURCE = python_multipart-$(PYTHON_MULTIPART_VERSION).tar.gz
-PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/f9/29/0e5c896ec896b4e501bafa80ab555bbf3bcb0d720e9e33f908179aeb1a61
+PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/16/6e/7ecfe1366b9270f7f475c76fcfa28812493a6a1abd489b2433851a444f4f
 PYTHON_MULTIPART_SETUP_TYPE = pep517
 PYTHON_MULTIPART_LICENSE = Apache-2.0
 PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
