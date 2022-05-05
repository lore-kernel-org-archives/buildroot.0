Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8A1C433F5
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 17:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2000F400D1;
	Thu,  5 May 2022 17:40:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yFzniNVpty4b; Thu,  5 May 2022 17:40:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F662401AE;
	Thu,  5 May 2022 17:40:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7BCF91BF354
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 17:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78036401AE
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 17:40:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vW0_mNoP9NuP for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 17:40:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F42D400D1
 for <buildroot@buildroot.org>; Thu,  5 May 2022 17:40:23 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.164.11.20])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D46F813F7E2;
 Thu,  5 May 2022 19:40:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1651772421;
 bh=nsmW/M3au5zHy35QT8WIGu+aiUJvCJ6CRaDi2Yafijk=;
 h=From:To:Cc:Subject:Date:From;
 b=HAGRbn9Sd5tR5v9e0rNtg2YaP6vmWZsp90IcBSpZCLlsrl+FoYwKfQQvpokwBLQct
 rcxlkEjVlh5LBYABUnf1ugXDGszV+PewOFN+MJJNDyvStkosOv4OgkKBd+JtQ5rJJi
 5jFwer99pzh/t3RfKrz/+Wnck1ocM8oZX3StgdeAU3Aq2QSte0o4m3ivAWjzc5u3sQ
 1fFzN5f/n2v023W9CEL7ilnBwN/+lBVS6JXRd4TT2UqAWiQfc8A3C/cMtZXfb+KSP2
 m/9mEOV0+k2ntKmerfEyLXxjG2fQyDwmIgV2DJnPG5UWDIPmTU9Zyrv8rGYQLAJb1w
 Ai4vYXHk26/cA==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu,  5 May 2022 19:40:10 +0200
Message-Id: <20220505174010.83712-1-ju.o@free.fr>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ola: add missing dependencies to
 libusb
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
- http://autobuild.buildroot.net/results/97d07f84cf8e34a697bd332c360ce353b96b2e26/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ola/ola.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 1fd6d6a592..6600de797e 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -203,6 +203,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_OLA_PLUGIN_STAGEPROFI),y)
 OLA_CONF_OPTS += --enable-stageprofi --enable-libusb
+OLA_DEPENDENCIES += libusb
 else
 OLA_CONF_OPTS += --disable-stageprofi
 endif
@@ -215,12 +216,14 @@ endif
 
 ifeq ($(BR2_PACKAGE_OLA_PLUGIN_USBDMX),y)
 OLA_CONF_OPTS += --enable-usbdmx --enable-libusb
+OLA_DEPENDENCIES += libusb
 else
 OLA_CONF_OPTS += --disable-usbdmx
 endif
 
 ifeq ($(BR2_PACKAGE_OLA_PLUGIN_USBPRO),y)
 OLA_CONF_OPTS += --enable-usbpro --enable-libusb
+OLA_DEPENDENCIES += libusb
 else
 OLA_CONF_OPTS += --disable-usbpro
 endif
-- 
2.36.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
