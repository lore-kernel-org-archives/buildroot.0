Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7C6CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26C5A821C6;
	Fri,  5 Jun 2026 12:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1gHZ3NuTPYFX; Fri,  5 Jun 2026 12:40:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B917821C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663222;
	bh=9kzlQuNvdiUBdp/MrO1evmTbmLGfFz3/DA0THi3crWU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o8LK78iTK/+byFxB3TSHwDFqJN/zMwLlyGFxmYJc2csI2/mJ1B6jfYWSS/bxDX4NA
	 BIgDj31D01jzpdIqeYWVRLxKOMVwcMUqLpTtbiRy8YycGxierxQFAi8p2el3boQ7jh
	 yCnNm0FV2GffFSEZVWixA0MqP988VbFvcT8WigtFglQ6jSrdz/tnuxLXOuKjA40lFD
	 EX5X6gjWnZXlbngM+XNBPICkhbQk5ZUahHEjC8mCBr0APBLjU7g4Xr3fipCsmx1FL0
	 72EAYFBl0HdRsc8oGfhUZ+YzHATipjGVPNxV6bNEawbgNuAgqXNLFIX3xbhFvg+vtU
	 LFQB6p+ISogWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B917821C7;
	Fri,  5 Jun 2026 12:40:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CB65388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BC2481F97
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cyjJEYGfHBx1 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFE7181FEF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFE7181FEF
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E969287B3B; Fri,  5 Jun 2026 12:38:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:53:48 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: c4a08102a4f3edf01cc56bc012f05c5194dd10ef
X-Git-Newrev: 475048387bc3a21c2d2cfe14a4cbf8a8e62f5435
X-Patchwork-Hint: ignore
Message-Id: <20260605123836.E969287B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/icu: update CPE
 vendor
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/475048387bc3a21c2d2cfe14a4cbf8a8e62f5435
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

The CPE "cpe:2.3:a:unicode:international_components_for_unicode:*:*:*:*:*:*:*:*"
is valid for this package.

Also remove the no longer needed "ICU_CPE_ID_VERSION" subst since [1].

The previous CPE hasn't been used since 2020. While the new one got two
CVE assigned since 2020.

[1] 5bf0db998b package/icu: bump version to 78.1
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-5222
[3] https://nvd.nist.gov/vuln/detail/CVE-2020-21913

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4893eeefde33a3e7417a5e1889f08934671f3269)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/icu/icu.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 3030e0c71c..ee1ede6f2c 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -13,9 +13,8 @@ ICU_SITE = \
 	https://github.com/unicode-org/icu/releases/download/release-$(ICU_VERSION)
 ICU_LICENSE = ICU License
 ICU_LICENSE_FILES = LICENSE
-ICU_CPE_ID_VENDOR = icu-project
+ICU_CPE_ID_VENDOR = unicode
 ICU_CPE_ID_PRODUCT = international_components_for_unicode
-ICU_CPE_ID_VERSION = $(subst -,.,$(ICU_VERSION))
 
 ICU_DEPENDENCIES = host-icu
 ICU_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
