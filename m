Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D8EECAAA1
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 08:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64C8F6102E;
	Thu, 15 Sep 2022 08:35:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64C8F6102E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tgc6gx1tdK10; Thu, 15 Sep 2022 08:35:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75BD360FEE;
	Thu, 15 Sep 2022 08:35:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75BD360FEE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C410A1BF475
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 08:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD118833A3
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 08:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD118833A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rBOOFmbBtp01 for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 08:34:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5673832C9
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 08:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5673832C9
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C63BF83829; Thu, 15 Sep 2022 08:34:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 10:32:37 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 9f5f395f58fb7c90eaf0bad23e69f7443a2c6137
X-Git-Newrev: fff6fc909892daed6790046387d2f7b40f12fd2b
X-Patchwork-Hint: ignore
Message-Id: <20220915083439.C63BF83829@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/jack2: add
 host-pkgconf dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=fff6fc909892daed6790046387d2f7b40f12fd2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fix the following build failure raised since commit
69284b6700e5f45e25a583e87b86ed1eb95038fd:

Checking for program 'pkg-config'        : not found
The above check failed, but the checkee is required for --alsa.

Indeed, before this commit, host-pkgconf was pulled by libsndfile
dependency

Fixes:
 - http://autobuild.buildroot.org/results/cbdc251980f5571f75281202ebffc04ddecbf28d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4e9d04986e6545e9258a8ba925c4538e6a9a481a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jack2/jack2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 9e56dcdfd8..9d6a3b6479 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -9,7 +9,7 @@ JACK2_SITE = $(call github,jackaudio,jack2,v$(JACK2_VERSION))
 JACK2_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK2_LICENSE_FILES = COPYING
 JACK2_CPE_ID_VENDOR = jackaudio
-JACK2_DEPENDENCIES = alsa-lib
+JACK2_DEPENDENCIES = host-pkgconf alsa-lib
 JACK2_INSTALL_STAGING = YES
 
 JACK2_CONF_OPTS = --alsa --example-tools=no
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
