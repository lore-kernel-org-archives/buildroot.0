Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CCFC433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 16:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9858483E05;
	Thu, 24 Feb 2022 16:25:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O3A_kzL_JRfN; Thu, 24 Feb 2022 16:25:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4664831F5;
	Thu, 24 Feb 2022 16:25:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2B941BF41D
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 16:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 907E9409FA
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 16:25:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eunZvlFcINvC for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 16:25:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BA3F409F2
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 16:25:23 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d17so456776wrc.9
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 08:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KRbf/mCIC8CgJRzqqZzaMFqGtTAz/DmRZPjPRRVhdig=;
 b=NUfRq3A9PSSMgwQZAkt34Arq8j8nFIpklakoJQgF3N+5TLwWkgIjr7AvqNK5sEUnC4
 pr24BjSf4Gro/Uw8+p3or9KnY4D8mH9Xm05fHpIS8ler6m0qUqs0fNHOClvfjhQ1qvoT
 wqBBuqak5xTdLbVbFha9WwmT1Ha4QBsZTxPlvmsIQmmwaQmVeUOtFhtYBd7E0mVafmCy
 XjsW2qKasis9mGQpVJQbD1ElssOujHLy3/n3+eJVs8W1pFpINEBO53XVo4yEC5xi7QXB
 jl15vqLKgX5jJ77BQd1e8LAyqfa5sG3NAo1IApQvTw1qgWaYt3Xn2tqSmBZS/It8SQps
 zpzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KRbf/mCIC8CgJRzqqZzaMFqGtTAz/DmRZPjPRRVhdig=;
 b=M6ff5bIEyt3we3pG7OoTH0qTKUSjNutUyOBftMjmQGwPhOeJTMou956UjCUrhGc3z5
 u/Se2PxRavTzf+63baj/pNLp+3KuLK/7R+U1Y2JlRw2iFLN/UPUAfyolNw3TCUafYfGM
 1RPM4FYfb/kgXj1/FX1RN0zNRv2kOmmDtvoPg3VkAdqiTAHR0SaCw7ZDMLUsLn4kQjsM
 PHl4Uxr/vgJtjanTicXKo17P5lCQsAS0uAXXWmA6A+lhGxtqRGaVgCFz6MetrKdN7/wf
 q6ei+VPvXNY54ptGn/TbRtEbeBHIFcyF55350WZClbJ/hwLs9J6jUoBbObU1ftvi495s
 iyWw==
X-Gm-Message-State: AOAM532MXmMd2bqgxLH3DFNqsd1iZAM3DEu+LsSqDXDWSYBWQWPYJHlR
 PHsW+f03uLuFaC7jWVI3gciCyUZ1nmk=
X-Google-Smtp-Source: ABdhPJzHG0p749r9/0RlN/aHquvGIOmsqspA43UX5WjgBp5lx4xgM0YtV87yTqlWzdVsFbMJS5RARA==
X-Received: by 2002:a5d:514b:0:b0:1ee:aed1:d48f with SMTP id
 u11-20020a5d514b000000b001eeaed1d48fmr1544882wrt.662.1645719921754; 
 Thu, 24 Feb 2022 08:25:21 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id l34sm3300733wms.15.2022.02.24.08.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 08:25:21 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 24 Feb 2022 17:25:16 +0100
Message-Id: <20220224162517.222437-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCHv2 1/2] package/efl: rework eeze handling in
 Kconfig
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

[1] e026c3bdb8f493b3fc21de7c45e3edbc47e03128

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: simplify the commit log
    Remove the "eeze" between parenthesis
---
 package/efl/Config.in | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index eb9c7aebd9..4c78bef7c8 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -115,7 +115,8 @@ config BR2_PACKAGE_EFL_PULSEAUDIO
 config BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT
 	bool "Enable libmount support (recommended)"
 	default y
-	depends on BR2_PACKAGE_EFL_EEZE
+	depends on BR2_PACKAGE_HAS_UDEV # efl-eeze
+	select BR2_PACKAGE_EFL_EEZE
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	# libblkid is part of required tools, see EFL's README.
@@ -125,8 +126,8 @@ config BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT
 	  devices etc... and disabling this will hurt support for
 	  Enlightenment and its filemanager.
 
-comment "efl's libmount support needs udev /dev management (eeze)"
-	depends on !BR2_PACKAGE_EFL_EEZE
+comment "efl's libmount support needs udev /dev management "
+	depends on !BR2_PACKAGE_HAS_UDEV
 
 config BR2_PACKAGE_EFL_HAS_RECOMMENDED_CONFIG
 	bool
@@ -173,16 +174,16 @@ config BR2_PACKAGE_EFL_WAYLAND
 	depends on BR2_PACKAGE_WAYLAND
 	depends on BR2_TOOLCHAIN_HAS_THREADS # Evas DRM Engine -> libdrm
 	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # Evas DRM Engine
-	depends on BR2_PACKAGE_EFL_EEZE # efl drm
+	depends on BR2_PACKAGE_HAS_UDEV # efl drm, efl-eeze
 	depends on BR2_PACKAGE_EFL_OPENGLES # OpenGL ES with EGL support only
 	depends on BR2_ENABLE_LOCALE # efl-drm <- efl-elput <- linput
 	select BR2_PACKAGE_EFL_DRM
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 
-comment "Wayland support needs udev /dev management (eeze), OpenGL ES w/ EGL, threads, locales"
+comment "Wayland support needs udev /dev management, OpenGL ES w/ EGL, threads, locales"
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
+	depends on BR2_PACKAGE_HAS_UDEV # efl-eeze
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
 	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # require libgbm from mesa3d
+	select BR2_PACKAGE_EFL_EEZE
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBINPUT # For elput
 	select BR2_PACKAGE_LIBXKBCOMMON
@@ -230,9 +232,9 @@ config BR2_PACKAGE_EFL_DRM
 	  etc) to handle interfacing with libinput without having to
 	  duplicate the code in each subsystem.
 
-comment "Evas DRM Engine needs udev /dev management (eeze), mesa3d w/ EGL support, threads"
+comment "Evas DRM Engine needs udev /dev management, mesa3d w/ EGL support, threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_MESA3D_OPENGL_EGL \
-		|| !BR2_PACKAGE_EFL_EEZE
+		|| !BR2_PACKAGE_HAS_UDEV
 
 comment "libevas loaders"
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
