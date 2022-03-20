Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B799C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 16:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2688940591;
	Sun, 20 Mar 2022 16:22:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tDR_lsB4EUss; Sun, 20 Mar 2022 16:22:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C97A40583;
	Sun, 20 Mar 2022 16:22:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7762B1BF3C0
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 16:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60A0C408B9
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 16:21:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vrxf4YFGkQeT for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 16:21:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D331408B2
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 16:21:58 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id q20so7310513wmq.1
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 09:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n4CBq1r/Mo+lx4Wa++WahdfLT0RsJ4TbzdMv/IEElWM=;
 b=W7xDKj04BXshGkGqnlfcSc5yCLSoHU3hVYvZWFPCqEVVorCDNU0rAR3mx3c68kz+2I
 wsNLIi+0XUAWYiHcWqCn8fIb4VHuz6iCZ9Bthiul4pgCBbNWfv1q/duopi8WrUY5BE88
 Qd2Rnm9DecQNQkrq+bwqKXRj84YwrzlR1U/IbG6DKjfvsdjXfanJUmofeVFvW+C3SLSB
 u3hsPt30QsdQYohuMjLyxriEca6EGb7WDe6pcluWZpo+2JZ/Rck/SDSRoWNV6sFX2A59
 pE/WPBnNBZl9TWhRa0Ns5pehbY8rKphQVN0r/1PCFZnuaLgg0zsAhlIaYY58SIH7Hefm
 RLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n4CBq1r/Mo+lx4Wa++WahdfLT0RsJ4TbzdMv/IEElWM=;
 b=6QMlgEo6tM3FHd5gf8+as+rjWJ2PLEYi+NhspN2oe/Hueh4+zdpYd4AhAY1sdpPRIs
 fVl1B1C9flZKlADskTnTV/1OK3KKBIgOFBv/3CFGksKiMOFhN+OHpeLoNf10k2dOOLdH
 Tvt9o/sacd92cgFCHkVzYg78/dl3FbveYQr9RLzVD7I9Zd4DJeg+ax5IamSt3pNcznzs
 E0XIigPa4TtFbpHR7aU8mfd7sDcwQskyTnYP5RcibjrGRLZr00ti316IZzgE7jzLDb9G
 mCu96pW4V3pkVL3FzHS5y+Mjg0HsYHOsOOphLEGmmPvt9GMMvO6tHiQwQuswMhTAbPJA
 qk1g==
X-Gm-Message-State: AOAM530diQ+Meqg2cchAWXgTu6kHkoP6s4j/Tbfiq112Z2Ndbj6TN6s2
 aPUQdhzIdDFhbK0QOMfo9r7FBDYBz/k=
X-Google-Smtp-Source: ABdhPJxzU1Z7lw+yijLemflrJCh52BgI8Xz+o3FB7J3HArV1OMlj1Z2BWxeFakVgQ6DE+opq0F2LGA==
X-Received: by 2002:a05:600c:4e51:b0:38c:a7f6:29c0 with SMTP id
 e17-20020a05600c4e5100b0038ca7f629c0mr341385wmq.125.1647793311118; 
 Sun, 20 Mar 2022 09:21:51 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a5d6181000000b00203fc0e79a3sm5052761wru.46.2022.03.20.09.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 09:21:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 17:20:12 +0100
Message-Id: <20220320162012.1527261-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: hid and hog needs
 headers >= 3.18
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Marcin Bis <marcin@bis.org.pl>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Romain Naour <romain.naour@gmail.com>, Mario Lang <mlang@blind.guru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with hid and hog raised since their
addition in commit fb9fc969d91f69851b4c70dba512b607e52bda7b and
https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=9b58288693680b021e5dcbc6f8bea80b5be89311
https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=646db71713b05d50b2b0c421da34e80ed4c54fbd
because UHID_GET_REPORT is only available since kernel 3.18 and
https://github.com/torvalds/linux/commit/fa71f32b5de2be1644ee671ddbe211d79be7847f:

profiles/input/device.c: In function 'uhid_send_get_report_reply':
profiles/input/device.c:222:24: error: 'union <anonymous>' has no member named 'get_report_reply'
  if (size > sizeof(ev.u.get_report_reply.data))
                        ^
profiles/input/device.c:223:21: error: 'union <anonymous>' has no member named 'get_report_reply'
   size = sizeof(ev.u.get_report_reply.data);
                     ^
profiles/input/device.c:231:12: error: 'UHID_GET_REPORT_REPLY' undeclared (first use in this function)
  ev.type = UHID_GET_REPORT_REPLY;
            ^

