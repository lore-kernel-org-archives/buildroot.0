Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2D3C7EE2F
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 12:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED0DF405AB;
	Sat, 10 Jun 2023 12:08:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED0DF405AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9jWxjYl2gaZx; Sat, 10 Jun 2023 12:08:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30FCF40195;
	Sat, 10 Jun 2023 12:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30FCF40195
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D92A11BF377
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 12:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFBF58429D
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 12:08:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFBF58429D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zjJI0bP0zYAH for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 12:08:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D5C084298
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D5C084298
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 12:08:22 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1b24cd75989so12774445ad.1
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 05:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686398901; x=1688990901;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+tVsCgGFcBbuZblebA0/LFx4inNTxZrI2QIKpP/G9C4=;
 b=Ls8xcxK82A7DSSRfIH6rMbX0ceooYR94Dk6fOr7CDQKbRT9n6o1+mCOH7dr8AGxb/w
 QQUIj+Rk+zLEuDC+nU4Ca3f6AXXEloIKTvbBYduRx+fH7NKN83XggsoFD7uBk2bNK76r
 MnCg0UTp6ifcJ1nL1ssleOx4JchUpjbMfDP10NlSbigoyRF+05cP/8AtRnA1FW7+vgJ+
 GNT00TQOHNd6vsC3pLRO6CUmp3M5VCv1XmgpUIzwt08A2eVcmaTGb92e0PPngdDqZ69K
 aqOE4WWsF595wX4N1p+KcdHF05Qj82o9xHyKKJT5DC/KH1D6uC8weopcIVKs1H7xsntF
 pEhQ==
X-Gm-Message-State: AC+VfDwl0ffryOBRP5Vm9Y8VV6DgcRU9ehxVx/e2z0eZx/7dYuovr6QS
 +kGvHMrlhOgf2lVnLS5olTG9MRGS/LRt85HDVvFzlw==
X-Google-Smtp-Source: ACHHUZ4zebT33IjXpVnDf57H/zV28w0jVofeJCIjCxTHlMRQezggzm51iPBnAsYs/ty2aFzNIZJRKg==
X-Received: by 2002:a17:902:74c2:b0:1a6:ff51:270 with SMTP id
 f2-20020a17090274c200b001a6ff510270mr1756286plt.29.1686398901502; 
 Sat, 10 Jun 2023 05:08:21 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 jj12-20020a170903048c00b001ac2c3e54adsm4894219plb.118.2023.06.10.05.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jun 2023 05:08:20 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 05:08:17 -0700
Message-ID: <20230610120818.968354-1-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1686398901; x=1688990901;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+tVsCgGFcBbuZblebA0/LFx4inNTxZrI2QIKpP/G9C4=;
 b=nXXSZ/wOYz7wkeDlpNKKSuo+EKlh0a21L7yXyOydx2kT26lF13txcdnpnBSJ5RBFOD
 hANlUu0mVUmDHCyYuyRvWWOAD08kJroP7brcgEH4yKxl6FHLSzpuc5KQS5/72ZRbHNb5
 REDvopr570b79ZcuWclcb3PSeWSeqBLPc5EoBERgepHMTgnVagp39NPY513Q9011FEcy
 DBZbuV9fE4rcrQ3973QolOKpQF2d2JqdyQnRVGE5+0ct0ZEnrDJGEEWPP2nuxyjrVfF/
 7SVsTab+7OLfZDjY2VALJA43GjkP3DMM1sFBE2xbDAW/hOyZ1r2YCviLCjpXnO91fwf4
 Oz6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=nXXSZ/wO
Subject: [Buildroot] [PATCH 1/2] package/docker-engine: bump version to
 v24.0.2
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

v24.0.2 patch release notes:

https://github.com/moby/moby/releases/tag/v24.0.2
https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A24.0.2

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 092ec989cf..b6729ab660 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f502eba135828ae52cefb12f1c74092c8865e39cb94f5daed0f3f6717a8d50a3  docker-engine-23.0.5.tar.gz
+sha256  f4bc7d7cc2ee3671371ae80fd624e61f0598e614b5c235012581f8ec1d593aa0  docker-engine-24.0.2.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index f904793aa2..8127689e9e 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 23.0.5
+DOCKER_ENGINE_VERSION = 24.0.2
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
