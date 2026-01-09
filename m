Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8148CD2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5517583443;
	Tue, 13 Jan 2026 19:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MAGDKH-2ZnHC; Tue, 13 Jan 2026 19:36:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA7CD83419
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333007;
	bh=iqTn7LEayzYkspOhOkvM9+mxb7DRwiscGlvWWpxop+Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mqbpIKw3r8CJkH2m7ILlFdsm27YG0fLyeZrgips28WIixjQwtI6fWNel99qgRfTJF
	 1oOXli5blbMvbTAcSbI1r9DFAoYWL6y3tOBKvSTO3hpgIGItDyQ4RP1O7Skwd/i2AP
	 z+1gQ8k9FqWn7hNn+rdYtiEMG24q4dlHuh1msSRwBz3/cGSNb6OucG+tEGE3j0/6dN
	 SbYiMrowlAj8tjtdtDQZGHFPdHVgOffzBkjnBo9mY/ma1DQ0IS28aGyo6YMRyUEPcV
	 snks0jFiE2I8ksBlspAcw/gZKaMbQb+wfIuebvxR+Jv4kzL2ffIC0wblQ29+Etufo9
	 bgz7Xh1w/+2GQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA7CD83419;
	Tue, 13 Jan 2026 19:36:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05BEE1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B4DE82D75
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YWJb6Ps9Ao_v for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61CC382CE4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61CC382CE4
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 606A186E71; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 17:00:34 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4288f056cb6b2cab982bfcd8baa96c0cd8208363
X-Git-Newrev: 1de40783e078d032a0dcbfc39e3e76b0f224a2d3
X-Patchwork-Hint: ignore
Message-Id: <20260113193619.606A186E71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libcpprestsdk:
 add dependency on Boost.System
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

commit: https://git.buildroot.net/buildroot/commit/?id=1de40783e078d032a0dcbfc39e3e76b0f224a2d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

libcpprestsdk searches for the Boost.System module in its
CMakeLists. Hence it should be selected as a dependency.

This does not fix any build failure, as boost-system was implicitly
selected by one of the other boost-* options that this package
selects, but an upcoming commit is going to change how boost-system is
selected by other boost-* modules, making this preparation change
necessary.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c659e0383d8f66b9bf89b5a30de89476ef48d5bc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libcpprestsdk/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcpprestsdk/Config.in b/package/libcpprestsdk/Config.in
index e533b30393..7688021ed0 100644
--- a/package/libcpprestsdk/Config.in
+++ b/package/libcpprestsdk/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_LIBCPPRESTSDK
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_RANDOM
 	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_OPENSSL
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