Fixes:
 - http://autobuild.buildroot.org/results/1db406eac7620e3f76d997414eb7af7d2ac6cfe6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bluez5_utils/Config.in | 16 ++++++++++++++++
 package/brltty/Config.in       |  2 +-
 package/cwiid/Config.in        |  6 +++---
 package/kodi/Config.in         |  6 +++---
 package/supertuxkart/Config.in |  2 +-
 5 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 2eea8c7ced..49bb719102 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -79,15 +79,23 @@ config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH
 
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID
 	bool "build hid plugin"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HOG
 	help
 	  Build plugin for HID (input) profiles.
 
+comment "hid plugin needs a toolchain w/ headers >= 3.18"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
+
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HOG
 	bool "build hog plugin"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
 	help
 	  Build plugin for HoG (input) profiles.
 
+comment "hog plugin needs a toolchain w/ headers >= 3.18"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
+
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MESH
 	bool "build mesh plugin"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # ell
@@ -126,11 +134,15 @@ config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SAP
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SIXAXIS
 	bool "build sixaxis plugin"
 	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # hid plugin
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID # runtime
 	help
 	  Build sixaxis plugin (support Sony Dualshock
 	  controller)
 
+comment "sixaxis plugin needs a toolchain w/ headers >= 3.18"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
+
 comment "sixaxis plugin needs udev /dev management"
 	depends on !BR2_PACKAGE_HAS_UDEV
 
@@ -142,11 +154,15 @@ config BR2_PACKAGE_BLUEZ5_UTILS_TEST
 config BR2_PACKAGE_BLUEZ5_UTILS_TOOLS_HID2HCI
 	bool "build hid2hci tool"
 	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # hid plugin
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID # runtime
 	select BR2_PACKAGE_BLUEZ5_UTILS_TOOLS
 	help
 	  Build hid2hci tool
 
+comment "hid2hci tool needs a toolchain w/ headers >= 3.18"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
+
 comment "hid2hci tool needs udev /dev management"
 	depends on !BR2_PACKAGE_HAS_UDEV
 
diff --git a/package/brltty/Config.in b/package/brltty/Config.in
index c728cb7e20..3527df6161 100644
--- a/package/brltty/Config.in
+++ b/package/brltty/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_BRLTTY
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID if BR2_PACKAGE_BLUEZ5_UTILS # runtime
+	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID if BR2_PACKAGE_BLUEZ5_UTILS && BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # runtime
 	help
 	  A daemon providing access to the Linux console for a blind
 	  person using a refreshable braille display.
diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
index 6ae2ac9405..7e8cdc3086 100644
--- a/package/cwiid/Config.in
+++ b/package/cwiid/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_CWIID
 	depends on BR2_USE_WCHAR # bluez5_utils -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez5_utils -> dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # bluez5_utils -> dbus, libglib2
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5_utils
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # bluez5_utils hid plugin
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # bluez5_utils
 	select BR2_PACKAGE_BLUEZ5_UTILS
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID # runtime
@@ -28,9 +28,9 @@ config BR2_PACKAGE_CWIID_WMGUI
 	select BR2_PACKAGE_LIBGTK2
 endif
 
-comment "cwiid needs a toolchain w/ dynamic lib, threads, wchar, headers >= 3.4"
+comment "cwiid needs a toolchain w/ dynamic lib, threads, wchar, headers >= 3.18"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
 	depends on !BR2_USE_MMU
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index c8e1e5d0ed..4c6e01745c 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -130,7 +130,7 @@ config BR2_PACKAGE_KODI_AVAHI
 
 config BR2_PACKAGE_KODI_BLUEZ
 	bool "bluetooth"
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5_utils
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # bluez5_utils hid plugin
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # bluez5_utils
 	select BR2_PACKAGE_BLUEZ5_UTILS
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO
@@ -138,9 +138,9 @@ config BR2_PACKAGE_KODI_BLUEZ
 	help
 	    Enable bluetooth support
 
-comment "bluetooth support needs a toolchain w/ headers >= 3.4"
+comment "bluetooth support needs a toolchain w/ headers >= 3.18"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
 
 config BR2_PACKAGE_KODI_DBUS
 	bool "dbus"
diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
index 1dd5dcf058..319415754a 100644
--- a/package/supertuxkart/Config.in
+++ b/package/supertuxkart/Config.in
@@ -24,7 +24,7 @@ config BR2_PACKAGE_SUPERTUXKART
 	select BR2_PACKAGE_SDL2
 	select BR2_PACKAGE_XLIB_LIBXRANDR
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID if BR2_PACKAGE_BLUEZ5_UTILS # runtime
+	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID if BR2_PACKAGE_BLUEZ5_UTILS && BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # runtime
 	help
 	  Karts. Nitro. Action! SuperTuxKart is a free 3D arcade kart
 	  racer with multiple karts, tracks and modes you can play.
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
