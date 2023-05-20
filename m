Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1D2C7EE23
	for <buildroot@archiver.kernel.org>; Sat, 20 May 2023 00:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD917612DA;
	Sat, 20 May 2023 00:04:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD917612DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eZIcif-GtnxJ; Sat, 20 May 2023 00:04:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A60B612D8;
	Sat, 20 May 2023 00:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A60B612D8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17CBC1BF407
 for <buildroot@lists.busybox.net>; Sat, 20 May 2023 00:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E324D41DF7
 for <buildroot@lists.busybox.net>; Sat, 20 May 2023 00:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E324D41DF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xIKLBoMhVJcT for <buildroot@lists.busybox.net>;
 Sat, 20 May 2023 00:04:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E113941C01
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E113941C01
 for <buildroot@buildroot.org>; Sat, 20 May 2023 00:04:36 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-5307502146aso2707251a12.1
 for <buildroot@buildroot.org>; Fri, 19 May 2023 17:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684541076; x=1687133076;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xmOYrK24ZUGN1jdsOWWm/BzQreCDc1dKIw+pE14VjUE=;
 b=ivbMEuZ0R7EJWOttVyWr/qdWdnm5Eh8zy2BfbJLca4Ibc9jq/ts+mZJwzwXFJVS3e4
 KUUcfL8JMA2zwLWl0TGnSUAab5PG+Fn6Pu1TlfGSjQCLPk8IH1ID4Qkj6upiBFFFOGnL
 kihFwNdZEsz887eKiCEYQ3BYPHt1hSM7TFDkcCCF/MQqDPaD2sRuF94+FhnpK81YyItX
 iGIVDeXEEEQrfhqcu7kF+g/YfQLEs010utxuVK+9PqVTgYMz/moplRfFH892er4+0Bof
 Iz6ormRSupVFNAacnlAs+nbm3zaEk36tAsIKpUhF+bw/YbM9mMIbToMziNhJmbFPggiu
 70GA==
X-Gm-Message-State: AC+VfDxJJd1TuEPYQhPTnCctFGFJSPvD5PpZMVCCpG6ZPb+mcdIMBQT+
 v1wPe8Rb563QTNtrxVpWVpeUtdPSUoEUBT7KeEQP9g==
X-Google-Smtp-Source: ACHHUZ5Ou8/7rijUz4vOiGpviLV/mS3c7XcGRW4oGsIRNyz4/i+9mEZe/CNvyU3AajNoHLU7m1HkDQ==
X-Received: by 2002:a17:902:e9d5:b0:1ac:8cd4:a82d with SMTP id
 21-20020a170902e9d500b001ac8cd4a82dmr3524777plk.27.1684541075986; 
 Fri, 19 May 2023 17:04:35 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 d22-20020a631d16000000b0050be8e0b94csm253334pgd.90.2023.05.19.17.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 17:04:35 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 19 May 2023 17:04:32 -0700
Message-Id: <20230520000433.9841-1-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1684541076; x=1687133076;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xmOYrK24ZUGN1jdsOWWm/BzQreCDc1dKIw+pE14VjUE=;
 b=du88hAVKAZ+IC9LxCuAfeKJfEMy83t4+n1+DRxbGV36urahaCFhmEdFa5gFIFeqUma
 ZINTziuadXitHPZfdWT93J8moo38mpy9BwJdaPY6r/CNw6s0cur4W6sxpypxuA/ouBUY
 6tWr8ILUsB8ThZlcUEik/41Gu8K7Kk6b1NYmrT35WZfMOc9xL+2Scf7ij/ND403BIadT
 QXKuiSe3rCZaDJ6Ipjx0VsRccXsiOLZBn7hOAx2zS/VVSkF9j7NbakILjVkrof2SKcKE
 aV+5JdizsgkNPu2/BmKaE9svOdZZvU4oXqOh45zZqzwrN7WSsY84uViQgcWYaj5Oq1Ds
 tIMQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=du88hAVK
Subject: [Buildroot] [PATCH v1 1/2] package/docker-engine: bump version to
 v24.0.1
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
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

v24.0.0 release notes:

https://github.com/moby/moby/releases/tag/v24.0.0
https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A24.0.0

v24.0.1 patch release notes:

https://github.com/moby/moby/releases/tag/v24.0.1
https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A24.0.1

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 092ec989cf..fc68e97b76 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f502eba135828ae52cefb12f1c74092c8865e39cb94f5daed0f3f6717a8d50a3  docker-engine-23.0.5.tar.gz
+sha256  cb8aa8ca7145cd8273b6eb2595ee5d7da2e97feec4b73936cb4ea8cbbe104028  docker-engine-24.0.1.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index f904793aa2..5bdeadc8a0 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 23.0.5
+DOCKER_ENGINE_VERSION = 24.0.1
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
