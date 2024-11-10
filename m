Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D3AD12D55
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 21:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43FFC40261;
	Sun, 10 Nov 2024 21:42:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46fJys2c4mRh; Sun, 10 Nov 2024 21:42:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18AC64023F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18AC64023F;
	Sun, 10 Nov 2024 21:42:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 48FD8D8F
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 21:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 291654023E
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 21:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S2pK3T7NjQGm for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 21:41:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F37254023C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F37254023C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F37254023C
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 21:41:58 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 72209B0051B;
 Sun, 10 Nov 2024 22:41:53 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
	Julien Olivain <ju.o@free.fr>
Date: Sun, 10 Nov 2024 22:41:46 +0100
Message-ID: <20241110214146.741778-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731274916;
 bh=wqceGHxhhZJPrJyZzNBRCNCyZVFCAeZog6053lx7Lbo=;
 h=From:To:Cc:Subject:Date:From;
 b=TwqFrJO4c5qaZ1nkf/R8J4zB3UO74ZzFtwgofuzIiVByUfJuigS4BtldBajvIfnuG
 t9BBLsTn00tFiAJNjqA2f4RHnk0eUMYuolcCmXoIicQt66zNZBagzfQicXcUEUQTfj
 jPKBx7UMhi3SsIGDoPqH7ziLbnd7ymFgMiphuMGDvLVrOnLAgYzXkRDItevFAOveA+
 z0AISGwKsrNvCfWRrbk7PMBfJACxO7xza95qn08U+Z7DAwTkdrmPE2COVAactH9NnV
 yEHmNrXqq48fCb91aH358ZQIFgNcscNznXKaSACMnwjlOVXSmS01133yKdhy7cEPWf
 rnqT4ePDvIa+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TwqFrJO4
Subject: [Buildroot] [PATCH 1/1] package/blake3: bump version to 1.5.4
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

For change log since 1.5.1, see: [1] [2] [3].

Also, v1.5.2 added the new license "Apache-2.0 with (LLVM)
exceptions". The initial LICENSE file was split in three
different files (one file per license). See [4] [5].
This commit updates _LICENSE, _LICENSE_FILES and the hash
file accordingly.

[1] https://github.com/BLAKE3-team/BLAKE3/releases/tag/1.5.2
[2] https://github.com/BLAKE3-team/BLAKE3/releases/tag/1.5.3
[3] https://github.com/BLAKE3-team/BLAKE3/releases/tag/1.5.4
[4] https://github.com/BLAKE3-team/BLAKE3/commit/bb8761256a6a6144f330907b74c80f0ed0ecab4a
[5] https://github.com/BLAKE3-team/BLAKE3/commit/0b2c630cc5c59ac76a184cdc9540092a97d33e7f

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/blake3/blake3.hash | 6 ++++--
 package/blake3/blake3.mk   | 6 +++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/blake3/blake3.hash b/package/blake3/blake3.hash
index 2a00d19b02..9c3792edf6 100644
--- a/package/blake3/blake3.hash
+++ b/package/blake3/blake3.hash
@@ -1,3 +1,5 @@
 # sha256 computed locally
-sha256  822cd37f70152e5985433d2c50c8f6b2ec83aaf11aa31be9fe71486a91744f37  blake3-1.5.1.tar.gz
-sha256  6a94bedb8b707ed97f6e310d0d015ab14e0683ffa0a612b02958581b9cc9fc0e  LICENSE
+sha256  ddd24f26a31d23373e63d9be2e723263ac46c8b6d49902ab08024b573fd2a416  blake3-1.5.4.tar.gz
+sha256  00fcc7a934ddbc9ece2a7cc063ac788e284b703b1d705ccbba72d462aa97921e  LICENSE_A2
+sha256  a5695f57ea0c221e0e8b7d784ff774c35e88c3d3270353646a925880bb3492cc  LICENSE_A2LLVM
+sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENSE_CC0
diff --git a/package/blake3/blake3.mk b/package/blake3/blake3.mk
index 3b1ccb44cc..f8ef2386f5 100644
--- a/package/blake3/blake3.mk
+++ b/package/blake3/blake3.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-BLAKE3_VERSION = 1.5.1
+BLAKE3_VERSION = 1.5.4
 BLAKE3_SITE = $(call github,BLAKE3-team,BLAKE3,$(BLAKE3_VERSION))
 BLAKE3_SUBDIR = c
-BLAKE3_LICENSE = Apache-2.0, CC0-1.0
-BLAKE3_LICENSE_FILES = LICENSE
+BLAKE3_LICENSE = Apache-2.0 or Apache-2.0 with exceptions or CC0-1.0
+BLAKE3_LICENSE_FILES = LICENSE_A2 LICENSE_A2LLVM LICENSE_CC0
 
 # The package is a dependency to ccache so ccache cannot be a dependency
 HOST_BLAKE3_ADD_CCACHE_DEPENDENCY = NO
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
