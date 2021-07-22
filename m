Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA55C4338F
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 23:43:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CECF60E9B
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 23:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8CECF60E9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DA0E82EA4;
	Thu, 22 Jul 2021 23:43:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aCJJFCSpyRem; Thu, 22 Jul 2021 23:43:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CA95838C0;
	Thu, 22 Jul 2021 23:43:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 93D811BF3A3
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 23:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E2B082FEA
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 23:42:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n6cpyvZgPkE0 for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 23:42:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFFF782EA4
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 23:42:50 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.181.181])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 6iEDmGaT8qG1w6iEEmUXMo; Fri, 23 Jul 2021 01:35:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1626996946; bh=uBBoDnuIHiF3HNO5E8IcI3VvXiBnD0bEd7wS/1D0cz8=;
 h=From:To:Subject:Date:MIME-Version;
 b=mLjVlsfDK5auyi/ee5iYVIsTNQ9YYhOB/Q/rnd9SwUdvH99aiywrDJX9uBQIsv9V4
 goCY3QZuDnBcwxLIBqPCKl9GTCBs9qGhDtr9gv+tFlk8ZIWNQPxY3xCqiYyleNACsv
 9dPkXunCLkJYRiaCBNJ3xs1HNwyJloMh3V2cm0Hy4td9ERaDsUCpZel57kJR0PCTZJ
 A4RxCN4BZdoMoW6U9E5PfmzcBtS87iqAXpj4F4qp3UXopfVdv8my6+4NT8GfYOjrBl
 Irez1HOe+iQnZ+L0nkwP2K849g6NBlqOJGXXl4ASW7BliAjqAeYcg3Jsnr762zx77X
 u0mdE0J9Gb0OQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 23 Jul 2021 01:35:43 +0200
Message-Id: <20210722233544.1210678-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722233544.1210678-1-giulio.benetti@benettiengineering.com>
References: <20210720224443.24edcd0f@windsurf>
 <20210722233544.1210678-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfPAqxgo93NIXy1Pn7m/bQ4n2kSjTlCGMJXi3uqDjpKrFoTk244EDUqMYgh5viUuJlm1/8SLps25BzHt+uZRayuTgpKtnGM7U54OWSaFMoO+bFIux70bv
 DrbkngQC7QXVgHQ8Sv3neqnNowVgKFp3ib6fY6dl5nb9mD2cr/XeRYUsfop3pYTrHl2DA6RDNzzXEZps96nLVvAaqY+MhwjkVG4/kdruaLk6Q2e1br3FaaX+
 BcMFpuSjdHR73m1R5T01WoqxVZjW3Di9VCpy+zGD1OS/ozuYztmPWUV0XVe++oc8
Subject: [Buildroot] [PATCH 1/2] package/libnspr: bump to version 4.32
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Bump to version 4.32

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 8ca0f573b9..13d3958735 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.30/src/SHA256SUMS
-sha256  8d4cd8f8409484dc4c3d31e180354bfc506573eccf86cd691106a1ef7edc913b  nspr-4.30.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.32/src/SHA256SUMS
+sha256  bb6bf4f534b9559cf123dcdc6f9cd8167de950314a90a88b2a329c16836e7f6c  nspr-4.32.tar.gz
 # Locally calculated
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 67fb738b57..58a3338c60 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.30
+LIBNSPR_VERSION = 4.32
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
