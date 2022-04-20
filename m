Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EBAC433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 07:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3A3C410D5;
	Wed, 20 Apr 2022 07:26:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5jlH9GqcuhZ3; Wed, 20 Apr 2022 07:26:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A33F410C8;
	Wed, 20 Apr 2022 07:26:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C3D21BF38A
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 07:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AF4A840CE
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 07:26:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gyXdunJInKuy for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 07:26:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 320F782ADD
 for <buildroot@busybox.net>; Wed, 20 Apr 2022 07:26:21 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id q20so582016wmq.1
 for <buildroot@busybox.net>; Wed, 20 Apr 2022 00:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w4kftYxMshUXFoqjJqXZTokdLjKhynL93OjiF4UsCrs=;
 b=IIKdsn+9DiurfgaoOnKotLJSJlBFZrfEuCZUkIErHyoNJhATBwXMREVJ41S/Y80RsR
 edEvM+r+RS3hwXrJlCxZW9L5Yeif51MQAWeCmb2GVZRwoObo+6RjQWenOvSdxr2KDSrJ
 uc9ykWmZc+PnbeMOX4Q2LoTTr2r6JSDaqcYp/U+8hzqJduTKf45AOwrrIwTNLSJW5m0H
 tRoO5RNJPMBGesor7gGeoNy2unbke7neaBMIU95Nccjyyz3CXMjbW06UftHPHl7y9vxo
 LvZNQ+RlgwlDc/ciApahBTuJd/YrlkwT7YJiHSLArO2cM4S7WN53q6NLq6jNg62smDAz
 YC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w4kftYxMshUXFoqjJqXZTokdLjKhynL93OjiF4UsCrs=;
 b=Gbz9c5fkjFFSomUAZNYEAdSrN62pk54942WQncK216i4UwaAFr9tVpuyiG/eiXdGB2
 6TQCGm82jbAF45Ua12MPLmU7u9fcJDgyaFh7505DQ45sl6PXlW6/HO3ORQt5WXg7nAn+
 N1zcsi9oE7WrTEGxStOUsLvRa/xJ2O6i0w9BKRPpWgGFFIkXdFOuiEjLow535B/nfGT2
 L7+Em9NyH6MaJ5f1AWfZ8IMPJR0JIbUH5LjwB6FBQjo/E9si5g6YRjCe9JETmumGdayP
 tJBwbULraRUh2vSrZwlaO/H6Q7gmkw+5BhD9grIj8qaumnsH92fFuHL6AkUx4i44uJg6
 phxA==
X-Gm-Message-State: AOAM533fiPg/Lyx5iGF73S0M5BTj9iMvaL1xpExjl6wVAzN/Y8WUcyaX
 W11aoUyso53eAofpXypqQES5mXKpVFA=
X-Google-Smtp-Source: ABdhPJwhs8gasIcBk2XspE8z7x/RXD8kPNgbeOFiOu9tWfvYUw2FTqPdx1Ku7AzInwI84LhqrVaCxg==
X-Received: by 2002:a05:600c:3ca4:b0:38e:54d0:406d with SMTP id
 bg36-20020a05600c3ca400b0038e54d0406dmr2176545wmb.199.1650439579443; 
 Wed, 20 Apr 2022 00:26:19 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 l28-20020a05600c1d1c00b0038ece66f1b0sm18724045wms.8.2022.04.20.00.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 00:26:19 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 20 Apr 2022 09:26:09 +0200
Message-Id: <20220420072609.3422227-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libarchive: bump to version 3.6.1
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libarchive/libarchive.hash | 2 +-
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index 5dd8e5c16..ca580b497 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,4 +1,4 @@
 # From https://www.libarchive.de/downloads/sha256sums
-sha256  5cac725dd4be31c4a10b65d30f29dc957ea29ef3d758df6e46e8ae90a996a19a  libarchive-3.5.3.tar.xz
+sha256  5a411aceb978f43e626f0c2d1812ddd8807b645ed892453acabd532376c148e6  libarchive-3.6.1.tar.xz
 # Locally computed:
 sha256  b2cdf763345de2de34cebf54394df3c61a105c3b71288603c251f2fa638200ba  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index cf16c27e6..865f605e2 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.5.3
+LIBARCHIVE_VERSION = 3.6.1
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
