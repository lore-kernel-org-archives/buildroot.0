Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F76EC0502C
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 07:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B070416DD;
	Sat, 27 Aug 2022 07:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B070416DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gTkaoX2stIny; Sat, 27 Aug 2022 07:52:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0F20416C0;
	Sat, 27 Aug 2022 07:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0F20416C0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 145BB1BF853
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0B5582C04
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0B5582C04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Im8wJ7gK8cEz for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 07:51:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E3F8827FB
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 07:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E3F8827FB
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 482AF876F6; Sat, 27 Aug 2022 07:36:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 09:50:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f336ba8c9beaff0ff12c2050b9fb59f9c9a9c844
X-Git-Newrev: 2f4b73adf85f369ecf00aca675b87ab85099d2f6
X-Patchwork-Hint: ignore
Message-Id: <20220827073608.482AF876F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mali-driver: fix legal-info
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f4b73adf85f369ecf00aca675b87ab85099d2f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix typo: MALI_DRIVER_LICENSE_FILE -> MALI_DRIVER_LICENSE_FILES
added by commit f3ecd9ea4a40d601317f3b7195be4f5d1bdb3146

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mali-driver/mali-driver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mali-driver/mali-driver.mk b/package/mali-driver/mali-driver.mk
index 2d5febe192..515f70c429 100644
--- a/package/mali-driver/mali-driver.mk
+++ b/package/mali-driver/mali-driver.mk
@@ -8,7 +8,7 @@ MALI_DRIVER_VERSION = 3d697de9bce8bc68bf9408d5407873ce32d0f4fc
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
