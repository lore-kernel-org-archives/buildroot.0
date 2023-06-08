Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619EAC7EE29
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 19:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC43382152;
	Thu,  8 Jun 2023 19:18:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC43382152
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3YsRYa4KDG9C; Thu,  8 Jun 2023 19:18:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BC4481A50;
	Thu,  8 Jun 2023 19:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BC4481A50
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB15C1BF397
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 19:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 958DD8210D
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 19:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 958DD8210D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eiCbxBONhK29 for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 19:18:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB8C481285
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB8C481285
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 19:18:46 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout06.t-online.de (Postfix) with SMTP id 93DE01292F;
 Thu,  8 Jun 2023 21:18:44 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd86.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q7L9d-0hwncf0; Thu, 8 Jun 2023 21:18:41 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:50702)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q7L9c-00076W-3B;
 Thu, 08 Jun 2023 21:18:41 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 21:18:40 +0200
Message-Id: <20230608191840.3534303-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686251921-0E7FCC77-125D91EF/0/0 CLEAN NORMAL
X-TOI-MSGID: 4d869a1a-4376-4710-a52e-fa483abed7bb
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: enable intel-xe-kmd
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ref:
- https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/20418

Xe KMD is a fresh KMD implementation for Intel GPUs, you can read more
about it in here: https://patchwork.freedesktop.org/series/112188/
Xe KMD will only support Tigerlake and newer platforms, so here is added
Xe KMD support for Iris and ANV, to properly work it is necessary to
enable Xe KMD in build time with -Dintel-xe-kmd=enabled then in run time
it will check if you have i915 or Xe KMD loaded and take the appropriate
code paths.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index feb8547e73..e4b03b65bb 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -98,6 +98,12 @@ else
 MESA3D_CONF_OPTS += -Dgallium-vc4-neon=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS),y)
+MESA3D_CONF_OPTS += -Dintel-xe-kmd=enabled
+else
+MESA3D_CONF_OPTS += -Dintel-xe-kmd=disabled
+endif
+
 # Drivers
 
 #Gallium Drivers
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
