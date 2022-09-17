Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB85ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 15:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 086F0843E5;
	Sat, 17 Sep 2022 15:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 086F0843E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eQG_SvS2d-rG; Sat, 17 Sep 2022 15:41:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39E31843A6;
	Sat, 17 Sep 2022 15:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39E31843A6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 153781BF388
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9EDA61113
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9EDA61113
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tikuq2u4jmaW for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 15:40:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8C456115A
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8C456115A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D8D01844E8; Sat, 17 Sep 2022 15:40:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 17:32:49 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 157babea786a21353c81546d749c1883d56d1a76
X-Git-Newrev: 138ebee299f7742ae0e71c35b535e70d27d4950c
X-Patchwork-Hint: ignore
Message-Id: <20220917154022.D8D01844E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/mali-driver: fix
 legal-info
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

commit: https://git.buildroot.net/buildroot/commit/?id=138ebee299f7742ae0e71c35b535e70d27d4950c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix typo: MALI_DRIVER_LICENSE_FILE -> MALI_DRIVER_LICENSE_FILES
added by commit f3ecd9ea4a40d601317f3b7195be4f5d1bdb3146

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2f4b73adf85f369ecf00aca675b87ab85099d2f6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mali-driver/mali-driver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mali-driver/mali-driver.mk b/package/mali-driver/mali-driver.mk
index b12bfec69d..480b358431 100644
--- a/package/mali-driver/mali-driver.mk
+++ b/package/mali-driver/mali-driver.mk
@@ -8,7 +8,7 @@ MALI_DRIVER_VERSION = a742530232d1de41b57465744a1259fa6c35049e
 MALI_DRIVER_SITE = $(call github,bootlin,mali-driver,$(MALI_DRIVER_VERSION))
 MALI_DRIVER_DEPENDENCIES = linux
 MALI_DRIVER_LICENSE = GPL-2.0
-MALI_DRIVER_LICENSE_FILE = LICENSE
+MALI_DRIVER_LICENSE_FILES = LICENSE
 MALI_DRIVER_MODULE_SUBDIRS = r8p0/drivers/gpu/arm/midgard
 
 $(eval $(kernel-module))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
