Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3365AC021BB
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 20:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3C5C406ED;
	Sat, 14 Sep 2024 20:56:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDPigYnBEKE6; Sat, 14 Sep 2024 20:55:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 879C8406F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 879C8406F6;
	Sat, 14 Sep 2024 20:55:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E75151BF3A4
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 20:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF3C8406FA
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 20:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8DosNA2wDRns for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 20:55:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 97142406ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97142406ED
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97142406ED
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 20:55:54 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3a043496fdeso11050395ab.3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 13:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726347353; x=1726952153;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YS5yvRvk2FI/iUbwQ/n9dSnntjCjVPtFiY+o6xW5PYQ=;
 b=N517rgohdDcdPN0gX4VvdmpzaYdpSdrRvBUynKgm2ZihqmjHCjThTA4oDkwu8TSfMG
 rAd5ce/sVTDTfU0xVx4+/PuFHajzZaKhw8Lootb88+Bhyi3jwu+fcmu7UTIl3OfL2Z3F
 uuPy5gw2WeATnKh5uWKd7nE+hXvuehlG8zhBNT1PL8MGQ5g0vZHPVcfveEyCH3p5eQmg
 DKDzCo5ggahqIuWT323nGMg2FCOTyfPQqvl0S9Y5PgXOHLfgUvriSTK+6sjuzNN3hveW
 0kUnZbGppYakVlqinsTJ2J+j4jftrx3wDZio8t8oO/rlXDclg/xWzUzOFHyajyb6WR9e
 Z38A==
X-Gm-Message-State: AOJu0Yw44U+S7/IGLKhJ6e+NNM9BGJkKNwtwdJ8zSY9Gc295DNgArGEp
 ux7CJ2XGxkgeEvFFob/tIUrZoRVWcXPqxnnqFTlBDGoDafsS96Etjwt81Q==
X-Google-Smtp-Source: AGHT+IH/CchLsxtE3sj2Fb8rn6qwW501XanoGkQ0tI4KyugHnYKZwbCJEzFMeVp/EAG04ReeqYoqvA==
X-Received: by 2002:a05:6e02:48e:b0:3a0:52f9:9170 with SMTP id
 e9e14a558f8ab-3a0848e5d4emr91055095ab.1.1726347353235; 
 Sat, 14 Sep 2024 13:55:53 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec1f010sm570603173.64.2024.09.14.13.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 13:55:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 14:55:50 -0600
Message-Id: <20240914205550.1172984-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726347353; x=1726952153; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YS5yvRvk2FI/iUbwQ/n9dSnntjCjVPtFiY+o6xW5PYQ=;
 b=cyMGo1JbJmX0TOC92PWfl42RZk64aMCqrHaVJLK0Mc+Y03v2hM9Og94v4LSvqGnqWs
 JMZEs+84wZ7BBV8pTjYaBjHK82f6s44FLhG82xEs40qXnW1jqBBxHFZrx3Trig8P0kL2
 +8pLfqckvVtmqbnQMeqe4wxW60ayPo5itYK5pjzjc2s9XZoh+bMkxlQnew8iMRBezKpD
 oHv2ZDdMoX3fnLyXwB2fZKL1sc3prTAgH3apKF+1v05y0lQ/5HrpQkRPxNnAo6Ev6D6N
 LeHk3w/B6BAPXIc0zxvxI3BGUekxu9reSzii11RQaWBDG7IsSIuKz+afMau3JSZjOLAI
 HIWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cyMGo1Jb
Subject: [Buildroot] [PATCH 1/1] package/python-aiodns: bump to version 3.2.0
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
 package/python-aiodns/python-aiodns.hash | 4 ++--
 package/python-aiodns/python-aiodns.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiodns/python-aiodns.hash b/package/python-aiodns/python-aiodns.hash
index bf65691b89..3f4d911db7 100644
--- a/package/python-aiodns/python-aiodns.hash
+++ b/package/python-aiodns/python-aiodns.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiodns/json
-md5  13fdfc38f30c9498e3e23c6f372e40ba  aiodns-3.1.1.tar.gz
-sha256  1073eac48185f7a4150cad7f96a5192d6911f12b4fb894de80a088508c9b3a99  aiodns-3.1.1.tar.gz
+md5  0bfcd1b040912744badd2771a33a32fc  aiodns-3.2.0.tar.gz
+sha256  62869b23409349c21b072883ec8998316b234c9a9e36675756e8e317e8768f72  aiodns-3.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  eb0455d35129425ed399883cd710923de3e246a510e2eb84d9f00032d0bbec97  LICENSE
diff --git a/package/python-aiodns/python-aiodns.mk b/package/python-aiodns/python-aiodns.mk
index f5cbb65334..9c1bea601c 100644
--- a/package/python-aiodns/python-aiodns.mk
+++ b/package/python-aiodns/python-aiodns.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIODNS_VERSION = 3.1.1
+PYTHON_AIODNS_VERSION = 3.2.0
 PYTHON_AIODNS_SOURCE = aiodns-$(PYTHON_AIODNS_VERSION).tar.gz
-PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/fa/10/4de99e6e67703d8f6b10ea92a4d2a6c5b96a9c0708b75389a00203387925
+PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/e7/84/41a6a2765abc124563f5380e76b9b24118977729e25a84112f8dfb2b33dc
 PYTHON_AIODNS_SETUP_TYPE = setuptools
 PYTHON_AIODNS_LICENSE = MIT
 PYTHON_AIODNS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
