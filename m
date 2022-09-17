Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB16ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 15:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3EEF41DCA;
	Sat, 17 Sep 2022 15:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3EEF41DCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xnrpHxgzOcRT; Sat, 17 Sep 2022 15:44:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FDF741746;
	Sat, 17 Sep 2022 15:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FDF741746
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 789CA1BF96B
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39DD861113
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39DD861113
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tkqdHviN6f1y for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 15:40:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BC8D61152
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BC8D61152
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5AE278455B; Sat, 17 Sep 2022 15:40:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 17:32:54 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 53f306784509867836cdc3b45e44cf6f263fbecf
X-Git-Newrev: 398aa5a4e117f1fffe361f365aac3e9697d3d73b
X-Patchwork-Hint: ignore
Message-Id: <20220917154057.5AE278455B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/mali-driver: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=398aa5a4e117f1fffe361f365aac3e9697d3d73b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
