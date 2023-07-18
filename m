Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC0BEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 20:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62F5B60C19;
	Tue, 18 Jul 2023 20:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62F5B60C19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id flG-n0E_kKUU; Tue, 18 Jul 2023 20:57:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1E4A60AB9;
	Tue, 18 Jul 2023 20:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1E4A60AB9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A40D61BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76B4160AB9
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:57:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76B4160AB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JSlCs8WkQGWc for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 20:57:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A1A5606C6
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 20:57:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A1A5606C6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8769A873FF; Tue, 18 Jul 2023 20:57:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 22:57:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d6bbf4bae81826e6756e62fc0e974777b8e3d92
X-Git-Newrev: ed20a4eccd7dd665cb7997537f170391b417c5e7
X-Patchwork-Hint: ignore
Message-Id: <20230718205756.8769A873FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: remove optional
 dependency to vulkan
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ed20a4eccd7dd665cb7997537f170391b417c5e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/8b4/8b4d12de72a1407e74bd9b9b79f4e01ae86510ba/

vulkan.pc is provided by the package vulkan-loader which is not
part of buildroot yet.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
