Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB6CC61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 11:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 386E8600D1;
	Sun,  5 Mar 2023 11:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 386E8600D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cPvf7jO1JKgG; Sun,  5 Mar 2023 11:14:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BD3E606CB;
	Sun,  5 Mar 2023 11:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BD3E606CB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 079E71BF5A5
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 11:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D59738197D
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 11:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D59738197D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cna8ALCbyANn for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 11:14:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 319158190B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 319158190B
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 11:14:20 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.226.240])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 9B2FA19F5BA;
 Sun,  5 Mar 2023 12:14:15 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  5 Mar 2023 12:14:10 +0100
Message-Id: <20230305111410.237442-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1678014857;
 bh=7bIxMw9LPC6Yi3fNmfmDNIMvwbV3i+Pyjj7oeRS9r7I=;
 h=From:To:Cc:Subject:Date:From;
 b=GJn4hMs2Ulbw2ZFGsckwpUnpb+g8kVK7h99atMwJSioR5qV8Tj+MiAG8Rk7K6qGaP
 cvPNeEl8yGueT9yHAQ2DdnayNFITVJ3UxU3po+ArYM8B4KCPDHo81vezsVzKhgHkdT
 kd6gTb9hPbsaN7TfURB08p0fIdmlo40NKYzLaf6ziqnYhBYLDiRPREE2JKFUNGXXUw
 EQjoXpUyU3kqml1IMgK6WeHEwBgEqYnRAKmD7t7J13BR2Z0bRTDrpukYMFktec1+Mq
 2BMzMA26u47ezIpXSlsKtLDDVgpQE5hpKR5G/R2s4dUXBTObw/nQU2pXeGrvwBWxOZ
 /+POutgY/nffQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GJn4hMs2
Subject: [Buildroot] [PATCH next 1/1] package/ddrescue: bump to version 1.27
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

For change log, see the release announce:
https://lists.gnu.org/archive/html/info-gnu/2023-01/msg00011.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch next at commit b793f3a with commands:

    make check-package
    ...
    0 warnings generated

    utils/test-pkg -a -p ddrescue
    ...
    45 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/ddrescue/ddrescue.hash | 4 ++--
 package/ddrescue/ddrescue.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ddrescue/ddrescue.hash b/package/ddrescue/ddrescue.hash
index f7c82b086b..3caec5667f 100644
--- a/package/ddrescue/ddrescue.hash
+++ b/package/ddrescue/ddrescue.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2022-01/msg00013.html
-sha256  e513cd3a90d9810dfdd91197d40aa40f6df01597bfb5ecfdfb205de1127c551f  ddrescue-1.26.tar.lz
+# From https://lists.gnu.org/archive/html/info-gnu/2023-01/msg00011.html
+sha256  38c80c98c5a44f15e53663e4510097fd68d6ec20758efdf3a925037c183232eb  ddrescue-1.27.tar.lz
 # Locally computed
 sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/ddrescue/ddrescue.mk b/package/ddrescue/ddrescue.mk
index 6d16d8701f..f4376a9340 100644
--- a/package/ddrescue/ddrescue.mk
+++ b/package/ddrescue/ddrescue.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DDRESCUE_VERSION = 1.26
+DDRESCUE_VERSION = 1.27
 DDRESCUE_SOURCE = ddrescue-$(DDRESCUE_VERSION).tar.lz
 DDRESCUE_SITE = http://download.savannah.gnu.org/releases/ddrescue
 DDRESCUE_LICENSE = GPL-2.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
