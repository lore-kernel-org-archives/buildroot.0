Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E37ECAAD4
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 11:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4029460F57;
	Mon, 29 Aug 2022 11:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4029460F57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jpQAAR_203Q2; Mon, 29 Aug 2022 11:36:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D57960AF4;
	Mon, 29 Aug 2022 11:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D57960AF4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C5DE1BF2BD
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 11:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3610583211
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 11:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3610583211
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OGo_MWJsJU31 for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 11:36:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B48F82F87
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 11:36:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B48F82F87
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7180587F3D; Mon, 29 Aug 2022 11:21:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 13:15:03 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 049500e07d4d934ee928da1aa7233d418a436cc3
X-Git-Newrev: 242d743689041d4d2afe99caf9228d0077c7afcf
X-Patchwork-Hint: ignore
Message-Id: <20220829112105.7180587F3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/opkg-utils: drop
 host-diffutils dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=242d743689041d4d2afe99caf9228d0077c7afcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

diffutils is now a host system dependency, so there is no need for
opkg-utils to depend on host-diffutils.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f7403e4d35c89f14a6663dcd471382734b2a75ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opkg-utils/opkg-utils.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
index 369a4586e8..ad267c5c94 100644
--- a/package/opkg-utils/opkg-utils.mk
+++ b/package/opkg-utils/opkg-utils.mk
@@ -12,7 +12,6 @@ OPKG_UTILS_LICENSE_FILES = COPYING
 
 HOST_OPKG_UTILS_DEPENDENCIES = \
 	$(BR2_PYTHON3_HOST_DEPENDENCY) \
-	host-diffutils \
 	host-lz4 \
 	host-xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
