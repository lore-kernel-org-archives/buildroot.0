Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39888EE4998
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 18:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BDC260B63;
	Tue, 30 Dec 2025 18:12:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qBYuaehpNSMR; Tue, 30 Dec 2025 18:12:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E03360BE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767118372;
	bh=zvFIxyWP6M+WQxDJoWe9SiP0hSPKl8TcCdr9N4UHj3Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZYbAmijPd/RZhn37pUtc8W6vCF79wNamwf4chR64uheBaX2LxP3dF4zD0Ldkqhz7l
	 g5xrfvcLuLT4ato1yySVknU+UJM9cmOZIpV9pYP8QS3Rk3wWWgJqHoRi04sHpGZESZ
	 rBuCVxBvHJr7c0Nwe1yj8ezpaRPuP3xZkJ1thKnoHVfvjzhwSFufkAK+9n4h7fx916
	 gSRSQ4eqUWRTcH8jDkcCjHh3Ae1aQrXdtMiOD0+7jl4TWagieA78/SSf02nA7dOgY0
	 nUmbp3xP8EFgynHQcm6Xoar8WqFv8MFNiMdTLE8jgp2zJFKRsQd5alieMUBhzDvEkQ
	 ZZNOEy9bXdriA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E03360BE0;
	Tue, 30 Dec 2025 18:12:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EDC6177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A86560B63
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QOdrUdi0j-Mv for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 554A660B85
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 554A660B85
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54DEF87C3F; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 19:12:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f306a3e82f6dce6bb22b313b8818d9c84beece03
X-Git-Newrev: 6ab3c9ea1885329c8f3fa53731bb0d1db15a3a9a
X-Patchwork-Hint: ignore
Message-Id: <20251230181235.54DEF87C3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mjpg-streamer: remove optional
 dependency to opencv3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ab3c9ea1885329c8f3fa53731bb0d1db15a3a9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenCV3 is unmaintained and will be removed from buildroot.

The package does not support OpenCV4:
https://github.com/jacksonliam/mjpg-streamer/commit/216c090707ffd71fdf86b0c5b182954846e01bd4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mjpg-streamer/mjpg-streamer.mk | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index 5e52b45b01..e5f12d9d88 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -10,6 +10,7 @@ MJPG_STREAMER_SUBDIR = mjpg-streamer-experimental
 MJPG_STREAMER_LICENSE = GPL-2.0+
 MJPG_STREAMER_LICENSE_FILES = $(MJPG_STREAMER_SUBDIR)/LICENSE
 MJPG_STREAMER_DEPENDENCIES = jpeg
+MJPG_STREAMER_CONF_OPTS = -DPLUGIN_INPUT_OPENCV=OFF
 
 ifeq ($(BR2_PACKAGE_LIBGPHOTO2),y)
 MJPG_STREAMER_CONF_OPTS += -DPLUGIN_INPUT_PTP2=ON
@@ -22,16 +23,6 @@ ifeq ($(BR2_PACKAGE_LIBV4L),y)
 MJPG_STREAMER_DEPENDENCIES += libv4l
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV3_LIB_HIGHGUI)$(BR2_PACKAGE_OPENCV3_LIB_IMGPROC)$(BR2_PACKAGE_OPENCV3_LIB_VIDEOIO),yyy)
-MJPG_STREAMER_CONF_OPTS += \
-	-DPLUGIN_INPUT_OPENCV=ON \
-	-DPLUGIN_CVFILTER_CPP=OFF \
-	-DPLUGIN_CVFILTER_PY=OFF
-MJPG_STREAMER_DEPENDENCIES += host-pkgconf opencv3
-else
-MJPG_STREAMER_CONF_OPTS += -DPLUGIN_INPUT_OPENCV=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_PROTOBUF_C)$(BR2_PACKAGE_ZEROMQ),yy)
 MJPG_STREAMER_CONF_OPTS += -DPLUGIN_OUTPUT_ZMQSERVER=ON
 MJPG_STREAMER_DEPENDENCIES += host-pkgconf protobuf-c zeromq
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
