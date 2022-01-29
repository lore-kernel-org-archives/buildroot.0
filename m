Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6C1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 22:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A676A60AFE;
	Sat, 29 Jan 2022 22:47:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r_zhFOnwhokh; Sat, 29 Jan 2022 22:47:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCE6860AE0;
	Sat, 29 Jan 2022 22:47:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 048A01BF357
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 22:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E789183134
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 22:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eWjgjOzoPPo7 for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 22:47:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3555283131
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 22:47:00 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id s18so17925074wrv.7
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 14:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MY4HsmFhBhseu4oYqDwgeqRe4M9Kor6qh1M5YtYBtbI=;
 b=GqCWYSR+Hwj8vMzdY+ovdR1Vwnz5ZjN98j9/cCcQMI/sHXu8Gcyz9F4eAx1O5tz70I
 ezxZKbUSKYopa2bgPPhq5RBehb9EnYvcZOS3P73KLBXYLsrhxFEc8JPRf+41lsancT7U
 zo7WkGKBN2W2H6eOC0c+i1Is6qbxHfZGcoUIXOOf9ATEuDFzGka14JJTMdeDTT1Te3yQ
 3tBxX1m25sxmCvCPCdt0mOX8voa8bJIN5rkQcYXtbRE7ClabhcXLleB2cb3KRzcziZBB
 fj93W7lDjfWFg4rQPRML1SqHAO6J3/LCnXooNmU0neYWW9CZqp0UFIg0lh4GAnGtPGCc
 Z2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MY4HsmFhBhseu4oYqDwgeqRe4M9Kor6qh1M5YtYBtbI=;
 b=bK5s32MWAaJp2HiebcCzkJt7r2hAops0eCpw3S7qsRlBG8+Tb8r7T1svQmD0EfOfLS
 vEfAefDEHPrTyo7iDI7LbeYQzDE/R0oQBV1V1f8l0rS+FL4DXq/fMxrcMycRRxwlwFkz
 nY1kEEDpXazHIjVT+RFgfXN/I0kofV7fMMsmlJCLnfL2LxmBkRT5fZPmbKo3W5LK++U6
 gqlCxhbs7TB8hjxTapogdMvpPfLeshdvdeSHvx94Gns2TEAYmRGRJmoSxEGKt5NsRdPF
 ZeCaRT5VSgfqafoL0vUThD20dAEBKkuYMJIDFI4wkuz6SavvCThek+XtVK19N4Yh6P+5
 N0uQ==
X-Gm-Message-State: AOAM533p5j6ity26XE4ybtVAkOJ1kLFAog6hL7sU7HLgLf8AjFdeBGTe
 kjrH/BAzCLDtE4011lv/vc6TZo75HIg=
X-Google-Smtp-Source: ABdhPJzSPVbhKPo8+7uE0QEhpM2DekqMp03/9xgMo2DPfVDLROVIvX4/ZB5wxE29OIXvMEDniPr3SQ==
X-Received: by 2002:adf:fb4a:: with SMTP id c10mr11455373wrs.243.1643496418303; 
 Sat, 29 Jan 2022 14:46:58 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id l24sm5101278wme.17.2022.01.29.14.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 14:46:57 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Jan 2022 23:46:49 +0100
Message-Id: <20220129224651.1282263-3-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220129224651.1282263-1-romain.naour@gmail.com>
References: <20220129224651.1282263-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/5] package/efl: rework eeze handling in Kconfig
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit [1] added eeze dependency using "depends on" to several efl
options (drm, libmount) instead of selecting eeze and propagate the
udev reverse dependency.

The dependency between eeze, libinput, efl drm requires to add a new
libinput option.

Rework eeze handling to use select BR2_PACKAGE_EFL_EEZE since the
user is already aware of the udev dependency (BR2_PACKAGE_HAS_UDEV).

[1] e026c3bdb8f493b3fc21de7c45e3edbc47e03128

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/efl/Config.in | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index eb9c7aebd9..21845ba306 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -115,7 +115,8 @@ config BR2_PACKAGE_EFL_PULSEAUDIO
 config BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT
 	bool "Enable libmount support (recommended)"
 	default y
-	depends on BR2_PACKAGE_EFL_EEZE
+	depends on BR2_PACKAGE_HAS_UDEV # eeze
+	select BR2_PACKAGE_EFL_EEZE
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	# libblkid is part of required tools, see EFL's README.
@@ -126,7 +127,7 @@ config BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT
 	  Enlightenment and its filemanager.
 
 comment "efl's libmount support needs udev /dev management (eeze)"
-	depends on !BR2_PACKAGE_EFL_EEZE
+	depends on !BR2_PACKAGE_HAS_UDEV
 
 config BR2_PACKAGE_EFL_HAS_RECOMMENDED_CONFIG
 	bool
@@ -173,7 +174,7 @@ config BR2_PACKAGE_EFL_WAYLAND
 	depends on BR2_PACKAGE_WAYLAND
 	depends on BR2_TOOLCHAIN_HAS_THREADS # Evas DRM Engine -> libdrm
 	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # Evas DRM Engine
-	depends on BR2_PACKAGE_EFL_EEZE # efl drm
+	depends on BR2_PACKAGE_HAS_UDEV # efl drm (eeze)
 	depends on BR2_PACKAGE_EFL_OPENGLES # OpenGL ES with EGL support only
 	depends on BR2_ENABLE_LOCALE # efl-drm <- efl-elput <- linput
 	select BR2_PACKAGE_EFL_DRM
@@ -182,7 +183,7 @@ config BR2_PACKAGE_EFL_WAYLAND
 comment "Wayland support needs udev /dev management (eeze), OpenGL ES w/ EGL, threads, locales"
 	depends on BR2_PACKAGE_WAYLAND
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_MESA3D_OPENGL_EGL \
-		|| !BR2_PACKAGE_EFL_OPENGLES || !BR2_PACKAGE_EFL_EEZE \
+		|| !BR2_PACKAGE_EFL_OPENGLES || !BR2_PACKAGE_HAS_UDEV \
 		|| !BR2_ENABLE_LOCALE
 
 choice
@@ -215,9 +216,10 @@ endchoice # OpenGL support
 
 config BR2_PACKAGE_EFL_DRM
 	bool "Evas DRM Engine"
-	depends on BR2_PACKAGE_EFL_EEZE
+	depends on BR2_PACKAGE_HAS_UDEV (eeze)
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
 	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # require libgbm from mesa3d
+	select BR2_PACKAGE_EFL_EEZE
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBINPUT # For elput
 	select BR2_PACKAGE_LIBXKBCOMMON
@@ -232,7 +234,7 @@ config BR2_PACKAGE_EFL_DRM
 
 comment "Evas DRM Engine needs udev /dev management (eeze), mesa3d w/ EGL support, threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_MESA3D_OPENGL_EGL \
-		|| !BR2_PACKAGE_EFL_EEZE
+		|| !BR2_PACKAGE_HAS_UDEV
 
 comment "libevas loaders"
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
