Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71F3EB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 08:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3569681C40;
	Sun, 16 Jul 2023 08:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3569681C40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J7djpt4PlZij; Sun, 16 Jul 2023 08:53:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81B7681BA9;
	Sun, 16 Jul 2023 08:53:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81B7681BA9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 626601BF372
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 08:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48F7C605B3
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 08:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48F7C605B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7k5X4CWC8t_y for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 08:53:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E74C5605BA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E74C5605BA
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 08:53:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 66B2BA4C00F6;
 Sun, 16 Jul 2023 10:53:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35072)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKxUy-0001um-0V;
 Sun, 16 Jul 2023 10:53:00 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 10:52:59 +0200
Message-Id: <20230716085259.3684479-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689497580;
 bh=egOYxlsOHsXnmRtlxIsFbTCbSaOm1unnqURXvYDMrgk=;
 h=From:To:Cc:Subject:Date:From;
 b=uKQpLKw3/tSdJEuEzuvBpbf2YTOli5fGy4zkYxOOI5IknGeCevnX7oncQm5WEl9wS
 qZyrqngsSTiIhuVVWJmFLWElkrGAH5hgmfkKSXjZ5D42wb8d8+RmWXfjVHL+4H8cze
 Hm2CehbBAKRwprJUn4O4tjntIPdjT2JfBIAVXSQ7ixGtcfiLed7l+RnYPV7ZE0P3Nz
 S1GGiu5eQBKFPJtFve0HiDDs3wrSLIyBwqDx/XKC/ubkMJRCVCaFfvD/9ky4uHxhwQ
 QOed7nFGAvh9hAAvp/aGdC5Kheu1Y2Ph4MGSyxW6IC87tKYk8WZqsUt5Mgl0EOPRZo
 VSUcHZub6O6fA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=uKQpLKw3
Subject: [Buildroot] [PATCH 1/1] package/pipewire: remove optional
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/8b4/8b4d12de72a1407e74bd9b9b79f4e01ae86510ba/

vulkan.pc is provided by the package vulkan-loader which is not
part of buildroot yet.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
