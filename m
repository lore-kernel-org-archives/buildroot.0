Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D25CD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 17:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B98D84158F;
	Sun,  3 May 2026 17:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WVIp1o0OazdE; Sun,  3 May 2026 17:59:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB21041588
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777831154;
	bh=xMrcWf0Cv/QoeeRk8jBWLr1edcZwaDYxeqZ3HjNx0CA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YqwgyzkJLKxUICLk2qcY1xOmj4UOQIWf0QY8er9W67x1iFg6PSEoFHesWgeGH2duP
	 ol7Z+vOmOpFajex0s0RqsBf/aQOs7NlDhzf3nz4Wwkub/+ADJB/SU9sQsV9nzncq0B
	 ayGXPJ8+i0Uafv187k4iUxW5WRbtBZTcr0U7xOua9pkxHAKi6p0CFn2VVXcxQev1Nh
	 fC1BLCJ+iOe4JnsWvpEZ9im5ft1Za9SID0klVatX711OT+GAulnusCk0+G+kRNjgWm
	 qxYFOe/GE2T5fj2/fJhMwVSd3Csvu3GrPcty7UuGsjV8HsrouPFyQDiuhaJ/ij9wSq
	 YZoIVJga09lfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB21041588;
	Sun,  3 May 2026 17:59:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 393E2190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 17:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 195AA41588
 for <buildroot@buildroot.org>; Sun,  3 May 2026 17:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XjWzuCL9ngq1 for <buildroot@buildroot.org>;
 Sun,  3 May 2026 17:59:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BC4241574
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BC4241574
 for <buildroot@buildroot.org>; Sun,  3 May 2026 17:59:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBB4A840BF; Sun,  3 May 2026 17:59:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 19:52:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae4c2baab90101216f52362eba7740353923f2e4
X-Git-Newrev: a14b18ee75ca5489c6ae18fe00ae604ee3ff846a
X-Patchwork-Hint: ignore
Message-Id: <20260503175911.BBB4A840BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ethtool: bump version to 7.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a14b18ee75ca5489c6ae18fe00ae604ee3ff846a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/tree/NEWS?h=v7.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index ca28e43ba4..2e02f7b256 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256  1c2114ab6e0c0d2aa67d699960eb11df4f341e2403139cdf28ae9da858a6025f  ethtool-6.19.tar.xz
+sha256  660bf9725a7871343a0d232068a7634fbcfb69b6c2f8eff455827faefb0cd162  ethtool-7.0.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 9fe63f31e7..b518c971c4 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 6.19
+ETHTOOL_VERSION = 7.0
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
