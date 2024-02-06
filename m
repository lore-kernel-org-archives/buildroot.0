Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455E0C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 12:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8AED81EEC;
	Tue,  6 Feb 2024 12:50:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xi0GYtIFuGdr; Tue,  6 Feb 2024 12:50:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22F9D81EAC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22F9D81EAC;
	Tue,  6 Feb 2024 12:50:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 05B6B1BF95D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB64181F81
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:50:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tvFQctScQZKj for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 12:50:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7788C81E3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7788C81E3C
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7788C81E3C
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 12:50:01 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40fc6578423so37137075e9.0
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 04:50:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707223800; x=1707828600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L5qGGbQn/jl7a3q+ZEE+wTZV8v1EZj/MBuW78USlqFo=;
 b=QhYDZjhPUi/htfGhGjzZhVNoQWZULVrBEHw9pwGniyCwwYXMuNN6sgF4bfsAqlGm3/
 R1hfXuLGJ1y3XdnE+51dGqYx5CIR6BdX4SGM4WQYMQ5FhbR7aYwd0UmxHQEuI9bFsizS
 0nRFFZmGP3/5JPyQSfT22HX8bNUW1kCM58Fu0lxe5gUHYXqeXiYqKKUT72F3mRXBn0cW
 IxsHPP9ZZdNjebHKJ3T/zc+E/gVebxQtzzkYBjAOzK5NmRiOZ8wcDQWmS/l0YIyR+h+n
 ZM0vG7AX6H4Z9oAS4gtusH6T5DaiKG8QOm78yJjWoIzbT+eNjSN2reipcwxrasjRsyKY
 OgnQ==
X-Gm-Message-State: AOJu0YzSWTbAiux5jWbse3J43vYRQhZJODBQiqSkXo+zWiow02OfYFdj
 vLQOWL1g7Hy8MK+osg34BPuCDjYZtOrCnBjgWAnrZ0rRlsAzLiqzkFQMhJ9waNmsjLVbm+xpXp1
 W5S0=
X-Google-Smtp-Source: AGHT+IFESpfqFts2IUIRbU1j2q18gk7qi734wkiYJLkZkCnDDGcsCmoLtgu53RHgJm94lxLO3GTImg==
X-Received: by 2002:a05:600c:5486:b0:40f:de25:f9b4 with SMTP id
 iv6-20020a05600c548600b0040fde25f9b4mr1694702wmb.26.1707223799964; 
 Tue, 06 Feb 2024 04:49:59 -0800 (PST)
Received: from P-NTS-Evian.. ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c161500b0040fde0ec31esm1887265wmn.31.2024.02.06.04.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 04:49:59 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 13:49:46 +0100
Message-ID: <20240206124947.1617078-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206124947.1617078-1-romain.naour@smile.fr>
References: <20240206124947.1617078-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707223800; x=1707828600;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L5qGGbQn/jl7a3q+ZEE+wTZV8v1EZj/MBuW78USlqFo=;
 b=2AMuhqSgz0nJyVMaIL4FR0PnU/C8UbmMZBn5V6YQiofhXWnLCOtvh4TTGuwPwIkLKX
 /nX6NDSb6M3IPsyM6Ynbz66MdN7Q1JEnKmm5suwDTiyfM+4VkT+BYrMQedLnXkIVJheG
 4k/GIrg2QLFQeqFCZBzZeg3CjeInMqKGb+nOD3atKGCiUVk0rLRuGcxSP4IwN/pKD47u
 yEBr1SPNvEj0IRBmT0oQvXmygXkJMtWsY1+hKfg8mxOZOo7glJUPQeu+xMPPthHll/5H
 62NE7uYTx94P1Aj9wUcO7tu+MkSwRASSkVZfVVIVhzgc9PPmlUsbt2yMSHrM3c8Bvaf6
 bCyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=2AMuhqSg
Subject: [Buildroot] [PATCH 1/2] package/mesa3d: fix drisw build without dri3
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mesa3d 23.3 added dri3_priv.h header and dri3_check_multibuffer() function in
drisw (part of swrast gallium driver) that can be build without dri3.

  i686-buildroot-linux-gnu/bin/ld: src/glx/libglx.a.p/drisw_glx.c.o: in function `driswCreateScreenDriver':
  drisw_glx.c:(.text.driswCreateScreenDriver+0x3a0): undefined reference to `dri3_check_multibuffer'
  collect2: error: ld returned 1 exit status

Add HAVE_DRI3 guard around dri3_priv.h header and the zink code using
dri3_check_multibuffer().

While testing again the TestGlxinfo runtime test, a new unexpected error line
appeared in the glxinfo log:

  MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so

