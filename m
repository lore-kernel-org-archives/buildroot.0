Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF2BC77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 09:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7452B42037;
	Sat,  6 May 2023 09:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7452B42037
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0NHi-eF_BudR; Sat,  6 May 2023 09:11:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23C8A41E80;
	Sat,  6 May 2023 09:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23C8A41E80
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7626C1BF373
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 09:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CEFC41E80
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 09:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CEFC41E80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E48Nj_ifoitj for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 09:11:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F231741E7E
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F231741E7E
 for <buildroot@buildroot.org>; Sat,  6 May 2023 09:11:37 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4efe8991b8aso3090339e87.0
 for <buildroot@buildroot.org>; Sat, 06 May 2023 02:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683364295; x=1685956295;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F5LwCF6YSOVnONiwqzfeHu0XkLFjBSTN2It14k5OAe4=;
 b=WqWw3uA/8vADhmn67LMsTjRmzKAtIeZ2MQPPMMBj5VLt5sR+9agacvwpCWVIx9wjgg
 SsuOKJPx6evZtbAMiQf1h5i8gLFoCsEYghx+G1/ebFe7rjm48Cyhu6oQKX5tGo9H62XP
 qu3GD/tLxerQmZKKjfqXmjBmIM/0bbGWZ0z/pwHu55safYm7aY6zkufaR9RxhqbdAPCw
 jWdCdpvhrqAK577ynGKfXbtsDQXz3nfjIFov8s7ht7ChE7RduMmL3p4IxQA6UDGHQ4sW
 4TYsmBi0cYmbRKLxFmvF8X4dWu8/2t8vEuwtNqV+kfPgyVc8GwPxLGONvU80TkRfuaPg
 8o7A==
X-Gm-Message-State: AC+VfDxAmB/W/s0Oce+vlnHiaaDDLMN6sWICFIy8rKFQ8awySx+tKMCf
 +6HICGKoNrlQBdfI6zQG1FPft/NYEV4KQDaa7GQ=
X-Google-Smtp-Source: ACHHUZ6kG1b7GABAdcZJIWTJiASjVkKLHvgDoRST9U4U8ffocoLRFLD+hXrAdmut+5L6OgpH9rG9tw==
X-Received: by 2002:ac2:5293:0:b0:4f1:408f:4fa6 with SMTP id
 q19-20020ac25293000000b004f1408f4fa6mr1254484lfm.49.1683364295478; 
 Sat, 06 May 2023 02:11:35 -0700 (PDT)
Received: from hp15.promwad.com
 (mm-48-15-214-37.mogilev.dynamic.pppoe.byfly.by. [37.214.15.48])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a056512095100b004e83fbba141sm587470lft.164.2023.05.06.02.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 02:11:35 -0700 (PDT)
From: Uladzimir Bely <wiselord1983@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 May 2023 12:11:27 +0300
Message-Id: <20230506091127.9192-1-wiselord1983@gmail.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683364295; x=1685956295;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F5LwCF6YSOVnONiwqzfeHu0XkLFjBSTN2It14k5OAe4=;
 b=dcW6SWmJUZodK16q46E84It5ahW1CzWM2RdhtQVJqwsHAGnGglGoHeJfaGWU+kxyfa
 TtVk6NkrxWa7SgU01v6Hd9a/wWAi/Ko7H6eZQcL+kKvUAPWjgn7x1h0NBL1VA9EtiS+3
 sAGU47DTzu+WIkAc+bjsShP/aZ9xs5D20A9xul1515ZKP9xbUvHNnGEOOW7MSvifnW+V
 zH38WCXwszJ9sm0l0mjrRfEX0ktQc++hErElaXOdtyuRvEdq1RqshCQNBkhcs3t3w0uT
 0KqbfTaCaJPT0sm1t0+GrR0959wiGtLKbhbr8e6WLiSN2pg1JuWbt9gz2LNjuE9aRiQW
 6Qvg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=dcW6SWmJ
Subject: [Buildroot] [PATCH 1/1] package/python-mpd2: bump to version 3.1.0
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
Cc: Uladzimir Bely <wiselord1983@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Uladzimir Bely <wiselord1983@gmail.com>
---
 package/python-mpd2/python-mpd2.hash | 4 ++--
 package/python-mpd2/python-mpd2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mpd2/python-mpd2.hash b/package/python-mpd2/python-mpd2.hash
index 88dcb28377..cfe5a7c0c0 100644
--- a/package/python-mpd2/python-mpd2.hash
+++ b/package/python-mpd2/python-mpd2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-mpd2/json
-md5  594dff3e53c8eb6f583ba642bc2c1a27  python-mpd2-3.0.5.tar.gz
-sha256  6f1bffd93b9a32fc018a9bbf3487505b52e0d757ec34066905c60a912d492384  python-mpd2-3.0.5.tar.gz
+md5  f083c107b28525bb4c2580140861d86e  python-mpd2-3.1.0.tar.gz
+sha256  f33c2cdb0d6baa74a36724f38c1c4a099a7ce2c8ec4a2bb7192150a5855df476  python-mpd2-3.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
diff --git a/package/python-mpd2/python-mpd2.mk b/package/python-mpd2/python-mpd2.mk
index bfe382b59e..124ff57db0 100644
--- a/package/python-mpd2/python-mpd2.mk
+++ b/package/python-mpd2/python-mpd2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_MPD2_VERSION = 3.0.5
-PYTHON_MPD2_SITE = https://files.pythonhosted.org/packages/ed/c2/263621bdbbc37fa1a55fa1a7f66fd601bf08b3f87481e318a3509fb6c4bf
+PYTHON_MPD2_VERSION = 3.1.0
+PYTHON_MPD2_SITE = https://files.pythonhosted.org/packages/59/32/e57725251ce3117d2ed2a7b76d9722ea9bea26f54b2cc8981d03350e4103
 PYTHON_MPD2_SETUP_TYPE = setuptools
 PYTHON_MPD2_LICENSE = LGPL-3.0+
 PYTHON_MPD2_LICENSE_FILES = LICENSE.txt
-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
