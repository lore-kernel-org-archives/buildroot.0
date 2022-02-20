Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37D0C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 21:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D89160ADB;
	Sun, 20 Feb 2022 21:42:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8-OsKhkEt_a9; Sun, 20 Feb 2022 21:42:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAECD60BB1;
	Sun, 20 Feb 2022 21:42:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 07D181BF3D7
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 21:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F106960BB1
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 21:42:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aH_frgmmIx8j for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 21:42:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 361B860ADB
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 21:42:34 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id o34so8473515wms.1
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 13:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ewjs+uEzQUsVZKVQsOwDffP0pTEcJ6ZzKPQqubKw0DU=;
 b=Btt9VQr8hFfOy4SL4dlZcPFlZykColbBMSefAHr0rkDcMwjhtTHXRwPIREgMXsEg2E
 Wu8RGAcUEjlnTJDcRVhpZeAf1XJtYjc1tnbLiRvEiA7wD/5ED9Pq4MArT7cHpoL2LndB
 AwYH9/X0omG5rA4OTXfO8cA2bVeEu0tZfnlrK7hlfRe60m60WnKUfwPCCSN862DMqzhB
 RD+cyUD6k6jJ+WQPbAbS1c7OoQyvbRJA2zdJs6elP1AKGEStSMEyIP6q8rLgxEsKzN2K
 XTUDr/NInc21rLvHlptR/30eJVf68th1wgjbnSiykEXwqzhuMc1Ha1S5/gkCYBqRZc4o
 kj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ewjs+uEzQUsVZKVQsOwDffP0pTEcJ6ZzKPQqubKw0DU=;
 b=LE45DDjwgbPBRMsA3kCJfDlJVkGO6amBv2Tc8/OV221lGrpLXlatNZIB+4TG4yrXNN
 LrYsef9VVchhs/7Fu75Rj6VmujHxG6E8LC3izjuh4SDa1V1B5Eo578YdJi6tiyPo1A15
 nS0AhVAPL1yaPGxD9yUFPRFAJpLxgRVGFAEOjevrkKcpmbK6e8QhgKcN2YXuFY6CUGb3
 8GoVxCANl2uJdnen4RmpXodbXe5HAZ6ErrmLIg9NvSg9ZWlfnNwPsmxmYLcWa564xgv2
 UtX5JeL/8G+Bd0J06FYznYFQi01A5He1/LfurhPCKPVY1774pr6MeMqU+/VBZWiQ4am5
 WIAQ==
X-Gm-Message-State: AOAM533hY4pZ81xxq9MZrKJfPysGMAK03VNeyPEFcYGb/1Bfrc63E/zz
 coCd7vRk2ksWePCJuzJR1CnKzdnr4ZE=
X-Google-Smtp-Source: ABdhPJwKCMEoXmVoqbx1U1xGgO/8N+aSe4Oe5qgZWKhxRdO/JMrrH/bbszwtFSj4iKQTl+gJMCYRPg==
X-Received: by 2002:a05:600c:4c12:b0:37b:b8aa:c0dc with SMTP id
 d18-20020a05600c4c1200b0037bb8aac0dcmr18919244wmp.13.1645393352084; 
 Sun, 20 Feb 2022 13:42:32 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id n7sm5699364wmd.30.2022.02.20.13.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 13:42:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 22:42:36 +0100
Message-Id: <20220220214236.1739049-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-r128:
 don't override XDRIVER_XF86_VIDEO_R128_CONF_OPTS
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

XDRIVER_XF86_VIDEO_R128_CONF_OPTS is wrongly overridden in a conditional
since commit 082b65319c90ea5c9a89ff4ffed12af3a3e952b6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
index 455cfbad86..690041d4c6 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
@@ -12,7 +12,7 @@ XDRIVER_XF86_VIDEO_R128_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_R128_DEPENDENCIES = xserver_xorg-server xorgproto
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
-XDRIVER_XF86_VIDEO_R128_CONF_OPTS = --disable-dri
+XDRIVER_XF86_VIDEO_R128_CONF_OPTS += --disable-dri
 endif
 
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
