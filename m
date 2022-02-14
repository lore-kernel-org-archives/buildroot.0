Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3DBC433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 19:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06564400C5;
	Mon, 14 Feb 2022 19:39:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nr-hI-NgdExV; Mon, 14 Feb 2022 19:39:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9C374031E;
	Mon, 14 Feb 2022 19:39:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D1D441BF316
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 19:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB36C402E2
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 19:39:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5m6C5IAE2LGm for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 19:39:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B501402C9
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 19:39:26 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id k1so28570565wrd.8
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 11:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wKSdVHuM4lJ0rrQpiP1KJa/35nyv1CeIoXtEPJrfLfw=;
 b=BQQMQzcfbjF8OHapfnloP0qnT/LjoQhMat450+kK9nhmPZ3kzmmQ/IG1W2ek36+v9t
 C2EIIkcN0RMWEkQoHB2jqwG3xROrS/IPuaOltGaDjTVLrvaP+kyaL/LDgXrXxxlUmWsS
 gTfqUXC8Kz7AXeqSdvQSnJpK5IHTOHo6MpV0ouehv0P1A6GAXYEg6kVQwWsVx0hwvdOJ
 i5vsdkF2btdy79aL/vvRGK5OsN+PYhzCgVaT/hnwWonnGh4OHFcc9g4fQUnPd7LDrTMH
 3qx1ieMy3WRF56CyRqJ+fiJGS6wcRwH0iiVMDBuQMHTllb+OK5q+iBl8+U9QZtfpLAR1
 z0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wKSdVHuM4lJ0rrQpiP1KJa/35nyv1CeIoXtEPJrfLfw=;
 b=Sj8S17aB6vxJHIqa4QIZ7JUCgy++qfJGXshrBONtpXtSx5VbGgaiME1kaO/t3NrYfW
 UWlxkhtJql6HZb+WUHm16hODOdlbLCQsyaD2lBuljobCiVi1EMZaJkgvjJkKjLKkAiXB
 JWVz8jb4e/ZTE64vCdadY56p/NAcGQcr2oAHDSK3HidhZnxEEB1lQSgvLuJg9EJwCvBV
 Bowxq5M575kkFU5KSu+vv+gILXNBLgUT2cVe9+RkQ0VX0Tcg3MYxcb1+E9Lf2xMcz4il
 kCtG5gCXCOFgaogWHXdZ04Bwo1sKnNR12RcJPBLzRIyqcn7KWqhbegCd1JXSf8YX/lBx
 FIdw==
X-Gm-Message-State: AOAM530o2IU7JFjJ4DRSIxQX3uxHPUN05WZIMwPpblPlHpHzWb01WG0j
 +/oK6+ugNf+OZMV7f+q//GjJMyem5TY=
X-Google-Smtp-Source: ABdhPJwrXQ58OTRcKpSH2zaktoqV74K/7XVaqPNjtopjz1fALVaUuQzawi1ucDervChPp+N3S1svbA==
X-Received: by 2002:adf:e98f:: with SMTP id h15mr428752wrm.93.1644867565003;
 Mon, 14 Feb 2022 11:39:25 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id p15sm15407352wma.27.2022.02.14.11.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 11:39:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 20:39:39 +0100
Message-Id: <20220214193940.3615904-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/weston: drop GBM dependency from
 DRM option
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

upstream advocated that DRM backend can be built without GBM:
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/791
so drop dependencies on
BR2_PACKAGE_MESA3D_OPENGL_EGL || BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
to allow DRM to be the default backend when fbdev will be removed in the
follow-up patch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/weston/Config.in | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index d45e50baaa..073a3ae567 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -40,12 +40,8 @@ config BR2_PACKAGE_WESTON_DEFAULT_FBDEV
 
 config BR2_PACKAGE_WESTON_DEFAULT_DRM
 	bool "drm"
-	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL || BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 	select BR2_PACKAGE_WESTON_DRM
 
-comment "drm backend needs mesa3d w/ EGL driver"
-	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL && !BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
-
 config BR2_PACKAGE_WESTON_DEFAULT_HEADLESS
 	bool "headless"
 	select BR2_PACKAGE_WESTON_HEADLESS
@@ -74,11 +70,6 @@ config BR2_PACKAGE_WESTON_DEFAULT_COMPOSITOR
 
 config BR2_PACKAGE_WESTON_DRM
 	bool "DRM compositor"
-	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL || BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
-
-# Uses libgbm from mesa3d
-comment "DRM compositor needs an OpenGL EGL backend provided by mesa3d"
-	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL && !BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 
 config BR2_PACKAGE_WESTON_FBDEV
 	bool "fbdev compositor (deprecated)"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
