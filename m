Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3849FC6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 10:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA82340578;
	Tue, 26 Mar 2024 10:26:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g9Y0lLOcWPrU; Tue, 26 Mar 2024 10:26:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C86A340ADF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C86A340ADF;
	Tue, 26 Mar 2024 10:26:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 889E01BF95F
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 10:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75BBE608F7
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 10:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q72NOQSzKvMn for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 10:26:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.130;
 helo=mout.kundenserver.de;
 envelope-from=thomas.claveirole@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EB75860673
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB75860673
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB75860673
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 10:26:51 +0000 (UTC)
Received: from houde.tangerine ([185.213.154.234]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1Ma1kC-1sL18G4BUa-00VyvT; Tue, 26 Mar 2024 11:26:49 +0100
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 11:26:35 +0100
Message-ID: <20240326102635.273072-2-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240326102635.273072-1-thomas.claveirole@green-communications.fr>
References: <20240326102635.273072-1-thomas.claveirole@green-communications.fr>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ZLUy428WcVjnO/mN2SLM4yRmknc90h7P5ZaDloWykKHPaknDOJ3
 cE1WJ2mQRca6AwyJl09dzlXWPOipEPN71BAO57FYvQ91MDvYuYIVyiAMj63BWxFXZ4bCkWt
 BLVMgle6Z6rT7KXTGjBuJqzYVegu9hr2xdjgpXUDc6JQR1GHMkPmmf2ro7pc4FRtnwvqybP
 e/021Gj30GQ+++xyFT5Og==
UI-OutboundReport: notjunk:1;M01:P0:AlNt+oMTuAA=;Z263suFOdQktzSA08mVgrAKMQAY
 A7uJ8Hr+7+ONYlqnitzxyEBRYhlS2IZjmY2FFJhRqzSoRzPnffrAJzxVqy/E4iRdC1D8HqxoM
 KFY1fC2tAZuSG7JIF4rR/SqkYVLNCzfpvMJkun5xlDoabhbqKJxBMK2gB59qXNG0xTsQiLC51
 mEbef6S/6/2/1At58WvttKaMGto0+V06Yoeu8uAxKYC7iGVz1logzdSw/8MB9G50HPJDdLXsy
 +5HAtykX656eyc1g9M9r0YEhYFahfwQRWH+xC5Rv4OKn69fIItixvQAottHaYS8Id+xPMYyYq
 BxUAugxf4WFlXqpvIXIFqy+njS9hegmbDGz9INI2+ZqJNf4goDClh7Nto7ugxW5y5xf2VrGrm
 2wjUCdMb9cmY9H4BrStHwukDFETBNURxfONVqNa4VMZdx3JSShJUgTOzkGWILsbsYyPAu2m+e
 TCoyMoU+HQuHkzN9XtaTP9Cry2Cs4Vx4P7uvptqDDVaglDJPK8rOvrP+fCV5cqxqWivs3Ne5j
 u++WWhZBYqqxyJSQ59uuc4FG/A1mwWJ+o/qcY0RyEabSO+FqoZH1y1OKMVDpHSxOygu40Q9DB
 WvAO591Bz7KNUWkEX+wkC6d1UNKD5fsT5YaDO6xx27MMMnZ6tBgK4K4axISXR7tAnUVBJlD/H
 ZNFxr8/qMRolvTinoCzrtqY/s6yhUPaM7CJPeplUdjfe1xV5aGrGaTnyrxOeiWEYoBwNOT59L
 DJpIHFYJBM509/Jaueo8dxO3+4EKaOQRd1MpuJmOQy80GEt1JYza2o=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 2/2] package/vuejs-router: bump to version 4.3.0
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/vuejs-router/vuejs-router.hash | 2 +-
 package/vuejs-router/vuejs-router.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vuejs-router/vuejs-router.hash b/package/vuejs-router/vuejs-router.hash
index f87d18f7ed..38f0bb5b8b 100644
--- a/package/vuejs-router/vuejs-router.hash
+++ b/package/vuejs-router/vuejs-router.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  61dc033860c42a2f3af046d461ef14348b1fe9094b27d107f7be6d1420d39b11  vue-router-4.2.5.tgz
+sha256  466a762bd6e9fb0e1ec33dca0b0ed3ecf31f25186e7ef03906716d69e9ecf3c7  vue-router-4.3.0.tgz
 sha256  91a2845c4db44e7497b514b98634a674c737986ad0db81599307cf733bf850b2  LICENSE
diff --git a/package/vuejs-router/vuejs-router.mk b/package/vuejs-router/vuejs-router.mk
index 7f73fed5d5..1aa1372638 100644
--- a/package/vuejs-router/vuejs-router.mk
+++ b/package/vuejs-router/vuejs-router.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_ROUTER_VERSION = 4.2.5
+VUEJS_ROUTER_VERSION = 4.3.0
 VUEJS_ROUTER_SOURCE = vue-router-$(VUEJS_ROUTER_VERSION).tgz
 VUEJS_ROUTER_SITE = https://registry.npmjs.org/vue-router/-
 VUEJS_ROUTER_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
