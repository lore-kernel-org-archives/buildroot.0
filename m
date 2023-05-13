Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3472FC77B7D
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 18:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAA0083EEE;
	Sat, 13 May 2023 18:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAA0083EEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y6N0dxPXR2YU; Sat, 13 May 2023 18:51:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E86C883ED0;
	Sat, 13 May 2023 18:51:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E86C883ED0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0ED341BF2C6
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 18:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC13E41799
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 18:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC13E41799
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ebHKrJ26VBo0 for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 18:51:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D34DD40A5B
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D34DD40A5B
 for <buildroot@buildroot.org>; Sat, 13 May 2023 18:51:00 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3078fa679a7so7723065f8f.3
 for <buildroot@buildroot.org>; Sat, 13 May 2023 11:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684003859; x=1686595859;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EN+3/WbSp36hyYLfT9mjwQB5zkdZb+RCf543AnUqiZ8=;
 b=fwx6pXSseB3etZ7Nh7nlJ/7fnPVIBm2PJq3z67nE/xHFI0NNQzPCZqIo5VXvc+unAf
 BKTWX0nwNPWJJb/4az0rgq38A5Dz6xOJOEesl5VdCRVE92PxaXTFUltnQpGeCRVmtNcV
 3LCzCBBUMDoZzsYG5aL0tk8hJR7QR14hzFuK1SifPbz61mV/OAmHmoKJyj9Sf29AIj8k
 xUBmcgUgJNpTF7pn/yN1uNMDfw3xKDMN3Kn9HN/SH9lnTtVrc4VEftWJWFda0oIPpjYH
 xm16a+B/3nOOMNuCE+c7L4cxY36AcIDeE1qERkgvx6LrGnAKMaKYEX7CjzlijUUKnDzT
 EVxA==
X-Gm-Message-State: AC+VfDzwwXqhIXh8yDFizXAlT/p7nIZExCDRR4gA86hMwUtQM9Lc7Umz
 htI4upHI1LZMfiLRsDuyD7FulCrPHfc=
X-Google-Smtp-Source: ACHHUZ6n1+hOJ9kRzEMZmSChRIvEKgzp4mLjCturiU8GPqVuRCZVl/alGDJD9ZVmqwZa3hQ99QOVOQ==
X-Received: by 2002:a5d:6a8e:0:b0:309:a4e:52f9 with SMTP id
 s14-20020a5d6a8e000000b003090a4e52f9mr2146146wru.35.1684003858754; 
 Sat, 13 May 2023 11:50:58 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 by smtp.gmail.com with ESMTPSA id
 a4-20020adffac4000000b00304ae802f02sm27151767wrs.66.2023.05.13.11.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 May 2023 11:50:58 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 20:50:57 +0200
Message-Id: <20230513185057.2733187-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684003859; x=1686595859;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=EN+3/WbSp36hyYLfT9mjwQB5zkdZb+RCf543AnUqiZ8=;
 b=j+yIgsky9qVWFUb789NJPv27LFmXT6UNT/XwogiwKfml7kpdcFf88N9RZwgdWC8nS7
 L8PfeT3fDjF9q3wnlhP4vOgau8RMvKYj+0/2NVXKAtxzh1aNdxVWbnYyniKYgmGSanLD
 0U+y4Crb4xbPUZtW/dtFetjfWWWksj3bIsInthLmbKi4TdpfwnyZFguUvJjW4FB820wC
 edAqUwZmCCZ0Y3MN6G7z6yz+jAHiRgT79mtVFcRh26l/s+FUfE+CIm/HxzGU2uh6xYp9
 hy4EGGdrCPwGEzfuJE+nU9R/wdMGHdG+T/leACVScCOo5q1euseaFR80kxph3edO82w2
 ef6Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=j+yIgsky
Subject: [Buildroot] [PATCH] package/tzdata: bump version to 2023c
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

tzdata and tzcode (for zic) are released in lock-step, as they go
together, so we update both simultaneously.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tzdata/tzdata.hash | 2 +-
 package/tzdata/tzdata.mk   | 2 +-
 package/zic/zic.hash       | 2 +-
 package/zic/zic.mk         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index aadd320063..3422655a71 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,4 +1,4 @@
 # From https://mm.icann.org/pipermail/tz-announce/2022-October/000075.html
-sha512  72d05d05be999075cdf57b896c0f4238b1b862d4d0ed92cc611736592a4ada14d47bd7f0fc8be39e7938a7f5940a903c8af41e87859482bcfab787d889d429f6  tzdata2022f.tar.gz
+sha512  608bd286ebcbd0004cfdc1da183273f08aff61f90c8867661154453d77a05d421e4c46ad6d066a1fe2e87d5c82ec0f1c0224667a3b35f3180a3eb7f6ff84cbf5  tzdata2023c.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 45bd7cf6e6..08f3c83bd1 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2022f
+TZDATA_VERSION = 2023c
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 40f68f0299..6a7f9f2f94 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,4 +1,4 @@
 # From https://mm.icann.org/pipermail/tz-announce/2022-October/000075.html
-sha512  3e2ef91b972f1872e3e8da9eae9d1c4638bfdb32600f164484edd7147be45a116db80443cd5ae61b5c34f8b841e4362f4beefd957633f6cc9b7def543ed6752b  tzcode2022f.tar.gz
+sha512  fa18bae9c0e7c061bc9d5f5f2eb9967f0e4ddb2baafdee9887fa30cd0c60f4aa6f21eacffb17df0d59d26ff54d08c5dcefa98159309eba497e86443624913a82  tzcode2023c.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 229afaadc2..a915f6d256 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2022f
+ZIC_VERSION = 2023c
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = https://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
