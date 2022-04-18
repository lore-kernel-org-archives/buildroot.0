Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB398C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Apr 2022 16:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E3D741581;
	Mon, 18 Apr 2022 16:21:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Knr1TUL1WIUL; Mon, 18 Apr 2022 16:21:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 560BF4152D;
	Mon, 18 Apr 2022 16:21:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BAFB51BF355
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 16:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6F6083E2B
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 16:20:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fSkuGmfMZj7A for <buildroot@lists.busybox.net>;
 Mon, 18 Apr 2022 16:20:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19B6B83E10
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 16:20:58 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id x18so11263593wrc.0
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 09:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M7colr6cGyJrOrYI/0ugrzRpQKTSA0CDDcBeRZmu9Z4=;
 b=LD0IaFQYqJe1lLE7Ou+ODbWa2Gkfg/zuoViYUsViR2y1sAjg5IzK1k2BVNuffrsI3K
 TWFwX1n8jIEWhyi04zE9H1fAMueZPpPv50oPsm78YeEkFiemHz69vdVjjov5ovYr7pG6
 s4O7BZgXS4WkzQ3hH3XdDSMU7IiRTDghdo7mqDbhBRweFyLVEQqsVRsDhcK/eZt+dddj
 lD8xejJHeBTVeR7z8brIyH8fGx/wYsqrcljByMT2FWHj6+njlzbUZfL2tyNDRtBAwYUf
 Z2wfH1ZPZTJurfDz4jXMOCmUWMd+kJzgBqqRldc0tTCVKTPPY64vks3GqWeaStkYDhNZ
 +/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M7colr6cGyJrOrYI/0ugrzRpQKTSA0CDDcBeRZmu9Z4=;
 b=nTHGWc0wtIs0qRpzlV+7xnY5aQT5o/LGtmd44Irh/YK/yl0T+bdjPza5fMZP1GMm6k
 QNhgVUs93C0KyTAdss+wnTuzrVxB39XtK5L0JXAxx1q1TknApdaC5C/8yCEvknt/eY5Z
 3QhatSi73lFjiiWKOcTje9IUjYkKBmKUjHQjCgFJgqxtSk2LRhqRQu4V0weU9ZhaNQ41
 +Mbulu/UVYhSWhNXyJTsTI/ux8u1L9FFfIFh4VauOJ9kWHT8q1KaMI1Lu/JERgsjpNnO
 iRmZcI/3JYrh4DG4Vz1FlIB58yIORd/8D1ZMMi71HDpYz0ySDCTdFZcnusMDyUpaZ8db
 lpTg==
X-Gm-Message-State: AOAM531pNXP0twQ5ZPuVTVEQwt6okGXnjdgU9JT6mAm2Sz7VVqPZxqCg
 ahg7cO37XMhqK4GKinBO4jxkJ8djmog=
X-Google-Smtp-Source: ABdhPJyfCJa9YTntDaFhM/DE8rCb+oOSDbRhhgm1GGep+FYtaATkMy2iruDTvsNfoBIR8XJKCKQAyw==
X-Received: by 2002:a05:6000:508:b0:1e4:a027:d147 with SMTP id
 a8-20020a056000050800b001e4a027d147mr8817341wrf.315.1650298857204; 
 Mon, 18 Apr 2022 09:20:57 -0700 (PDT)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a05600c4e4100b00392910b276esm5635282wmq.9.2022.04.18.09.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 09:20:56 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Apr 2022 18:20:45 +0200
Message-Id: <20220418162045.3408-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/coreutils: bump version to 9.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Tested:

                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK


 package/coreutils/coreutils.hash | 2 +-
 package/coreutils/coreutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
index 758a6341a3..9f3434e58f 100644
--- a/package/coreutils/coreutils.hash
+++ b/package/coreutils/coreutils.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256 ce30acdf4a41bc5bb30dd955e9eaa75fa216b4e3deb08889ed32433c7b3b97ce  coreutils-9.0.tar.xz
+sha256 61a1f410d78ba7e7f37a5a4f50e6d1320aca33375484a3255eddf17a38580423  coreutils-9.1.tar.xz
 # Locally computed
 sha256 3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 438b7910eb..931859b0ac 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 9.0
+COREUTILS_VERSION = 9.1
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
