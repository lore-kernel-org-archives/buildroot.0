Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AD0D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 601D483126;
	Tue, 13 Jan 2026 19:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jeS_NcG7cxU7; Tue, 13 Jan 2026 19:40:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27D5283E16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333255;
	bh=hteWv8Ah8/YEwOABM2JEBrUzQtKoB08gzIbEa/tMMac=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K7mz5qt8r0cZJDHY3DEg4RTy4xzbMY9dX1QH04aqVq7Wy8XUn/3MYTPiCxSEVmaPi
	 H2JDiOUKWhTtfqSOFHtHxNx3rY5P/5QYvpiG63W8WIfl1/kEDahlcQBc3BUaNdInGJ
	 kR4tdg74ApDU0m7LvG5m/YtabFcgy+3HubPiFEC3KUKeekz0PO9BltcTaJrGtl+OIx
	 ZuIXO/Gb1so7UGGJtyTylgOiWeU08SIdtqZJKfh9AtbFahaDVKvporzxP1fCNG80zF
	 Pl+hVEUtpZo0jF3MtZlCTbmKmHFOK+94d60+VS5infLO0Yq8YSX5wfofh+kBCDrC/b
	 /eQ5MXX/I6v8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27D5283E16;
	Tue, 13 Jan 2026 19:40:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 352B91C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6531D406E6
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s2HKa8f3xUWM for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1D8C406D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1D8C406D5
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B01F78267D; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:04:41 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 700f6e24a1d4f3d7712397cda711ae1bc1eac993
X-Git-Newrev: aecb01fa11cd926f4a016238cb368537897bc5b7
X-Patchwork-Hint: ignore
Message-Id: <20260113194032.B01F78267D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/cmake: remove
 stale IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=aecb01fa11cd926f4a016238cb368537897bc5b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
versions using '-'.

These IGNORE_CVES entry introduced in [2] is then no longer matched to
the cmake package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching
[2] 5ce1e773b9 package/cmake: ignore CVE-2016-10642

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ac47f65186d775ae98fda7429e007ff59e278c51)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cmake/cmake.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 8f3a54be5a..304dc3755a 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -11,8 +11,6 @@ CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
 CMAKE_CPE_ID_VALID = YES
-# Tool download MITM attack warning if using npm package to install cmake
-CMAKE_IGNORE_CVES = CVE-2016-10642
 
 # The package is a dependency to ccache so ccache cannot be a dependency
 HOST_CMAKE_ADD_CCACHE_DEPENDENCY = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
