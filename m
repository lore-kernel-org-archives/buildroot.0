Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B17DC46CD2
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 00:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF4CF40A8A;
	Wed,  3 Jan 2024 00:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF4CF40A8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6BFBui5mV_gO; Wed,  3 Jan 2024 00:01:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB8D640A5F;
	Wed,  3 Jan 2024 00:01:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB8D640A5F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11FE21BF311
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF977410A0
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF977410A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Secxj-_cDNRD for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 00:00:10 +0000 (UTC)
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A6D4416CA
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 00:00:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A6D4416CA
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-595b208a050so678489eaf.0
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 16:00:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704240009; x=1704844809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bxryJsBf9AAZWbrVPrdz1v2aHdolC98vP5at+2cgeiw=;
 b=QEAmmPNdjeZaPVc/snxlhLinXHScMVUI+FxDN05Ax7zMv7UuUAFegwPlFfg6mZrzzB
 mhr5fr7Uck/8MhaakilXPkEqB1p5camPWlzQot5ASU0nnkrHiflv6kzn1Ei1vDuJz6cw
 vlJu9nsAM0ggWwPBZTziEoobYiYbCN7o7th+8B77wT+Etl763QvLbPSgFJtvVJb00tjp
 CKCzymAKBDQ52ZzJ6uPPo+HbJBGwZO+y20HZCj2QBxiaWuwpIzwNqOMAZqgdkSeJiI1x
 2VlBpat/gX97jKZ7Si//nS5I7/TDkB4YhZgKjEtSdCqHuItWt5WfOrQkTN4pO+BDDnXi
 jzOg==
X-Gm-Message-State: AOJu0YzCsrYhPpdyt3ht7KY3mTn4J74dgVBbC3YS9BMkpH8Wn/qdfRh1
 SVG3vWpdl7u+2A8cCcUL1F19wm2Vk3uCG7gQxfIOvO+9POE=
X-Google-Smtp-Source: AGHT+IGVXuCObQg5t95FAEGZdaGqGpmogzctmGUT+6NXheM0jBftarzi9NKF42yNVYSuzIZycnS0Iw==
X-Received: by 2002:a05:6358:c69a:b0:174:c186:cb70 with SMTP id
 fe26-20020a056358c69a00b00174c186cb70mr14720277rwb.20.1704240008794; 
 Tue, 02 Jan 2024 16:00:08 -0800 (PST)
Received: from desktop-oi0kn2b.lan (75-174-33-82.boid.qwest.net.
 [75.174.33.82]) by smtp.gmail.com with ESMTPSA id
 cc13-20020a17090af10d00b0028b8499dc80sm181824pjb.39.2024.01.02.16.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 16:00:08 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 16:59:26 -0700
Message-ID: <20240102235957.3072102-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
References: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704240009; x=1704844809;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bxryJsBf9AAZWbrVPrdz1v2aHdolC98vP5at+2cgeiw=;
 b=ebZbp4GMINGwRh5SXr9m0HMf6YdxA8aAmby8UUA1HpSDmxHkivdrDQVNXcnMFU4w6D
 bqfFQQW6z0Cs5ZXgcbJm/JMSnsZD+MApohGaZAkZOIJbJ+nJn8a1td21tj7p9KzaaILv
 BmYERQZ2kmlGdeHBAkCfDe4ZpDhTt8LZLBR6E=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ebZbp4GM
Subject: [Buildroot] [PATCH v3 04/11] package/flutter-engine: bump version
 to 3.16.5
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

Flutter 3.16 includes 1,954 commits and improvements.

Flutter 3.16.0 also sets Material 3 as the default visual style for
applications.

A brief changelog can be found here:
https://docs.flutter.dev/release/release-notes/release-notes-3.16.0

A full changelog is provided below, which is provided at the end of the
brief changelog page found above:
https://github.com/flutter/engine/compare/3.13.0%E2%80%A63.16.0-0.5.pre

This package update has been tested on a x86_64 host with Docker 24.0.5:
  - The following distributions:
    - Fedora 39: Host system
    - Ubuntu 22.04: Docker
    - Debian 11: Docker

  - The following targets:
    - BR2_aarch64
    - BR2_arm
    - BR2_x86_64

Also, the package is tested with the following testing command:

./support/testing/run-tests \
  -d ./dl \
  -o ./output \
  -k \
  tests.package.test_flutter.TestFlutter

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v2 -> v3: Updted to 3.16.5

 package/flutter-engine/flutter-engine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index d31d435d79..c3ac144f2a 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -21,7 +21,7 @@
 #
 # There is no hash provided, as the gn binary (used for configuration) relies
 # on the .git directories. As such, a reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.13.9
+FLUTTER_ENGINE_VERSION = 3.16.5
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
