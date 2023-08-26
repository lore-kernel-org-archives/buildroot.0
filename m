Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0188EC83F15
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 18:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC84B40232;
	Sat, 26 Aug 2023 18:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC84B40232
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id he9obUrKVHAn; Sat, 26 Aug 2023 18:48:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2A8F405B7;
	Sat, 26 Aug 2023 18:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2A8F405B7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B4C041BF867
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99A1D41499
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99A1D41499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rnSLiV_-6hJo for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 18:48:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7B5A409FC
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 18:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7B5A409FC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93D2F8636D; Sat, 26 Aug 2023 18:48:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 26 Aug 2023 19:17:10 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: ab72054281376ead3742ff9cbb8511562b0f7c53
X-Git-Newrev: a856114c6b1337fa81cf4390d4fbddccc1b9e0da
X-Patchwork-Hint: ignore
Message-Id: <20230826184802.93D2F8636D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/pipewire: remove
 optional dependency to vulkan
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

commit: https://git.buildroot.net/buildroot/commit/?id=a856114c6b1337fa81cf4390d4fbddccc1b9e0da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes:
http://autobuild.buildroot.net/results/8b4/8b4d12de72a1407e74bd9b9b79f4e01ae86510ba/

vulkan.pc is provided by the package vulkan-loader which is not
part of buildroot yet.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ed20a4eccd7dd665cb7997537f170391b417c5e7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pipewire/pipewire.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index ecf4a035ec..d6bd2434bf 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -30,6 +30,7 @@ PIPEWIRE_CONF_OPTS += \
 	-Dvideoconvert=enabled \
 	-Dvideotestsrc=enabled \
 	-Dvolume=enabled \
+	-Dvulkan=disabled \
 	-Dsession-managers=[] \
 	-Dlegacy-rtkit=false \
 	-Davb=disabled \
@@ -180,12 +181,6 @@ else
 PIPEWIRE_CONF_OPTS += -Dlibusb=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),y)
-PIPEWIRE_CONF_OPTS += -Dvulkan=enabled
-PIPEWIRE_DEPENDENCIES += mesa3d
-else
-PIPEWIRE_CONF_OPTS += -Dvulkan=disabled
-endif
 
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 PIPEWIRE_CONF_OPTS += -Dpw-cat=enabled -Dsndfile=enabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
