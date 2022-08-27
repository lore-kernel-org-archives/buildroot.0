Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D018ECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 07:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAF4F82D75;
	Sat, 27 Aug 2022 07:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAF4F82D75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SLDUSsjtEYzC; Sat, 27 Aug 2022 07:52:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D72FF82C04;
	Sat, 27 Aug 2022 07:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D72FF82C04
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11C961BF853
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD00482BD6
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD00482BD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yTl1LKfQu2vx for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 07:51:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 798F882813
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 07:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 798F882813
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 520C7878F5; Sat, 27 Aug 2022 07:36:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 09:50:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f4b73adf85f369ecf00aca675b87ab85099d2f6
X-Git-Newrev: 6cd25766163c35b74ba27f08b552bbb92d6bb406
X-Patchwork-Hint: ignore
Message-Id: <20220827073608.520C7878F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/edk2-platforms: fix legal-info
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

commit: https://git.buildroot.net/buildroot/commit/?id=6cd25766163c35b74ba27f08b552bbb92d6bb406
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix typo: EDK2_PLATFORMS_LICENSE_FILE -> EDK2_PLATFORMS_LICENSE_FILES
added by commit 33aa59e7b500e60f2d736a17183c7d49b7baf5bd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/edk2-platforms/edk2-platforms.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/edk2-platforms/edk2-platforms.mk b/package/edk2-platforms/edk2-platforms.mk
index 430791ae3e..7de59c1afc 100644
--- a/package/edk2-platforms/edk2-platforms.mk
+++ b/package/edk2-platforms/edk2-platforms.mk
@@ -8,7 +8,7 @@
 EDK2_PLATFORMS_VERSION = db922e1253cb6f1fc456805bc42fb7d401eed5c2
 EDK2_PLATFORMS_SITE = $(call github,tianocore,edk2-platforms,$(EDK2_PLATFORMS_VERSION))
 EDK2_PLATFORMS_LICENSE = BSD-2-Clause
-EDK2_PLATFORMS_LICENSE_FILE = License.txt
+EDK2_PLATFORMS_LICENSE_FILES = License.txt
 EDK2_PLATFORMS_INSTALL_TARGET = NO
 EDK2_PLATFORMS_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
