Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0FAC678D5
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 16:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6655781AC1;
	Sat,  4 Mar 2023 16:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6655781AC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DCVninyfgLeA; Sat,  4 Mar 2023 16:31:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB27981DF7;
	Sat,  4 Mar 2023 16:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB27981DF7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E6CC1BF853
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 16:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15FD34011D
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 16:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15FD34011D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WJM-BIMIJJ_6 for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 16:31:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02FE3400BF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02FE3400BF
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 16:31:12 +0000 (UTC)
Received: from b52572-12.ea.freescale.net (unknown
 [IPv6:2a01:e0a:43e:e970:8763:f5a3:4adf:bb86])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E69C3B00579;
 Sat,  4 Mar 2023 17:31:07 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 Mar 2023 17:31:00 +0100
Message-Id: <20230304163101.3986363-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1677947469;
 bh=cMHNQ0mEAvzQcJISSHfsxBs/997bwSmurx50y+ta41w=;
 h=From:To:Cc:Subject:Date:From;
 b=Nonhk1v5I6LRqR4zHCKU0oT6VOMWDv93kKsf9Lk/7hR/8yTH574kDOOaCEij/j2Yc
 mRXf1uDw7RCHJbAs0K4myAiWy/8sGXCdPr/PQmyuWwjWTNE/x/UbW1X96v1lq97ssl
 PKvhj6vjc0L+ZXyNNgcdY5viv9M8mcDmaen/N6TbgZhS3Z8DzdupwMJpX+3AvqctUc
 R6EFgoCT9Uk3mReHKnVFQh+UZq0rKwcdkbBIJ8Ai/Za/eFSrlnD1y4xP8tPjYQo1Df
 wayFvlQFhiUJ1t23IoGHypx7ALvA0T7dvf47iYphGYuiJUIBO2E63mxshzgN5rRTe/
 DrGVGdo2tdKIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Nonhk1v5
Subject: [Buildroot] [PATCH next 1/2] package/iperf3: bump to version 3.13
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LICENSE file hash changed, due to year update.

For change log, see:
https://github.com/esnet/iperf/blob/3.13/RELNOTES.md#iperf-313-2023-02-16

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch next at commit b793f3a with commands:

    make check-package
    ...
    0 warnings generated

    utils/test-pkg -a -p iperf3
    ...
    45 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/iperf3/iperf3.hash | 6 +++---
 package/iperf3/iperf3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index 15c75b6dac..b2c89df98a 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.12.tar.gz.sha256
-sha256  72034ecfb6a7d6d67e384e19fb6efff3236ca4f7ed4c518d7db649c447e1ffd6  iperf-3.12.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.13.tar.gz.sha256
+sha256  bee427aeb13d6a2ee22073f23261f63712d82befaa83ac8cb4db5da4c2bdc865  iperf-3.13.tar.gz
 # Locally computed
-sha256  a5c2e3d799f2835156e565a3de4fad33d32ed289cdc9e414dfaf75719fd12ef9  LICENSE
+sha256  35aa7c4618b9884d6faa9b43a4e70291b35ea9f89329d5d33becd852e85221b0  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index 9041c86575..129319d78a 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.12
+IPERF3_VERSION = 3.13
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
