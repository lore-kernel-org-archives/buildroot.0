Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65958CD1288
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 09:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 153CE40204;
	Sat, 30 Mar 2024 09:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HiWBrgHNLRzW; Sat, 30 Mar 2024 09:29:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2116940B66
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2116940B66;
	Sat, 30 Mar 2024 09:29:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 843611BF27C
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 09:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CC0C40B6B
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 09:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pczqN8Ocg-we for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 09:29:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.102;
 helo=smtpcmd02102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A33A240204
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A33A240204
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A33A240204
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 09:29:27 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id qV1grQhVDEmGUqV1grElEH; Sat, 30 Mar 2024 10:29:24 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 10:29:02 +0100
Message-Id: <20240330092902.834778-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBp+LJlu7MTSTLT9lCKY9FIht85NUehYr/FSzrrRPQfcUtVvz7LXOlxnBKNAVtnn5ZNXTWPrI6m97XrtpVFSF0cM78lfX24k3FotQksV+9Ov7J9Zm2As
 c9nB2IbPxcXrheoAPi2uod8SfMr8levM98cqxFYiSTqP2f9wiDTofqwxUxtjUd5W+l5JIDNoRsBSWn6d5t5egWn3njZJyz2R40z6GSZ99ZBCmSpCngrjLvej
 iP1uR3aQJA5MuCKCaNH4d9gV0+cY8VyC9m+F64NxEq8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1711790964; bh=GFq3uO8faIYpnbr9io3dD0fR+oV6ynVTyiBbVHMg61Y=;
 h=From:To:Subject:Date:MIME-Version;
 b=YUf2rMob36sGdzy/EgBg3zODzn9c7E2zmgS+tKsUMhxgnPl0YE8xxIQmnhIhnaVW/
 Oq6k3v1zZooQ0S3KDy4/RfyH69wZSnfc1sox8MZufjfjEvR8q7vZajUyIbpy+Prqxs
 Y38NclsGsJ4uEydwI+EYzU0AJGRcnAd37XkROoqaTErsJEz6E3RkqPx464yRIWh53X
 SNCVPdsa9Xd9L/N0v4F68u6B/lhxiI4PgGcKicb3qxpTq1lO2Pnx/8OtMv39/2huw6
 5jUdJRhRVQE0lvqzGzo5E/Zc5+5PbQea+67hF63jOmIvZqOJY1OS/xFOhJMX068ljC
 eOuZZiS4s6Gag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=YUf2rMob
Subject: [Buildroot] [PATCH] configs/mangopi_mq1rdw1_defconfig: fix build
 failure due to undefined linux headers
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6 to prevent error:
Incorrect selection of kernel headers: expected 6.8.x, got 6.6.x

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278078

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/mangopi_mq1rdw2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/mangopi_mq1rdw2_defconfig b/configs/mangopi_mq1rdw2_defconfig
index a2f8a1299b..2249fa4be5 100644
--- a/configs/mangopi_mq1rdw2_defconfig
+++ b/configs/mangopi_mq1rdw2_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TARGET_GENERIC_HOSTNAME="mangopi-mq1rdw2"
 BR2_TARGET_GENERIC_ISSUE="Welcome to MangoPI MQ1RDW2"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
