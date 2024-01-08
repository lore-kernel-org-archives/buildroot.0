Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4810C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 12:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92FBA416DA;
	Mon,  8 Jan 2024 12:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92FBA416DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KEg5y1IDz6se; Mon,  8 Jan 2024 12:59:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E565B416C6;
	Mon,  8 Jan 2024 12:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E565B416C6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 239871BF292
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 12:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F166381EBF
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 12:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F166381EBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P7N4ELK4kydt for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 12:59:46 +0000 (UTC)
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9CD68140E
 for <buildroot@busybox.net>; Mon,  8 Jan 2024 12:59:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9CD68140E
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id BC2D944086C;
 Mon,  8 Jan 2024 14:57:32 +0200 (IST)
To: buildroot@busybox.net
Date: Mon,  8 Jan 2024 14:59:31 +0200
Message-ID: <73c3bb4a908caabf868e9c966ec71081c7360d02.1704718771.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <955dd511a8904b18bce9c2ac8e27ad07c160e2b2.1704718771.git.baruch@tkos.co.il>
References: <955dd511a8904b18bce9c2ac8e27ad07c160e2b2.1704718771.git.baruch@tkos.co.il>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1704718652;
 bh=5TVryyF10ldv4909oJygrqX+25JXbVD3sLkm1q5cDIY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OLIuCOGZ1qvv8LdKS/PDVTX0IQ5RKtSWy9p9oITioiumXfxPmeQ7ewj2khEIHeY/u
 nMPrDsi9EZB4RiuhT5I1HBN9e2O7p+Ae7zrxdXh1RbozBR9tOO0RvJJxY7n8P/e+1u
 M2mtIIz2Tr5fndZxjjHYo+FZ6aVa7dv5kMhfzwXt5lX7efvo2AO2k+/Lk3sIOpUJ7r
 GqCcaluAg0SAX0pBgi3fLr8F6HsjHo2GrP8Ehf3USCIkQSI9GjRls+x6F4uIyYvX50
 4rSZN3ujDpb0K5l6CMn9NSWnP8JqDI7hH/BFpDcDo0X25IwqvyILwjCYxdXp8TUiaB
 gE007wEDQGA5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=OLIuCOGZ
Subject: [Buildroot] [PATCH 2/2] package/rng-tools: normalize github macro
 package name
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This usage of <PKG>_NAME was introduced in commit f9e9c6349afe0
("package/rng-tools: bump to 6.7"). No other package uses <PKG>_NAME
this way.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/rng-tools/rng-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index 3e565103e415..933370c9a99e 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RNG_TOOLS_VERSION = 6.16
-RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
+RNG_TOOLS_SITE = $(call github,nhorman,rng-tools,v$(RNG_TOOLS_VERSION))
 RNG_TOOLS_LICENSE = GPL-2.0
 RNG_TOOLS_LICENSE_FILES = COPYING
 RNG_TOOLS_CPE_ID_VENDOR = rng-tools_project
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
