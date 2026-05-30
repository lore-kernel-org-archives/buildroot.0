Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F21CD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 210FA85E26;
	Tue,  9 Jun 2026 13:05:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GNuVdSYro9Q8; Tue,  9 Jun 2026 13:05:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0A6985E1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010337;
	bh=o0/d7PJ/nZhFUsyi0BKHqy+BuImjbklj5p7ilUI4WXA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VP3+qogt9zEaHBeXLa/PNWgN3J2rtjxivetkGwb+jgpPHeNv3ANowhNArsewVtlvA
	 unxRwHqiuYAjHSmPGjGL2IBtq+/6neMdSqUzSW2sr8Ab4ReR44P2sjRQloAPA2znE9
	 zGTJbcOKC7ebSgPnBykAhpQt0PoGTiX+TKgbdD4CFI7G25+uAorcVLpADMcUQSxDHi
	 sGa2Qbd9StP60WnzAb34TljG4fi2+didwzlUdLdY91NWq2ch5sZEz6MkDYPYQ/AJKA
	 SvwfWN8uxve5K3lb6axwohMILJr4jPmKyVXCjuN6EfOT9WGYRur88X3a9Y86Lb1Pi9
	 sm9AAg3zug5ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0A6985E1B;
	Tue,  9 Jun 2026 13:05:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60BCB2EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 029F0426F3
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PkssobXVXOPa for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2060342552
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2060342552
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B81587E68; Tue,  9 Jun 2026 13:01:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 11:21:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2602d10a16e1d32d619fa8dfb696df81265a2c9
X-Git-Newrev: 5d7800b210b535f98b959de4a00d88482fe983e2
X-Patchwork-Hint: ignore
Message-Id: <20260609130121.5B81587E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/powerpc-utils: bump version to
 1.3.13
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5d7800b210b535f98b959de4a00d88482fe983e2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/ibm-power-utilities/powerpc-utils/compare/v1.3.11...v1.3.13

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/powerpc-utils/powerpc-utils.hash | 2 +-
 package/powerpc-utils/powerpc-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/powerpc-utils/powerpc-utils.hash b/package/powerpc-utils/powerpc-utils.hash
index 32387014cc..d24017684c 100644
--- a/package/powerpc-utils/powerpc-utils.hash
+++ b/package/powerpc-utils/powerpc-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6bb16078068d8b889afdd78927d2f061702ef155e57fc548ae573e2b0b90ca13  powerpc-utils-1.3.11.tar.gz
+sha256  35efb04063f1b7bd9d715f1d8d3ab75352b595b1fd12349d7570a7ba19ba6d86  powerpc-utils-1.3.13.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
index ddeb830b07..38195835e6 100644
--- a/package/powerpc-utils/powerpc-utils.mk
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POWERPC_UTILS_VERSION = 1.3.11
+POWERPC_UTILS_VERSION = 1.3.13
 POWERPC_UTILS_SITE = $(call github,ibm-power-utilities,powerpc-utils,v$(POWERPC_UTILS_VERSION))
 POWERPC_UTILS_DEPENDENCIES = zlib numactl
 POWERPC_UTILS_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
