Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79775CAC59F
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 20:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 434DD614AC;
	Tue, 17 Sep 2024 20:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id icsWX6nu5tjf; Tue, 17 Sep 2024 20:48:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53BC861145
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53BC861145;
	Tue, 17 Sep 2024 20:48:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D3E91BF2C3
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 20:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CE0061148
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 20:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2x6Kmg7bxl1N for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 20:48:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF71661145
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF71661145
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF71661145
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 20:48:22 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-39f52e60a19so32889985ab.3
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 13:48:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726606101; x=1727210901;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GgUNPiIBy3cQ6aO1vkSIjwYO5kemV/zbST1l1R4oYb0=;
 b=u2pLBHwFPiKrRTowA+mCxTDSYk2WerggjWdHPYSD8P7vZlq/nE5JC2RGhI4DzTfKHc
 FMVU3LwZBfaAVPehn02cxVDC9wo9tobACtq6pSxGSHC04qbUHOGZxS5w90mAYNvOIbM4
 Kn8rXyWzL9O2XG2UClezUHWshAQ2CjBqkA3B3JanlZO4qlvu679pvDQs5JOB9Kh/IHes
 JKKJa7rDpUysLOncIPMRccjxHfRnwL6KtyS3YExREzGJ35f6lE4sXZrkKqECPicmvdX+
 f8F1N82hoTPZBVl7b/4NZ42fmcVuXSI3LBSnSV0P19kWd98Lu17VhZ5H6sqaRCJJD8ZD
 7Gsw==
X-Gm-Message-State: AOJu0Yy2ENYvtBMGof1zya/8DzvyQ+gF6AFD7XRHPEDUiF6OUBF/8Eu/
 Z6w/+RkdBwfdb2mJaj3ua6CwhBQpT3PDay0wlais6DPL4g+f8HhUO1cJGA==
X-Google-Smtp-Source: AGHT+IH9W0EpinMl6uOzTf0y1sNP6k6K18hBPsnD2xc4sxmxgQhoFHMWEZka7dQsotwCBjb+QOLamA==
X-Received: by 2002:a05:6e02:1a0e:b0:39f:558a:e404 with SMTP id
 e9e14a558f8ab-3a0848ac716mr187342965ab.4.1726606101502; 
 Tue, 17 Sep 2024 13:48:21 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec1f004sm2152507173.61.2024.09.17.13.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 13:48:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 14:48:18 -0600
Message-Id: <20240917204818.4029962-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726606101; x=1727210901; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GgUNPiIBy3cQ6aO1vkSIjwYO5kemV/zbST1l1R4oYb0=;
 b=Ljge9zCruR0YfLTZ/sq63fYPrmnV8/CWVz890vWl+jd/1jHeW4tEpoT5saxytiTSG+
 RMrEQ0+rj8+NOhUrKI6R7f8RMeu6uLuHgP/Rszv5doXbL3+WjWGCgAQzyfWm7fjDM4Vi
 AHyDdXRfNYt/ro17zMzyCg3qosMiIcLzV7M6+Lnahqu4+xuyDYpJaYczt+5PWtPWyzlJ
 V2CGtzTGVASnrpQrkit7nHPRUtGlEyNcNOeNdrtOQqfYiMYgl3f10guXucw3fxueSEnA
 EHeZy4coWLILx5ryTn6vOcaumdRjBJcPpwN2CgcSyCkteb5rX+hkDpHyJzEVMXyM1svt
 HJHg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ljge9zCr
Subject: [Buildroot] [PATCH 1/1] package/python-pybind: bump to version
 2.13.6
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pybind/python-pybind.hash | 2 +-
 package/python-pybind/python-pybind.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind/python-pybind.hash
index c831007d4d..a046181a9b 100644
--- a/package/python-pybind/python-pybind.hash
+++ b/package/python-pybind/python-pybind.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  51631e88960a8856f9c497027f55c9f2f9115cafb08c0005439838a05ba17bfc  python-pybind-2.13.1.tar.gz
+sha256  e08cb87f4773da97fa7b5f035de8763abc656d87d5773e62f6da0587d1f0ec20  python-pybind-2.13.6.tar.gz
 # License files, locally calculated
 sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index a1cc02ee04..8d815ac38f 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYBIND_VERSION = 2.13.1
+PYTHON_PYBIND_VERSION = 2.13.6
 PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
 PYTHON_PYBIND_LICENSE = BSD-3-Clause
 PYTHON_PYBIND_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
