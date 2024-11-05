Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B46FD31769
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 17:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3123C60878;
	Tue,  5 Nov 2024 17:14:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-sNSBeuwqXo; Tue,  5 Nov 2024 17:14:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4756E60879
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4756E60879;
	Tue,  5 Nov 2024 17:14:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B23123B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FAD940A47
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i127TF8pndIm for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 17:14:51 +0000 (UTC)
X-Greylist: delayed 310 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 05 Nov 2024 17:14:50 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0939D40A51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0939D40A51
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.133;
 helo=mout.kundenserver.de;
 envelope-from=thomas.claveirole@green-communications.fr; receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0939D40A51
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:14:50 +0000 (UTC)
Received: from houde.tangerine ([185.213.154.168]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1MnpP8-1taaLB2Jpa-00h2XP; Tue, 05 Nov 2024 18:09:47 +0100
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue,  5 Nov 2024 18:09:20 +0100
Message-ID: <20241105170920.214977-2-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241105170920.214977-1-thomas.claveirole@green-communications.fr>
References: <20241105170920.214977-1-thomas.claveirole@green-communications.fr>
MIME-Version: 1.0
X-Provags-ID: V03:K1:L0n0cCxkz7oQbyp6cxjqvHKmpNB1rZrgKY58GvwTpdcx7gUQUVQ
 lznmSKf2bCmW+z5N6kK6EdcZMuZsaSH7UherqGz7XQlN9fKDQdCVgp3ZVRRYjczgVgpyRL4
 t7p2A616+4L1Ad6tiaDEWG+//BYcnG6P/SwcoHglqdkrwwfNN/Me2kePstVHze8Ndd+bS1c
 y3IQVmuIDMLPeuKhVuXJA==
UI-OutboundReport: notjunk:1;M01:P0:bSnhz3Swdq8=;lEB1gS7z3VQcl2lj/xJUN364XwA
 1DEle7RQrNUG4Qoybi4crnVXIbbi86OzHGf9WCIeCSdDeVszmpie+O5LgAdWGyM5PcWNK6R5Q
 58j31kciPRFIFjaJtIy7a7Gf1xRRkWpGpUwhYVNXo6pXfagC6MzzI7AsgxVDdJoY6a900unQ/
 HVEe+7B+82wjRW/lv5uzP2T8pXlVmm0yaVaZDAP017O1QcDimHeGiEQzyRtAA/bPxIz/DI7YT
 +8AQxgi5FBEjW6Eo3Ce5qPk2Z4L5LDYeImIPQ7C2Jhio9KCFJnq/WZ4GFHPljt/8pcMRlOWlz
 lnZlk/soNQQ9Fk6yXNAt7ExTQuabsQ/qPhWkQP7Wic88EZAPEVlhjH4XM91TkeusP1I3fmTrN
 lsmFlbtvM9tmbShER0y7I/bdJeaCbmTwC6ruRQYX9R/YhbRxhL3VblZG0Fmvq/uqoaAHgTp2o
 mgBQklRNC+3tfcin/acgkvHGOH5afyYpd3mq/bxslqHQqPdCmjg/RZRemTb1FLPOKFxcZbZrr
 5FpWnDYFfnza6bVQdc76w2VPhTX9/h1eGdym22AykJIxTCxAJou7kC8jGkQcyxqXGG2eI3CSS
 mfsry/rKOii/HgxDAuXmG2jRq+9Yh51ndTRVfAlPAL/RUfwrKpyGqt+HX1rE9DCoS2aGxWB/s
 A53RZvXkIKxXQLgtGYmhL4AWIO2Jc60whE1HZ/Dt7SIh994Sl8RNylJywo8XjShfQtfmwCkQ4
 pgUOfnb8KEjduagD/htjTWBxWYTjUglxw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 2/2] package/vuejs-router: bump to version 4.4.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
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
index e297667f4c..83c14e8823 100644
--- a/package/vuejs-router/vuejs-router.hash
+++ b/package/vuejs-router/vuejs-router.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ad4999f6c346053d93e9e600a69162c52759b1db3aa9a09ef4e9d2d8ffb2d167  vue-router-4.4.0.tgz
+sha256  7f114198b1efb7635c281cb191948f6ed1cecfa9a9e9be2c14d5356cd624eb60  vue-router-4.4.5.tgz
 sha256  91a2845c4db44e7497b514b98634a674c737986ad0db81599307cf733bf850b2  LICENSE
diff --git a/package/vuejs-router/vuejs-router.mk b/package/vuejs-router/vuejs-router.mk
index fb352fd1bd..7de4864d3f 100644
--- a/package/vuejs-router/vuejs-router.mk
+++ b/package/vuejs-router/vuejs-router.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_ROUTER_VERSION = 4.4.0
+VUEJS_ROUTER_VERSION = 4.4.5
 VUEJS_ROUTER_SOURCE = vue-router-$(VUEJS_ROUTER_VERSION).tgz
 VUEJS_ROUTER_SITE = https://registry.npmjs.org/vue-router/-
 VUEJS_ROUTER_LICENSE = MIT
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
