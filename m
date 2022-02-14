Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742AEC433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 19:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CC9E40573;
	Mon, 14 Feb 2022 19:39:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9UkDU5K35Yx3; Mon, 14 Feb 2022 19:39:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEE7F404FA;
	Mon, 14 Feb 2022 19:39:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC8801BF316
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 19:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B90B360D51
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 19:39:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id een0-szyHyu4 for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 19:39:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68CF160B30
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 19:39:29 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 y6-20020a7bc186000000b0037bdc5a531eso447546wmi.0
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 11:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pTNsM2p37SRi22oqlXNyt38aI9rUia0dxUzc8eyLXuo=;
 b=Sa8f+cuEjfQr6TFCTbgRB1fTUU9iBy6pnDTTgM0kPJxtxAZeLADVyFVj+eRdtvP9EI
 eZgyzUwHm+ppQ9civJcy3hd+ZeD6qzE1sQWv5/JqpnAa8vVRebQ9fFvSIyu7Oso6r7uK
 9NG1SUrtrnnfqxcb3mTRt9+MRCZFmVVkQQ/blatjwdF/fGYU/nVwDhgAbU8ZoZ/iiYso
 h9JVv6uf25M/vBo6pnXQDZ1KNCsAPKceaLVKhHgI4QELM1THAXZKuhqWsmC1ggzbIiT4
 eTRV6GMVpy3Zh4eM9tf3+h3xCE/XQnnnKdtUR2Pna3WtSaTTPgDUDBTpzPIgPlc0BGj6
 YNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pTNsM2p37SRi22oqlXNyt38aI9rUia0dxUzc8eyLXuo=;
 b=PQ/MgxNvWQs/Yb4jUlkZOi3/6P7U+3g1Wt8pztBYNMQYpqqU7pHzvQm/G/bJeINrWw
 dATh9KlI03kghp7j18bKNXAYwH8nrysxsCcv1m3KMQEUHpSimuyTRzTemBRA5J88g5Xt
 LbhSqqUcjlMgdpgWLselrho+qLOQjv4nkItp38cfIn07H0js0Gd3jDPu1Y252es0sTl+
 Ti8CwphpB5llbXzQxL82HY6KAQPoul4Cbtv3Uaj2/wjPF1qaKZBfONHjCNqKx8BebA/D
 gLe97Gj5mShzWNXCHpKvtWsdZlTE0AY2Qu5+vUApYoYEmldm3F8unQfy1R1qfDd3NVP7
 +Nog==
X-Gm-Message-State: AOAM531eUNUp1K1tqU55AehSCKrsqL/IkHQaNlcdnyfT/kXPOJVrJioU
 T7gQWsjdXbqrZBCqBraEqSrMxBXSJQs=
X-Google-Smtp-Source: ABdhPJzj8DcWxqAw8IwWaKHjeNtCPaoWAhVE/oxwzUf3WRCUCMQUUiBl/5AIxUP4bbwhxl8fcTjpkQ==
X-Received: by 2002:a05:600c:220b:b0:37b:ec02:32c4 with SMTP id
 z11-20020a05600c220b00b0037bec0232c4mr226500wml.11.1644867567237; 
 Mon, 14 Feb 2022 11:39:27 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id p15sm15407352wma.27.2022.02.14.11.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 11:39:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 20:39:40 +0100
Message-Id: <20220214193940.3615904-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214193940.3615904-1-fontaine.fabrice@gmail.com>
References: <20220214193940.3615904-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/weston: drop fbdev
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

fbdev raises the following build failure since bump to version 10.0.0 in
commit f67a6e9b7a7be9adbc405b3126000056120a01af and
https://gitlab.freedesktop.org/wayland/weston/-/commit/6338dbd5816689b2f08f48b359a972e16ff038d8:

../output-1/build/weston-10.0.0/meson.build:133:7: ERROR: Tried to access unknown option 'backend-fbdev'.

Drop fbdev to avoid this build failure as upstream is reluctant to
properly fix this issue by renaming the fbdev option in stable release:
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/791

Fixes:
 - http://autobuild.buildroot.org/results/e669a6237c19783c627169c819d7372e20daaf54

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy         | 12 ++++++++++++
 package/weston/Config.in |  8 --------
 package/weston/weston.mk |  6 ------
 3 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index aefb0ba6ea..b90b9dbcbc 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,18 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_WESTON_DEFAULT_FBDEV
+	bool "weston fbdev removed"
+	select BR2_LEGACY
+	help
+	  fbdev was deprecated in weston 10.0.0.
+
+config BR2_PACKAGE_WESTON_FBDEV
+	bool "weston fbdev compositor removed"
+	select BR2_LEGACY
+	help
+	  fbdev compositor was deprecated in weston 10.0.0.
+
 config BR2_PACKAGE_LINUX_TOOLS_BPFTOOL
 	bool "bpftool was moved"
 	select BR2_LEGACY
diff --git a/package/weston/Config.in b/package/weston/Config.in
index 073a3ae567..6ad8241caa 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -34,10 +34,6 @@ if BR2_PACKAGE_WESTON
 choice
 	prompt "default compositor"
 
-config BR2_PACKAGE_WESTON_DEFAULT_FBDEV
-	bool "fbdev (deprecated)"
-	select BR2_PACKAGE_WESTON_FBDEV
-
 config BR2_PACKAGE_WESTON_DEFAULT_DRM
 	bool "drm"
 	select BR2_PACKAGE_WESTON_DRM
@@ -62,7 +58,6 @@ endchoice
 
 config BR2_PACKAGE_WESTON_DEFAULT_COMPOSITOR
 	string
-	default "fbdev"    if BR2_PACKAGE_WESTON_DEFAULT_FBDEV
 	default "drm"      if BR2_PACKAGE_WESTON_DEFAULT_DRM
 	default "headless" if BR2_PACKAGE_WESTON_DEFAULT_HEADLESS
 	default "wayland"  if BR2_PACKAGE_WESTON_DEFAULT_WAYLAND
@@ -71,9 +66,6 @@ config BR2_PACKAGE_WESTON_DEFAULT_COMPOSITOR
 config BR2_PACKAGE_WESTON_DRM
 	bool "DRM compositor"
 
-config BR2_PACKAGE_WESTON_FBDEV
-	bool "fbdev compositor (deprecated)"
-
 # FreeRDP needs threads and !static, already the case for weston
 config BR2_PACKAGE_WESTON_RDP
 	bool "RDP compositor"
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index a0a18d9358..90cf160688 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -85,12 +85,6 @@ else
 WESTON_CONF_OPTS += -Dbackend-rdp=false
 endif
 
-ifeq ($(BR2_PACKAGE_WESTON_FBDEV),y)
-WESTON_CONF_OPTS += -Ddeprecated-backend-fbdev=true
-else
-WESTON_CONF_OPTS += -Ddeprecated-backend-fbdev=false
-endif
-
 ifeq ($(BR2_PACKAGE_WESTON_DRM),y)
 WESTON_CONF_OPTS += -Dbackend-drm=true
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
