Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D095D185C6
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 11:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE03F60DE0;
	Thu,  8 Jan 2026 11:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qIMlxnz-IHbL; Thu,  8 Jan 2026 11:00:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A762460DE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767870032;
	bh=M31r8kWgkG1HKauL30NGD+3l5ftQj0i9o2OL9/UFwyk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=b2UIUx2cxYPs6swTVrGkggEKPfff1jmUdoh5vQx2034WQS4POuTDFQ0pIYpjOgOe3
	 o97clp/oi9lu8yVcrD2wW09luN1ydBUaS9hxOOLX8T1vKWLDiLecyoD8WBzACCUp63
	 TMwyT2zF6cGFZZhUvGZ+6ayheaGtXWj9Oa4ziTadP0SStlUvt5ULP9mlQBisP9rIw8
	 QVqTrGeMO5bjQrh4CnBXKp5INn0yBgUET+UUes7fj/UXiiDuHLOHZ09kkenmAgK1II
	 cx6FEPcATnS5j8v42w1cKkHyFoKPCfVxDOHbGQ4nxY7skgSy04IWbmREqRxOEI5fOf
	 n1yeFYZQ+dK9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A762460DE9;
	Thu,  8 Jan 2026 11:00:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17660436
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 396B240A91
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SFZAB3qUhLUh for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 147FB40ABE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 147FB40ABE
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1248B8834B; Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Jan 2026 23:33:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1fe37b6fb703caeb575ab2a1d9a466465288fe41
X-Git-Newrev: 6ccd7b85ee25e2944a4395606ea57323234fef13
X-Patchwork-Hint: ignore
Message-Id: <20260108110024.1248B8834B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-extutils-installpaths: bump
 to version 0.015
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ccd7b85ee25e2944a4395606ea57323234fef13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE: minor cleanup
    see https://metacpan.org/release/LEONT/ExtUtils-InstallPaths-0.015/diff/LEONT/ExtUtils-InstallPaths-0.014#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-extutils-installpaths/perl-extutils-installpaths.hash | 6 +++---
 package/perl-extutils-installpaths/perl-extutils-installpaths.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-extutils-installpaths/perl-extutils-installpaths.hash b/package/perl-extutils-installpaths/perl-extutils-installpaths.hash
index 9838345b65..6bb98325b1 100644
--- a/package/perl-extutils-installpaths/perl-extutils-installpaths.hash
+++ b/package/perl-extutils-installpaths/perl-extutils-installpaths.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  34fb12d1b245e44142846c72905beffc  ExtUtils-InstallPaths-0.014.tar.gz
-sha256  ae65d20cc3c7e14b3cd790915c84510f82dfb37a4c9b88aa74b2e843af417d01  ExtUtils-InstallPaths-0.014.tar.gz
+md5  70f17a346e92560b5f5692119edbb161  ExtUtils-InstallPaths-0.015.tar.gz
+sha256  7d64eb2dfa87ead010cdf55c8a1bdfde50b7b5852d7cb8cf2304f55bea2eb007  ExtUtils-InstallPaths-0.015.tar.gz
 
 # computed by scancpan
-sha256  bddd4809100e5b59fa3b029b2cd303d6384cff751c3898d53827777181a9aabd  LICENSE
+sha256  78b39d4fa3804c0fa0f1e85eb7397e8023d5589d4f15e942586eb83c5ac586e5  LICENSE
diff --git a/package/perl-extutils-installpaths/perl-extutils-installpaths.mk b/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
index 31727194df..16cb77c178 100644
--- a/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
+++ b/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_EXTUTILS_INSTALLPATHS_VERSION = 0.014
+PERL_EXTUTILS_INSTALLPATHS_VERSION = 0.015
 PERL_EXTUTILS_INSTALLPATHS_SOURCE = ExtUtils-InstallPaths-$(PERL_EXTUTILS_INSTALLPATHS_VERSION).tar.gz
 PERL_EXTUTILS_INSTALLPATHS_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 HOST_PERL_EXTUTILS_INSTALLPATHS_DEPENDENCIES = host-perl-extutils-config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
