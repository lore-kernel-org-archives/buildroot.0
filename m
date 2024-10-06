Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8177CFB43F
	for <buildroot@archiver.kernel.org>; Sun,  6 Oct 2024 07:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A102402C9;
	Sun,  6 Oct 2024 07:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xgL5CXa3_OUS; Sun,  6 Oct 2024 07:36:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEDB94037A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEDB94037A;
	Sun,  6 Oct 2024 07:36:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 372881BF48C
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 07:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31C454037A
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 07:36:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOfNNL1aL8Yu for <buildroot@lists.busybox.net>;
 Sun,  6 Oct 2024 07:36:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D027C402C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D027C402C9
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D027C402C9
 for <buildroot@buildroot.org>; Sun,  6 Oct 2024 07:36:50 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 91B39B00563;
 Sun,  6 Oct 2024 09:36:46 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  6 Oct 2024 09:36:39 +0200
Message-ID: <20241006073639.170430-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1728200207;
 bh=2wDOIG5F04OIB72iLczTAI1H03mev0J6/XhKDnI+AeE=;
 h=From:To:Cc:Subject:Date:From;
 b=iaHaGAlqOkBx58obAw0yT97tNviBcaWsSMpMHfi7+pczoUCWHrVYNXs47bhDgfe30
 DsegmAgsMDAKh6sY9ueT3NJPjv/JLV8OCPLjR4lVmBpR3AZq5m2diD0XyIsHJypeeu
 U4/+e3i0+3RY4fAGBxcXRjMYx9OSX4BRJs6TS1SgTLFK7vCVJHEbVUtRwWkCsd6hAF
 WtJuvedMw4L/kEpDAHT1UbuO1YflnD8M2obGTrv2ipGc98lb2sRDrVVPK+iyWRQCtg
 S9aD6pJNeImLLUJmG5NDdVJ3+7RKI8J4KuKziu99Dv6fnmpB1s1SgVeayMm7gh5LTJ
 qYGbuXUJlDHTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iaHaGAlq
Subject: [Buildroot] [PATCH 1/1] package/swipl: bump version to 9.2.7
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

For change log since version 9.2.6, see:
https://www.swi-prolog.org/ChangeLog?branch=stable&from=9.2.6&to=9.2.7

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8003804145
---
 package/swipl/swipl.hash | 2 +-
 package/swipl/swipl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swipl/swipl.hash b/package/swipl/swipl.hash
index 98611ffcda..36e27cef2d 100644
--- a/package/swipl/swipl.hash
+++ b/package/swipl/swipl.hash
@@ -1,4 +1,4 @@
 # From https://www.swi-prolog.org/download/stable
-sha256  0cb9b80b9922be8165cbac384ebe050d94553e72cf7aebfc980b4395ff01d05d  swipl-9.2.6.tar.gz
+sha256  fd4126f047e0784112741a874e2f7f8c68b5edd6426ded621df355c62d18c96f  swipl-9.2.7.tar.gz
 # Locally calculated
 sha256  770594d0f4463b71f1485f00e4bc5cf4b6f667d62ef6bc9bde2fee236541992a  LICENSE
diff --git a/package/swipl/swipl.mk b/package/swipl/swipl.mk
index 595f5e975b..ba33b1b1c3 100644
--- a/package/swipl/swipl.mk
+++ b/package/swipl/swipl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWIPL_VERSION = 9.2.6
+SWIPL_VERSION = 9.2.7
 SWIPL_SITE = https://www.swi-prolog.org/download/stable/src
 SWIPL_LICENSE = BSD-2-Clause
 SWIPL_LICENSE_FILES = LICENSE
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
