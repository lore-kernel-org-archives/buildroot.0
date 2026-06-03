Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F698CD6E57
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA58A61B1D;
	Wed,  3 Jun 2026 18:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zyg2vTLx5eUt; Wed,  3 Jun 2026 18:49:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7713861B10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512593;
	bh=jGDHbQMNMTDwDX2yubmXhQ8MGN5hfeTOQt/GtFu9wEA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rIiGAFEGR/kRKMoYEEkkP8EURR9Sp2OWuBHsKHLHeOsqZzgkX3RYs/9MV/KlY/5cz
	 pNfNBNzZ/EXsW7kEkINIUFssQyq1+NhJcuhdpMbCfSyB4KYvXxbNJn6A59pf3hk8SC
	 aEi/9jdCSF1RHSHuREsSfSEf4J7gDLViRumiVzCKqbZBTCC0H22fmYmTVt6JWWuZw4
	 11DfBB6VkK+kRvTwla9zkGTR0JDZTP4NhULffENMD2BrMbJXunebKe3bU68/S/qsJ7
	 k9dI4rA1nhBexA47DUxqdmh0Bxcr3G4zdFDZyMS+szUBEFACuJ6+Ywob9yGySmfMmX
	 4ZOYdIsozVCeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7713861B10;
	Wed,  3 Jun 2026 18:49:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0861D192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5717B4011C
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xkl7Jeb1HRK3 for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB9F54229C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB9F54229C
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A075987991; Wed,  3 Jun 2026 18:49:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 20:43:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2dce5a7844d061860810da4b77965d96d09eb2b4
X-Git-Newrev: ab03ba7396017b8911944c3089c06c9b68822fbe
X-Patchwork-Hint: ignore
Message-Id: <20260603184932.A075987991@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/faad2: update CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ab03ba7396017b8911944c3089c06c9b68822fbe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The CPE audiocoding:freeware_advanced_audio_decoder_2 hasn't received
any new CVEs since 2018 while faad2_project:faad2 received 9 new cves
[1].

See the full history in [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2023-38857
[2] https://security-tracker.debian.org/tracker/source-package/faad2

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Peter: set FAAD2_CPE_ID_VALID = YES for check-package]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/faad2/faad2.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/faad2/faad2.mk b/package/faad2/faad2.mk
index 62c469e3ef..9aa767a5b2 100644
--- a/package/faad2/faad2.mk
+++ b/package/faad2/faad2.mk
@@ -8,8 +8,7 @@ FAAD2_VERSION = 2.11.2
 FAAD2_SITE = $(call github,knik0,faad2,$(FAAD2_VERSION))
 FAAD2_LICENSE = GPL-2.0
 FAAD2_LICENSE_FILES = COPYING
-FAAD2_CPE_ID_VENDOR = audiocoding
-FAAD2_CPE_ID_PRODUCT = freeware_advanced_audio_decoder_2
+FAAD2_CPE_ID_VALID = YES
 FAAD2_INSTALL_STAGING = YES
 
 # faad2 contains assembly routines using ARM instructions not present in thumb1 mode:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
