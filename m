Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE852ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 12:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C48C41636;
	Fri, 16 Sep 2022 12:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C48C41636
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ixuTs3fjYSHw; Fri, 16 Sep 2022 12:25:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A218141638;
	Fri, 16 Sep 2022 12:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A218141638
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 698C41C2744
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 12:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42D6041632
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 12:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42D6041632
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id psSLMwMkrkMk for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 12:23:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CC0241630
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 12:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CC0241630
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 48C6E83D26; Fri, 16 Sep 2022 12:23:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 14:08:45 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: bc9363b7248892b1ade8f19bb9fd778bcc0f46cb
X-Git-Newrev: 6bdb351b4c557b52b95bc03379572e822de90995
X-Patchwork-Hint: ignore
Message-Id: <20220916122357.48C6E83D26@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
 package/sunxi-mali-utgard-driver: move package SITE to Github
 giuliobenetti/sunxi-mali
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

commit: https://git.buildroot.net/buildroot/commit/?id=6bdb351b4c557b52b95bc03379572e822de90995
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
(cherry picked from commit 6dcaa20ca4adea12c9d5fbc6af5793f08fe81634)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
