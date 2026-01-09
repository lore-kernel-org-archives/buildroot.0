Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8F0D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27D3E82FE4;
	Tue, 13 Jan 2026 19:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LI5dtk6Ax3lp; Tue, 13 Jan 2026 19:36:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32CA482C38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333008;
	bh=bldW/u1K0M1dNbLHecQHELX+rxi8Wo8GUuqxckv7Mbs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kloDIiAIXH5FANwDMsM719SS3+yO2JOfk03Isags3/e2JbBnzANLK21PGq0iL4FWx
	 bYKyyppxzBpVlksGK03PacW+OKMa3F6MrbbxgtmR0/bNorEalTkO1WkFL3x73qLcEl
	 693vk1RroV2qzA9q4IDZ5KLjDj9YRmL9/215JqbhYgvP5rdS3G3GhnPFUT8psI+sKB
	 82qdfL0rDFREy+t60RQurDWsFhJ/2sYvj3kEtyu2YJfqV7nmamsxQWVHf8fqTZ7FFK
	 +SdW1D+aexBD2PUMoD+VZoDO/kTjjMI1Ll4w0ManXGryMXb8tWGM08gLjkYXMQMSVa
	 B0z+b0efr/pQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32CA482C38;
	Tue, 13 Jan 2026 19:36:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 402E61C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7AE04056D
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVMJMX5ksFoO for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 054ED4048C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 054ED4048C
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03F6287E62; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:04:38 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 72fc25bba729b022dd4bac558461d5e0dbd58faf
X-Git-Newrev: 2f5143824b3fd8d9d17cfda11c905706533fb5b4
X-Patchwork-Hint: ignore
Message-Id: <20260113193618.03F6287E62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cmake: remove
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f5143824b3fd8d9d17cfda11c905706533fb5b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
