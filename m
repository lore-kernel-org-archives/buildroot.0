Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98A0C433FE
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 22:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45AF14032C;
	Mon, 22 Nov 2021 22:30:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZI4M58JqX3Ht; Mon, 22 Nov 2021 22:30:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE42740371;
	Mon, 22 Nov 2021 22:30:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 250501BF951
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 22:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C63A40373
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 22:30:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9e0_Fzqtv7bD for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 22:30:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7508140371
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 22:30:13 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso473953wml.1
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 14:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0aEvZD8r3TFuSsd8TmHszkZzbnEit8ekqlHvG5mLg60=;
 b=ANX4IxqlpvXB/vRakX/4mA6tfDcIk0zJRqFhd0+7SMMSM9gmoS5k+acyOdf+P2/0Po
 skvygfuVuPzCiSIPAECkPBbnBZP3yiOpyjVtF8O5MiYASc5B8j+SED+0xuUB2S3KkRPB
 oymw7Ev3gIzFGgDZEnMjUjE1O2eUS+fT02JFgnhRWIs+jDzhRw1bHQb0+O7ylSlJyZW/
 3eC6jp13KlKsuxg27acoEpmL+HZU+oL2CExLSxTmOKW7HdlBCfF9uSg8TnC/jwomO3JM
 x46Zp0+AJfFVp6+Ndx1yD17IB9drxtIWKbPOq0zhzFXoN157qhpaaLaF+WTOdqvOsY0l
 9ObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0aEvZD8r3TFuSsd8TmHszkZzbnEit8ekqlHvG5mLg60=;
 b=4R+XrO9U5MDQ6pv2wfBDno1ROIb+2dBFSTJvF7cBvSlYFbDDbfWPYYa/2/RTt8cvMN
 aAEDyjrtGUHGTEzf0IC+zB9C6nMHINkuD/PCiafEVquypFo0yEQ7kqjbOqMaVae41hcu
 Jr4lD5+bR5beN+IZJtw5ztJpA4ZhrQOUTkpkUSWRejRKE3qRPWkCUxBHmNU/LSKy5S9F
 q/WNWTqLkNJukEphcVMpzhzNR+llK/vNmKqnb3/GBXvkxCWZnLUvj61LUiLEA7kqiUiA
 oEN/t91/aRStFezzXWseVd6fgOzflcfHcHM/g3eB7Jvw3LSV519WEi8LktMptDZ9r3Ce
 KMYw==
X-Gm-Message-State: AOAM532cH45Lhddgo+YgsNsIu9wY2FIH/8Jmw2jxvEhG88zxn348M0jf
 tUGODyNOULJRCdtygXU0fr+UYhTdGxE=
X-Google-Smtp-Source: ABdhPJwDL3J3G81Q5f9OVBA0gzNmsUW6VFiyodpY3+HMnvlJJz41vUy4Anu3ewZN65i5yqA1i2S7Fg==
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr894126wmg.20.1637620211561; 
 Mon, 22 Nov 2021 14:30:11 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id m14sm13594287wrp.28.2021.11.22.14.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 14:30:11 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Nov 2021 23:27:49 +0100
Message-Id: <20211122222749.3539821-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xcursor-transparent-theme:
 rename ICONS_DEFAULT_CONFIG_INSTALL
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../xcursor-transparent-theme/xcursor-transparent-theme.mk   | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
index ddcc6ac9cb..4706a522ef 100644
--- a/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
+++ b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
@@ -10,11 +10,12 @@ XCURSOR_TRANSPARENT_THEME_DEPENDENCIES = xlib_libXcursor host-xapp_xcursorgen
 XCURSOR_TRANSPARENT_THEME_LICENSE = GPL-2.0
 XCURSOR_TRANSPARENT_THEME_LICENSE_FILES = COPYING
 
-define ICONS_DEFAULT_CONFIG_INSTALL
+define XCURSOR_TRANSPARENT_THEME_ICONS_DEFAULT_CONFIG_INSTALL
 	$(INSTALL) -m 0755 -D package/x11r7/xcursor-transparent-theme/index.theme \
 		$(TARGET_DIR)/usr/share/icons/default/index.theme
 endef
 
-XCURSOR_TRANSPARENT_THEME_POST_INSTALL_TARGET_HOOKS += ICONS_DEFAULT_CONFIG_INSTALL
+XCURSOR_TRANSPARENT_THEME_POST_INSTALL_TARGET_HOOKS += \
+	XCURSOR_TRANSPARENT_THEME_ICONS_DEFAULT_CONFIG_INSTALL
 
 $(eval $(autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
