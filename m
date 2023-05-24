Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1218C7EE23
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 13:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 219BA840C5;
	Wed, 24 May 2023 13:20:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 219BA840C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RwuSfx9cXAOz; Wed, 24 May 2023 13:20:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60CEB84041;
	Wed, 24 May 2023 13:20:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60CEB84041
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C32D1BF322
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 13:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7497583C82
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 13:20:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7497583C82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xOuJ3GeHq8B6 for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 13:20:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 822D384071
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 822D384071
 for <buildroot@buildroot.org>; Wed, 24 May 2023 13:20:47 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f6094cb2ebso8042785e9.3
 for <buildroot@buildroot.org>; Wed, 24 May 2023 06:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684934445; x=1687526445;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mAeTqufy9jvy51oyPai1xyn+EIyfedv/M4noQDXq7e0=;
 b=aB07ze+eUDWye12r56cfHD0pGL7iIaUpoZjQsDzAMoL2ce1o5x2py00v9pd3+PjZ5m
 t4eWv+jeBgACqfseiJlyOVW3N7Js8tPszwFDimMA4majDJA8Qg7sIED/+PXwlZb7LCFW
 H+atUL/sncmTXv7R722RYhrm/0wHQNbbogtQSGJGJNOhNHM+DAn4RfITJlF5Sb8hYloe
 MBXMjfgEA8yNihjAEpcWQuHreorrmf3ttHfIsmxv468KWnQyRBVVkVhRYNyKrcv2YV/v
 +bkhS37xynew7QRXTzPs9HK43obtd26ot7WdbKsMyEzI7jSfxqR0+mRY1lqIyA8POwpB
 pxqw==
X-Gm-Message-State: AC+VfDyLzrmYDGAhumm+ysl1QTulflhmFa1/vTv4/S8HpEgxAYfnzF6p
 Ve6JdjwBb3eOyvek7RJpYQnYDYty6VqpwCF+
X-Google-Smtp-Source: ACHHUZ79KLW9oRDYHK4NmpcXBiF/aSVEmw6Xxpbq5JIVHQdfJvA5UWmPdDd5L69jBB4Q7Lvt8ErG5g==
X-Received: by 2002:a7b:c357:0:b0:3f5:fb97:eafe with SMTP id
 l23-20020a7bc357000000b003f5fb97eafemr9902572wmj.30.1684934445315; 
 Wed, 24 May 2023 06:20:45 -0700 (PDT)
Received: from Antoines-MBP.home.priv.kittencorp.net.net
 ([2a13:79c0:ff00:a55:61ac:7392:d73:876a])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a5d61c2000000b00309382eb047sm14525352wrv.112.2023.05.24.06.20.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 May 2023 06:20:44 -0700 (PDT)
From: Itz 'toinux' Wam <itz.wam@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 24 May 2023 15:20:36 +0200
Message-Id: <20230524132037.90220-1-itz.wam@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684934445; x=1687526445;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mAeTqufy9jvy51oyPai1xyn+EIyfedv/M4noQDXq7e0=;
 b=Q656xV9Zj7sO7Qehj5dFooKbW/mm6U/yx1UZxLZQCmiwChr8xGkosjSMcBPHS/0CeA
 64+BVod+dfpMtiLSXgYsccGBodU5inz1pkxXoKLL4ItvD/dz4K8dp0cZjf1avDLgCnmr
 t4+QlFImlPsOPQr2/JPkJNLbEkJOppRRunYyzLiLMm1pMzZ8jxmFQc4/pSeJ46mNkdmO
 657agzyjY2wF4sndlwWbkZacZH+honIEpqjQA+z6lo3IZoKUsbfIHXAEh+9IHXWo1aGq
 z6/2yWb1jghD2fceZIpPu65nWFbgsxmOzitPof9UX1WoGgT7uMxEcCgzqbsFqukoCzUJ
 j3nw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Q656xV9Z
Subject: [Buildroot] [PATCH] package/bird: bump to version 2.0.12
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
Cc: itzwam <itz.wam@gmail.com>,
 =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: itzwam <itz.wam@gmail.com>

Signed-off-by: Itz 'toinux' Wam <itz.wam@gmail.com>
---
 package/bird/bird.hash | 2 +-
 package/bird/bird.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bird/bird.hash b/package/bird/bird.hash
index 3e00a1993d..a62fbba630 100644
--- a/package/bird/bird.hash
+++ b/package/bird/bird.hash
@@ -1,2 +1,2 @@
-sha256  60a7b83b67b9d089d2a745a11fddd12461f631abc7b645b6c085adf90b3f55d6  bird-2.0.11.tar.gz
+sha256  3ec462a237d06d1f4455d6ec00a42f0b1686061fc988e5c89a841d01dd753b53  bird-2.0.12.tar.gz
 sha256  94c53c84320078920ac1f0d49c81a4e9004512f534521a58bdf145acbcbc2cd2  README
diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index 1295358fb9..f1b2ee6c5e 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIRD_VERSION = 2.0.11
+BIRD_VERSION = 2.0.12
 BIRD_SITE = https://bird.network.cz/download
 BIRD_LICENSE = GPL-2.0+
 BIRD_LICENSE_FILES = README
-- 
2.39.2 (Apple Git-143)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
