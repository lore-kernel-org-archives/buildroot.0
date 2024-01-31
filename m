Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4095C47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 20:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 314AB60F3F;
	Wed, 31 Jan 2024 20:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 314AB60F3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CxYUgl2tklxF; Wed, 31 Jan 2024 20:37:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A65760F31;
	Wed, 31 Jan 2024 20:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A65760F31
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15C291BF5A4
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 20:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E092C40160
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 20:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E092C40160
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gkato6wUxv0l for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 20:37:45 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9687240139
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 20:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9687240139
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33ae4eb360aso120589f8f.0
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 12:37:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706733463; x=1707338263;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xmrbGc5iozgTQLLdGRgTrJuKILNcBxukI8V/wB84cIc=;
 b=Ytc1J+I4Mr4X/dn53tNKlRfB5TqYNtcWAcirgnDLz9Ok23jflr2kl0+3FPmkwbzuRx
 CmpyZV0BWQ1QVbpc2VOgiskjEVAzx8m+wfAewLhB1uMXc8sbVDuztzxF2TQLnCPRRccz
 87/ujPBm8XwX4zDl5R1IB2Svg1Xe1CY02E4JK5jMK2/G3z0bWeZEiM+DgIJJDzgHJfGs
 nH6RhpgoplAYaDIpoxEJcpBy6EWyvXhNWpA6JJwuDsd/5/LZ+2SUi5dmHdUIPf3DFXri
 Mv8sMZR9WYn/yLtfSI3PP0Pw4RgMtHaiMM/nFQdAF33NJn/yKXCnWIF3wpS+WeVRW4Tu
 +pBg==
X-Gm-Message-State: AOJu0YxcheLXVcYz9kkL5mfrCtw7YvsfommskVjMk1bYZxvGfNTD2k0t
 xP6qFQsSqfP58MWGQalLZaANbslvQvSApQS8+QYe1FmmZJCtdNLeFum5BxWbjdM=
X-Google-Smtp-Source: AGHT+IEs5JUfRqIfBU+g1EiDVD1Nv3QhTwzGRCcGnSstn+jYaHhtgNgyjBmwdOm80rPUexnXdMCzhA==
X-Received: by 2002:a05:6000:11c4:b0:33a:edb7:cbf6 with SMTP id
 i4-20020a05600011c400b0033aedb7cbf6mr2256071wrx.5.1706733462489; 
 Wed, 31 Jan 2024 12:37:42 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c1d1200b0040e89ade84bsm2551663wms.4.2024.01.31.12.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 12:37:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Jan 2024 21:37:39 +0100
Message-ID: <20240131203739.2092971-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706733463; x=1707338263; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xmrbGc5iozgTQLLdGRgTrJuKILNcBxukI8V/wB84cIc=;
 b=S0Odl8yb1B1nuvw8CWQnPwuybMeqDz7uEfP1lIEio9kCzAI+RF/D/8sVEItqpYnTGc
 godYMB4VnqrhIXI5cVRw9uuPQ/rpSgvVzWHC4JKZ0owxBMuFoV+bP7nHNz3y0cXPVIVO
 S7TNo1HlG/T1pl6887BEWjKlCFuuYIVDbnLvFYJUR3Se1LDU+Id8LgKpR0sd90TS/ZCq
 5vvTfiu2wZ4fooqiNWt5s2DCYXRnf3hnFgrq+7KiSYYSMmKKctCK2nF/4r8s7KXJOUV6
 T7JI1nZybuH6zw4qyvsIvq/8/FSfwx/Hgyr7uxCsyoTegBvfcrekuiJrvYp8wKigGnJM
 zYxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=S0Odl8yb
Subject: [Buildroot] [PATCH 1/1] package/sdl2: force arm mode instead of
 Thumb mode
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
Cc: Michael Fischer <mf@go-sys.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure in Thumb mode:

/home/autobuild/autobuild/instance-12/output-1/build/sdl2-2.28.5/src/atomic/SDL_atomic.c:292:2: error: #error This file should be built in arm mode so the mcr instruction is available for memory barriers
  292 | #error This file should be built in arm mode so the mcr instruction is available for memory barriers
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/70587e7c2452563d655d054a7623bb2fd969862e
 - http://autobuild.buildroot.org/results/2cb11b1f3c013c1f49e2b5383a11ba3f1db6a24c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sdl2/sdl2.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 4646e7d1f8..42b4a433e8 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -54,6 +54,10 @@ SDL2_POST_INSTALL_STAGING_HOOKS += SDL2_FIX_SDL2_CONFIG_CMAKE
 # We must enable static build to get compilation successful.
 SDL2_CONF_OPTS += --enable-static
 
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+SDL2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 SDL2_DEPENDENCIES += udev
 SDL2_CONF_OPTS += --enable-libudev
@@ -76,7 +80,7 @@ endif
 ifeq ($(BR2_PACKAGE_SDL2_DIRECTFB),y)
 SDL2_DEPENDENCIES += directfb
 SDL2_CONF_OPTS += --enable-video-directfb
-SDL2_CONF_ENV = ac_cv_path_DIRECTFBCONFIG=$(STAGING_DIR)/usr/bin/directfb-config
+SDL2_CONF_ENV += ac_cv_path_DIRECTFBCONFIG=$(STAGING_DIR)/usr/bin/directfb-config
 else
 SDL2_CONF_OPTS += --disable-video-directfb
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
