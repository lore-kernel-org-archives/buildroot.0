Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CADBC52D6F
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 19:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D884A40196;
	Tue,  6 Aug 2024 19:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e6xChGh4LkPP; Tue,  6 Aug 2024 19:25:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92FD3402B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92FD3402B0;
	Tue,  6 Aug 2024 19:25:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 81D5C1BF28D
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 19:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CAFE60656
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 19:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nF8MHDe_wK72 for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 19:25:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5D13760640
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D13760640
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D13760640
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 19:25:43 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E5F5EB0054E;
 Tue,  6 Aug 2024 21:25:39 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  6 Aug 2024 21:25:24 +0200
Message-ID: <20240806192524.180436-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1722972341;
 bh=TIE7kaQErds1RNpx1QM22ygXlyfTb4I2kKvyKgLibkY=;
 h=From:To:Cc:Subject:Date:From;
 b=Ye2qpniRCP/u+EO3wZ4StiALHEpGesxfpQmIchMu7vmbI9lwop4HSh+7E7CrP8NN6
 LCbTGWt4OI8kIRcEwhjzBySzv9xCGffOve9Hij8NgJhQ1nIofvtKXPDNqkZRh++4hF
 rcN1ceVs+0xSBjD1BtVZpYpvdf9GAHBjFFoYeUqwHV31L7hWtncgnLVSRFDPaA+0hI
 ny7Z5GV8DD1Eo6hSNYHUz4BjR0M4yqigbxm8VJUUsFPrS2Er8MPVkU+e2OBK52NkXG
 czGcy7jy0SQYwttcLS0FPtVYjv/h0hXYnoijnHeNkexPtffSwpB6XA73W5bBJOKnqq
 ym7k/vQ8E404Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ye2qpniR
Subject: [Buildroot] [PATCH 1/1] package/swipl: bump version to 9.2.6
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

For change log, see:
https://www.swi-prolog.org/ChangeLog?branch=stable&from=9.2.0&to=9.2.6

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/swipl/swipl.hash | 2 +-
 package/swipl/swipl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swipl/swipl.hash b/package/swipl/swipl.hash
index 9f980654ba..98611ffcda 100644
--- a/package/swipl/swipl.hash
+++ b/package/swipl/swipl.hash
@@ -1,4 +1,4 @@
 # From https://www.swi-prolog.org/download/stable
-sha256  10d90b15734d14d0d7972dc11a3584defd300d65a9f0b1185821af8c3896da5e  swipl-9.2.0.tar.gz
+sha256  0cb9b80b9922be8165cbac384ebe050d94553e72cf7aebfc980b4395ff01d05d  swipl-9.2.6.tar.gz
 # Locally calculated
 sha256  770594d0f4463b71f1485f00e4bc5cf4b6f667d62ef6bc9bde2fee236541992a  LICENSE
diff --git a/package/swipl/swipl.mk b/package/swipl/swipl.mk
index d4263a6aa8..9ba841084e 100644
--- a/package/swipl/swipl.mk
+++ b/package/swipl/swipl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWIPL_VERSION = 9.2.0
+SWIPL_VERSION = 9.2.6
 SWIPL_SITE = https://www.swi-prolog.org/download/stable/src
 SWIPL_LICENSE = BSD-2-Clause
 SWIPL_LICENSE_FILES = LICENSE
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
