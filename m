Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44BBC433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 21:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D8B4402D2;
	Mon, 13 Dec 2021 21:15:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EzrIA6vUBbw0; Mon, 13 Dec 2021 21:15:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB97C40308;
	Mon, 13 Dec 2021 21:15:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 26F141BF97C
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 090BA81322
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7yIFLmLgp1Bg for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 21:15:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFE5181351
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 21:15:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E62A083799; Mon, 13 Dec 2021 21:09:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Dec 2021 22:09:26 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: c50bbd066eabb06c9f05fd80ad71217f8b02f8bd
X-Git-Newrev: 24f45aa78be210cf922e2b6948534f88d96c6cde
X-Patchwork-Hint: ignore
Message-Id: <20211213210951.E62A083799@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/ell: use official
 tarball
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

commit: https://git.buildroot.net/buildroot/commit/?id=24f45aa78be210cf922e2b6948534f88d96c6cde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f02033033efbd97668a7155428ae4686f3ababd4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ell/ell.hash |  4 ++--
 package/ell/ell.mk   | 12 ++----------
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index a795b1aa0d..5f1cc7ddcb 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
-# Locally computed
-sha256  deacff70541b2b0aa61758d7e4eafbabd8c603eeea0207a8a2f5f42118c2f49d  ell-0.39-br1.tar.gz
+# From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
+sha256  653e2e139e23ed31e03c56c05f15321a9e818e2dca00a315c18d2c7b72f15d08  ell-0.39.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index c83063feda..bd291c60db 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -5,19 +5,11 @@
 ################################################################################
 
 ELL_VERSION = 0.39
-ELL_SITE = https://git.kernel.org/pub/scm/libs/ell/ell.git
-ELL_SITE_METHOD = git
+ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
+ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
 ELL_LICENSE_FILES = COPYING
 ELL_INSTALL_STAGING = YES
-# sources from git, no configure script provided
-ELL_AUTORECONF = YES
-
-# autoreconf requires an existing build-aux directory
-define ELL_MKDIR_BUILD_AUX
-	mkdir -p $(@D)/build-aux
-endef
-ELL_POST_PATCH_HOOKS += ELL_MKDIR_BUILD_AUX
 
 ELL_DEPENDENCIES = host-pkgconf
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
