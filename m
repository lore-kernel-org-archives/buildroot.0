Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216CBC32793
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 02:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76B0A40423;
	Wed, 24 Aug 2022 02:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76B0A40423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O3tY8TnC0T9j; Wed, 24 Aug 2022 02:49:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FA1E40480;
	Wed, 24 Aug 2022 02:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FA1E40480
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8CEC41C1148
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 02:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68FFE40423
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 02:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68FFE40423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NE-KEQIQEsc5 for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 02:49:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6E0C40112
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6E0C40112
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 02:49:29 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id g18so15772227pju.0
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=cuZxOiTJMP5+zuK3MzjaF79nTdIc+AnV3IYD937FLN0=;
 b=dohV2QbD18Dp0yLphnQ/xmDObWEcqPXjQak3GVLXmifw1U8UFck0tUfRJklXs2ZEM4
 FSfloB+/qeZgE1i58EZsLM5MF7K5wd01gOWcGBYNxb7DVj5OUfU/N9B3RZLoUusQ0j84
 abk6EFi7Hcj+X8eTEJgXQFH5nv+N9rg3BTy653FA4lfffwArCKsTeEfq+OUdT0rlgehz
 FsZDyBndXf9OS7hDe2s/DdAwdQhnjjY4OYOCF8OC6d37+lOLMwC/FHEUQcf4hBSipqEo
 5YfSIsf46dHMw9Pjnp0XL4BBjFOE0gWztJYOIHjGEzP4JwJTZ4cYb439Yur8oFaZ3Jvh
 a2fw==
X-Gm-Message-State: ACgBeo3M3PUIA8xkZ3NKt3Lv1h6Xd8klfXPFKbROf53ffpOrfhbqsavt
 0uTs4xSic3mQ27fysLg5DFujlutGpwOYBwL58WQ=
X-Google-Smtp-Source: AA6agR5AZ1y663JIDFZlnlerSwxxUGSTV1HJLJjbPVZAiEK1KVF3UwIHIYfWScMX9XUN83nmVTmgag==
X-Received: by 2002:a17:90b:1b4a:b0:1f5:5578:6398 with SMTP id
 nv10-20020a17090b1b4a00b001f555786398mr6108458pjb.122.1661309368900; 
 Tue, 23 Aug 2022 19:49:28 -0700 (PDT)
Received: from chris-jammy.hollywoodparkca.com
 (2603-8000-3f01-0100-893e-b127-a8ca-bcb9.res6.spectrum.com.
 [2603:8000:3f01:100:893e:b127:a8ca:bcb9])
 by smtp.googlemail.com with ESMTPSA id
 p13-20020a635b0d000000b004296719538esm9845273pgb.40.2022.08.23.19.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 19:49:28 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 19:48:52 -0700
Message-Id: <20220824024904.2529728-2-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824024904.2529728-1-chris.dimich@boundarydevices.com>
References: <20220824024904.2529728-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=cuZxOiTJMP5+zuK3MzjaF79nTdIc+AnV3IYD937FLN0=;
 b=aCCWfLY8XOqC1rhCwYnDUva/mTduTayykUHmyhafMlnE+dYKdmsvVih9kx9Lpi4G94
 uOiMWRFZFunBxAIONlbeAtfu19PwMkkIdJaoHkRD1PhyuzNdH2g+1vJmdWBURdFI7til
 +tVyDKd9xgGGB95xvv+0eDGBKuY654+MjwRYo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=aCCWfLY8
Subject: [Buildroot] [PATCH 2/7] package/weston: add
 BR2_PACKAGE_WESTON_DEPRECATED_WL_SHELL config
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In the case of the vivante sdk, the deprecated-wl-shell option needs to
be enabled. Otherwise, apps using the sdk cannot run on weston/wayland.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 package/weston/Config.in | 4 ++++
 package/weston/weston.mk | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 3b4e932b7d..8f7b1824c7 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -164,4 +164,8 @@ comment "demo clients needs an OpenGL ES provider, an OpenEGL-capable Wayland ba
 		!BR2_USE_WCHAR || !BR2_PACKAGE_HAS_LIBGLES || \
 		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
+config BR2_PACKAGE_WESTON_DEPRECATED_WL_SHELL
+	bool "deprecated wl shell"
+	default n
+
 endif
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index e6c54ee7aa..ad4d81425e 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -186,4 +186,8 @@ else
 WESTON_CONF_OPTS += -Ddemo-clients=false
 endif
 
+ifeq ($(BR2_PACKAGE_WESTON_DEPRECATED_WL_SHELL),y)
+WESTON_CONF_OPTS += -Ddeprecated-wl-shell=true
+endif
+
 $(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
