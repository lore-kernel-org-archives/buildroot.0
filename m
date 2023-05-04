Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA327C77B75
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 00:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47BD4418DF;
	Thu,  4 May 2023 00:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47BD4418DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ATqGsR8TaIV; Thu,  4 May 2023 00:25:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34A8941889;
	Thu,  4 May 2023 00:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34A8941889
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBD921BF3DB
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 00:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B195283D0E
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 00:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B195283D0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N5UG2pzeJBvV for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 00:25:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D121783D0D
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D121783D0D
 for <buildroot@buildroot.org>; Thu,  4 May 2023 00:25:08 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-63b50a02bffso4415556b3a.2
 for <buildroot@buildroot.org>; Wed, 03 May 2023 17:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683159908; x=1685751908;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tV26+sA98aBr+1VSMc4J2Pd+trG9T2kW37m9rEkepjY=;
 b=QG5sItynW8Q4cBDPeExfJ+FoSWnZWYX3mJg+EwZPj0Z/PESSQqzqAaY7Y5NOlpwuAM
 vbYORqL6alZgTvjursqjPRKsTZts7kbiielRZO+SE1PbYEQmd0vCGu6r+RVlvwy4j0YP
 5eWhp/rlbvIrogPBxLorG9pxVfB570vF6aGodl3dgd4BCeIGowcKtEB1qqCF0u1ehZDf
 6B3YpDuJm2jncoyC5YiGT77cbQcZ9PWaRK8QPY9phiJjys6htgssvsiWWsYy7w+UXcLL
 lhbteaulgkoKn72ZwXYw7q9yetXP6RKod4oz3mZSIl+A6aAHB5vc0UR4WZhhOsIgKGP3
 W69g==
X-Gm-Message-State: AC+VfDzT+kVEDYYYWGlHDrb3dE43RTF2ekraHcok4qRZvwdzkZ2iWsYC
 8GAymBT2DMFYmMyvDhB5FEiBK+kd7DI49CTIkH5wDEZmduU=
X-Google-Smtp-Source: ACHHUZ7eXuBHW+6soIS7qJCRqDHEhpHs9JiWYl2TPb7iYTv28Z6RJuu8Za3Ad+n0A6n9dyWxns5c5w==
X-Received: by 2002:a05:6a20:9f49:b0:f5:75f7:a0bd with SMTP id
 ml9-20020a056a209f4900b000f575f7a0bdmr419136pzb.13.1683159907911; 
 Wed, 03 May 2023 17:25:07 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 k128-20020a632486000000b00502ecc282e2sm21030930pgk.5.2023.05.03.17.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 17:25:07 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  3 May 2023 17:25:06 -0700
Message-Id: <20230504002506.1463712-1-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1683159908; x=1685751908;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tV26+sA98aBr+1VSMc4J2Pd+trG9T2kW37m9rEkepjY=;
 b=d3td7xAzvXnLarx8zVrcUHPJCptwSVKmfOs/jKOR99qA1YpkqmOgxwtG0ta3amsriP
 GuyN9TOxV+WNFAQnD4oHmA5eSs8hiaWwjou5T7IkNq1SWwMSiR8Fd/UvYKCF9ulCL0/S
 kuxIxNlTgxWFi4s2UDekOL5OcmQoBgg2fTk0Z7Ju8xCGW1+jxMLV8uY7SMktefn2W2cT
 3b9LjaaPddphiz7nALlR/Xgw9MeWaTf7fSrp6Y5WPzGZGpv69RuTHeCF/dip3fNxCa8j
 qHsbzpvKk+hXn3qA8W+AmXtHWRixojdoY5o2frlxOD/Ccr9PcUl1GeFSUE0D+VImnKQm
 VLaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=d3td7xAz
Subject: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump version to
 2.17.3
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/docker/compose/releases/tag/v2.17.3

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-compose/docker-compose.hash | 2 +-
 package/docker-compose/docker-compose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index 2c924d5080..4fe6d73139 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  346571ca487bf3f4b3dc9caeadc88a645354b0e098fa60f350249ec35ab3f240  docker-compose-2.15.1.tar.gz
+sha256  3a777f6442db77447919cc7006d8b9439c95cc61c04acad4039e0120a8e591ea  docker-compose-2.17.3.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index 3bced8bb7b..09f611e185 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 2.15.1
+DOCKER_COMPOSE_VERSION = 2.17.3
 DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
