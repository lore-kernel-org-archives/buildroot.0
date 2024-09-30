Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F251ECEB2CB
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 22:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6E5F6074A;
	Mon, 30 Sep 2024 22:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ewVVsQ6qhscY; Mon, 30 Sep 2024 22:39:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE75460755
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE75460755;
	Mon, 30 Sep 2024 22:39:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC4921BF34F
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 22:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BE058101B
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 22:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CUEfaKfJQlHP for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 22:39:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A6E4381016
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6E4381016
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6E4381016
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 22:39:31 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3a341ab4573so19250125ab.1
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 15:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727735970; x=1728340770;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=os0oSSEB++uOXxZuYDr6Wxo0b9Z9yiSya+MKRde8TH4=;
 b=Sj4rc3pzJhVoeuPyY+Lfekoe23bKXcNSexBpMPzqk2POoYjdB1QHliOAzEpXyOPNUU
 w/Erq1y8sQhNNTrg4nb/UWk1umJ4rLxJyyHbViLf/H+Z8e+1viguHz4XPg27RoF163x8
 +0/2xDU62tuWakePLOatG6hOdcsFvtwhv4x37o9HlLUO8z3VI/aRimSEboZVLmR6EN2m
 ZI01qb3EUqf33SlRGHhbWeI7bxqITdz1JWH1BNGuNhezlf6mtJ3gEANGTx+g1AeU1xpN
 MjefvVdx10WKHESAVrKb1dxFvQnE8GbcwMpcehMs9YZzDbnsICpVEKV7PbBLfBamiQau
 hp2w==
X-Gm-Message-State: AOJu0YyJK82P7Q5J9o8UaNuxRBZiCjjq5LC4vbn+bvm4AOUq8VQmUmj1
 ghWeUEbuuo54sx8fAZz7JgqAoMe9D+36txXiIWr5ERl8EmNtycdZA07iQw==
X-Google-Smtp-Source: AGHT+IEV7JqPgybAwOzjTYIczqQJpp2iKLQaB07/Mn6l1OhfJdBwAzKlf+5wKZuA1dOtP+1Brj/5RQ==
X-Received: by 2002:a05:6e02:1a0a:b0:39f:36f3:1957 with SMTP id
 e9e14a558f8ab-3a345148113mr119131955ab.3.1727735970151; 
 Mon, 30 Sep 2024 15:39:30 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d88884a660sm2377415173.62.2024.09.30.15.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 15:39:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 Sep 2024 16:39:28 -0600
Message-Id: <20240930223928.1204689-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727735970; x=1728340770; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=os0oSSEB++uOXxZuYDr6Wxo0b9Z9yiSya+MKRde8TH4=;
 b=BEtADuKMfw4r6QmhfjqgvduoeB2St+oAvhvR9B8DDLkrXyb175XXhdEN3lHKVjzKr/
 TwqZnhRHQMwl5wDbxC6mltql4zqSwbmLDL+WzXI6TxtzaOXX8SNGaSORBXH+an9PmS3A
 Q52WIFSfK4TShFIw5s8P9fvpRiTguGAQcGwKJQ6uM4gJPijEH/ji57sFyKtZ78y3n4SU
 7ZUYgQPSsXM2RV9oPSmoz813Mh+gTJB7ojZV6ZwtKh14CLc3dr/dZRwQhpm4IN1k3rm9
 /Yj42CbjMmR72WY6vKjlOuH2o6hulytyRPuFbDcbEfAD7coK4WGf/bxXVS3lekUzlCmF
 OObA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BEtADuKM
Subject: [Buildroot] [PATCH 1/1] package/python-jaraco-functools: bump to
 version 4.1.0
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
 package/python-jaraco-functools/python-jaraco-functools.hash | 4 ++--
 package/python-jaraco-functools/python-jaraco-functools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jaraco-functools/python-jaraco-functools.hash b/package/python-jaraco-functools/python-jaraco-functools.hash
index d99e1aa537..69edc2384b 100644
--- a/package/python-jaraco-functools/python-jaraco-functools.hash
+++ b/package/python-jaraco-functools/python-jaraco-functools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco.functools/json
-md5  70deb206d55e5d003e008e1385e80b5d  jaraco_functools-4.0.2.tar.gz
-sha256  3460c74cd0d32bf82b9576bbb3527c4364d5b27a21f5158a62aed6c4b42e23f5  jaraco_functools-4.0.2.tar.gz
+md5  b8a8d165da986efa1966abd91c45348e  jaraco_functools-4.1.0.tar.gz
+sha256  70f7e0e2ae076498e212562325e805204fc092d7b4c17e0e86c959e249701a9d  jaraco_functools-4.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-jaraco-functools/python-jaraco-functools.mk b/package/python-jaraco-functools/python-jaraco-functools.mk
index 65a273a16f..e72a062fa8 100644
--- a/package/python-jaraco-functools/python-jaraco-functools.mk
+++ b/package/python-jaraco-functools/python-jaraco-functools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JARACO_FUNCTOOLS_VERSION = 4.0.2
+PYTHON_JARACO_FUNCTOOLS_VERSION = 4.1.0
 PYTHON_JARACO_FUNCTOOLS_SOURCE = jaraco_functools-$(PYTHON_JARACO_FUNCTOOLS_VERSION).tar.gz
-PYTHON_JARACO_FUNCTOOLS_SITE = https://files.pythonhosted.org/packages/03/b1/6ca3c2052e584e9908a2c146f00378939b3c51b839304ab8ef4de067f042
+PYTHON_JARACO_FUNCTOOLS_SITE = https://files.pythonhosted.org/packages/ab/23/9894b3df5d0a6eb44611c36aec777823fc2e07740dabbd0b810e19594013
 PYTHON_JARACO_FUNCTOOLS_LICENSE = MIT
 PYTHON_JARACO_FUNCTOOLS_LICENSE_FILES = LICENSE
 PYTHON_JARACO_FUNCTOOLS_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
