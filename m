Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CDBE95A77
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 10:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C049460ABA;
	Tue, 30 Dec 2025 10:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FWim-F_wgIk2; Tue, 30 Dec 2025 10:57:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD50B60B56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767092264;
	bh=/SA4YMZtWIuj/6pmOIn27YunoUUEpyECGIMf+azip+U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YJ1QmFKF2TOnfgnHVhr2E88zRS1sv/RmWItqIFJryye5gJ1qKZTQyeWX8/iDrlbqY
	 G7ubw8ltwxnl09UTVRgcFjnZYb2vO3UK0wYidT4BIlqzdf8JTkpuN16eZ1FwMgYIyf
	 dA6aqppT726hedUlQylBHPYVWdkBfuIVZRpMjUcLp76kYWIs380NFUnHas8FUbpOja
	 90G8OMsijEG/n2A/gvP4fYIrDOXG+2Rsu3bejvf7ZrhPHAojbEPTHeBt6eNW6sqPyM
	 oPiUQLk7kPIbnDcmJi/cEqUqchglAKCT7mPzKcCdqiyQosGy4wBpv5ZiriS8RZPC8I
	 WjRAsD3qVmmFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD50B60B56;
	Tue, 30 Dec 2025 10:57:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 25B64372
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 323796082C
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IFSKb1K1K-oo for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56BF1608A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56BF1608A0
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55C4487BD1; Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 11:54:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9dbd14df2291b5c6566d7fcd73c3934b931aed1a
X-Git-Newrev: ac47f65186d775ae98fda7429e007ff59e278c51
X-Patchwork-Hint: ignore
Message-Id: <20251230105735.55C4487BD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cmake: remove stale IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac47f65186d775ae98fda7429e007ff59e278c51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
versions using '-'.

These IGNORE_CVES entry introduced in [2] is then no longer matched to
the cmake package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching
[2] 5ce1e773b9 package/cmake: ignore CVE-2016-10642

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cmake/cmake.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index e9752640e5..ef4f6aa98e 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -11,8 +11,6 @@ CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
 CMAKE_CPE_ID_VALID = YES
-# Tool download MITM attack warning if using npm package to install cmake
-CMAKE_IGNORE_CVES = CVE-2016-10642
 
 # The package is a dependency to ccache so ccache cannot be a dependency
 HOST_CMAKE_ADD_CCACHE_DEPENDENCY = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
