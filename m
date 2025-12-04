Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D41D2A53A
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E1E761C1B;
	Thu,  4 Dec 2025 20:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3BXJU390YNGs; Thu,  4 Dec 2025 20:39:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 885D261254
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764880764;
	bh=0gSwDDed12kzsBm/pnt3lH7DMYqtmRQHXGqTe4FbzN8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PXKCBnW40FwG0f440/g/01S2KMf2OKG3z0OWBE6nGur2tzvmrSSBNSLpeTiYNRSjQ
	 ZpfSugKNzuaHIZyY8zCvL1CLBf3T5bTzfqNFd2a8sEpgP+IIwl4RKfgI0VEELtqlvD
	 Kc0xxYJjiyO6+kozdmNBqYStKUxFOP+dVnWEjHvwtjwIgoFr3DPivmxUCwOGemKUmn
	 +69c8LpjJK2aBGlGUM1V87urMZMYHsgTPFEffQz2VtmD43rhiw/4XPge6o/qEcuW21
	 IbnE5wQmyNtaGVVzT3nTR3ixWvBSN2rlzBwSqEVs/3rMiWafyTICZn+OOkQATFPzm6
	 AvJ1H5R5MYRXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 885D261254;
	Thu,  4 Dec 2025 20:39:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10EED1A9
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 037484078C
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qIlGNXI5ir80 for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:39:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4419407C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4419407C8
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:39:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E26C9864D9; Thu,  4 Dec 2025 20:39:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Dec 2025 13:23:56 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 29f8d1133d9b0dc44fabe4690bf8662cba6eb44a
X-Git-Newrev: 9a5dca399f36664d63da13c5adbdf5ea5bad36b8
X-Patchwork-Hint: ignore
Message-Id: <20251204203917.E26C9864D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/18xx-ti-utils:
 switch to git repo
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a5dca399f36664d63da13c5adbdf5ea5bad36b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Downloading the snapshot tarball has been unstable in the past so we
switch to git for fetching the source code.

Fixes:
https://autobuild.buildroot.net/results/8b9/8b9b15e578ee13c47bdfe77f8bd79cd34c49de91/
https://autobuild.buildroot.net/results/bfc/bfcfb6e5014e017334604ba8fdcfac2acc65d161/
https://autobuild.buildroot.net/results/6c6/6c69077ea076c3c28d0e8599913cde31ee27b0c5/
https://autobuild.buildroot.net/results/b43/b431fabedd709f660f556a7a6539a0b1e28aeb49/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d8b15b078aeb9b9f3b42b9bdea91f2adff02fd09)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/18xx-ti-utils/18xx-ti-utils.hash | 2 +-
 package/18xx-ti-utils/18xx-ti-utils.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/18xx-ti-utils/18xx-ti-utils.hash b/package/18xx-ti-utils/18xx-ti-utils.hash
index 7ecca54b9b..116d05e8e9 100644
--- a/package/18xx-ti-utils/18xx-ti-utils.hash
+++ b/package/18xx-ti-utils/18xx-ti-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ce0185ba8a9bf456cc94a798bf66903775065e337e53ff812f18a6d88f5bac13  18xx-ti-utils-R8.8.tar.xz
+sha256  33be3c90719bf36d5da76c6faaefb07bf3697635f81b86e28b92307d7825483e  18xx-ti-utils-R8.8-git4.tar.gz
 sha256  363cef40b276a7a91ebcff3f78626d9cfe5e5a51927c725236007259403d5fc4  COPYING
diff --git a/package/18xx-ti-utils/18xx-ti-utils.mk b/package/18xx-ti-utils/18xx-ti-utils.mk
index 5d45191cde..3e6f715730 100644
--- a/package/18xx-ti-utils/18xx-ti-utils.mk
+++ b/package/18xx-ti-utils/18xx-ti-utils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-18XX_TI_UTILS_VERSION = 8.8
-18XX_TI_UTILS_SITE = https://git.ti.com/cgit/wilink8-wlan/18xx-ti-utils/snapshot
-18XX_TI_UTILS_SOURCE = 18xx-ti-utils-R$(18XX_TI_UTILS_VERSION).tar.xz
+18XX_TI_UTILS_VERSION = R8.8
+18XX_TI_UTILS_SITE = https://git.ti.com/cgit/wilink8-wlan/18xx-ti-utils
+18XX_TI_UTILS_SITE_METHOD = git
 18XX_TI_UTILS_DEPENDENCIES = libnl
 18XX_TI_UTILS_LICENSE = BSD-3-Clause
 18XX_TI_UTILS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
