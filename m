Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396E7E6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 19:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BEDED4018B;
	Fri,  6 Sep 2024 19:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZyXdFQAxzNlf; Fri,  6 Sep 2024 19:19:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83711401D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83711401D5;
	Fri,  6 Sep 2024 19:19:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A1C21BF46A
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04826401D5
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZBoQNwRHY9bG for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:19:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9D8BF4018B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D8BF4018B
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D8BF4018B
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:19:46 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-39f51934f61so9207905ab.2
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 12:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725650385; x=1726255185;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K7+/fKE/ukRQnoxO05TezlEDwkpGTC7e3l7WBOGtI0k=;
 b=wPdMsUaEjf4iObRikGMW9Kb4nPg8HOscNOC3nBW+z9nwqe1PvV00cKZ+QOEKCK/wUU
 Y1F8NtVg/U2BAzx9GDCSzrfaKn2rdxBEmPHU6vxZ7QF8JZzw7kIODVTw+qlbIdUm9Q2M
 oR92CcoD6HqVEdGky9pAvruIperspjBPumKABs6zCxaGJUQBuMXjZ8gFDxSNa1f9b/j2
 lRKmrYNoulTPeC8AuG0uLVHSJ9kqXZzFhGRZYfPej40jO4GmQfqqDfPhdTX55mCD2yEG
 AGt4IEYlPJ3UHpQcl83+xSibh9VizopBv5lsexDVXcKmPv0iY5MJ3WxJTHybhhwpuH0k
 prnQ==
X-Gm-Message-State: AOJu0YwD/efmnMxqmYGDYhFi/IVLJvbKVsmy7QmOGlhgHgNVykNmyBfz
 z59ImQ0EH3+YZ1kUCA6EnbZdMcXjvuAAWs6Nd3A1E7jSyzd4R5G2YmdfOg==
X-Google-Smtp-Source: AGHT+IFvqVVJaRmnfIsOyoF93tz3JqabATZqW60z6Zx4IyR0E3Y055m97GxqSJsLm0LbETDCT/G/yQ==
X-Received: by 2002:a05:6e02:154d:b0:376:4049:69e5 with SMTP id
 e9e14a558f8ab-3a04f0e19ecmr46701325ab.23.1725650385268; 
 Fri, 06 Sep 2024 12:19:45 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-39f3afc65b2sm48812475ab.47.2024.09.06.12.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 12:19:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 13:19:39 -0600
Message-Id: <20240906191939.1857705-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725650385; x=1726255185; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K7+/fKE/ukRQnoxO05TezlEDwkpGTC7e3l7WBOGtI0k=;
 b=IMDcTVXwIx9cUYXfR0JwtXhSU8Ou82tMuWFZLSFPipdoGUDG7+wSRddeCBUqvBcngk
 3dySE+a/tHGMQ97AX+u/IGPQ9Snd6dq8QYhYpdzCM1rHFjdxH9UG9wQGJidg8N8IaJMn
 3tFUrA4+zB+jthTNHEHgES0dx2I7iGApqf2UFCga+YmyJw7JR4U04hTSGSrElhhVcIlK
 gl7DYr7j5U8WT3OfGjlKO8xB0kd2pxn/2BSKnNQIiVU+FtRXZjKRMggZnPqkPnWiXYId
 fxpzIRPBA2OszQ0CwgfieK/BN9sEBmjBQ20VOHXmKwSDu7sr61np27x7Xfo0zEwES4++
 i7+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IMDcTVXw
Subject: [Buildroot] [PATCH 1/1] package/python-websockets: bump to version
 13.0.1
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
 package/python-websockets/python-websockets.hash | 4 ++--
 package/python-websockets/python-websockets.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
index 8d0bda501c..33d28745b0 100644
--- a/package/python-websockets/python-websockets.hash
+++ b/package/python-websockets/python-websockets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websockets/json
-md5  49d033c8236aa56ba2524f65570a27c5  websockets-12.0.tar.gz
-sha256  81df9cbcbb6c260de1e007e58c011bfebe2dafc8435107b0537f393dd38c8b1b  websockets-12.0.tar.gz
+md5  b3d1cc7a447c4f91b0c6f24beaf312cc  websockets-13.0.1.tar.gz
+sha256  4d6ece65099411cfd9a48d13701d7438d9c34f479046b34c50ff60bb8834e43e  websockets-13.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3d6a0c050d8bec52fabad502e45fb25bd02bcadbd70dea34d447b6a0ff4e6da8  LICENSE
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index 2b8761c029..00d69f9ddd 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKETS_VERSION = 12.0
+PYTHON_WEBSOCKETS_VERSION = 13.0.1
 PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
-PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/2e/62/7a7874b7285413c954a4cca3c11fd851f11b2fe5b4ae2d9bee4f6d9bdb10
+PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/8f/1c/78687e0267b09412409ac134f10fd14d14ac6475da892a8b09a02d0f6ae2
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
