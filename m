Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1F7C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 10:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38CFE8195C;
	Mon, 15 Aug 2022 10:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38CFE8195C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dm1q3dx9sVHA; Mon, 15 Aug 2022 10:03:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4177C817EB;
	Mon, 15 Aug 2022 10:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4177C817EB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6336E1BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 10:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D1D34169B
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 10:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D1D34169B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CVKSlubmX_Og for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 10:03:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29A3041505
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 10:03:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29A3041505
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1B84B8760F; Mon, 15 Aug 2022 09:48:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 12:02:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b8665e39f1fa3f77fc390cb2a14884f2cb7c76f4
X-Git-Newrev: 6dcaa20ca4adea12c9d5fbc6af5793f08fe81634
X-Patchwork-Hint: ignore
Message-Id: <20220815094832.1B84B8760F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sunxi-mali-utgard-driver: move
 package SITE to Github giuliobenetti/sunxi-mali
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6dcaa20ca4adea12c9d5fbc6af5793f08fe81634
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Github repository mripard/sunxi-mali states to use Lima in place of
sunxi-mali because it's deprecated, but this package is still useful in
Buildroot so I want to move the SITE to my Github fork of the original
repository that already contains a patch to fix a build failure showing
up with Linux version >= 5.15.

The upstream patch fixes missing DMA_BUF module inclusion that leads to
build failure. The patch includes DMA_BUF by using:
MODULE_IMPORT_NS(DMA_BUF);

My idea is to continue to maintain this package in parallel to Lima since
it seems to be still useful.

Fixes:
http://autobuild.buildroot.net/results/8f25c26de737c358b3b43a10737609465b4e1398/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash | 2 +-
 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
index 4b276fecb7..ac6587b27a 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0197271dbf503e866dd4873091f61bb3de1f2c3031701aac1ba205d1e2f267ac  sunxi-mali-utgard-driver-e4a91c95096bb31450b556fcb13f3c4ba79f60b4.tar.gz
+sha256  64f15a8c7d383ac92230ef82711507a7f3a309462999f6694863fbbb4f12e0be  sunxi-mali-utgard-driver-c4cf7aabed25e0fd27159564caf588a37016870d.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
index 5f9090f492..594a770e61 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SUNXI_MALI_UTGARD_DRIVER_VERSION = e4a91c95096bb31450b556fcb13f3c4ba79f60b4
-SUNXI_MALI_UTGARD_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_UTGARD_DRIVER_VERSION))
+SUNXI_MALI_UTGARD_DRIVER_VERSION = c4cf7aabed25e0fd27159564caf588a37016870d
+SUNXI_MALI_UTGARD_DRIVER_SITE = $(call github,giuliobenetti,sunxi-mali,$(SUNXI_MALI_UTGARD_DRIVER_VERSION))
 SUNXI_MALI_UTGARD_DRIVER_DEPENDENCIES = linux
 SUNXI_MALI_UTGARD_DRIVER_LICENSE = GPL-2.0
 SUNXI_MALI_UTGARD_DRIVER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
