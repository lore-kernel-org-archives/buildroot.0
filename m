Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720D9C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 11:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1081F42372;
	Fri, 22 Jul 2022 11:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1081F42372
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JEILCTOmyDYm; Fri, 22 Jul 2022 11:01:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A9374233D;
	Fri, 22 Jul 2022 11:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A9374233D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B148F1BF365
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 11:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89A0C4233D
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 11:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89A0C4233D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZB5EH4YiI40Q for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 11:01:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55F74422DF
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55F74422DF
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 11:01:15 +0000 (UTC)
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1oEqP7-0008SY-F6;
 Fri, 22 Jul 2022 12:01:10 +0100
From: John Keeping <john@metanate.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 12:01:03 +0100
Message-Id: <20220722110103.4068083-1-john@metanate.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Authenticated: YES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=8+06ZI4fhPSZlMIfK/8F+0pwNeeHsgkyUUiXyMoa9uo=; b=oL
 P0ICQN4+T0w9Xyv3Br5LUAJvteYBQRMkngSc12iQJ9EhYkTrztY6OrNwyg2EfRdRYQR5p92/8SPAl
 WrpblWhNvYXaHvUn+97vuTqz1PS8+hydJAowntGZoUT89mgRZWmH1D/9eMJk4+y1p7HGzbN4vqIqM
 X4Tq5KxBchQnQ3jYCedyFQsjTFcNWs/7BfJWOAlSidJYA1Ee48NnutHxvOgA2Om0TjaSTEKVL7+fM
 kH3zJvbN7J8AbriUydrIy6Okgt9A3rHhzePpri+9XN33Z+uN8Znbb/Sko/7pHbZsuSBVZzaAci0tx
 nNChrulgPCbm1g389hhYSHDOe95rgCeA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.a=rsa-sha256 header.s=stronger header.b=oLP0ICQN
Subject: [Buildroot] [PATCH] package/fscryptctl: bump to v1.0.0
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
Cc: John Keeping <john@metanate.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to a tagged release, pulling in about 4 years of development.

Note that v1 encryption policies have been deprecated and removed in
this release.  Since the previous version in Buildroot is old enough not
to have support for v2 policies, this is an incompatible update.

There are unlikely to be many v1 users and the format has some known
vulnerabilities so no compatibility option is included.

Signed-off-by: John Keeping <john@metanate.com>
---
 package/fscryptctl/fscryptctl.hash | 2 +-
 package/fscryptctl/fscryptctl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fscryptctl/fscryptctl.hash b/package/fscryptctl/fscryptctl.hash
index b06b96c10f..6dc62a8485 100644
--- a/package/fscryptctl/fscryptctl.hash
+++ b/package/fscryptctl/fscryptctl.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 970a8febbcbf315313711d8a7ee3d954dea593d8087744d3cba65f6cb4bebcc1  fscryptctl-f037dcf4354ce8f25d0f371b58dfe7a7ac27576f.tar.gz
+sha256 3828d5ad9b93664b9fec0174fc5d8e96d7b021a7896da74efe18fabe5f01d638  fscryptctl-v1.0.0.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/fscryptctl/fscryptctl.mk b/package/fscryptctl/fscryptctl.mk
index 4275bf2b83..8cc4dfdd8f 100644
--- a/package/fscryptctl/fscryptctl.mk
+++ b/package/fscryptctl/fscryptctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FSCRYPTCTL_VERSION = f037dcf4354ce8f25d0f371b58dfe7a7ac27576f
+FSCRYPTCTL_VERSION = v1.0.0
 FSCRYPTCTL_SITE = $(call github,google,fscryptctl,$(FSCRYPTCTL_VERSION))
 FSCRYPTCTL_LICENSE = Apache-2.0
 FSCRYPTCTL_LICENSE_FILES = LICENSE
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
