Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0A0EA8536
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 17:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 709754154D;
	Sun,  8 Mar 2026 17:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id efhJh2a6lEEc; Sun,  8 Mar 2026 17:09:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1D1341262
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772989740;
	bh=WGGHHIPeaH4AJ+g8kBK/oh6rUOiqwtsTk7ccZa1ct4o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K68/PX6Z2N8qfZCDfFmnl2vf4DybgrwpRjRwvhR3Q8Zhago8gs+xG4+ZoNI4E2Ye3
	 beOSH/yVH6AaIVh6t8EokzHuUGe8EERWvjHMBr1cZMFuOlzGnmJffDl47fJrLNN9DW
	 QuJaP2MbRNJ/pV0eO8SNEiUctrstDnSjXo7rgtuJ6WEfdlidMoU9ibGoSbTBqKXzTB
	 PSWXBgVKft1jbHip+RdlYLPefBRRTOgtYbnTzZbo24l6nkyganQ0ZB/w6liooN0e51
	 rKwoCp6voXAFnrfoH7mBZ6lLF+PNHV7TO6geDuVVH4IcJmvXEXjMyeT0uk2x8239Er
	 psgiY8M3MphEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1D1341262;
	Sun,  8 Mar 2026 17:09:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 19401119
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 17:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B0A183C9A
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 17:08:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C1rWhcwj_7qe for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 17:08:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3685A83C6C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3685A83C6C
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 17:08:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40D8C85E7D; Sun,  8 Mar 2026 17:08:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 8 Mar 2026 17:59:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c654253887964506ac6d7c3e587df296f90bfda
X-Git-Newrev: 8f441d359165de9987a371149d71d057ebf0ee9e
X-Patchwork-Hint: ignore
Message-Id: <20260308170858.40D8C85E7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ethtool: bump version to 6.19
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8f441d359165de9987a371149d71d057ebf0ee9e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/tree/NEWS?h=v6.19

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index b5cbc3d737..ca28e43ba4 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256  9477c365114d910120aaec5336a1d16196c833d8486f7c6da67bedef57880ade  ethtool-6.15.tar.xz
+sha256  1c2114ab6e0c0d2aa67d699960eb11df4f341e2403139cdf28ae9da858a6025f  ethtool-6.19.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 4e60cadbf6..9fe63f31e7 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 6.15
+ETHTOOL_VERSION = 6.19
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
