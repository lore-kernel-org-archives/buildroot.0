Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AB4C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 20:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99A3D416E9;
	Tue,  5 Apr 2022 20:11:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SEgY96MmaKo8; Tue,  5 Apr 2022 20:11:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FBE5416DD;
	Tue,  5 Apr 2022 20:11:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D72081BF3A4
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 20:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4776405A8
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 20:11:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8iCctsk0SMLU for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 20:11:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26D59402F3
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 20:11:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3122683649; Tue,  5 Apr 2022 20:01:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 5 Apr 2022 22:10:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2642edb0af08f04fb98f4cb5f88895faded4b325
X-Git-Newrev: ab85fc137faa46bd1feb5d95b14ba9bedb1513e8
X-Patchwork-Hint: ignore
Message-Id: <20220405200159.3122683649@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: drop workaround for
 previously missing file
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

commit: https://git.buildroot.net/buildroot/commit/?id=ab85fc137faa46bd1feb5d95b14ba9bedb1513e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop UTIL_LINUX_FIX_DISK_UTILS_COMPILE which is not needed since bump to
version 2.37.4 in commit a586f0a283cd69f436bc6d0cff484460b412a1ce

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/util-linux/util-linux.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 9d9b61d8f5..b53b94ec31 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -35,13 +35,6 @@ UTIL_LINUX_CONF_OPTS += \
 
 UTIL_LINUX_LINK_LIBS = $(TARGET_NLS_LIBS)
 
-# workaround missing disk-utils/raw.8 file in util-linux-2.37.3
-# release download package
-define UTIL_LINUX_FIX_DISK_UTILS_COMPILE
-	touch $(@D)/disk-utils/raw.8
-endef
-UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
-
 HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
 
 # We also don't want the host-python dependency
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
