Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BA1C433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 17:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7012D40342;
	Mon, 24 Jan 2022 17:27:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UMvU5Vgs5OaX; Mon, 24 Jan 2022 17:27:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37D184053F;
	Mon, 24 Jan 2022 17:27:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AFF2A1BF296
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABCD584BC3
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DD_TXFbf_usv for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 17:27:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92CAD84BBC
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 17:27:02 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r22so7313863wra.8
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 09:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=St+Caaj81l0I0XsAAPT5yulHkoPzs/TiRxd9g65T5x8=;
 b=ZJLk9vuFLUA6pM9e/sZN8nYPmfiUbKhrlL0MweAZMgVITPcdeHVJpsjMUXjnafxRj1
 eYvTebjXET1mS2Ubor9MsvJX3WMTw+RhECtaoDnvjx+zaSh+4n7PvGdg4uyKrltwK55W
 5PYupgi3o4vyunouoKPHqF3dT3L/IhBxEUKT9K4jtBGVAW335MKeswbBddetyLGt9jbi
 xZoeHE87qwAPqYaGlNI6OxunDXfoS3F2W1zUXkm2GHm9Kp9OH1hHjRHKXj0DvpAtgPLg
 0LTkzYIN+ZLxk9cz7wmevBOjxpM8Chfa3fLWuYoBjcklzhjtAA2819o9TPdFswjjc95m
 1WvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=St+Caaj81l0I0XsAAPT5yulHkoPzs/TiRxd9g65T5x8=;
 b=kdNpeZgJLbu/MOx7G7FDpY2zsVs1dW7G1ncZuXS05Irxdo3KPtv05xuLIOvBHVoBL8
 Idle3BOyvLzj6v7ez+pL+HA16eVJu5b6UXFT8sst4u1GN/QYPPHGYwHPlR6afPUyd2aR
 CSxfWvtO1jlfU2C/7BVibmiqCOFNv+0CoqnxiHo34h4n64GELXPlYL60C3kg1LQOPU/6
 R/JVXywsKYsCmuPgiv9Q8ZwK+cIDDm+LTNvpZ9x6hfU1CcSlDFFN5k0mwJSvCK5iYfqy
 LfUD1HIX4dqGLET6XAslPPZU5TMoV0FxNe112RzUhd7DUPY4dJSKhWOmWP+2A3SrHYQU
 1IQg==
X-Gm-Message-State: AOAM533MJ2bbu/C/a7FQADNBaddaskFyTTFk2IfZFjeEV+zh1DFFHere
 3dnAFwrMGqH5+AKPjWZyBr7X97lyje0=
X-Google-Smtp-Source: ABdhPJx+j0RRW7UA8B8MU+9s40ma8MhIYjY6q4xbiAKUbIiZR0Va0t+r3AVzxrnE23j77SbPWVXdLg==
X-Received: by 2002:a5d:544b:: with SMTP id w11mr15459095wrv.10.1643045220716; 
 Mon, 24 Jan 2022 09:27:00 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id m17sm19761185wmq.35.2022.01.24.09.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 09:27:00 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 18:25:20 +0100
Message-Id: <20220124172520.2302603-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/xvisor: bump to version 0.3.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop first patch (already in version)
- Send second patch upstream

http://xhypervisor.org/index.php?page=news/20211220

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../xvisor/0001-fix-build-with-gcc-10.patch   | 64 -------------------
 ...smouse-back.c-fix-build-with-gcc-11.patch} |  1 +
 package/xvisor/xvisor.hash                    |  2 +-
 package/xvisor/xvisor.mk                      |  2 +-
 4 files changed, 3 insertions(+), 66 deletions(-)
 delete mode 100644 package/xvisor/0001-fix-build-with-gcc-10.patch
 rename package/xvisor/{0002-psmouse-back.c-fix-build-with-gcc-11.patch => 0001-psmouse-back.c-fix-build-with-gcc-11.patch} (98%)

