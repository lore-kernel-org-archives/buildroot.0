Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472C2CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1441781E9C;
	Fri,  5 Jun 2026 12:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1eQaknOiJQ9z; Fri,  5 Jun 2026 12:38:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B65E81EAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663093;
	bh=B8eW2uJpfw5cwc807sK7U4c9CjDfMgVepZZF7bxmBKM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mBSmqolQgqUeTUmcBm2BCy9z+3BQ79LM/ITz7YM60jBmQLtJ+fG1K2VJNzPW3koRO
	 Xexy87Qjlk8uzQjLtcdUZKL4aalCCKoAjCO+SLiVSZScVXpd6YpGSbo/vDC86+XG8p
	 duVOpIJyUBDQCn8Q6XBiD6b8/+P33BHb2I0UAaIV8R9NRahySicUCT8JuZ+DMjnC3A
	 7K5NhUhmL+x9bNcC6lElLgTw2w73H8Q9ohp9jCKJNug3be2ryd5pzYBr13hp1nTZfQ
	 aC4i3YwlGPacJaxHMy7zHdi/umur7OciyUbP0vLS1B/ybH1iWxpHCIlt6Q2ryPCutH
	 zYxe19OfeG/wQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B65E81EAD;
	Fri,  5 Jun 2026 12:38:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EA8A3B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5B9881E87
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vXZ-ch6j3gHH for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E46B81E88
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E46B81E88
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A82EF87B03; Fri,  5 Jun 2026 12:37:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:01:16 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 491004290faab165d3d886ff1e5cdb00a88f9f6e
X-Git-Newrev: 47348d3d6a70a9106174dcfa60e5345a72c6cbcd
X-Patchwork-Hint: ignore
Message-Id: <20260605123712.A82EF87B03@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/icu: update CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/47348d3d6a70a9106174dcfa60e5345a72c6cbcd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
 package/icu/icu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 73547a7537..e0dffd543c 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -13,7 +13,7 @@ ICU_SITE = \
 	https://github.com/unicode-org/icu/releases/download/release-$(ICU_VERSION)
 ICU_LICENSE = ICU License
 ICU_LICENSE_FILES = LICENSE
-ICU_CPE_ID_VENDOR = icu-project
+ICU_CPE_ID_VENDOR = unicode
 ICU_CPE_ID_PRODUCT = international_components_for_unicode
 ICU_CPE_ID_VERSION = $(subst -,.,$(ICU_VERSION))
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
