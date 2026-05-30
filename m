Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B1FCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 09:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D47C542E23;
	Sat, 30 May 2026 09:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d01ZFif845Kv; Sat, 30 May 2026 09:04:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDB6342E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780131881;
	bh=LNv8jJQbpKwPNFchcU3d5s5IujShexQ8VA20YClAhic=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lHOFMhZMVKnzJdIEVbbL6gKQlxvn9qOmfGf+fwayu49jrhG+A3HLm3qN99AwEbZGm
	 g2xb6uie7HbZnw+zfDvrW6XJKS7fAbqfWb+sKkwSuRxaKByphsX/sTf80fMlkrm4th
	 kYkr6Yrazyk/1U9DD5Og6oRupSzaMCiB2ABSlu3LdoLuxVsEt1xcloNFCphms8Kq2+
	 ANnGdJnx2SbBuDv+uGQ2qZbz4VLKJ3doKbRh3zDFORZGWZk5jpGDbtrGthczffKuwD
	 GkJGNWpXMPGqAPZBvAgO3WyOBi9k8ae2tmM0R+WEguF+OwcJrJj+TRFHlDaxfn71EE
	 80Jo9jIU8rDMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDB6342E82;
	Sat, 30 May 2026 09:04:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 27826D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16F4342E22
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:04:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZH1EoXmLh2D for <buildroot@buildroot.org>;
 Sat, 30 May 2026 09:04:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4665F42E02
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4665F42E02
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:04:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5146386C8A; Sat, 30 May 2026 09:04:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 11:00:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e166708e1e686491d5555578380a2923e21f6c28
X-Git-Newrev: 4893eeefde33a3e7417a5e1889f08934671f3269
X-Patchwork-Hint: ignore
Message-Id: <20260530090423.5146386C8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/icu: update CPE vendor
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4893eeefde33a3e7417a5e1889f08934671f3269
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
