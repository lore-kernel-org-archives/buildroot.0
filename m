Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBBFCD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 17:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE3B481C6F;
	Sun,  7 Apr 2024 17:09:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3sHzLmeFq7SC; Sun,  7 Apr 2024 17:09:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAB0B81D5F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAB0B81D5F;
	Sun,  7 Apr 2024 17:09:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0905C1BF2BE
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 17:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9D8D81C6F
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 17:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2RKKFuB8w6YS for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 17:09:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CE63D81E02
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE63D81E02
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE63D81E02
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 17:09:40 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4166d6dab3dso1476955e9.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 10:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712509778; x=1713114578;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WbC/j5awKcn0sQtrHdMtbQBHUKXShZy63TldwIPEos8=;
 b=TgIxwOmCx3xSPRrBUHlm3c4/9u8LpawpEaC4/qmwH5M+SIhdnzi/f0jyv9gtRxNdXd
 j970peB7VpGn5kE8N4rIJjPdC6VVlovIbq4JGIlLj0BNl579qTJmREH2iZ9ScUiyf44O
 2S6EgjVrFKoIIK/HCnWqm1yRGkPFM2SmYpbF+PBDpDe/gHvJPO5fquvSvrWdFFR6qNyP
 2ze8DC912bpKFFeCEdG0DH3YYyUlG5j5LG+lmVOlGSCf6H9HsJJ+oYX+68M25pCURCLF
 NZvyGAlz8A5G6il06ggmfG0EMLIyYQrE89/KE/KZPlgXFng9eBvr2rJJodEmmxTYTP6W
 tOVw==
X-Gm-Message-State: AOJu0YyyLnsePxZA1bVPigFEolnwYd1QUXT8p+FP8/I+V53ZbvCAAJeZ
 y8+SnDApVZCeqdq18tWXknNCVWd2vvYazsGR7IkU/wvyDJpUmh6OE5blWQ5i
X-Google-Smtp-Source: AGHT+IHtULo+YP5QFr5ChnMXq9VGhmHQWNg73hT3hf87jsm/xEQMwbDyY0h4bTQOiuNLadtpEixLcA==
X-Received: by 2002:a05:600c:1e1c:b0:416:6bd7:cd88 with SMTP id
 ay28-20020a05600c1e1c00b004166bd7cd88mr475552wmb.8.1712509778484; 
 Sun, 07 Apr 2024 10:09:38 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c500700b0041656610e05sm3008615wmr.35.2024.04.07.10.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 10:09:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 19:09:36 +0200
Message-ID: <20240407170936.2788174-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712509778; x=1713114578; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WbC/j5awKcn0sQtrHdMtbQBHUKXShZy63TldwIPEos8=;
 b=amzdn1dgQVNi6M8++4LtAW5DztQN2pZLaIrPIg5nzo/T934y2akIrwKq2OJsFDoz4d
 j8BikTh3UgyG/0AHifRBL8NLqVty5Skp2yUd6Q640o+Ieh0UujWcg5Q51s/gkSC3K909
 vXCPjdrFdWX3F0P6fzi1lhUNAFQZAXCiAR4Kk/9YKp8tiNuHNvNy1CJIdtQxConwW4Fc
 duMZ320PcHdSEZKIuMlW3RWwPBDMaLT6uOrkEcszP+PZbNFKlZz2nXTzv6qq/7ZVXObA
 x43wjM7+i5jCn+R8/n5O+jRcqQnoeDiiv/ESSdlgxVQpERKoEy1V+gWmlOPMaOTpOSSE
 xGXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=amzdn1dg
Subject: [Buildroot] [PATCH 1/1] package/botan: security bump to version
 3.3.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix a potential denial of service caused by accepting arbitrary
  length primes as potential elliptic curve parameters in ASN.1
  encodings. With very large inputs the primality verification
  can become computationally expensive. Now any prime field larger
  than 1024 bits is rejected immediately.

https://botan.randombit.net/news.html#version-3-3-0-2024-02-20

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/botan/botan.hash | 2 +-
 package/botan/botan.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index 840191aa4b..37e00ea9cc 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,4 +1,4 @@
 # From https://botan.randombit.net/releases/sha256sums.txt
-sha256  049c847835fcf6ef3a9e206b33de05dd38999c325e247482772a5598d9e5ece3  Botan-3.2.0.tar.xz
+sha256  368f11f426f1205aedb9e9e32368a16535dc11bd60351066e6f6664ec36b85b9  Botan-3.3.0.tar.xz
 # Locally computed
 sha256  1833cde7c7cc03296b1ef2ddc178b1cd7fd1c476840f32cf6aedb09ab0bc9004  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 95352ea41b..e0bd258f57 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 3.2.0
+BOTAN_VERSION = 3.3.0
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
