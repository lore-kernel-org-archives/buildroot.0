Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EEFC369C2
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 16:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 698B442DB2;
	Fri, 25 Apr 2025 16:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 61VFvEie92xg; Fri, 25 Apr 2025 16:34:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94D9A42D5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94D9A42D5C;
	Fri, 25 Apr 2025 16:34:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B096159
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E594C42D56
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ulUcfGy_l_46 for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 16:34:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1B2D042D5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B2D042D5C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B2D042D5C
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:34:29 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E67E2B00548;
 Fri, 25 Apr 2025 18:34:25 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
	Julien Olivain <ju.o@free.fr>
Date: Fri, 25 Apr 2025 18:34:21 +0200
Message-ID: <20250425163421.1719483-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745598868;
 bh=8PV911qXDZqpI0qMaVwprGXf6hcMZsiS+2rgQqeQF9g=;
 h=From:To:Cc:Subject:Date:From;
 b=it4BSR0Tl5yz1mRs+ttWchtLYmExqHrPRK5HO+1m6P6WSgeZCXBqEXXofuxqgQSm4
 axI0B9xVdK1ULz2hS00feU2DvZLVrRi3te/j4mzZI3TPGZ6Oh3U8ungQ3yW0lkBlq5
 1nNj16+5DuzFi+UzngRbx8Ihr53dFVJMyH1/kG7ORaOhoGv2FOKEibn31HPdR+CI3W
 /DF5dm4QwjUbU6G8VF77dP3YMFnEHrniovUDiDC1haHR2uXa3i1fflyE7TeC1Gh6sC
 QhnJbIzI3WglTK7sJB5yKxyUpgXjZkxs62LriQAcbS51SLCqgngyeKrTnbi9ZJf/EO
 /yjgl73rH5e4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=it4BSR0T
Subject: [Buildroot] [PATCH 1/1] package/blake3: bump version to 1.8.2
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

For release notes since 1.5.4, see:
https://github.com/BLAKE3-team/BLAKE3/releases

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/blake3/blake3.hash | 2 +-
 package/blake3/blake3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/blake3/blake3.hash b/package/blake3/blake3.hash
index 9c3792edf6..6bcfefb2b8 100644
--- a/package/blake3/blake3.hash
+++ b/package/blake3/blake3.hash
@@ -1,5 +1,5 @@
 # sha256 computed locally
-sha256  ddd24f26a31d23373e63d9be2e723263ac46c8b6d49902ab08024b573fd2a416  blake3-1.5.4.tar.gz
+sha256  6b51aefe515969785da02e87befafc7fdc7a065cd3458cf1141f29267749e81f  blake3-1.8.2.tar.gz
 sha256  00fcc7a934ddbc9ece2a7cc063ac788e284b703b1d705ccbba72d462aa97921e  LICENSE_A2
 sha256  a5695f57ea0c221e0e8b7d784ff774c35e88c3d3270353646a925880bb3492cc  LICENSE_A2LLVM
 sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENSE_CC0
diff --git a/package/blake3/blake3.mk b/package/blake3/blake3.mk
index f8ef2386f5..9d1323192c 100644
--- a/package/blake3/blake3.mk
+++ b/package/blake3/blake3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BLAKE3_VERSION = 1.5.4
+BLAKE3_VERSION = 1.8.2
 BLAKE3_SITE = $(call github,BLAKE3-team,BLAKE3,$(BLAKE3_VERSION))
 BLAKE3_SUBDIR = c
 BLAKE3_LICENSE = Apache-2.0 or Apache-2.0 with exceptions or CC0-1.0
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
