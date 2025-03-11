Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF8BC282EC
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 11:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14E77605CD;
	Tue, 11 Mar 2025 11:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJERCdpYb9FK; Tue, 11 Mar 2025 11:55:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0397E6064C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0397E6064C;
	Tue, 11 Mar 2025 11:55:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C3D451DA
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 11:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE84580D9B
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 11:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dEWPxZL2YhIW for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 11:55:13 +0000 (UTC)
X-Greylist: delayed 368 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 11 Mar 2025 11:55:13 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AFB0A80B87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFB0A80B87
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:4:17::1908;
 helo=smtp-1908.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch
 [IPv6:2001:1600:4:17::1908])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFB0A80B87
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 11:55:13 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch
 [10.4.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZBsVR3hWnz6xT;
 Tue, 11 Mar 2025 12:49:03 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4ZBsVR0jmHzJ7R; Tue, 11 Mar 2025 12:49:03 +0100 (CET)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Tue, 11 Mar 2025 12:48:53 +0100
MIME-Version: 1.0
Message-Id: <20250311-libcamera-qt6-v1-1-4897aadc6fe3@cherry.de>
X-B4-Tracking: v=1; b=H4sIACQj0GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0MD3ZzMpOTE3NSiRN3CEjPdtDTDNAtDE5M081RDJaCegqLUtMwKsHn
 RsbW1AMDmaJ1fAAAA
X-Change-ID: 20250310-libcamera-qt6-ff1f8144f7e1
To: buildroot@buildroot.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH] package/libcamera: force-disable qcam for now
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@cherry.de>

qcam is based on Qt6 since commit 71aa3ceec30b ("apps: qcam: Port to Qt
6") which is part of the v0.3.1 release.

qcam being enabled when BR2_PACKAGE_QT5BASE_WIDGETS symbol is defined
breaks the build as it's missing the qt6 dependencies.

The migration to Qt 6 for the Buildroot package isn't straightforward
though as we're hitting a meson bug[1].

For now, let's just always disable qcam until we can get everything
fixed and migrated properly.

[1] https://github.com/mesonbuild/meson/issues/13018

Fixes: 72757d111a5d ("package/libcamera: bump to version 0.3.2")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
This is suboptimal solution to unbreaking Buildroot builds of libcamera
when Qt5 Widgets are enabled but that should do for Buildroot 2025.02
release.

We should ideally work on adding proper support for qcam in a later
commit, once the issue reported in
https://github.com/mesonbuild/meson/issues/13018 is either fixed or
worked around in Buildroot.

FWIW, I went as far as:

```
ifeq ($(BR2_PACKAGE_QT6BASE_WIDGETS)$(BR2_PACKAGE_QT6_OPENGL),yy)
LIBCAMERA_CONF_OPTS += -Dqcam=enabled
LIBCAMERA_DEPENDENCIES += qt6base
else
LIBCAMERA_CONF_OPTS += -Dqcam=disabled
endif
```

as Qt6 OpenGL module seems required now. Additionally, the Qt6 tools
dependency is doing nothing so it can be removed. It actually never did
anything but turn a check from meson from red to green in the configure
step, the binaries with and without Qt tools (qt5 or qt6) were always
identical to the bit.

There are also a number of other changes we should be making to the
recipe as libcamera is extended without knobs if libdrm, libsdl2,
libjpeg, libdw and/or libunwind are provided. So we should add those to
LIBCAMERA_DEPENDENCIES if they are part of the build, to make builds
reproducible.
---
 package/libcamera/libcamera.mk | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index dcfa54e5dd7fcafcdaaf012ab30df5992ba1d4ce..b3132dc01658ed2fe9e5f780951f3152596dcfcf 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -18,6 +18,7 @@ LIBCAMERA_DEPENDENCIES = \
 LIBCAMERA_CONF_OPTS = \
 	-Dandroid=disabled \
 	-Ddocumentation=disabled \
+	-Dqcam=disabled \
 	-Dtest=false \
 	-Dwerror=false
 LIBCAMERA_INSTALL_STAGING = YES
@@ -83,16 +84,6 @@ LIBCAMERA_CONF_OPTS += -Dgstreamer=enabled
 LIBCAMERA_DEPENDENCIES += gstreamer1 gst1-plugins-base
 endif
 
-ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
-LIBCAMERA_CONF_OPTS += -Dqcam=enabled
-LIBCAMERA_DEPENDENCIES += qt5base
-ifeq ($(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS),y)
-LIBCAMERA_DEPENDENCIES += qt5tools
-endif
-else
-LIBCAMERA_CONF_OPTS += -Dqcam=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_LIBEVENT),y)
 LIBCAMERA_CONF_OPTS += -Dcam=enabled
 LIBCAMERA_DEPENDENCIES += libevent

---
base-commit: f2498258d4d0c7e4f181a54a5334b45ab73612d8
change-id: 20250310-libcamera-qt6-ff1f8144f7e1

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
