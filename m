Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51AFD185CC
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 11:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63ECF82425;
	Thu,  8 Jan 2026 11:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ATUil78bMu3i; Thu,  8 Jan 2026 11:00:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 938E5825D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767870026;
	bh=EncAAP32jWCb1c2TL25Htn1C6nTfwiMCiCCsC540NGs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hyDP1C9xM9AzAb8cpVEAMZtmi0RalrvouiYK839n/hzdigHNnHCKSDPHT4ndacUNB
	 F8BO90I6g4oDAbBJD7dD/JxpxEVX9vFzP4MdRz63YStyi5stHMGAIp1ZlYe5XMFuxk
	 sFgh/5j9FnqLJo1S3UiHd/LAd7q+t83S3ggIcMOVZmgUxOBIloR3azZuLBREmpgX4n
	 s8oizk5Jj067VnpHr38f7l2SwY1GdTjsjDKs7asFTSpVpvdAqLqDsIWU7T7Ejvc3NA
	 x+k1u9DAn3Aueh3GlOVu6x/5wqunz4Uu3c/bb795Q3ch5bgrRaOlQtpH99k+1AOAov
	 ZKJcREYLIZ9Fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 938E5825D3;
	Thu,  8 Jan 2026 11:00:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95E49AEB
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D114406C5
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzJB5_40I7UZ for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 11:00:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBD9B4004E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBD9B4004E
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B72DA88440; Thu,  8 Jan 2026 11:00:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Jan 2026 23:29:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12bbae6e58ced7fe74a40dc9ff9a6be9f806c671
X-Git-Newrev: 8e1abc7c3f38b2d4c9f0cf1f11ddae89d5c90e91
X-Patchwork-Hint: ignore
Message-Id: <20260108110023.B72DA88440@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-mozilla-ca: bump to version
 20250602
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8e1abc7c3f38b2d4c9f0cf1f11ddae89d5c90e91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-mozilla-ca/perl-mozilla-ca.hash | 4 ++--
 package/perl-mozilla-ca/perl-mozilla-ca.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.hash b/package/perl-mozilla-ca/perl-mozilla-ca.hash
index 35bb158d12..bd396d1dec 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.hash
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  dad624e6dce1d5f87dbb6268395df180  Mozilla-CA-20240924.tar.gz
-sha256  c4b1412bbc37dff8cf29af6f92cb47defbe90eebcbc29e407a98638f7a31bcd0  Mozilla-CA-20240924.tar.gz
+md5  c28848458e8ae2325e46b15a243f1918  Mozilla-CA-20250602.tar.gz
+sha256  adeac0752440b2da094e8036bab6c857e22172457658868f5ac364f0c7b35481  Mozilla-CA-20250602.tar.gz
 
 # computed by scancpan
 sha256  95cd63dae5c2bf6e7cf33435981614a36c85ef01fc7a02464e05e58a5355398e  README
diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.mk b/package/perl-mozilla-ca/perl-mozilla-ca.mk
index ce56649969..02b4cf3d5c 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.mk
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOZILLA_CA_VERSION = 20240924
+PERL_MOZILLA_CA_VERSION = 20250602
 PERL_MOZILLA_CA_SOURCE = Mozilla-CA-$(PERL_MOZILLA_CA_VERSION).tar.gz
 PERL_MOZILLA_CA_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LW/LWP
 PERL_MOZILLA_CA_LICENSE = MPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
