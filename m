Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32137C4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Nov 2023 02:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 702D783A9B;
	Sat, 11 Nov 2023 02:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 702D783A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tE2d2g5MCqQT; Sat, 11 Nov 2023 02:14:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B55CE83A94;
	Sat, 11 Nov 2023 02:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B55CE83A94
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9257C1BF846
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 02:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B4B342475
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 02:14:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B4B342475
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3IsrKc6ABYdO for <buildroot@lists.busybox.net>;
 Sat, 11 Nov 2023 02:14:32 +0000 (UTC)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86BEE42226
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 02:14:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86BEE42226
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7a694a365d9so105323139f.0
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 18:14:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699668871; x=1700273671;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7fgUv3xJuWessHhMosOvT+SPmZGBZfLO9bScRTHHbYQ=;
 b=DDdTgftZGkXys2in88vFcTv/uMcLCSq7l4o2gXZiBOrUbxEoaO204Zz32fbWlyNGMY
 KDnll3cxcAkvLApaI+pKQPFDxa0zInD/a95pd5P6P8GmrilNgW1jpYGuqVSZr/rfdoC8
 D8d90lVRe8tCHmOYJ7j1tBSkAc8NxIlmlWiuvnJcCyKYDcb4og/6qqg9G9l+CnmArqjr
 ZrSwWHl4juIoYHrC32O8o4CCcVHrA/f3xQLsmHCnVPjrvOGxXs1aAZhpd+WSPK7ahzxD
 e+7N2wNxh8cxDzYuZ4Ckh+1wa4BW1OLjVsqk4SXEUkKWBMuC+Bjze/q1odTMSpS2v5bs
 cYag==
X-Gm-Message-State: AOJu0YxR6X2/dAYYkFn485Yg+FpWmhUoufK3s26lgbD/UZOSvP43AhX4
 Sbu3tUoM8wsVKj7OjUqAf6lgf34X+yM=
X-Google-Smtp-Source: AGHT+IFQsabaH3MovA6UHTQGqiMolyQQZpGrv3WnQax8amSMnf0JDZZB4XPDAznsfgjdic/fXTRZUA==
X-Received: by 2002:a05:6e02:1a6c:b0:359:3e84:f79 with SMTP id
 w12-20020a056e021a6c00b003593e840f79mr1355720ilv.3.1699668870891; 
 Fri, 10 Nov 2023 18:14:30 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 p5-20020a056e02104500b00359695ec5aesm161893ilj.62.2023.11.10.18.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 18:14:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 19:14:28 -0700
Message-Id: <20231111021428.91649-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699668871; x=1700273671; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7fgUv3xJuWessHhMosOvT+SPmZGBZfLO9bScRTHHbYQ=;
 b=bsL76zmD2nau0SicDbWfTGiepFJMNVuSQa3BAZbf/XO1q5vo2C8uyhfWFq8+LvjSkH
 PIiz7O9jDbv9M4M+2S2JaBGAoDYnwQR5cNrrjQsSQwY8QY65xfD9rxouuI3PPpmWqjwL
 BggG8qMffjKdvXsVx7E/HlIyU6PkpkovLvDi24aOGWgoKGl0h2B0uwowStLi2oy3yfrD
 QzTleQQe4D7eAZyj4nZyHCRUawvKFDrU83IuonL9bgyrdDU9/5YLsun5L2jw/D5Embs7
 lRgSETcVrHMYaP2yx+oeYf2+5G1VhqYHJBxqhsOu5PBbdwrDf4VB+LdfE1GNP8kA7tCz
 Zygw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bsL76zmD
Subject: [Buildroot] [PATCH 1/1] package/python-logbook: bump to version
 1.7.0.post0
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
 package/python-logbook/python-logbook.hash | 4 ++--
 package/python-logbook/python-logbook.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-logbook/python-logbook.hash b/package/python-logbook/python-logbook.hash
index d77acad76e..8761945de6 100644
--- a/package/python-logbook/python-logbook.hash
+++ b/package/python-logbook/python-logbook.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/logbook/json
-md5  719970ea22dd274797bb4328161d700f  Logbook-1.5.3.tar.gz
-sha256  66f454ada0f56eae43066f604a222b09893f98c1adc18df169710761b8f32fe8  Logbook-1.5.3.tar.gz
+md5  cbb7e5fb2d6325f42a323b0000127393  Logbook-1.7.0.post0.tar.gz
+sha256  a5e8016701ca3beea6a390b0ba1541037f663543ca508ccd36cfdc841639cdd7  Logbook-1.7.0.post0.tar.gz
 # Locally computed sha256 checksums
 sha256  2ca266337cc6947578654ab0dd6438de4d01fa78b2e6eb554b09757df1178f98  LICENSE
diff --git a/package/python-logbook/python-logbook.mk b/package/python-logbook/python-logbook.mk
index 8f02e9b945..e47e78d26e 100644
--- a/package/python-logbook/python-logbook.mk
+++ b/package/python-logbook/python-logbook.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_LOGBOOK_VERSION = 1.5.3
+PYTHON_LOGBOOK_VERSION = 1.7.0.post0
 PYTHON_LOGBOOK_SOURCE = Logbook-$(PYTHON_LOGBOOK_VERSION).tar.gz
-PYTHON_LOGBOOK_SITE = https://files.pythonhosted.org/packages/2f/d9/16ac346f7c0102835814cc9e5b684aaadea101560bb932a2403bd26b2320
+PYTHON_LOGBOOK_SITE = https://files.pythonhosted.org/packages/cc/98/c1d93c1d7593f58515333a6217aa4ae647d9ee9c1aa2dfdf77b28b7bb7c7
 PYTHON_LOGBOOK_SETUP_TYPE = setuptools
 PYTHON_LOGBOOK_LICENSE = BSD-3-Clause
 PYTHON_LOGBOOK_LICENSE_FILES = LICENSE
+PYTHON_LOGBOOK_DEPENDENCIES = host-python-cython
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
