Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DDEC3DA7E
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 01:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07F2A606F8;
	Tue, 23 Jul 2024 01:32:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i4Hwo3_NnkQs; Tue, 23 Jul 2024 01:32:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86354607B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86354607B9;
	Tue, 23 Jul 2024 01:32:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 01FF51BF2F4
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 01:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3B0440318
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 01:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ub9qfHVhwLrN for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 01:32:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 973FA40311
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 973FA40311
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 973FA40311
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 01:32:14 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46N1WDkg045011;
 Mon, 22 Jul 2024 20:32:13 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46N1WDmR003437
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 22 Jul 2024 20:32:13 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 Jul 2024 20:32:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 Jul 2024 20:32:13 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46N1WDPd115183;
 Mon, 22 Jul 2024 20:32:13 -0500
Date: Mon, 22 Jul 2024 20:32:08 -0500
MIME-Version: 1.0
Message-ID: <20240722-optee-bump-v1-3-8e25b342634d@ti.com>
References: <20240722-optee-bump-v1-0-8e25b342634d@ti.com>
In-Reply-To: <20240722-optee-bump-v1-0-8e25b342634d@ti.com>
To: <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1721698333;
 bh=O08Fcqcs+KJoevnCHMF6pa9hL+1ENKn5H0qp3laUhlk=;
 h=From:Date:Subject:References:In-Reply-To:To:CC;
 b=l8QTXqKCrO2oNpK2yYMOdxX/eCoxfEJjdM7HoKBeXaa0Och3iYOHrNgUdcr9KLXq0
 FahrUpwUqWgxeVLwPa9DSxajwUodBD7Vz8NZiRxXEcj2qJ29mNGMcn+TBhovu/W9Ry
 84dPU36Ravx72unfwdMQGq520czZpeMn7KDYlRwo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=l8QTXqKC
Subject: [Buildroot] [PATCH 3/4] package/optee-examples: bump to 4.3.0
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Bryan Brattlof <bb@ti.com>, Etienne Carriere <etienne.carriere@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update optee-examples to the latest tagged release

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 package/optee-examples/optee-examples.hash | 4 ++--
 package/optee-examples/optee-examples.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-examples/optee-examples.hash b/package/optee-examples/optee-examples.hash
index a60b6619f14ae..a6ecd2caec545 100644
--- a/package/optee-examples/optee-examples.hash
+++ b/package/optee-examples/optee-examples.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_examples/archive/4.2.0/optee-examples-4.2.0.tar.gz
-sha256  fcc032f84c0c7c90fbc3936c6d4d10e502797da7a7c23780ce2a5a88a720887d  optee-examples-4.2.0.tar.gz
+# From https://github.com/linaro-swg/optee_examples/archive/4.3.0/optee-examples-4.3.0.tar.gz
+sha256  ee1576617365b5fe9d20d72c16cf6b39159eb79b1401189bd37a91ef03371820  optee-examples-4.3.0.tar.gz
 # Locally computed
 sha256  6f1ef8449cb82ae79d2155605f7985bdf0f08e7ab5007de9b4362e8bf28733b9  LICENSE
diff --git a/package/optee-examples/optee-examples.mk b/package/optee-examples/optee-examples.mk
index 7d52a277d2b7e..8eb8724ff626a 100644
--- a/package/optee-examples/optee-examples.mk
+++ b/package/optee-examples/optee-examples.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_EXAMPLES_VERSION = 4.2.0
+OPTEE_EXAMPLES_VERSION = 4.3.0
 OPTEE_EXAMPLES_SITE = $(call github,linaro-swg,optee_examples,$(OPTEE_EXAMPLES_VERSION))
 OPTEE_EXAMPLES_LICENSE = BSD-2-Clause
 OPTEE_EXAMPLES_LICENSE_FILES = LICENSE

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
