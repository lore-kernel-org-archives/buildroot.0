Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1F7EE3F39
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 22:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0284D41B87;
	Tue, 12 Sep 2023 22:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0284D41B87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CmU7lucfe_Ol; Tue, 12 Sep 2023 22:16:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 992DB41B88;
	Tue, 12 Sep 2023 22:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 992DB41B88
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 77C501BF831
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 22:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7235F60D88
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 22:15:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7235F60D88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MEN55oj8IQDK for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 22:15:56 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D211160B1F
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 22:15:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D211160B1F
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-31f8a05aa24so3974815f8f.1
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 15:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694556954; x=1695161754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8DyA2k+L1u+3itJnuW2A036/x9Wes9KpxQARRDd1IaY=;
 b=hU1gKT45IhQwas0B/9MTsKa8bm1A+YZqDeuadRwNiPmnrv/Tjahu30LzjqTON4EP+o
 TYv7l07xCYnV8Rlbg8z+SzEH6I1JHgBsE08vcuVZsvTXW93cEdQpg3TstO53xFo/XsS/
 3vPk8uGGRaMCZ7TQ/ZgvIySYNOfcWCHx9DSbvaS0L51lUKNOUJwffEZp5BDHrZYhW23m
 xJwyFdcby7muAxUB//IDZEWqeduz40mVnhf8xMFP6sjjc6OcxKfBY+dcat/2Z8AbbqUs
 7G4CNd4JVjdRdn+A/UsBo8ejURCrBkAmMAbBcNgdJIThSZDPbdaN0rdSU3KfetfgmCRJ
 7bOw==
X-Gm-Message-State: AOJu0YxvgZd4DlzFsORrAyCz4wufarBmkYVhB/Edt+m3/jX9PXyWbrek
 4ZSW5fIipGEOi8uzgj+mU6GZok9xpAc=
X-Google-Smtp-Source: AGHT+IHI8s5pVqRRUizObpdGoUmuwO6vhDTNE+XvFQY4LjA3SZ/n3cjZ6HfUP4yQKfNBA/g6ZCaNAw==
X-Received: by 2002:adf:f08c:0:b0:31d:c3d2:4300 with SMTP id
 n12-20020adff08c000000b0031dc3d24300mr522037wro.71.1694556953513; 
 Tue, 12 Sep 2023 15:15:53 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:d377:8b3f:c881:5464])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a5d67c7000000b0031423a8f4f7sm13901170wrw.56.2023.09.12.15.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 15:15:53 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 00:15:48 +0200
Message-Id: <a55c91fd6ba2fdefaf885d631c6a74eb69fb81a1.1694556946.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1694556946.git.yann.morin.1998@free.fr>
References: <cover.1694556946.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694556954; x=1695161754; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8DyA2k+L1u+3itJnuW2A036/x9Wes9KpxQARRDd1IaY=;
 b=s3JuSZDykLfzBEq0nXp2awssLM7af0MJl08f6c1Km6Ty1PUk2VkxFMooNaYL6fXHG1
 617UkGtpkmyxF0asxglj88ReTt2QmVbYPm2XHxPuXmSvTfbBL4Hu+Au2ARxMiKiL1xXz
 0Eq0afK3Su++9vOAsm0Up9UdbUGA94cU1BoSUlNqYp9SESsauzMCi6hETqcDfpkaphwZ
 86sDbcQLspfwOSC4RV/R6GgdsUuRA7Qxp8cAAQ3UKsv6zS7GxAEeeKE7aI4H4p6yaWmA
 2cpFjoSaZvRNzISC6N74cZyXG+hXLU7It7XCyrVCr7u/QlseJMhc4zlykU7fXD6aqNmt
 Vm1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=s3JuSZDy
Subject: [Buildroot] [PATCH 1/5] package/qt5: fix upstream git trees
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commits 4e8b5f9bee9c [0], 6cfbd51d98d1 [1], and d838a416c4ed [2],
the repository we clone from is the cgit browser, and it does not serve
the git tree, only the browser:

    $ git clone https://code.qt.io/cgit/qt/qtcoap.git
    Cloning into 'qtcoap'...
    fatal: repository 'https://code.qt.io/cgit/qt/qtcoap.git/' not found

Browsing there displays the cgit UI, which gives a proper URI to clone
from; switch to using that.

[0] 4e8b5f9bee9c package/qt5/qt5mqtt: bump version to 5.15.2 (and fix download)
[1] 6cfbd51d98d1 package/qt5/qt5coap: bump version to 5.15.2 (and fix download)
[2] d838a416c4ed package/qt5/qt5knx: bump version to 5.15.2 (and fix download)

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
CC: Julien Corjon <corjon.j@ecagroup.com>
---
 package/qt5/qt5coap/qt5coap.mk | 2 +-
 package/qt5/qt5knx/qt5knx.mk   | 2 +-
 package/qt5/qt5mqtt/qt5mqtt.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5coap/qt5coap.mk b/package/qt5/qt5coap/qt5coap.mk
index a50f19d7f2..5feb1e5bc2 100644
--- a/package/qt5/qt5coap/qt5coap.mk
+++ b/package/qt5/qt5coap/qt5coap.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QT5COAP_VERSION = 5.15.2
-QT5COAP_SITE = https://code.qt.io/cgit/qt/qtcoap.git
+QT5COAP_SITE = https://code.qt.io/qt/qtcoap.git
 QT5COAP_SITE_METHOD = git
 QT5COAP_INSTALL_STAGING = YES
 QT5COAP_LICENSE = GPL-3.0, GFDL-1.3
diff --git a/package/qt5/qt5knx/qt5knx.mk b/package/qt5/qt5knx/qt5knx.mk
index 412e31c652..91b99aaa87 100644
--- a/package/qt5/qt5knx/qt5knx.mk
+++ b/package/qt5/qt5knx/qt5knx.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QT5KNX_VERSION = 5.15.2
-QT5KNX_SITE = https://code.qt.io/cgit/qt/qtknx.git
+QT5KNX_SITE = https://code.qt.io/qt/qtknx.git
 QT5KNX_SITE_METHOD = git
 QT5KNX_INSTALL_STAGING = YES
 QT5KNX_LICENSE = GPL-3.0 with exception
diff --git a/package/qt5/qt5mqtt/qt5mqtt.mk b/package/qt5/qt5mqtt/qt5mqtt.mk
index 0b62cf1bed..824d58d1d1 100644
--- a/package/qt5/qt5mqtt/qt5mqtt.mk
+++ b/package/qt5/qt5mqtt/qt5mqtt.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QT5MQTT_VERSION = 5.15.2
-QT5MQTT_SITE = https://code.qt.io/cgit/qt/qtmqtt.git
+QT5MQTT_SITE = https://code.qt.io/qt/qtmqtt.git
 QT5MQTT_SITE_METHOD = git
 QT5MQTT_INSTALL_STAGING = YES
 QT5MQTT_LICENSE = GPL-3.0 with exception
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
