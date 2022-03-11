Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94637C433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 04:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2466240BCD;
	Fri, 11 Mar 2022 04:41:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E1ibtvcfzGIV; Fri, 11 Mar 2022 04:41:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12CE4401FB;
	Fri, 11 Mar 2022 04:41:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9CB991BF3A7
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 04:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B4C8847D8
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 04:41:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ni8V21S3szmL for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 04:41:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7DE73847D6
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 04:41:31 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id h5so5387824plf.7
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 20:41:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=We+bYqqoz0YN+IkVZlfVmLz88a5sWqL4WHIHmrlfSOQ=;
 b=OsFIfgrpy2L6qSudp4WmYWK/TL3H2j8+cxDXco7CuEmkKGi1+z8eokD4aXWavnZETt
 26IivFgcajozvJWianYePUG3eVDkwqJZMHgt6Y5FsUrWNh5Q1Q7tvSxT18F/EZf5UZbt
 Pve3zIeuuEtvwiuU4uNqbS68rmO5GCRKSo4/uT9bknvuDbYvajkTGWNqSQiwBp/lMV6W
 pooFaMnPm3qXy88UR++7L7C5dPkg0WwYmPqSTWxnABaIVcyWzpNa/utnq29e/M/J27Bi
 vtiNtOOzNZ6A/V+tt8CQ2WJgl0vs5nkQjHXv2yMyekd9vX2vpIdxS/HIX4e7lITAvydT
 EV0w==
X-Gm-Message-State: AOAM533rQlEExX287vpDNGCZJbsQSZQyTlKduJJnw24EH2ony5wc7rFW
 a9ukHTEG/FUCfpOhLcZk7EYHgZQApkA=
X-Google-Smtp-Source: ABdhPJy2tW0ge7qtBwPkEGPETNRldUxWOrRotyq+SIRcVnUJZLOc/Aeq0MgBSEe/OiL4B1XFPdyGuQ==
X-Received: by 2002:a17:90a:faa:b0:1bf:b996:42c0 with SMTP id
 39-20020a17090a0faa00b001bfb99642c0mr8826292pjz.197.1646973690513; 
 Thu, 10 Mar 2022 20:41:30 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a056a00190500b004f104b5350fsm8974803pfi.93.2022.03.10.20.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 20:41:29 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 20:41:17 -0800
Message-Id: <20220311044117.3213995-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/balena-engine: bump to version
 20.10.13
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
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yunhao Tian <t123yh.xyz@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/balena-os/balena-engine/blob/v20.10.13/CHANGELOG.md

Signed-off-by: Christian Stewart <christian@paral.in>

---

v2:

 - rebase: update commit against upstream/master

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/balena-engine/balena-engine.hash | 2 +-
 package/balena-engine/balena-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/balena-engine/balena-engine.hash b/package/balena-engine/balena-engine.hash
index ef590881f5..1054e22550 100644
--- a/package/balena-engine/balena-engine.hash
+++ b/package/balena-engine/balena-engine.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  43f4c985b855a4f731a5cdac214f1adf6c4cc2021cbad3f93856009df246d61c  balena-engine-20.10.12.tar.gz
+sha256  88254fe4a5bcb9801ba0094226de65696fc754eca8143f601c75ba2f95893d3b  balena-engine-20.10.13.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/balena-engine/balena-engine.mk b/package/balena-engine/balena-engine.mk
index 0afcea3d7e..402c586468 100644
--- a/package/balena-engine/balena-engine.mk
+++ b/package/balena-engine/balena-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BALENA_ENGINE_VERSION = 20.10.12
+BALENA_ENGINE_VERSION = 20.10.13
 BALENA_ENGINE_SITE = $(call github,balena-os,balena-engine,v$(BALENA_ENGINE_VERSION))
 
 BALENA_ENGINE_LICENSE = Apache-2.0
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
