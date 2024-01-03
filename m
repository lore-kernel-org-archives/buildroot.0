Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47900C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 19:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B81E54175C;
	Wed,  3 Jan 2024 19:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B81E54175C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A2DiQx9BddNp; Wed,  3 Jan 2024 19:03:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9B75414D1;
	Wed,  3 Jan 2024 19:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9B75414D1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 108501BF5E9
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 19:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D90FB40490
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 19:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D90FB40490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cLWY25YxNeIq for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 19:03:02 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F07E440132
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 19:03:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F07E440132
Received: from fli4l.lan.fli4l (p5b3a0630.dip0.t-ipconnect.de [91.58.6.48])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CA674A4C0C7E;
 Wed,  3 Jan 2024 20:02:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38630)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rL6W2-000000006iw-2HyA;
 Wed, 03 Jan 2024 20:02:58 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 20:02:58 +0100
Message-Id: <20240103190258.2729806-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1704308578;
 bh=TmK1bcIxcqTGVkf+iN1u6jUy2nmPa8G9dX8kZnMv4pQ=;
 h=From:To:Cc:Subject:Date:From;
 b=uw9XOHaLbo8vcVLs1EBuxCobldJg63Y8jAdK9nKaS5GsOWHAJlDqiphVUdpBcAo6s
 RT2asBYRXin9PGYQn/M3ysKOg9t1yDfuHGex2Ia+zLn8ADCAPhOgYqepRidbLXE+b6
 ieKX1RCbKS8SBAeSyVaIChWL54I63eDSOzHu0B4pj24DZ4Uh6g6Q7O0/rKG3OUZJBq
 1YUYVWOjVr5QRAX+9+vB1mmj1frrSQtS76bitEWzjSIcyxRW8Qo+XinulT2BufzXrx
 f/xVrsjZFYLNprYrSu5Dcd7kqV/nil2bNWfgCPpZh3P1HVgDRvis+yDCNalqod+f1e
 Gs9mRqBeKyS6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=uw9XOHaL
Subject: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.97.1
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2023-51766: https://seclists.org/oss-sec/2023/q4/348

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index 6336a40427..a3822302fb 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  428150e67c494fa14fe5195d81b972c1b23e651ee4f9f2ff1788250266d31e9c  exim-4.97.tar.xz
+sha256  bd782057509a793593508528590626d185ea160ce32cb34beda262e99cefdfa9  exim-4.97.1.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  b28cbb49fa7e143dfcc94e004d57cf98a1945013e676cd103c1ee4cf52933d49d378baa13bea2663353dba97745d6b2ab8b7b66cde870788a2d85d7abd716968  exim-4.97.tar.xz
+sha512  eab7ca28b37f1635c48f5e963ab69fcbad539b2c35a84286ecaad7d7ff5210bbefce86452302e08099afdc0710f9cb7ca6d9b152b0ba88a19292f7c5541e0cfc  exim-4.97.1.tar.xz
 # Locally calculated
 sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 1b3295697e..d473ad1dbf 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.97
+EXIM_VERSION = 4.97.1
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
