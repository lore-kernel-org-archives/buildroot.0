Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAF0CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 09:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40A4F81F2C;
	Fri, 13 Oct 2023 09:35:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40A4F81F2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TRP3i1f1VmHp; Fri, 13 Oct 2023 09:35:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3739381F10;
	Fri, 13 Oct 2023 09:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3739381F10
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C8F31BF3C8
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 09:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75CF760804
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 09:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75CF760804
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ydS4PFPNoRPx for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 09:35:53 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F47D607CA
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 09:35:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F47D607CA
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso290630666b.0
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 02:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697189751; x=1697794551;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LEw34QRzmhEWhhEs8dFZdCwEd9K9lyRmH44sQyp85VY=;
 b=n/UM5b1rgG/mQjd7Kz75c4hdSBMZ6eKsu/yRg/aM/lTkGV0i27qbu+TDGpkZDQU8Rg
 kVJEXupeieA+5ufzFJ8DAPeoW55CXdiTGSIg1a6igbGZJp2AFho4j4Nrm8xiK0qikfkx
 9Ke7uh9cSKBl9UVnVnXV1k5PdawzRVOmPc2NdklTCyB7qR293G1eiUnPVMFm9JtO6xdo
 EpT5WmyxKT2bm4JEsoKyqHv6nsf5oYvqVADgekYicNtiP/5Gp+JgilHcdPahoFJI1sBX
 TQBqcK0xIUNvBcTtbSOMs2iNgBk4KJ52YJjNdnTovYbZmN7F70EqItjDjH8hXjQnj3tL
 oPdw==
X-Gm-Message-State: AOJu0Yy4bQ7z32tFE6/J6Ohtb9rN+IP8E/vKkAqPiIFfRpc/i0SHnzlP
 RJVkfhHGfK4dHhAfvQdfURFnsqj0J/QHMTWuDr1oKg==
X-Google-Smtp-Source: AGHT+IGaoVyzFR05/ZbpE4kW4bgSiGoUVgi/TfwOxbMg3YZZIGq88yNA08OfEmEsY7+oCBMXO0Qtmw==
X-Received: by 2002:a17:906:10a:b0:9ae:3e2f:4d00 with SMTP id
 10-20020a170906010a00b009ae3e2f4d00mr28000184eje.70.1697189751269; 
 Fri, 13 Oct 2023 02:35:51 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 cf11-20020a170906b2cb00b0099ce188be7fsm12052147ejb.3.2023.10.13.02.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 02:35:51 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 11:35:41 +0200
Message-ID: <20231013093541.1556311-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697189751; x=1697794551;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LEw34QRzmhEWhhEs8dFZdCwEd9K9lyRmH44sQyp85VY=;
 b=HzNSZFuCeJ8mcaqH/QAndZAM/x7qTyIIASb0HN4XYGkR5NGoyO133kgkSt1d9GlyAz
 n2PXw2MH0p2VRWmta5VspKWRTbnS/L7tMbiM0TLMA32FhDbufLP8mMWPxdJpygal0epA
 nxZJT44xPy3z2BJTWYS1Ic4HA9m3ZckBLINyc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=HzNSZFuC
Subject: [Buildroot] [PATCH 1/1] package/rauc: bump version to 1.10.1
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Andrey Yurovsky <yurovsky@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/rauc/rauc.hash | 2 +-
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 3a1fa6f5f9..38fea45b8a 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d3eec057e74d41565bbdfa10ff8bb2edb38e39af2b2126f8ad1d2174ae034d47  rauc-1.10.tar.xz
+sha256  aa99164c5f54fd29b5c8456221b51f92c900884af66de3e1b7f15a25b7db98a7  rauc-1.10.1.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 9f0571402f..4211abdcc4 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.10
+RAUC_VERSION = 1.10.1
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
