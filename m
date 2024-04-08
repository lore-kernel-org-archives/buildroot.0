Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFCAC67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 17:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 854DD81E1D;
	Mon,  8 Apr 2024 17:13:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k1p0t5FS1_pe; Mon,  8 Apr 2024 17:13:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B0A481EC1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B0A481EC1;
	Mon,  8 Apr 2024 17:13:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 841861BF315
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 17:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7173B409EF
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 17:13:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h2hicbypUT3n for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 17:12:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5C20F400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C20F400E4
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C20F400E4
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 17:12:59 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 56A7FB0057C;
 Mon,  8 Apr 2024 19:12:56 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon,  8 Apr 2024 19:12:50 +0200
Message-ID: <20240408171250.11751-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712596377;
 bh=zSR7l60Sz7HCEBTFVXar2/RGe0sx73PNOlreCflCvRU=;
 h=From:To:Cc:Subject:Date:From;
 b=pgXtk5VLn/01i+PCZbcmaUXEEZJrdF9rcSgEBMi0cSPRoeAYdgamz4LaQj/+bePwM
 cbLhUKu7BXkPio+qCJjt2EOTTmTvyGAd4wu33JIxqWwWhWma674fK7EQ1a5nctsFoO
 D67OwDa9N8U7mH8kUQA7Imm4PtF7pkCu6AgZNOt9driml/k8LnTfDfkt/psHvEKP4X
 xgf9hDtVDXLyU5AqGDE5ta7aUuXQ770qP2klkcn+nqpNPL9bMRRSCNFZaYTe4hjzhs
 EHgs00SHqOED4MlZT7td3hSYuJbFNjrE7tXQCM+CMjhQPBZ4KGk1V8EkvmY6dCSixH
 +dABI6qtUWhIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pgXtk5VL
Subject: [Buildroot] [PATCH 1/1] package/z3: bump to version 4.13.0
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

For change log since 4.12.5, see:
https://github.com/Z3Prover/z3/blob/z3-4.13.0/RELEASE_NOTES.md#version-4130

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/z3/z3.hash | 2 +-
 package/z3/z3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/z3/z3.hash b/package/z3/z3.hash
index e8110991fa1..df78fd8b7da 100644
--- a/package/z3/z3.hash
+++ b/package/z3/z3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  70e211e0a8e77febccc51865e45111066f623356a4ef0b527c3597362bc6db72  z3-4.12.5.tar.gz
+sha256  01bcc61c8362e37bb89fd2430f7e3385e86df7915019bd2ce45de9d9bd934502  z3-4.13.0.tar.gz
 sha256  e617cad2ab9347e3129c2b171e87909332174e17961c5c3412d0799469111337  LICENSE.txt
diff --git a/package/z3/z3.mk b/package/z3/z3.mk
index facbdec486f..e436d48f270 100644
--- a/package/z3/z3.mk
+++ b/package/z3/z3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-Z3_VERSION = 4.12.5
+Z3_VERSION = 4.13.0
 Z3_SITE = $(call github,Z3Prover,z3,z3-$(Z3_VERSION))
 Z3_LICENSE = MIT
 Z3_LICENSE_FILES = LICENSE.txt
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
