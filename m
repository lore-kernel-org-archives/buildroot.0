Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89010C433FE
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 18:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFB91404CC;
	Sun,  3 Apr 2022 18:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ERsBftnF0Da0; Sun,  3 Apr 2022 18:36:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1DA04058E;
	Sun,  3 Apr 2022 18:36:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 208B91BF36E
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 18:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1773D60C2B
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 18:36:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BH3He0YesUic for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 18:36:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9E4560C05
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 18:36:47 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id r7so4647108wmq.2
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 11:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hEEABay3vZ0sfZHpPimsOE+WbraG4X1SHOdDBhKaI0g=;
 b=M7XNdnT50k7d4Lf2fVM0mj/4d9OY2JNVIjKuAeOesRbPlt4hWDvMfMqEQS4fIIRVC3
 +8y7Z4vpFl2W1x+P1esG7vDUuo3h5FsBHHjzN/gn9dJtRlvMFR+Eq69n5qPTYsXtkGVl
 NlPQK5+DeQyA96ChLhcHIwdXmSI8YRncnWWytFOhbsgxxwko1EGtvgtH6+T39dpBSOPD
 pDPGQZuzoNEnuSZUSQVNrQ9nTwvA50PjiM0QWuI/p2CXdw54xJ10Cg5KlbMbBTFy57jS
 lydU3ipq56XxR7pnvvTlrg1ngsBotpdQOS8yAy75CW+JgbzwhLlTOA3ntAPkfwUKrgfb
 Xy4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hEEABay3vZ0sfZHpPimsOE+WbraG4X1SHOdDBhKaI0g=;
 b=ZYyIsvYUZQsl0eoOn7QtM2aw828iXuFoHtNU5e5BhSK+CCRwVnhaw6Mt8E5381bYW1
 aotwAIBq6/AB+5V/ehJKrlzDSE98qUkyUh0/g19ZMNv+dUd0ngCtV1wPJgeILwm149u7
 cGwJySWr2qGKzNpHDqHXu6sA5sq0Qz8O17fHB9bBCsSYiZSQCYknHIpZubNwcfiG4bJs
 ISjRcv8hwnkZFdUI4Ytx1N8HpPXsySNXX+LrHdKGfQM0B54zF2bx53fjHwl080LgSfyz
 HHRx5X3kfXAKZgaUG1i0RrEgQus/EboafhajQpGRk4WiOOsvYsfx+olkhS5hGFVE2UHa
 xg7A==
X-Gm-Message-State: AOAM530uzhvc4Mdz4xnqqq+T2ZDxeG4W95Fxb0lya607aWZmMJgQo5PJ
 Y22ZPewKKy6NB+Di/D7Tjh8NTKlHbbo=
X-Google-Smtp-Source: ABdhPJzXDmR7ej57GuZEbDij4f6rjv+gix1U95ovdLDCLBpPxn4KqsobbitLueBcsMKyUmxCFVAgOw==
X-Received: by 2002:a1c:f719:0:b0:381:ba:5247 with SMTP id
 v25-20020a1cf719000000b0038100ba5247mr16509118wmh.183.1649011005582; 
 Sun, 03 Apr 2022 11:36:45 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a05600c35ce00b0038c9f469979sm7294883wmq.40.2022.04.03.11.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 11:36:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 20:35:03 +0200
Message-Id: <20220403183503.736373-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/minizip: bump to version 3.0.5
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

This bump will fix the following build failure with zlib-ng thanks to
https://github.com/zlib-ng/minizip-ng/commit/9184ba1216589077803b3e4e85f2b226f861ab2d:

/home/autobuild/autobuild/instance-10/output-1/build/minizip-3.0.4/mz_crypt.c:19:14: fatal error: zlib-ng.h: No such file or directory
   19 | #    include "zlib-ng.h"
      |              ^~~~~~~~~~~

https://github.com/zlib-ng/minizip-ng/releases/tag/3.0.5

Fixes:
 - http://autobuild.buildroot.org/results/530fee780557941356dcd6aabb8cc9eb048574f3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minizip/minizip.hash | 2 +-
 package/minizip/minizip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
index 3e87e64dae..e73637670c 100644
--- a/package/minizip/minizip.hash
+++ b/package/minizip/minizip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2ab219f651901a337a7d3c268128711b80330a99ea36bdc528c76b591a624c3c  minizip-3.0.4.tar.gz
+sha256  1a248c378fdf4ef6c517024bb65577603d5146cffaebe81900bec9c0a5035d4d  minizip-3.0.5.tar.gz
 sha256  675181c03fc1302a1c8554c00f7be9bb420c5dbc9dcc2013433cec144413de03  LICENSE
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index 07f67c1354..b9259f0c54 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIZIP_VERSION = 3.0.4
+MINIZIP_VERSION = 3.0.5
 MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
 MINIZIP_DEPENDENCIES = host-pkgconf
 MINIZIP_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
