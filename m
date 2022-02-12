Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793D8C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 11:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F26B4411C6;
	Sat, 12 Feb 2022 11:50:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vesaENX_YLRV; Sat, 12 Feb 2022 11:50:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EA5A4136B;
	Sat, 12 Feb 2022 11:50:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 747421BF3A4
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 11:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9B2F41298
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 11:50:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hN3i7QMnREgD for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 11:50:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A493410E9
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 11:50:37 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id c188so14438543iof.6
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 03:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tIuhi3O6q/YhoeiEZI/BiEin8glZsBnIrM80OakzRBw=;
 b=CMCSj3CuNL7QK2QqCbf3sqbMZBAGT7v+lJUnitN22tY7c+DzK1kp4uDiOILdDCY4Mc
 Szhz/ryG9cdeWlFvX91m2o+540C4drs3ObwuVUGuMjZrrUeAgQQsxdlqWPKrrWU92bAr
 NUyhtF4tUE1Fbt5dHAIOsQvW9Czn4OGdBevvf5Z5xco6DqmqWQvWlkQKlA8V8LGU5pii
 +5QwDVcJ9rmZmmldw0iiE2pQekA1AdFl9dKLNavpn0qA7eVpiM3tp/rFaD7o2IiZS9sy
 L+OUEsXBucOK8mZUfkNP1zGBbVFbGm8AmEbeHjQG4+vfZk2vZiR70iXJVFZw8gv9NunT
 D33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tIuhi3O6q/YhoeiEZI/BiEin8glZsBnIrM80OakzRBw=;
 b=FOW5TR6lku0Kr4RPuuD/ZmzGam6SNuTmVTq1CaabgxWWe0cYTOoCJqAYvNdr8Bq/6J
 xGw0NeBr1kRgT3JaHVXg6+gQT+d/wJoV/w58HDEvEQpRthMG/PTAn7DHfmTbvfTZo+lz
 13ijIuD/bwO9D+duyVOajHzEquicA8aeKELucMUcFHPnPFeK8rzAWW+muSNh9vRDW3wC
 tuU7qRurg5dP2+YksdX4hoxo+55CGl6Kxmu8DjUhmzu8yoEzBSndOHt5PTOCrlfvi6IC
 gqR2RuOnbUXdLJB803dSHYCGNLIpJiid7SP/nwU32z52U5Yjeq49nTGF6p6NmiKiNj/m
 Lbtg==
X-Gm-Message-State: AOAM5311yUMTieAZL2Y2X4Veo+JXpTNI3hCqVDBL9s3XCAeqw3ygZLnx
 IJh8NggXRJGZcvnPeNw+R/ChEC3jV4/XjQ==
X-Google-Smtp-Source: ABdhPJx3NAbRxecb9TG330C2cF68rvRq0BNFp5GaZXrMFgN/EkpVaxm99ReinWovyKWJBpwBENkc9g==
X-Received: by 2002:a05:6602:2f0c:: with SMTP id
 q12mr2961611iow.131.1644666636940; 
 Sat, 12 Feb 2022 03:50:36 -0800 (PST)
Received: from james-x399.localdomain (97-118-156-98.hlrn.qwest.net.
 [97.118.156.98])
 by smtp.gmail.com with ESMTPSA id a15sm2778613ilj.21.2022.02.12.03.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Feb 2022 03:50:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 04:50:27 -0700
Message-Id: <20220212115027.1533516-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH buildroot-test 1/1] scripts/autobuild-run: fix
 and default to python3
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 scripts/autobuild-run | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 346928f..9219134 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Copyright (C) 2014 by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 #
@@ -794,7 +794,7 @@ class Builder:
         while True:
             try:
                 self.run_one_build()
-            except URLError, e:
+            except URLError as e:
                 sleep(30)
 
 # args / config file merging inspired by:
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
