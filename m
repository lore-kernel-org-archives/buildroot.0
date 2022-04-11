Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38906C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 21:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF8C460EA3;
	Mon, 11 Apr 2022 21:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pklZFlP6R2G2; Mon, 11 Apr 2022 21:24:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E64D860E43;
	Mon, 11 Apr 2022 21:24:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 955341BF30D
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 21:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92AEF60E63
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 21:24:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BoScGLS-pB4Q for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 21:24:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9598260E43
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 21:24:30 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 ay11-20020a05600c1e0b00b0038eb92fa965so368242wmb.4
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 14:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CAxiIvaTl9Y13SwVCzq+kBkC+FoJJtRRzn1ZiGm3SYM=;
 b=lhNutvJW2Cn85+2ICYjpFTKNXyT4LpNj38NPFH3MCxbJYamxZSImWPbRdpdCC3seAi
 upbZ9ewxWs3xq7TwD2oT29xfCN2S+8Tt1wZRV1Mf5YLI9orD3B/kp6Y/eITyFfvQHUXk
 vr8e+QypPHMo+WTIUzHc4qOpHQTD0yJA3e12LAMkLWA63Ylsc9D1lr2/Ce1H3vy7MnbN
 0Ej54oBs20jf9hT1bgCdXwwNPu3R6Kd0YXz/rMCrdoQFLm2WK/e+T1su4m6RvhS8xi4Q
 JkXJskC8z+miFldm2+MDAjF2YjjDogw8qZ1OhpHDxZ8G/8DXJbfxr1bzt9XQmpkMp5gn
 5EOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CAxiIvaTl9Y13SwVCzq+kBkC+FoJJtRRzn1ZiGm3SYM=;
 b=LGIf60fZajXv08Sx20E3cgxHonFvfKwj6AgIICZaumLahrHjedRCtovWsfjnKo/Hoi
 zAdBtFhgOwYuB4IQ1CpMy8trjAWenP11JwzJpNSyuTiudp9AjnNnUVnXu0E0QJUp2DvU
 4FKKkkMDqylQa4tASlJhO1+vv2LvmF2g5qwpG3INhJfiQYl3JxzBIiPYaeM82ySTYbYY
 Bzru+STrKFhiIg/gw3HzujcVCKuwy6HG2GGFKQFljI/+FnE49qFooVRJtWjxmRmNpCO1
 FH6cQMQRxT/d524zY+TIhLisCwCCE1FiC4BcTb5kieKFcpqlQDGtGDVrshk0X9a/Fv1T
 meYQ==
X-Gm-Message-State: AOAM533JsocDXtqBUMJ9ONh4dHL53oKA30E4DMCkmx5cPeiyGRXykK1f
 6CO/d3+yKX/W7PicZE5xZFqBoqShSE0=
X-Google-Smtp-Source: ABdhPJy66EhW3cP9AMRDbSgQzMIsBe12uOFNJeKa1YoeRgxo++AyBjIn/JPv213PSibomcrHx2LpkA==
X-Received: by 2002:a05:600c:1910:b0:38d:1403:da8b with SMTP id
 j16-20020a05600c191000b0038d1403da8bmr1004003wmq.3.1649712268589; 
 Mon, 11 Apr 2022 14:24:28 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b0038e75fda4edsm490980wmb.47.2022.04.11.14.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 14:24:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Apr 2022 23:22:34 +0200
Message-Id: <20220411212234.257672-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/startup-notification: bump to
 version 0.12
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

xcb-util is mandatory since
https://cgit.freedesktop.org/startup-notification/commit/?id=15c0bae76e0bcd5d2839a791cf51c8b22e615fe2
https://cgit.freedesktop.org/startup-notification/commit/?id=57816a46aa32d0bd667661ce6aaaa187f84ec889

https://cgit.freedesktop.org/startup-notification/tree/NEWS?h=STARTUP_NOTIFICATION_0_12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/startup-notification/Config.in                 | 1 +
 package/startup-notification/startup-notification.hash | 2 +-
 package/startup-notification/startup-notification.mk   | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/startup-notification/Config.in b/package/startup-notification/Config.in
index 88d18174bc..606276e484 100644
--- a/package/startup-notification/Config.in
+++ b/package/startup-notification/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_STARTUP_NOTIFICATION
 	bool "startup-notification"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_XCB_UTIL
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
 	  Startup-notification is a library used to monitor
diff --git a/package/startup-notification/startup-notification.hash b/package/startup-notification/startup-notification.hash
index 474c8bd92c..9c5713213b 100644
--- a/package/startup-notification/startup-notification.hash
+++ b/package/startup-notification/startup-notification.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c2fa09f9a49d8b319e79638e49e967c682df8726006e03059b1ffca5ab82099c  startup-notification-0.9.tar.gz
+sha256  3c391f7e930c583095045cd2d10eb73a64f085c7fde9d260f2652c7cb3cfbe4a  startup-notification-0.12.tar.gz
 sha256  29935974beae046f50da806b5f4e54532401dd7bcfbc696a0b645f4cbcce9dbb  COPYING
diff --git a/package/startup-notification/startup-notification.mk b/package/startup-notification/startup-notification.mk
index b3314087f5..4a9e33e5ed 100644
--- a/package/startup-notification/startup-notification.mk
+++ b/package/startup-notification/startup-notification.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-STARTUP_NOTIFICATION_VERSION = 0.9
+STARTUP_NOTIFICATION_VERSION = 0.12
 STARTUP_NOTIFICATION_SITE = http://freedesktop.org/software/startup-notification/releases
 STARTUP_NOTIFICATION_INSTALL_STAGING = YES
-STARTUP_NOTIFICATION_DEPENDENCIES = xlib_libX11
+STARTUP_NOTIFICATION_DEPENDENCIES = xcb-util xlib_libX11
 STARTUP_NOTIFICATION_CONF_ENV = lf_cv_sane_realloc=yes
 STARTUP_NOTIFICATION_CONF_OPTS = --with-x \
 	--x-includes="$(STAGING_DIR)/usr/include/X11" \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
