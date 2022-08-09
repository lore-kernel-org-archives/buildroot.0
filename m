Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8B4C19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 13:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45C15415DA;
	Tue,  9 Aug 2022 13:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45C15415DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gy7dnutt74KD; Tue,  9 Aug 2022 13:27:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8886E415A6;
	Tue,  9 Aug 2022 13:27:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8886E415A6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C6A341BF5E6
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 13:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACE8760BD1
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 13:27:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACE8760BD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DNMg8ykU4NQh for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 13:27:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7820160E3A
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7820160E3A
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 13:27:36 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 p12-20020a7bcc8c000000b003a5360f218fso210951wma.3
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 06:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=3uAwV4N1oDp2whGd7CZeJmQzkFR0BgOn7u6fiA7rBOA=;
 b=gnXej/RqlPyyqdtADik/puNBNC3Wq4XnbI/GaaV8UiHIA5GsK1LPKYfLIRvG9Dtzny
 LTmUFBfveq/27eTF0JgOdfD1ZbxEeoXnJdmpRbfrk5vWvHFjWriu5QxcbMpDb+9BDCkB
 LVWO6RRfXr+Kahr8jAoaXT9KkU5aDwpwAgkDOgbWSfepX1+U0qzV2uuKM7DNohnkeoBg
 owzhCr779IZuyRx76eoRb1uJ6ykHasG+QVyiMtjgfFd+UULE2h8Osz93t3aQuTeCmkK2
 2c9rZfyssaYsS8/PkZCuoBanD4RXjKQj/gx0Ljivk1t88Or02OcySj0vLDIAAFBpDGf4
 BBoQ==
X-Gm-Message-State: ACgBeo1CRwsN+oieZMz+2ozjlnR+oq610w8c1xnsSSwnK+RXVQ0Yjm34
 nPQNi0OwuAz8ow7Wfq6JeiA3iT8YcqbJww==
X-Google-Smtp-Source: AA6agR5Hz4GAg4YFTByxJ04z0LVvAcgVh9Hdn7gM5OVDrMIUNG83o92GzAe4ZvBJ7Yt5R4zyEzAtjQ==
X-Received: by 2002:a05:600c:348d:b0:3a3:1fe6:6b38 with SMTP id
 a13-20020a05600c348d00b003a31fe66b38mr15816989wmq.144.1660051654652; 
 Tue, 09 Aug 2022 06:27:34 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a05600c4e8600b003a37d8b864esm18305288wmq.30.2022.08.09.06.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 06:27:34 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 15:27:30 +0200
Message-Id: <20220809132730.232111-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20220809132730.232111-1-romain.naour@smile.fr>
References: <20220809132730.232111-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=3uAwV4N1oDp2whGd7CZeJmQzkFR0BgOn7u6fiA7rBOA=;
 b=G43Xv5L0GM6mZh5Hw28PFGzwvAEsouKvUl0TaQR0lcmW1p7p91LFjLG0a172T2hb4h
 nhLja7ad9F0AvImR9fJ7JWjNQennO5QPg/NPYcKpITopksujAy+lRG6JrDi0uKjqx3Xd
 pSNHf4WaKgjT1Tt8try6kgcYL21hFotiy50qB/pJk/ICHCra9G9M0143kqOjD7k3eD6U
 jMqy9Ow1UrU1MY36ssgubRFKWMJxl8+B1KZ6Eu5DeDBPFZcd/zlaUVzwXv/6jeUKVKLC
 eVvp8jJfPQGyN+g3oUB4pwbFWohJ0DmMPyN2oRPRm7SkWS4SANsFVLEhD8sT9UMfDQNU
 iylQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=G43Xv5L0
Subject: [Buildroot] [PATCH 2/2] package/libinput: remove python tools
 scripts if python is missing
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
Cc: Romain Naour <romain.naour@smile.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some libinput tools are actually python scripts and requires
at least tree python modules: libevdev, pyudev and pyyaml:

libinput]$ file *
libinput-analyze:                   ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
libinput-analyze-per-slot-delta:    Python script, UTF-8 Unicode text executable
libinput-analyze-recording:         Python script, UTF-8 Unicode text executable
libinput-analyze-touch-down-state:  Python script, UTF-8 Unicode text executable
libinput-debug-events:              ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
libinput-debug-tablet:              ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
libinput-list-devices:              ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
libinput-measure:                   ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
libinput-measure-fuzz:              Python script, UTF-8 Unicode text executable
libinput-measure-touchpad-pressure: Python script, UTF-8 Unicode text executable
libinput-measure-touchpad-size:     Python script, UTF-8 Unicode text executable
libinput-measure-touchpad-tap:      Python script, UTF-8 Unicode text executable
libinput-measure-touch-size:        Python script, UTF-8 Unicode text executable
libinput-quirks:                    ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
libinput-record:                    ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
libinput-replay:                    Python script, UTF-8 Unicode text executable

To avoid adding a python interpreter dependency on libinput package,
add a new libinput option to keep these tools (installed by
default) only when python is available on the target. Otherwise
remove them from the target.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
libinput install unconditionally python scripts without checking if python is available.
It's not really nice to have to remove them from .mk.
---
 package/libinput/Config.in   | 22 ++++++++++++++++++++++
 package/libinput/libinput.mk | 20 ++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/package/libinput/Config.in b/package/libinput/Config.in
index 14e4e70f96..1a8fcc7ed4 100644
--- a/package/libinput/Config.in
+++ b/package/libinput/Config.in
@@ -13,5 +13,27 @@ config BR2_PACKAGE_LIBINPUT
 
 	  http://freedesktop.org/wiki/Software/libinput/
 
+if BR2_PACKAGE_LIBINPUT
+
+config BR2_PACKAGE_LIBINPUT_PYTHON_TOOLS
+	bool "install python tools "
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_LIBEVDEV # runtime
+	select BR2_PACKAGE_PYTHON_PYUDEV # runtime
+	select BR2_PACKAGE_PYTHON_PYYAML # runtime
+	help
+	  Install python tools:
+	  libinput-analyze-per-slot-delta,
+	  libinput-analyze-recording,
+	  libinput-analyze-touch-down-state,
+	  libinput-measure-fuzz,
+	  libinput-measure-touchpad-pressure,
+	  libinput-measure-touchpad-size,
+	  libinput-measure-touchpad-tap,
+	  libinput-measure-touch-size,
+	  libinput-replay
+
+endif
+
 comment "libinput needs udev /dev management"
 	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index a66b0afde5..8c8e0a49a3 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -30,4 +30,24 @@ else
 LIBINPUT_CONF_OPTS += -Ddebug-gui=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIBINPUT_PYTHON_TOOLS),)
+LIBINPUT_PYTHON_TOOLS = libinput-analyze-per-slot-delta \
+	libinput-analyze-recording \
+	libinput-analyze-touch-down-state \
+	libinput-measure-fuzz \
+	libinput-measure-touchpad-pressure \
+	libinput-measure-touchpad-size \
+	libinput-measure-touchpad-tap \
+	libinput-measure-touch-size \
+	libinput-replay
+
+define LIBINPUT_REMOVE_UNNEEDED_FILES
+	for i in $(LIBINPUT_PYTHON_TOOLS) ; do \
+		rm -f $(TARGET_DIR)/usr/libexec/libinput/$$i ; \
+	done
+endef
+
+LIBINPUT_POST_INSTALL_TARGET_HOOKS += LIBINPUT_REMOVE_UNNEEDED_FILES
+endif
+
 $(eval $(meson-package))
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
