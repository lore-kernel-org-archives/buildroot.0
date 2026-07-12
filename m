Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D12C43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 15:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A782240952;
	Sun, 12 Jul 2026 15:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ncvQli1x5FuS; Sun, 12 Jul 2026 15:58:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF92A40953
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783871907;
	bh=GI9nMb9tTpf9YkLlVHOzPseA+pCEtJrRrXNz1FmCbRM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pTd4nNFDSXLAPbwAjUubWyW9aetqNnZ62Gk5owjrRAUh5UwAvZ3Hl5dp/AWPoJeaG
	 t0BbXXifYJv9HcEKC5BlVvkeWHxTAavB3v1knqWdThzfH4vuUU0pGDWo2JP1rmdQpR
	 T9DqPXQotdcZcKi1YanpOCoi22cEjTlaTPVKaY5Cm8OrOigWwcHUCynib8XeIlyIl6
	 bV/Sf4ZeB4nGusOabh7snrZoioqbMZwpk2K2SoISaWyCaPikHXptkKwEAYhzOyuYZI
	 8mEQ0nj1Bsv4dOujVBRvSKJur7ZG+x0qawmo601JRHUtn1UN04OX+SWbu8+BG/cHuU
	 NXf4ytF1HFx5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF92A40953;
	Sun, 12 Jul 2026 15:58:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E5EC522F
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 15:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAAA140953
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 15:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GGmxaPSTdp5a for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 15:58:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3193640952
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3193640952
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 15:58:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60E2B88740; Sun, 12 Jul 2026 15:57:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Jul 2026 17:50:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d552378b00d6f5a7788cbef5f7fc27c8f927d336
X-Git-Newrev: eb594e029f6e7ff394ca3ea5d8e5ae86d1449e9e
X-Patchwork-Hint: ignore
Message-Id: <20260712155751.60E2B88740@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ethtool: bump version to 7.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eb594e029f6e7ff394ca3ea5d8e5ae86d1449e9e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/tree/NEWS?h=v7.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 2e02f7b256..f19f646832 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256  660bf9725a7871343a0d232068a7634fbcfb69b6c2f8eff455827faefb0cd162  ethtool-7.0.tar.xz
+sha256  4d78c26edc0255bc92f4b995b5fd66108d75ff966ed4694f6025a6d370bc2496  ethtool-7.1.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index b518c971c4..77798971bd 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 7.0
+ETHTOOL_VERSION = 7.1
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
