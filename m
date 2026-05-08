Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49EBCD3436
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 10:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF0D8615BA;
	Fri,  8 May 2026 10:06:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CLgsamR2ZoXy; Fri,  8 May 2026 10:06:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11A4661597
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778234789;
	bh=LAzlQ+Eu4GfYSS/FQnH7E7eEk4DrpwRccHgTE3hFBDs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CCgVawWfU3r10AmpGFaQNnuQv1XagvnR8ZcAJgdTZYCXKzA/bKGiHenp9adZcj/9X
	 IiHgLu9ZlX/N1MwV4FsyQw3W6bGQDLdoASLAHyEz/YBffDbbVfJQvjC9jYPAh9E2Lp
	 ADvt3lqITqYTXyx0auYnlYJdT7mXAdd+FHEzKMu8W7aN2sakKyzD7owLtWmElcY65Q
	 d5vWDKj6bSGazeo6+1weZkRXROnbSZgdzbwIw97MMUeHlFUpqVZvTscsAvg/1AkaPZ
	 AzLGFKED/4ZAcLgz/xlX+IHywgcqCd50jDQI5m2h2Loc2izZsgGLXDHkCVAdjy1Zsw
	 kimbx/LeXVW3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11A4661597;
	Fri,  8 May 2026 10:06:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD007358
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF022841B5
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZNvwjPNvBlh for <buildroot@buildroot.org>;
 Fri,  8 May 2026 10:06:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B8F3841B7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B8F3841B7
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:06:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE8408555E; Fri,  8 May 2026 10:06:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 8 May 2026 11:58:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c19e6d80fbcff18465a6839676195a91db18ace5
X-Git-Newrev: 7cca743c4d1b964a901458818d9eb6188e022594
X-Patchwork-Hint: ignore
Message-Id: <20260508100624.DE8408555E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mdio-tools: bump to version 1.3.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7cca743c4d1b964a901458818d9eb6188e022594
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

adds support for Microchip's paged PHYs.

Release Notes:
https://github.com/wkz/mdio-tools/releases/tag/1.3.2

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mdio-tools/mdio-tools.hash | 2 +-
 package/mdio-tools/mdio-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mdio-tools/mdio-tools.hash b/package/mdio-tools/mdio-tools.hash
index 19172e2cd6..c922fb43d0 100644
--- a/package/mdio-tools/mdio-tools.hash
+++ b/package/mdio-tools/mdio-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  652353ba153fdd8b1d58ded4b90d0639536d705aa5923018e27ea0b78aa8e4fb  mdio-tools-1.3.1.tar.gz
+sha256  44bb2a15303763ed0fed0941a6f49a89377aa3e905ffcf6542f27da458664bb5  mdio-tools-1.3.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mdio-tools/mdio-tools.mk b/package/mdio-tools/mdio-tools.mk
index e61f847e13..0225f910f9 100644
--- a/package/mdio-tools/mdio-tools.mk
+++ b/package/mdio-tools/mdio-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MDIO_TOOLS_VERSION = 1.3.1
+MDIO_TOOLS_VERSION = 1.3.2
 MDIO_TOOLS_SITE = https://github.com/wkz/mdio-tools/releases/download/$(MDIO_TOOLS_VERSION)
 MDIO_TOOLS_LICENSE = GPL-2.0
 MDIO_TOOLS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
