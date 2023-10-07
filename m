Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BC3E95A65
	for <buildroot@archiver.kernel.org>; Sat,  7 Oct 2023 18:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF60C41B8F;
	Sat,  7 Oct 2023 18:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF60C41B8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xpr9lQPADDfl; Sat,  7 Oct 2023 18:31:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B25F141D9D;
	Sat,  7 Oct 2023 18:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B25F141D9D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 085631BF401
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 18:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2F914045C
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 18:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2F914045C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3mfa3OdQ6TGb for <buildroot@lists.busybox.net>;
 Sat,  7 Oct 2023 18:31:07 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34142400CE
 for <buildroot@buildroot.org>; Sat,  7 Oct 2023 18:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34142400CE
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40572aeb6d0so29850915e9.1
 for <buildroot@buildroot.org>; Sat, 07 Oct 2023 11:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696703465; x=1697308265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YTlmFmS3Za4t8YzgsAzPrL0BeJTDtR83LznNyXRIduo=;
 b=BAopVQHVT7aTN5NDepPjsG6+k2LLJXmPS+JdF5pxexQr4f3nknb+GxdFAbI3te8jcC
 dPeDeZ59Ywe3y6OBh5/qJrPJlZ/kNETmeoUZeBjkEWA8lnxPOCgTGx4y3t1QnzZVW4r5
 U5Jwb4D3ECbQG3U5dizWg9ovDLqRh8DdFhmvdBiYkGDD+PU49dcULOG0FuMtoD91VPWQ
 meVS6gOJO6rxADgSHS+nDLJqpNyWB2e4JefUhtPbkqS6rAOK8MJCRd1nHKmibYwcV+s9
 Doau+SQrSn/ayOusYggaw9ilq859VcOKebBPxAICcLr3XqdbvUiVJaxOxYBJVBmj4aQl
 qN4g==
X-Gm-Message-State: AOJu0YyrGlCPcV+F/mnl7GJHu7a+XqxQC4YfVOFWKojiSCttq2Zf5Xov
 apgSj6kv8fPmkepSu54jPpERZY0ZM4Cxu9YVm5SpDA==
X-Google-Smtp-Source: AGHT+IGaj6E+N9c998/UMnO/5MgfWK+n+eNk14oJb/b6jwfqR3brF3hb6Fdg7SQvjcNM8eHFiYBH2w==
X-Received: by 2002:a05:600c:2303:b0:402:ee9e:ed98 with SMTP id
 3-20020a05600c230300b00402ee9eed98mr10647945wmo.34.1696703464917; 
 Sat, 07 Oct 2023 11:31:04 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a7bc3d8000000b004042dbb8925sm9022365wmj.38.2023.10.07.11.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Oct 2023 11:31:04 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  7 Oct 2023 20:30:53 +0200
Message-ID: <20231007183053.12650-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696703465; x=1697308265;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YTlmFmS3Za4t8YzgsAzPrL0BeJTDtR83LznNyXRIduo=;
 b=hUvYdq2i1Gnq+A9YQQboBs7a56FxS8oImtMiMJyXsX3xDQtAqwwnjpk9eI/27bS6Zy
 HsHbga0fF+36h0/+4KM0jY1jPkYeA6DweFLj43Ej8yY3csvpLbYmoMtA8iyLakQT5hat
 wU5o5lwqR8eeuw994qOYGzhfOG27Ub+4ON/AQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=hUvYdq2i
Subject: [Buildroot] [PATCH 1/1] package/setools: bump version to 4.4.3
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/setools/setools.hash | 2 +-
 package/setools/setools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/setools/setools.hash b/package/setools/setools.hash
index c353e1f609..6a61fc2809 100644
--- a/package/setools/setools.hash
+++ b/package/setools/setools.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  998d12d01852feed1889110a4ca81090a47a2d9b47368e4dfe2b94d68696c813  setools-4.4.2.tar.gz
+sha256  29f5e7d98764a6942b2e32c8aa44da6a618882818c79599ade967ece0cf1dace  setools-4.4.3.tar.gz
 sha256  0e58d74751e394f39748c7b7b4039d6a883b5def9711160668ba962b52e69e01  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index b80d25a6b9..efb3869e5b 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SETOOLS_VERSION = 4.4.2
+SETOOLS_VERSION = 4.4.3
 SETOOLS_SITE = $(call github,SELinuxProject,setools,$(SETOOLS_VERSION))
 SETOOLS_DEPENDENCIES = libselinux libsepol python-setuptools host-bison host-flex host-python-cython host-swig
 SETOOLS_INSTALL_STAGING = YES
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
