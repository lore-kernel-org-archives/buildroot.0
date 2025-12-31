Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0564EEB565
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 17:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EDD78133C;
	Wed, 31 Dec 2025 17:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N5FS2E9yI4FS; Wed, 31 Dec 2025 17:03:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A14FF81221
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767200617;
	bh=Rt8B/mqi1GGRUUj527CmtSO1C6Rhjbe9A5Qo8ljkwc8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V60eoeUesy7WR4Lp7+/gxM0CwddU/ElxTWvqzFa0NTn8DS0n9hlTPaZAtigEA25q2
	 J+IcKSdoSvt0nnfARz3XBU9TS+1oFd5kNofdeNO0YzDSILeG9uQifkUBPw3VV+/i35
	 l/XDS/s2heLdT1YUsKYH2hLRhw0vlauXFoNR3u/fPjUojexrFZHgJqgpPZjfix+hgB
	 YYGGO1iJogET3xhVU2VdOs3so5IuzMlvzKIrLkaGgmlmwLhEbpi6mtMLH5U1RuT49z
	 lu6Zq3DbNPq0nLcFDcE2EdiVQJhp8BUkm6gW40yg6tR1qnQGtpUNkIZ1yjkpvfqygQ
	 7WEBnjtiBvtUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A14FF81221;
	Wed, 31 Dec 2025 17:03:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B228249
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 17:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5A3160AFF
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 17:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MEFlFTnvPmfT for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 17:03:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A91260AF4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A91260AF4
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 17:03:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB70186023; Wed, 31 Dec 2025 17:03:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 14:51:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c6552cd60b82cbfac6918de296772b2f37c35a1
X-Git-Newrev: 60e12203b123a63a2c86ced4760d287095b85eae
X-Patchwork-Hint: ignore
Message-Id: <20251231170334.EB70186023@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/utfcpp: bump version to 4.0.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=60e12203b123a63a2c86ced4760d287095b85eae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/nemtrif/utfcpp/releases/tag/v4.0.9

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/utfcpp/utfcpp.hash | 2 +-
 package/utfcpp/utfcpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/utfcpp/utfcpp.hash b/package/utfcpp/utfcpp.hash
index d995899165..4b43eb330b 100644
--- a/package/utfcpp/utfcpp.hash
+++ b/package/utfcpp/utfcpp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f808b26d8c3a59def27fea207182ece77a8930bd121a69f80d328ecf3cfef925  utfcpp-4.0.8.tar.gz
+sha256  397a9a2a6ed5238f854f490b0177b840abc6b62571ec3e07baa0bb94d3f14d5a  utfcpp-4.0.9.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/utfcpp/utfcpp.mk b/package/utfcpp/utfcpp.mk
index 4e17364e0b..72a590eeb3 100644
--- a/package/utfcpp/utfcpp.mk
+++ b/package/utfcpp/utfcpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UTFCPP_VERSION = 4.0.8
+UTFCPP_VERSION = 4.0.9
 UTFCPP_SITE = $(call github,nemtrif,utfcpp,v$(UTFCPP_VERSION))
 UTFCPP_LICENSE = BSL-1.0
 UTFCPP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