diff --git a/package/xvisor/0001-fix-build-with-gcc-10.patch b/package/xvisor/0001-fix-build-with-gcc-10.patch
deleted file mode 100644
index a538558d86..0000000000
--- a/package/xvisor/0001-fix-build-with-gcc-10.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 8458abb357cd981f55d730ec2d74459a3042e571 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 6 Oct 2020 21:52:20 +0200
-Subject: [PATCH] fix build with gcc 10
-
-Define variables in header files as extern to avoid the following build failure
-with gcc 10 (which defaults to -fno-common):
-
-/home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/arm-buildroot-linux-gnueabihf-ld:
-/home/giuliobenetti/autobuild/run/instance-3/output-1/build/xvisor-0.3.0/build/drivers/mmc/core/mmc.o:/home/giuliobenetti/autobuild/run/instance-3/output-1/build/xvisor-0.3.0/drivers/mmc/core/core.h:67:
-multiple definition of `sdio_func_type';
-/home/giuliobenetti/autobuild/run/instance-3/output-1/build/xvisor-0.3.0/build/drivers/mmc/core/core.o:/home/giuliobenetti/autobuild/run/instance-3/output-1/build/xvisor-0.3.0/drivers/mmc/core/core.h:67:
-first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/b6070c0721b33824e71833ce53423979980aa598
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/xvisor/xvisor/pull/125]
----
- drivers/mmc/core/core.h    |  2 +-
- emulators/display/drawfn.h | 10 +++++-----
- 2 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
-index d75d135a..e2ca3141 100644
---- a/drivers/mmc/core/core.h
-+++ b/drivers/mmc/core/core.h
-@@ -64,7 +64,7 @@ int mmc_go_idle(struct mmc_host *host);
-  * Note: Must be called with host->lock held.
-  */
- extern struct vmm_bus sdio_bus_type;
--struct vmm_device_type sdio_func_type;
-+extern struct vmm_device_type sdio_func_type;
- 
- int __sdio_attach(struct mmc_host *host);
- 
-diff --git a/emulators/display/drawfn.h b/emulators/display/drawfn.h
-index f9163cff..385deaf6 100644
---- a/emulators/display/drawfn.h
-+++ b/emulators/display/drawfn.h
-@@ -69,14 +69,14 @@ typedef void (*drawfn)(struct vmm_surface *,
- 				 DRAWFN_ORDER_MAX * \
- 				 DRAWFN_FORMAT_MAX)
- 
--drawfn drawfn_surface_fntable_8[DRAWFN_FNTABLE_SIZE];
-+extern drawfn drawfn_surface_fntable_8[DRAWFN_FNTABLE_SIZE];
- 
--drawfn drawfn_surface_fntable_15[DRAWFN_FNTABLE_SIZE];
-+extern drawfn drawfn_surface_fntable_15[DRAWFN_FNTABLE_SIZE];
- 
--drawfn drawfn_surface_fntable_16[DRAWFN_FNTABLE_SIZE];
-+extern drawfn drawfn_surface_fntable_16[DRAWFN_FNTABLE_SIZE];
- 
--drawfn drawfn_surface_fntable_24[DRAWFN_FNTABLE_SIZE];
-+extern drawfn drawfn_surface_fntable_24[DRAWFN_FNTABLE_SIZE];
- 
--drawfn drawfn_surface_fntable_32[DRAWFN_FNTABLE_SIZE];
-+extern drawfn drawfn_surface_fntable_32[DRAWFN_FNTABLE_SIZE];
- 
- #endif
--- 
-2.28.0
-
diff --git a/package/xvisor/0002-psmouse-back.c-fix-build-with-gcc-11.patch b/package/xvisor/0001-psmouse-back.c-fix-build-with-gcc-11.patch
similarity index 98%
rename from package/xvisor/0002-psmouse-back.c-fix-build-with-gcc-11.patch
rename to package/xvisor/0001-psmouse-back.c-fix-build-with-gcc-11.patch
index 28010034d6..1c02f45c9d 100644
--- a/package/xvisor/0002-psmouse-back.c-fix-build-with-gcc-11.patch
+++ b/package/xvisor/0001-psmouse-back.c-fix-build-with-gcc-11.patch
@@ -17,6 +17,7 @@ Fixes:
  - http://autobuild.buildroot.org/results/69062b9c80567d135edd48890165e69881cf7295
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/xvisor/xvisor/pull/139]
 ---
  drivers/input/mouse/alps.h       | 4 ++--
  drivers/input/mouse/lifebook.h   | 6 +++---
diff --git a/package/xvisor/xvisor.hash b/package/xvisor/xvisor.hash
index 6938e20e7b..45b6fec49c 100644
--- a/package/xvisor/xvisor.hash
+++ b/package/xvisor/xvisor.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  81660d26a0bc63979ba40872f10511df777185712eba2d0e19e816438388de05  xvisor-0.3.0.tar.xz
+sha256  b1bb2ca09340e87a2f465c65196892cdd0f59b798794ae69e35d1f883cf9ba49  xvisor-0.3.1.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
index 394ff7c80b..dc49258400 100644
--- a/package/xvisor/xvisor.mk
+++ b/package/xvisor/xvisor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XVISOR_VERSION = 0.3.0
+XVISOR_VERSION = 0.3.1
 XVISOR_SOURCE = xvisor-$(XVISOR_VERSION).tar.xz
 XVISOR_SITE = http://www.xhypervisor.org/tarball
 XVISOR_LICENSE = GPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
