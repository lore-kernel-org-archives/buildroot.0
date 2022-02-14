Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA650C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 17:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 633AE410DB;
	Mon, 14 Feb 2022 17:39:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lTBmGAbEMVQH; Mon, 14 Feb 2022 17:39:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B44034098E;
	Mon, 14 Feb 2022 17:39:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF5F31BF338
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 17:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBA6D40332
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 17:38:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6RpgVbcyTVjM for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 17:38:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp2.osuosl.org (Postfix) with ESMTP id 683BF400A4
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 17:38:58 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JfJQna5Yukz4hJfJQn3TRI; Mon, 14 Feb 2022 18:38:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644860336; bh=mRgge4xi5opvHUZKf/UYnwYF95CyBfuco+9Ct6956Kc=;
 h=From:To:Subject:Date:MIME-Version;
 b=cLOeVre8KXU91vHZVvEVHa+sqy3lCYLH0rkY+V3hH6L213a9UyOfkZvPEdvkoKr03
 lW22WKNVsorwP/OrHjJfalFBtxK7LdfIfjrdAPGoo2Tq/ThxW06A1F0nFVUVrIHWrP
 vqFiolbWtmoH0kGKWcCFK2mGf8s0bC20GNIyCxwwXD73ZuognLp4KSGx4Z5Sc2TdHA
 P9NMrwymld0I3bP/ySyyHISeyKHOWU3o4IaLxIVCOZEZQtTTJveRNAKIDWsnEEYMVl
 DItRK+9CfKKnZb7JFRqlBE0xx4UFbHUFvcWRaA8cuhm6BGL3f3cImdAmG7DJJEGNA1
 n5eII2PboihzQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 18:38:55 +0100
Message-Id: <20220214173855.4071040-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfLsqn9oDX91kXAcwVMfNDM1JxWeyiO3E83KxVHLHvbqivG+ZEQW5DDm4Rd9Djl83LTbyfP+lpnvg4svmkZkVMQELQx7I3P6Cza0JimHbX84+BLgwmRUH
 wGiHc6/MYTcQGJtAr2dp4wzxYs+COh+jiQ0CBYtk9X672ORTbmsmiKLC5gz0OK+DIpGX3zMgjow7omX7YTwmDyOAeIKMENcwd9yb5ElQ4GRWpSBat0GyBU0e
 JNmL6oU6iN8aUo+b1Cv2Hll1Yv7zCShNtkSXwF5AoXYQ9bG+L0cN0AFziHF2pu2YLX5a/jL9U0fmjwdtop4ISXICC37iSoJxP+bB5ValLnAomTBPSstQiOjx
 L/cS8t1Fu0qdJQjA/q7dTeomKIjdKg==
Subject: [Buildroot] [PATCH] utils/docker-run: hide docker run command
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since this is a helper script I don't find the reason to show the command
we're issuing, so let's remove 'set -x' before running docker.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 utils/docker-run | 1 -
 1 file changed, 1 deletion(-)

diff --git a/utils/docker-run b/utils/docker-run
index 0614f1325d..55dafd22a3 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -6,5 +6,4 @@ MAIN_DIR=$(readlink -f "${DIR}/..")
 IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
         sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
 
-set -x
 exec docker run -v "${MAIN_DIR}:/home/br-user" -t "${IMAGE}" "$@"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
