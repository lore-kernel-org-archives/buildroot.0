Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D673C001B0
	for <buildroot@archiver.kernel.org>; Mon, 14 Aug 2023 14:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3B1261076;
	Mon, 14 Aug 2023 14:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3B1261076
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EpELxBMxTAuk; Mon, 14 Aug 2023 14:21:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1259760F8C;
	Mon, 14 Aug 2023 14:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1259760F8C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ADFD51BF385
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 14:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 938BB8148D
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 14:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 938BB8148D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XHPzwj1JVmp6 for <buildroot@lists.busybox.net>;
 Mon, 14 Aug 2023 14:21:15 +0000 (UTC)
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C696F8143E
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 14:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C696F8143E
Received: by mail-ej1-x642.google.com with SMTP id
 a640c23a62f3a-99bf8e5ab39so598973866b.2
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 07:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692022872; x=1692627672;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a6Cb0L12kMh5j5m7smsKHO+86upNAe3b3GKSHiufJBU=;
 b=GYjsRQjqwEgXSsZnnuMsp89MPxR4uMFQ3FK9G9yrMi0hnaTmgsVcr1wPk2/4pteeTv
 XK0MMH2A7gtAJeUgrJyhs3u9ytRKS2vZ8crwH0GGKMevwfjaN2xpVo1W+ce2HdDJ4hsv
 H18nxy+Nsi5agHxwFkMc9D20Wj+ZJByCYSg1ELhkRXYy5NZ0GLIt24bwpaLB72CZCOQR
 XNUjIbjP+liBVH4Ac3rSbN9ttmf6Jvic20Jb5rfYCZ/3kxhjtthZEeEJWAcmpvTavaoj
 CRjK4eiaRZwNjgmBElSRKbAJPZiXybLHhdGbpQwxOPhos/VmWXDEsbNvvfsJs3eBljzS
 bCLA==
X-Gm-Message-State: AOJu0Yz6yk+SAMskRLq2VAYskfTyEnBjv3k+uJtABaS9oLLXMbbcVHWa
 EJSJcgStNEysWy46O3YCQe2vDS7T0r01Akk1uEmdOkWU
X-Google-Smtp-Source: AGHT+IFfT2nNq9GgyUoofgRK4oDFHpBZMTQk2ZLGZTMbZIxKUZuU+w92lwPCUkxYrsBsxkoz5qE4aw==
X-Received: by 2002:a17:906:32c3:b0:994:54ff:10f6 with SMTP id
 k3-20020a17090632c300b0099454ff10f6mr8501495ejk.30.1692022872608; 
 Mon, 14 Aug 2023 07:21:12 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-180-23-204.pool80180.interbusiness.it. [80.180.23.204])
 by smtp.gmail.com with ESMTPSA id
 kq20-20020a170906abd400b00988b86d6c7csm5742989ejb.132.2023.08.14.07.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 07:21:12 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 14 Aug 2023 16:21:06 +0200
Message-Id: <20230814142106.141500-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692022872; x=1692627672;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a6Cb0L12kMh5j5m7smsKHO+86upNAe3b3GKSHiufJBU=;
 b=UEQTEOsAMUK3C0l5vu/90xY/hICY+70UreYfhhl8VIir4VYHXl5/a41fLBEG28Rbp7
 1b8r0DUUZPr7uTFSO1oPoPEZz7f+iCpkCgT0Usq8XKYYGboxmUQCvQNQrPr2Vi025ntT
 tnAYBag/vHAkfTaPsbj8yxZV+4v/dGrfIb8Fc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=UEQTEOsA
Subject: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.125
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.125

The changes to README.md are not related to license modifications.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uuu/uuu.hash | 4 ++--
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index f42e92a3793b..574cb48a3c28 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  6c99b82c55202f43583dc41198225dea7d5b050e33e13946751911e473aed4a5  uuu_source-uuu_1.5.109.tar.gz
+sha256  085d7f6308ee6b77dfb131fac40704575525adf6da45cdc446c00a0b29e4c21a  uuu_source-uuu_1.5.125.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
-sha256  f68fb8c8002c797a14e63f91963ac247034fdfd44275e4f4a3226111cd0423db  README.md
+sha256  52a715c7443f269ddeba360abd70694879e120213926553a000e9be9373ea731  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 14a8a5ef025d..5f3271066f81 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.109
+UUU_VERSION = 1.5.125
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
