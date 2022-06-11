Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5113BC43334
	for <buildroot@archiver.kernel.org>; Sat, 11 Jun 2022 14:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16FB04121A;
	Sat, 11 Jun 2022 14:38:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D33AbHNlevUj; Sat, 11 Jun 2022 14:38:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4301D408D1;
	Sat, 11 Jun 2022 14:38:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F72F1BF400
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 14:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E342A408D1
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 14:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hcgIQKMtDaVo for <buildroot@lists.busybox.net>;
 Sat, 11 Jun 2022 14:38:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BE0740256
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 14:38:32 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id a10so803543wmj.5
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 07:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aac+pUFsLplILgQ9zpmcz9RawAqFPTUErfe7vaLeOLQ=;
 b=fCFdqGHcI4DA6913lrwNNlcBclmVND7QY9zOwUoOXeyPtoEVLRSZxCdgVBXOhRZCMA
 YG8mhOuKnfZHuIt4bkBO7HTjqoH0NAtZTmuX57NA5BIlxA+R572ilq5iQ/FaIBDqkWtR
 SgVCAmOAW837VwUmOtgPW8VmNVrY3+MvXxlrJ7CM84aIHjC+G8jbwHzDybrYxRuncVwq
 SUJOTLUWag9DnnMEp4oAysgE/Pg0Vg1fqwU5pltNgCFghE5DXomSx14EAdgXBbrdsiEq
 IRObzsjXOkJnbN5PbZORxzCN+WQG7l13EYbuCFHaJ5a669P0i6MoPHOIeRsx/bAkhrsK
 c1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aac+pUFsLplILgQ9zpmcz9RawAqFPTUErfe7vaLeOLQ=;
 b=Jx571KG6vLvUJc+p/nu4pyh+BSr2IX93Yw5XpbuRm5aLUME+kFz0/fpaostdNNC1mO
 Rop/0OHmegj4i3yw2kXe9GbYE6MlBCdL7jL8ZCkLuFTgnUBwuQKrWex1sUdK5AyeFg01
 4zl8yPviGu1oI8zZLZihCUjo/7JRJnWYgWCG0ap+GnzbpXPm9gP5qR8SsgQQg90RuBvV
 LXEwZQI2Smtfos6KR+k69Emn3yGTJbYfazcAKRmuSqGJqc+591iDmH0KSq84W4ajzvmE
 5OE7Dp2TR4FX1XUOGqYQhzhwZiT3iswwYPHZ0OE2aQuD1L9PJ9boO2X4SZ31aY7nNYlo
 lVjw==
X-Gm-Message-State: AOAM532NSHTpyGZJmrdNQNJUnkiY09yamQdenJ6Y4zkOTUMFJsh3+BPZ
 7UuniYpbP/F3AESTVDUYPtlGxOGD850=
X-Google-Smtp-Source: ABdhPJwT2VS3LVHBlUJMuw33ms34qPl4Zy6FAVMSTiTBrDIjkrdFS4XtGWf7o4752vFKBZP/iyJesw==
X-Received: by 2002:a05:600c:4fd0:b0:39c:6565:31a5 with SMTP id
 o16-20020a05600c4fd000b0039c656531a5mr5110518wmq.60.1654958310385; 
 Sat, 11 Jun 2022 07:38:30 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a5d5746000000b0020d10a249eesm2750132wrw.13.2022.06.11.07.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jun 2022 07:38:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jun 2022 16:35:43 +0200
Message-Id: <20220611143544.844613-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/wolftpm: fix dependencies
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
Cc: Dimitar Tomov <dimi@tpm.dev>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pkg-config is not used by wolftpm and wolfssl dependency is missing (and
optional) resulting in the following build failure since the addition of
the package in commit 4bb884a3c61c6b71e33f69453a90eb2a367f64b7:

configure: error: WolfSSL library not found. You can get it from http://www.wolfssl.com/download.html
        If it's already installed, specify its path using --with-wolfcrypt=/dir or --prefix=/dir

Moreover, BR2_PACKAGE_WOLFSSL_ALL, threads and dynamic libray support
are not mandatory:

./utils/test-pkg -p wolftpm
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: OK
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
6 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Fixes:
 - http://autobuild.buildroot.org/results/77a93521b909e701ef4e86f18524258b9242c721

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wolftpm/Config.in  |  7 -------
 package/wolftpm/wolftpm.mk | 13 ++++++++++---
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/wolftpm/Config.in b/package/wolftpm/Config.in
index 0fe094f277..741d92aa4e 100644
--- a/package/wolftpm/Config.in
+++ b/package/wolftpm/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_WOLFTPM
 	bool "wolftpm"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_WOLFSSL
-	select BR2_PACKAGE_WOLFSSL_ALL
 	help
 	  wolfTPM is a portable, open-source TPM 2.0 stack with
 	  backward API compatibility, designed for embedded use.
@@ -11,6 +7,3 @@ config BR2_PACKAGE_WOLFTPM
 	  resource usage.
 
 	  https://www.wolfssl.com/
-
-comment "wolftpm needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
index ea01eaad6b..f0cf0df0d3 100644
--- a/package/wolftpm/wolftpm.mk
+++ b/package/wolftpm/wolftpm.mk
@@ -10,7 +10,6 @@ WOLFTPM_INSTALL_STAGING = YES
 WOLFTPM_LICENSE = GPL-2.0+
 WOLFTPM_LICENSE_FILES = LICENSE
 WOLFTPM_CPE_ID_VENDOR = wolfssl
-WOLFTPM_DEPENDENCIES = host-pkgconf
 WOLFTPM_CONFIG_SCRIPTS = wolftpm-config
 
 # wolfTPM's source code is released without a configure script,
@@ -19,8 +18,7 @@ WOLFTPM_AUTORECONF = YES
 
 WOLFTPM_CONF_OPTS = \
 	--disable-examples \
-	--enable-devtpm \
-	--with-wolfcrypt=$(STAGING_DIR)/usr
+	--enable-devtpm
 
 # Fix for missing config.rpath in the codebase
 define WOLFTPM_TOUCH_CONFIG_RPATH
@@ -29,4 +27,13 @@ define WOLFTPM_TOUCH_CONFIG_RPATH
 endef
 WOLFTPM_PRE_CONFIGURE_HOOKS += WOLFTPM_TOUCH_CONFIG_RPATH
 
+ifeq ($(BR2_PACKAGE_WOLFSSL),y)
+WOLFTPM_CONF_OPTS += \
+	--enable-wolfcrypt \
+	--with-wolfcrypt=$(STAGING_DIR)/usr
+WOLFTPM_DEPENDENCIES += wolfssl
+else
+WOLFTPM_CONF_OPTS += --disable-wolfcrypt
+endif
+
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
