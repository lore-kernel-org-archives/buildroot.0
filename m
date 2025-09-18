Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BE0CAC59A
	for <buildroot@archiver.kernel.org>; Thu, 18 Sep 2025 18:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66BCE81D9F;
	Thu, 18 Sep 2025 18:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T2ehiZ6J4G-t; Thu, 18 Sep 2025 18:48:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A93581DA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A93581DA0;
	Thu, 18 Sep 2025 18:48:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C8F61E3
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 18:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DF6F40217
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 18:48:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HG7_nDVOyRvU for <buildroot@buildroot.org>;
 Thu, 18 Sep 2025 18:47:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BACD640216
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BACD640216
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BACD640216
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 18:47:58 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:7427:ac55:2702:f075])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 7B0C45FFB1;
 Thu, 18 Sep 2025 20:47:53 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Thu, 18 Sep 2025 20:47:48 +0200
Message-ID: <20250918184748.407199-1-ju.o@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758221274;
 bh=DokRPh2yomBiqrXfwMJjJzvAe8UBd0CUprBd7KpQIhw=;
 h=From:To:Cc:Subject:Date:From;
 b=oMWzl9zDOWxIO7eTXp4jP8VbxtVRANdqU3Etde1rb+i+aG7N3XjEunKqXWSG/VWHT
 AOSBhJsODnegqiiw8yDul6eAZIR0xzeAoyVfTDlFYyYCpOgl+dpF0KIAWY9edMqG2Q
 Sq/YNLqXyQ7HDAVWEH0i0hni6BeaM56SKDbUaxmHimpsuAyP4ihzUUA1K1PXptRLSe
 FApQAHCTV+2o1ZvqMG9XnIRQ2k64WuKb1yvUt2HkX3NIn6uksL3ymQd2QmBw54fFEY
 1aAT+pR1orzm1O8Kaa1HRo7n5aboWf9W/1h4BU2TVURBg2LnNjZY5ov5Ml6cTsfo64
 FSKEcp5wDEA/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=oMWzl9zD
Subject: [Buildroot] [PATCH 1/1] package/tig: bump to version 2.6.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 2.5.12, see:
https://github.com/jonas/tig/releases/tag/tig-2.6.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/pipelines/2048008611
---
 package/tig/tig.hash | 4 ++--
 package/tig/tig.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tig/tig.hash b/package/tig/tig.hash
index 4329723f9e..e234a329be 100644
--- a/package/tig/tig.hash
+++ b/package/tig/tig.hash
@@ -1,6 +1,6 @@
 # From:
-# https://github.com/jonas/tig/releases/download/tig-2.5.12/tig-2.5.12.tar.gz.sha256
-sha256  5dda8a098810bb499096e17fc9f69c0a5915a23f46be27209fc8195d7a792108  tig-2.5.12.tar.gz
+# https://github.com/jonas/tig/releases/download/tig-2.6.0/tig-2.6.0.tar.gz.sha256
+sha256  99d4a0fdd3d93547ebacfe511195cb92e4f75b91644c06293c067f401addeb3e  tig-2.6.0.tar.gz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/tig/tig.mk b/package/tig/tig.mk
index 58084bc758..b6a7ddf9de 100644
--- a/package/tig/tig.mk
+++ b/package/tig/tig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIG_VERSION = 2.5.12
+TIG_VERSION = 2.6.0
 TIG_SITE = https://github.com/jonas/tig/releases/download/tig-$(TIG_VERSION)
 TIG_LICENSE = GPL-2.0+
 TIG_LICENSE_FILES = COPYING
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
