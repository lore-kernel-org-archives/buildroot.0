Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAB7ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 07:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 660A6818C4;
	Wed, 14 Sep 2022 07:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 660A6818C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nzFDHFL6KFD3; Wed, 14 Sep 2022 07:39:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3E1C818B5;
	Wed, 14 Sep 2022 07:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3E1C818B5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 269E31BF909
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 07:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F092E40B4D
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 07:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F092E40B4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 03zKTI8WFoGa for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 07:39:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28FAE40B3C
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 07:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28FAE40B3C
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 08D8E838A7; Wed, 14 Sep 2022 07:39:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 09:30:38 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d6eb50a71d0ec484f95c4695c39fbafba145e68a
X-Git-Newrev: 7b166d93e20140b525ea9ec77914e77758cbe05a
X-Patchwork-Hint: ignore
Message-Id: <20220914073925.08D8E838A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/cog: add udev
 dependency to drm platform support
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b166d93e20140b525ea9ec77914e77758cbe05a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The DRM platform support already has the 'BR2_PACKAGE_HAS_UDEV' symbol in
package/cog/Config.in

We just need to specify 'udev' as a dependency in the cog.mk file.
The udev virtual package is pulled by libinput anyway, but this makes it
more explicit.

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit df36e51ee1a545f6fc50a237cc9ff23f099cd806)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cog/cog.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index da660eb7c1..95b6220629 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -28,7 +28,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
 COG_CONF_OPTS += -DCOG_PLATFORM_DRM=ON
-COG_DEPENDENCIES += libdrm libinput libgbm libegl
+COG_DEPENDENCIES += libdrm libinput libgbm libegl udev
 else
 COG_CONF_OPTS += -DCOG_PLATFORM_DRM=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
