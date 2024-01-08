Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA04C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 20:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FA19417FB;
	Mon,  8 Jan 2024 20:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FA19417FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dg41l6dV-kVa; Mon,  8 Jan 2024 20:38:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BA89417B7;
	Mon,  8 Jan 2024 20:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BA89417B7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 71F541BF2BA
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 20:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 581258136B
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 20:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 581258136B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6OTaJVkVP-Gj for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 20:38:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A36C981366
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 20:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A36C981366
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F0E484BD9; Mon,  8 Jan 2024 20:38:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 Jan 2024 21:35:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 717fe9dc396b3982a02306e8685d8338ae2ebbf6
X-Git-Newrev: a2b8596873d53c52684e3056b655406aa40b58cc
X-Patchwork-Hint: ignore
Message-Id: <20240108203836.8F0E484BD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rng-tools: normalize github macro
 package name
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=a2b8596873d53c52684e3056b655406aa40b58cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This usage of <PKG>_NAME was introduced in commit f9e9c6349afe0
("package/rng-tools: bump to 6.7"). No other package uses <PKG>_NAME
this way.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rng-tools/rng-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index 3e565103e4..933370c9a9 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RNG_TOOLS_VERSION = 6.16
-RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
+RNG_TOOLS_SITE = $(call github,nhorman,rng-tools,v$(RNG_TOOLS_VERSION))
 RNG_TOOLS_LICENSE = GPL-2.0
 RNG_TOOLS_LICENSE_FILES = COPYING
 RNG_TOOLS_CPE_ID_VENDOR = rng-tools_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
