Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AC4CF2579
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 18:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8517780B49;
	Sun, 13 Oct 2024 18:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_i-GraXmo3Y; Sun, 13 Oct 2024 18:48:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9122980B4F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9122980B4F;
	Sun, 13 Oct 2024 18:48:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B7BE1BF3DF
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 18:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B03A80B4F
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 18:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8KwvTVmxNRo8 for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 18:48:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F71D80B49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F71D80B49
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F71D80B49
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 18:48:12 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-83542d9d7c1so159809439f.2
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 11:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728845291; x=1729450091;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CFQXxTnUjKk13xrctQmHiXAzbfUZE2TAwORTqMseRf4=;
 b=jz87EJaGw5H0Pj5UUq/r0dwf2VmdvFFLZcS8nsFgl0xVnyYR1YGDuMUpVI5IPt5PN6
 WfjpecOUmRMCpQcPXB2ge3l1oHo+ALwbXU8XwTrcLj+/iEftA7x4ntYmxQhJRymnQHP3
 Yzv1rYKF9yJjybD/EINp8AjXRpypITXBt8mqun+jbNWBuF+yW9Fs+uxWhE5O6N3MDT2M
 JpjJbGJbRgJp7QrSAAHpFVwRan6Hnso0gzMlf3QRLw9lLmw9nStLcfJ2jjIvYPRzt55D
 H79SeevB2sHKhau0bcgSwzjCf/EFRpzjfJevkGltA7kpSGsSTMB70IxnR4bPuY+/dQoS
 EVMg==
X-Gm-Message-State: AOJu0YyfocsuipHT9D7BQjy+koOP3dZFGO9IuYcOu+FaMP4zE4nKZOvZ
 E8MczbD6/2Io/qwzqaEuPpRFzYd7kGyY0L2X1r3l+z3yx1mu9apNNIyRXg==
X-Google-Smtp-Source: AGHT+IF2mtqtz4GsaljmuSgRJkmgklhhRkNh088ETqzow2Xzj/dlGS0/hgzgHbjG47wu66cJUja3iw==
X-Received: by 2002:a05:6602:6c18:b0:835:359c:3f03 with SMTP id
 ca18e2360f4ac-83794d44c60mr735588639f.15.1728845291044; 
 Sun, 13 Oct 2024 11:48:11 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net.
 [71.33.159.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8354b90716bsm164539839f.18.2024.10.13.11.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2024 11:48:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Oct 2024 12:48:07 -0600
Message-Id: <20241013184807.2793442-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728845291; x=1729450091; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CFQXxTnUjKk13xrctQmHiXAzbfUZE2TAwORTqMseRf4=;
 b=nOLeX4DCzBHycGm5//HNS7e9Tj5QPWkzMgm39gvca8rHnCd3l6WXpXjaE9N/Zjyv54
 9kRHybgIAZfCMJf/UG2+/B1u9NBELKXAIC675cES8pjSWmyPtRxL+51On08+q5mZigS1
 5pKMPSS/5y8fD2xfT4512DchLd6ogra12Ug8oBc5D5DLv81hySmfg+m1W1zYAWItnuib
 D6N4d/bWdA8uHMaXFSv+9EplsaRQJEeUKz/G7uwBkj1GxzOnI86K42CUecRk16VbT7EJ
 33EpsZOS1+6YvV5GmsuzrATSWIOeV65tFdb3FR64NcHsqbVl7MbEN655BLz1QCaGVGiO
 uOSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nOLeX4DC
Subject: [Buildroot] [PATCH 1/1] package/python-networkx: bump to version
 3.4.1
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
 package/python-networkx/python-networkx.hash | 4 ++--
 package/python-networkx/python-networkx.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-networkx/python-networkx.hash b/package/python-networkx/python-networkx.hash
index 3b6f4c6fba..77d2fbfdef 100644
--- a/package/python-networkx/python-networkx.hash
+++ b/package/python-networkx/python-networkx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/networkx/json
-md5  c307f8c790cf3f18954ae7458b16c843  networkx-3.3.tar.gz
-sha256  0c127d8b2f4865f59ae9cb8aafcd60b5c70f3241ebd66f7defad7c4ab90126c9  networkx-3.3.tar.gz
+md5  4980849a13f8174a8f6aeb5a9d59e77b  networkx-3.4.1.tar.gz
+sha256  f9df45e85b78f5bd010993e897b4f1fdb242c11e015b101bd951e5c0e29982d8  networkx-3.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  5b433b90f755eb9bbd06feff1d1a4f5f232c5208a185694199e45fa95d762792  LICENSE.txt
diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
index ef51003047..9ac5f857e9 100644
--- a/package/python-networkx/python-networkx.mk
+++ b/package/python-networkx/python-networkx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_NETWORKX_VERSION = 3.3
+PYTHON_NETWORKX_VERSION = 3.4.1
 PYTHON_NETWORKX_SOURCE = networkx-$(PYTHON_NETWORKX_VERSION).tar.gz
-PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/04/e6/b164f94c869d6b2c605b5128b7b0cfe912795a87fc90e78533920001f3ec
+PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/36/2b/20ad9eecdda3f1b0dc63fb8f82d2ea99163dbca08bfa392594fc2ed81869
 PYTHON_NETWORKX_LICENSE = BSD-3-Clause
 PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
 PYTHON_NETWORKX_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
