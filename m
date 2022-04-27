Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F233C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 07:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF86C60F00;
	Wed, 27 Apr 2022 07:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pVAxDhIF5bp6; Wed, 27 Apr 2022 07:43:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 904BA60DC2;
	Wed, 27 Apr 2022 07:43:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0022E1BF48C
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 07:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F179083E48
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 07:43:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jYqqg3HpzMr1 for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 07:43:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09069833CD
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 07:43:23 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id r12so1909959iod.6
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 00:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5uk3jPf3ux+vjEJkX20cnUzRUKu54hjWX0WqSzIPhGM=;
 b=Ddbx4PqlMAFY63GDeXPnCYClbXuouMM/B1RYsZRQ0tf4groLESY/hHP2p1kMSMbubS
 cBtHq3Tyzmhv9m6zvSrM2xSOr24biOBMrXmBHZCiqmu1wSLYr8r3a6nXcfcbb8hcvenv
 VjIZAe4PVxZoV3oeDg9pK0ee25RWqxmwJsMltGCPxcHy1N4OXermpvxGoEsdERzbfM5U
 uMC6cBGOxybx2vN68dX5e9GCSm3BdbFV2LE7XWbLAgNeaD6mWRAG/7TBc3iBAggsxbZL
 VuHamGH44uTiSkfhonTYlR1ZJEXa4Edw3BE1UUl4Arkm8wEJA5l8y1B+4YD9NvGA0w9c
 EHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5uk3jPf3ux+vjEJkX20cnUzRUKu54hjWX0WqSzIPhGM=;
 b=PbOB/lqJFfRB9yu099AMgb9Ms+lHdvZAjLkwdzzaqxpcMHP0bqTo37y3W0f4XHuAjd
 hR1Wzldn2UEX9aK2tZOMvlxxKVlGywsV1IqmbdK22qCw831NzXd/iv+V/03/W9QP0W9Q
 pOiI1+vAtfLXq6wHKPaEV7CkclZeWFh4XgIcdzkXxwDdbm1tp6h7F4/yzHps4b6JlP1m
 JxhaoQSHlPdIE/JW1rZIES/SXSDnkRs1iRWHXBz5S4aM/MrQCe9b6SaXeZ+xKeWQMAMs
 hUk5VkqxaQVuLi+zDvGUhbCjbzIQTDR4yW0rTTzw4SLBKmdddifOZibp+F5bfwlmxz4/
 GUpA==
X-Gm-Message-State: AOAM532DNGl/ro9MltTtJAk6gqBWLqdpq+HOfwIU2mVPv2OLilIojwlf
 bSjD3VAP4FUGuiYbLhNLvNRJ7Qs8Nkw=
X-Google-Smtp-Source: ABdhPJzCXXdNJWYfhC9hZvueKmroudFNvTontHQlUbVMCeZl1YiWNa+WchsjbOXNs1ATYuey5hN5+A==
X-Received: by 2002:a02:970c:0:b0:326:f9ba:e6b1 with SMTP id
 x12-20020a02970c000000b00326f9bae6b1mr10767790jai.25.1651045403075; 
 Wed, 27 Apr 2022 00:43:23 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 x9-20020a6bda09000000b006545a38b1acsm10639875iob.47.2022.04.27.00.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 00:43:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 01:43:21 -0600
Message-Id: <20220427074321.37979-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nodejs: add missing host-pkgconf
 dependency
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
 Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
 - http://autobuild.buildroot.net/results/d1f/d1f49b451b56e3cf6a97d27e8db5b85b0cb58ca9

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/nodejs/nodejs.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 2e41c11dbd..4fe34e0aad 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -7,10 +7,11 @@
 NODEJS_VERSION = 14.18.3
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
-NODEJS_DEPENDENCIES = host-qemu host-python3 host-nodejs c-ares \
+NODEJS_DEPENDENCIES = host-qemu host-pkgconf host-python3 host-nodejs c-ares \
 	libuv zlib nghttp2 \
 	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
-HOST_NODEJS_DEPENDENCIES = host-icu host-libopenssl host-python3 host-zlib
+HOST_NODEJS_DEPENDENCIES = host-icu host-libopenssl host-pkgconf host-python3 \
+	host-zlib
 NODEJS_INSTALL_STAGING = YES
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
 NODEJS_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
