Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836C7C67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 17:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2455D81E77;
	Mon,  8 Apr 2024 17:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3JAXxaTLX7SP; Mon,  8 Apr 2024 17:08:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F41581F13
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F41581F13;
	Mon,  8 Apr 2024 17:08:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 066CB1BF315
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 17:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3CE5403C1
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 17:08:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WqS0-doQMoEJ for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 17:08:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9606E40812
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9606E40812
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9606E40812
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 17:08:21 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C574AB00579;
 Mon,  8 Apr 2024 19:08:16 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon,  8 Apr 2024 19:08:11 +0200
Message-ID: <20240408170811.9572-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712596097;
 bh=V/zWnpViYpFgG03KzPQatY80nXkmcQOtQNtlGsv3iUQ=;
 h=From:To:Cc:Subject:Date:From;
 b=qdDR/RVg0Km/v8q2r1YJh7Z0ERIuLeFP54PlGO98EcP/HJ/JYf2h639W9ZoA3sy2k
 w4ApYmH0zYVJpg7O4QFOOR/J2BkH7MkSW2zRIQXgs6W5AUZY36xEOHu7va0WkWPNmx
 qQD3X5sZWBxHL7GBazDdw7FCkiBDUyIG+bsuW3y8UBApm8TSZY9tfS9iKEfAS3DJj/
 cHGhu0rxwaaOsu0sJoSY8GEjzfqjeeDVyzFSiws92HNkXG/tp9YWxnUG+aZRXaVfo7
 J8OsnSiWrvpUh7GzzzGutWf9W/1++sQB3DdiYGueO1Cn+GGzplxwRDzee9293u1L10
 99Ycu5KdSsaWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qdDR/RVg
Subject: [Buildroot] [PATCH 1/1] package/opencsd: bump to version 1.5.2
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
https://github.com/Linaro/OpenCSD/blob/v1.5.2/README.md?plain=1#L323

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/opencsd/opencsd.hash | 2 +-
 package/opencsd/opencsd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opencsd/opencsd.hash b/package/opencsd/opencsd.hash
index 6295f32051a..43a5a38683e 100644
--- a/package/opencsd/opencsd.hash
+++ b/package/opencsd/opencsd.hash
@@ -1,3 +1,3 @@
 # Locally Computed:
-sha256  11ef93c0ee57203e620cf7c58b7b7cae00b267a2b57948a511da01c4161775e3  opencsd-1.5.1.tar.gz
+sha256  ef27fe6afa6402b051aeae5c2827fa6d8c2d174170a5dc244f7f721db6908219  opencsd-1.5.2.tar.gz
 sha256  980eef4b0744e63834e3ec0d50c2a4ff6d81d7ec62dd8ba8c66acae0ec5a2e88  LICENSE
diff --git a/package/opencsd/opencsd.mk b/package/opencsd/opencsd.mk
index cc3538ef281..8aafeeaad57 100644
--- a/package/opencsd/opencsd.mk
+++ b/package/opencsd/opencsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCSD_VERSION = 1.5.1
+OPENCSD_VERSION = 1.5.2
 OPENCSD_SITE = $(call github,Linaro,OpenCSD,v$(OPENCSD_VERSION))
 OPENCSD_LICENSE = BSD-3-Clause
 OPENCSD_LICENSE_FILES = LICENSE
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
