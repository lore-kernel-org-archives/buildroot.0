Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6621BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 08:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5DF5827A1;
	Mon, 24 Jan 2022 08:00:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YNqs5rpZvVba; Mon, 24 Jan 2022 08:00:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B1B28195D;
	Mon, 24 Jan 2022 08:00:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC46F1BF356
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 08:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B1FE8195D
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 08:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O-U0DAcsDFXD for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 08:00:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3CA68144B
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 08:00:16 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id p125so14672328pga.2
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 00:00:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O73p3U/FxE0+EzqMDQRBGikswO4Els3hmwxFOBjNLFM=;
 b=bL9IocH4DBr/bmkTOWCtlp5tuqEQ7996sTfpL+vHGMZiO1DO9MVGjwb6NOLfYPt58c
 +QTIi0c7wfXNn2u1qEiEn/NXEV/pj7KWBcMrKO/DwzBJpICuWAjlw4Ydm9nJWl7Mzg5v
 X30yLH1FE3JNGOgQXf8lQWQ9WWheHEME3YxTzohailmbzm2GkMQ8X7ib/KN3iYt4d48E
 NL98yFqzio4rfsZqaoiaYs6oKIeudAs+ckv3yuF2RnyhAcHAJk42VfXZ8/cU4f0HSZgu
 CdxEDXm8+/77bB9DsN3i+4UlzazO1w6V/sen8VnsryQSekqNjleywKBRj+ZmpcGEcbCr
 apUw==
X-Gm-Message-State: AOAM532BmmvdKD7tjknac1DreA9tJMyZsoyHAuQFzpzdCIWFyQzlScco
 ki9OZFpbtX+9hFA6f7Fse6BG//ss735gWw==
X-Google-Smtp-Source: ABdhPJyZKZ7EoMQVHf5T5uPD0LE7zYMekD2RBCvbJFz5zkIOem782W9P7HiHSj/wyFJCphYO7EIbSQ==
X-Received: by 2002:a05:6a00:a92:b0:4c5:90cb:71e4 with SMTP id
 b18-20020a056a000a9200b004c590cb71e4mr12836537pfl.1.1643011216216; 
 Mon, 24 Jan 2022 00:00:16 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 k16sm8813148pfu.140.2022.01.24.00.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 00:00:15 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 00:00:13 -0800
Message-Id: <20220124080013.83231-1-christian@paral.in>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/runc: bump to version 1.1.0
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added LGPL-2.1 license specifier: libseccomp is statically-linked.

https://github.com/opencontainers/runc/releases/tag/v1.1.0

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 4ef04132bf..38d9f52510 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0eaf2f6606d72f166a5e7138a8a8d4d8f85d84e43448c08c66a1c93ead17a574  runc-1.0.3.tar.gz
+sha256  a8de57edbf0ff741ea798ccdd99ac0e1b79914f552871bd7cd92b0569f200964  runc-1.1.0.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index c4e45a00a9..a40075544e 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.0.3
+RUNC_VERSION = 1.1.0
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
-RUNC_LICENSE = Apache-2.0
+RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 RUNC_LICENSE_FILES = LICENSE
 RUNC_CPE_ID_VENDOR = linuxfoundation
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