mesa3d try to load zink gallium driver even if it was not enabled at
build time, indeed there is no such option in Buildroot.

Apply patches sent upstream:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6093854455

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../0006-drisw-fix-build-without-dri3.patch   | 58 +++++++++++++++++++
 ...on-t-try-zink-if-not-enabled-in-mesa.patch | 42 ++++++++++++++
 2 files changed, 100 insertions(+)
 create mode 100644 package/mesa3d/0006-drisw-fix-build-without-dri3.patch
 create mode 100644 package/mesa3d/0007-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch

diff --git a/package/mesa3d/0006-drisw-fix-build-without-dri3.patch b/package/mesa3d/0006-drisw-fix-build-without-dri3.patch
new file mode 100644
index 0000000000..ab27d384cf
--- /dev/null
+++ b/package/mesa3d/0006-drisw-fix-build-without-dri3.patch
@@ -0,0 +1,58 @@
+From 3ab46dcfda9edf5c9bc27c8f5031146d9d9d8ade Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Thu, 18 Jan 2024 22:50:16 +0100
+Subject: [PATCH] drisw: fix build without dri3
+
+commit 1887368df41 ("glx/sw: check for modifier support in the kopper path")
+added dri3_priv.h header and dri3_check_multibuffer() function in drisw that
+can be build without dri3.
+
+  i686-buildroot-linux-gnu/bin/ld: src/glx/libglx.a.p/drisw_glx.c.o: in function `driswCreateScreenDriver':
+  drisw_glx.c:(.text.driswCreateScreenDriver+0x3a0): undefined reference to `dri3_check_multibuffer'
+  collect2: error: ld returned 1 exit status
+
+Add HAVE_DRI3 guard around dri3_priv.h header and the zink code using
+dri3_check_multibuffer().
+
+Fixes: 1887368df41 ("glx/sw: check for modifier support in the kopper path")
+
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ src/glx/drisw_glx.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/glx/drisw_glx.c b/src/glx/drisw_glx.c
+index 3d3f75259bc..4b19e2d7707 100644
+--- a/src/glx/drisw_glx.c
++++ b/src/glx/drisw_glx.c
+@@ -32,7 +32,9 @@
+ #include <dlfcn.h>
+ #include "dri_common.h"
+ #include "drisw_priv.h"
++#ifdef HAVE_DRI3
+ #include "dri3_priv.h"
++#endif
+ #include <X11/extensions/shmproto.h>
+ #include <assert.h>
+ #include <vulkan/vulkan_core.h>
+@@ -995,6 +997,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
+        goto handle_error;
+    }
+ 
++#ifdef HAVE_DRI3
+    if (pdpyp->zink) {
+       bool err;
+       psc->has_multibuffer = dri3_check_multibuffer(priv->dpy, &err);
+@@ -1005,6 +1008,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
+          goto handle_error;
+       }
+    }
++#endif
+ 
+    glx_config_destroy_list(psc->base.configs);
+    psc->base.configs = configs;
+-- 
+2.43.0
+
diff --git a/package/mesa3d/0007-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch b/package/mesa3d/0007-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
new file mode 100644
index 0000000000..f9e4d50fd7
--- /dev/null
+++ b/package/mesa3d/0007-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
@@ -0,0 +1,42 @@
+From 83b4ff6616708bd7ba5981d22cd5211ca6787d58 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Wed, 24 Jan 2024 14:28:32 +0100
+Subject: [PATCH] glxext: don't try zink if not enabled in mesa
+
+Commit 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
+added an automatic zink fallback even when the zink gallium is not
+enabled at build time.
+
+It leads to unexpected error log while loading drisw driver and
+zink is not installed on the rootfs:
+
+  MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so
+
+Fixes: 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
+
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ src/glx/glxext.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/glx/glxext.c b/src/glx/glxext.c
+index 39d5f08bdcf..e106eb40046 100644
+--- a/src/glx/glxext.c
++++ b/src/glx/glxext.c
+@@ -904,9 +904,11 @@ __glXInitialize(Display * dpy)
+ #endif /* HAVE_DRI3 */
+       if (!debug_get_bool_option("LIBGL_DRI2_DISABLE", false))
+          dpyPriv->dri2Display = dri2CreateDisplay(dpy);
++#if defined(HAVE_ZINK)
+       if (!dpyPriv->dri3Display && !dpyPriv->dri2Display)
+          try_zink = !debug_get_bool_option("LIBGL_KOPPER_DISABLE", false) &&
+                     !getenv("GALLIUM_DRIVER");
++#endif /* HAVE_ZINK */
+    }
+ #endif /* GLX_USE_DRM */
+    if (glx_direct)
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
