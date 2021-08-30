Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E695C432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 11:25:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A03F76112F
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 11:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A03F76112F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=green-communications.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6211C401AF;
	Mon, 30 Aug 2021 11:25:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id au-0mhGYM4Mm; Mon, 30 Aug 2021 11:25:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8936B401C0;
	Mon, 30 Aug 2021 11:25:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F0501BF39C
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 11:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F2D7607AB
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 11:25:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fAgrRaPr4bJS for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 11:25:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC25F607B4
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 11:25:14 +0000 (UTC)
Received: from houde.tangerine ([185.65.135.179]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1MI4cT-1mG3FX0B0B-00FEnz; Mon, 30 Aug 2021 13:25:12 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Mon, 30 Aug 2021 13:24:31 +0200
Message-Id: <20210830112431.144659-2-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210830112431.144659-1-thomas.claveirole@green-communications.fr>
References: <20210830112431.144659-1-thomas.claveirole@green-communications.fr>
MIME-Version: 1.0
X-Provags-ID: V03:K1:wsqm7pBBtuwxZmdVf7PFJKM41nIZqvadDY2Hpl/XS1VeWDF60Od
 yPNl25RUG138Ncjl0iCZv5VGhb35eEpPf+d47B0F9EKBkQ2JJS5VQc6Aoa9rNz8Fvgb0Mgp
 QKxxfJTvqV3oXtAEuGFdooubEDaOAU2G/djkR8dL8F5eFTXr7R0gNQMTZWzd2y3kFb1Rrod
 3CX1/hlur2zVZafa5E8Vg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0NYDIzYCOq0=:jZjQNAbezAG7g+KWOf5KNx
 Fv/O0In5ijJ+TJp14/Msk0BI6IfvB3zyXou4YMRZUnuHjbvRVX+uDz7Nkw1tJ3EKjxvwKgpvQ
 c4KyrDg7BL9U/ve7PQVT17Jc8Z/Swg9OJuGo0e1evA7kgXTAd6jjqu+vBr02qv/AMLiA2NOg9
 oi3EbYZSg2yHxkFYEqaB/3pygf4NtZA0Q7Oi8S3ai10/WMdOWwUN7y0uUHLI1jzwbY7Fd7Emh
 MWcBS9wah2Q4Ne1DXwoMt3aUEkvoY0Z21+qaDTza4gF6++37DERYwKE597kmHa3DvETDUf74/
 sWd0CpZ6VwA16FKRptFe/TuW9rjTAYcq3LFtb64Z3Gl8yAvte3G4M2bi4s40mysXhCgbrdsNk
 uYbukQHie31oWZbxl8hDy9SKgMaNmLvKZU3V1j8CIX/VuI774vVaCzL0ByyVTaLME9dKwvvlG
 TNTbGj4y5GUhxZUNdDo0nGVK54JExEhjf6n51QpBmqWwSHcV4rAx+Qpw5CtpzzYk6fEk0DCzI
 JVnsNRQUUpVjTFhnoayC4F0FBwFfevRqg/Qyos1OSYu71n5MKdKI/mn0sEYglhw1Bv/vDFXZv
 c8SIvlY6uG//ZbS+xZFygvRUfV7bqmM3b+yvX/s0Rqhnds1AtvJ4I2udGykzhLq/A1I4xBwCL
 8Pk8LCVam+FHv6G9XWd+oo8GkeD13TvJIYvNdvZmlKoaU8VjPa7jCiNzJE3A18DGGRKbVCGFP
 gtPcRCynUb0nTB+UPtL6nPqaFDgvOzPqlhBgWmtCIzyNo6xtYKnLI3PJWun/kKLbBCrxp7+nD
 x6r5krh
Subject: [Buildroot] [PATCH] package/vuejs-router: bump version to 4.0.11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/vuejs-router/vuejs-router.hash | 2 +-
 package/vuejs-router/vuejs-router.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vuejs-router/vuejs-router.hash b/package/vuejs-router/vuejs-router.hash
index 62b16505ea..1e5f850ca6 100644
--- a/package/vuejs-router/vuejs-router.hash
+++ b/package/vuejs-router/vuejs-router.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d85cb70686cad36a087ad9586f1839c9997f707eb0065445fb1ea3d9218494f6  vue-router-4.0.10.tgz
+sha256  317ae9b916b9a8c5ec521697c345bef15759887d63342ddf19c18ff05ca279b9  vue-router-4.0.11.tgz
 sha256  9c0015250f592a09d7787efc07152afcf661fff6bda2554359f6d00987828c02  LICENSE
diff --git a/package/vuejs-router/vuejs-router.mk b/package/vuejs-router/vuejs-router.mk
index 60e751e1d1..3f6bcc5067 100644
--- a/package/vuejs-router/vuejs-router.mk
+++ b/package/vuejs-router/vuejs-router.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_ROUTER_VERSION = 4.0.10
+VUEJS_ROUTER_VERSION = 4.0.11
 VUEJS_ROUTER_SOURCE = vue-router-$(VUEJS_ROUTER_VERSION).tgz
 VUEJS_ROUTER_SITE = https://registry.npmjs.org/vue-router/-
 VUEJS_ROUTER_LICENSE = MIT
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
