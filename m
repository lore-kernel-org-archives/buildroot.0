Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625ACC433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Mar 2022 16:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4F3C4092D;
	Sat, 19 Mar 2022 16:22:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9A35sWsZKTN4; Sat, 19 Mar 2022 16:22:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6E4540922;
	Sat, 19 Mar 2022 16:22:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D74E1BF48B
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 16:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C22082660
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 16:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JYQT6KiRhAwY for <buildroot@lists.busybox.net>;
 Sat, 19 Mar 2022 16:22:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 069DB82656
 for <buildroot@buildroot.org>; Sat, 19 Mar 2022 16:22:27 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id v22so1547022wra.2
 for <buildroot@buildroot.org>; Sat, 19 Mar 2022 09:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KmlG36YWPtLvVIDS5I1TOEfcTXMNUXJWR1IfssbeOgQ=;
 b=Jw4VF0HXNWOZG9XSaxFSbp2LevHjLppJVIhJV9tIyguQ+gW4C00NHC08TeE522/hF6
 DL+73MdwqJTtofTDD/r/KkxrOzs/bhiWBvArdX0Z4Gledqq9JXQGbX9pz+1ra79V3ddH
 z0FlmxqDxba4brwj60Fb417q2kTLcedk/ULgYYXk1AdolsoyvyqJxYbZiRbm0RgRF3Gf
 ANochJEWYOo0ebkfC4XE7CB7tydn5CBZ3FxDYPJHlGk0X87u43JQKrEI65Gmm2eAuwBM
 q/XsvW1VJQaIsRdnbskmEpXDRkkRY5hD9Zbz/Uibap0yZBnTE2dXQjVb/4VcaJrHRMY/
 ecmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KmlG36YWPtLvVIDS5I1TOEfcTXMNUXJWR1IfssbeOgQ=;
 b=wMuLWDYhUOtlO9hV93fsT8fBDCsjCYEjSGH0nJjdm4yQ1sknB1UGXDxUTW84aMH/HY
 PAnInWa4OvbY7gLzHqt1XJufEu0mX1+rerdx/llrNT7w8Q6ktHjADlTbiGagL4slUYsO
 T0ZVmtLrSR+w0klHhH8OUW9Yu728/P+EdiB39EHlzywhEb0OquR4wbg+3DxL4tMev6W3
 lR0ihtsERQ96y/41zWe27rgw7+n+2Vj82ZI83lw5Ebd7LuQDRcD8HfIMvYo1Wu1fc3pT
 yFrV2Uo8bzR5v9RLg7JR2FWuxgUobY72LexfX88FYY6zZj5xY5uOtSuVDYmmVkw+I5Rp
 hEGQ==
X-Gm-Message-State: AOAM5309dq1U7/nixtVePSvvCQGrsjzfk2/gc9qPG6NavZ5bD4Ry6rMn
 fBSqMTDU8QYr2rZLjlxiurY8Psbsq+0=
X-Google-Smtp-Source: ABdhPJzirgi2kB4LarCv+Bfgh4K1/EXTLRo6n6DtLXc7KwXlO49nIO3ia/TbGY+vQmHFWFAhdqFQrQ==
X-Received: by 2002:adf:e604:0:b0:203:d866:f741 with SMTP id
 p4-20020adfe604000000b00203d866f741mr12087028wrm.391.1647706945804; 
 Sat, 19 Mar 2022 09:22:25 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n188-20020a1ca4c5000000b00389c692a3b5sm12718828wme.42.2022.03.19.09.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Mar 2022 09:22:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 19 Mar 2022 17:21:09 +0100
Message-Id: <20220319162109.1088457-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/xscreensaver: add gl dependency
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without gl raised since bump to version
6.03 in commit cbcbd66b0f241184288232972d9cd9d03c9f0ce1:

       Note: The OpenGL 3D library is not being used.

             Those demos which use 3D will not be built or installed.
             That is most of them.

make: *** [package/pkg-generic.mk:282: /home/peko/autobuild/instance-0/output-1/build/xscreensaver-6.03/.stamp_configured] Error 1

A patch was sent to Jamie Zawinski to fix this failure and he replied:

"Why would you do that? I pretty much consider that an unsupported
configuration, since that's more than half of the savers at this point."

I told him that some embedded devices don't have gl and he replied:

"Such as? Just about every modern "embedded device" I'm aware of is more
performant than the desktop computers on which I developed many of those
GL hacks..."

So just add a dependency on gl.

Fixes:
 - http://autobuild.buildroot.org/results/b76743a48d75b5b7539712318fa0b2937a157f88

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xscreensaver/Config.in       | 7 ++++---
 package/xscreensaver/xscreensaver.mk | 9 ++-------
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index 48eefdfa70..ba259274d1 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XSCREENSAVER
 	bool "xscreensaver"
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_HAS_LIBGL # libglu
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk2 -> pango
 	depends on BR2_TOOLCHAIN_HAS_THREADS # gdk-pixbuf, libgtk2 -> glib2
 	depends on BR2_USE_WCHAR # gdk-pixbuf, libgtk2 -> glib2
@@ -9,7 +10,7 @@ config BR2_PACKAGE_XSCREENSAVER
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
 	select BR2_PACKAGE_GDK_PIXBUF
 	select BR2_PACKAGE_GDK_PIXBUF_XLIB
-	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_LIBGLU
 	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_JPEG
@@ -28,10 +29,10 @@ config BR2_PACKAGE_XSCREENSAVER
 
 	  http://www.jwz.org/xscreensaver/
 
-comment "xscreensaver needs a toolchain w/ wchar, C++, threads, gcc >= 4.9"
+comment "xscreensaver needs a toolchain w/ wchar, C++, threads, gcc >= 4.9, OpenGL backend"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_USE_WCHAR
+		!BR2_USE_WCHAR || !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index 0a91d22d14..0f21fc0e9f 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -17,6 +17,8 @@ XSCREENSAVER_DEPENDENCIES = \
 	gdk-pixbuf \
 	gdk-pixbuf-xlib \
 	jpeg \
+	libgl \
+	libglu \
 	libgtk2 \
 	libxml2 \
 	xlib_libX11 \
@@ -32,13 +34,6 @@ XSCREENSAVER_CONF_OPTS = \
 	--includedir=$(STAGING_DIR)/usr/include \
 	--libdir=$(STAGING_DIR)/usr/lib
 
-ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
-XSCREENSAVER_CONF_OPTS += --with-gl=yes
-XSCREENSAVER_DEPENDENCIES += libgl libglu
-else
-XSCREENSAVER_CONF_OPTS += --with-gl=no
-endif
-
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 XSCREENSAVER_CONF_OPTS += --with-png=yes
 XSCREENSAVER_DEPENDENCIES += libpng
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
