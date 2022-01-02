Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D20FC433EF
	for <buildroot@archiver.kernel.org>; Sun,  2 Jan 2022 18:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECD3A813CA;
	Sun,  2 Jan 2022 18:15:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 49ltA6ULwvyA; Sun,  2 Jan 2022 18:15:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 480D881363;
	Sun,  2 Jan 2022 18:15:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B4F9B1BF2B8
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 18:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1AA26063B
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 18:15:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m2sk_fZ_jfgp for <buildroot@lists.busybox.net>;
 Sun,  2 Jan 2022 18:15:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B06AC605A7
 for <buildroot@buildroot.org>; Sun,  2 Jan 2022 18:15:33 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id z29so127995096edl.7
 for <buildroot@buildroot.org>; Sun, 02 Jan 2022 10:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=wnhIVtYn+uDyVNlyfLEXWyXNH9EoeY6W1guCzT0PwW0=;
 b=BsDT+y2PXc6doPc1YRb12lft5dGRy04Yc7ArHdZZrEMipRbIK9vou6x+mmvWtZCb5j
 LiCgjlul/+7hwtpRmdkMye4A6M0McRz1PZOcl4eZBTpdf2i/NMdCAWn7595kYOfR2d6r
 dpNU4+Fv6xdCX1SW4Nb3qgESOeA3IOJUQ13tHgKhVEG1eZeRGDE3GYg+jycooxwx3MgB
 FGkkPUApyNDQ84ZOMKGLVmNB58rkJQq+dRvRvnhkeIhUyvG4zV4R1ox5JUTFvsG6bcFB
 3snuBuTk4n3VI9lbY2jiVAfZFBfJr3psi/TG5rhngJ4ZZeU+gDXaQP4UQy2I4gVV4LxZ
 Rdtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wnhIVtYn+uDyVNlyfLEXWyXNH9EoeY6W1guCzT0PwW0=;
 b=IG5TEvvyz9SzbqCvvjFQ51oifmbdjF13cR+hcjKaSWTmNgkyBZG2Bem2eM5aguwbP+
 i+cNEwkH65J+Ak9t62Js+rtAy7hhc8mvfyMEbT4jiWMtNT/rdH00WynCw3p5OBUhgArw
 JapM0bhisXth9TIJeGARaONnqnWxUsaZfclT8wRDDCkq5PEUrbcETA5zj/EvQw4uB+fd
 qgiMKLT7rhmOs//7WReo78ylmeuhk3kZ9OS29TE18JhWFt/6bopwkeGG5QdyWeQVOuYQ
 E338FuNHQlKxCcdYE/OdxdJEZgD0sIbAjQ5xFGFlG5zAODeT+giAp39bx6Bw9ZlD5us4
 lWcA==
X-Gm-Message-State: AOAM53248Xu7SSe4Vyt7mWHzPXYVCHEb4nlbMoCKz4y94AUTTXuj5JVJ
 Wu036iaJXcf2r1RxmTOwd0SvkJ938DsR6A==
X-Google-Smtp-Source: ABdhPJy/F0G4L60XPatxDTZbOgQI7OTmQ+Et2CiaUpi0ieoByFdtTwfJHdxyH5xcpaQQvCYBARol7w==
X-Received: by 2002:aa7:cc83:: with SMTP id p3mr41588128edt.382.1641147331502; 
 Sun, 02 Jan 2022 10:15:31 -0800 (PST)
Received: from localhost.localdomain ([156.196.164.230])
 by smtp.gmail.com with ESMTPSA id u21sm12831445eds.8.2022.01.02.10.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jan 2022 10:15:31 -0800 (PST)
From: azxxza22 <amrtmoh2006@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Jan 2022 20:15:24 +0200
Message-Id: <20220102181525.9494-1-amrtmoh2006@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Buildroot] [PATCH 1/2] nodogsplash package added
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
Cc: azxxza22 <amrtmoh2006@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: azxxza22 <amrtmoh2006@gmail.com>
---
 package/Config.in                  |  1 +
 package/nodogsplash/Config.in      |  9 ++++++++
 package/nodogsplash/nodogsplash.mk | 37 ++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 package/nodogsplash/Config.in
 create mode 100644 package/nodogsplash/nodogsplash.mk

diff --git a/package/Config.in b/package/Config.in
index 2eda8f6ad7..152a2e9e60 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2270,6 +2270,7 @@ endif
 	source "package/nfacct/Config.in"
 	source "package/nftables/Config.in"
 	source "package/nginx/Config.in"
+	source "package/nodogsplash/Config.in"
 if BR2_PACKAGE_NGINX
 menu "External nginx modules"
 	source "package/nginx-dav-ext/Config.in"
diff --git a/package/nodogsplash/Config.in b/package/nodogsplash/Config.in
new file mode 100644
index 0000000000..7a68bcccb0
--- /dev/null
+++ b/package/nodogsplash/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_NODOGSPLASH
+	bool "nodogsplash"
+	depends on BR2_PACKAGE_LIBMICROHTTPD
+	help
+	   Nodogsplash is a Captive Portal that offers 
+	   a simple way to provide restricted access to the Internet by 
+	   showing a splash page to the user before Internet access is granted
+
+	   https://github.com/nodogsplash/nodogsplash/
diff --git a/package/nodogsplash/nodogsplash.mk b/package/nodogsplash/nodogsplash.mk
new file mode 100644
index 0000000000..3075b7e9f1
--- /dev/null
+++ b/package/nodogsplash/nodogsplash.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# nodogsplash
+#
+################################################################################
+NODOGSPLASH_VERSION = v4.5.1
+NODOGSPLASH_SITE = git://github.com/nodogsplash/nodogsplash.git
+NODOGSPLASH_SITE_METHOD = git
+NODOGSPLASH_LICENSE = GPL-2.0
+NODOGSPLASH_LICENSE_FILES = COPYING
+NODOGSPLASH_DEPENDENCIES = libmicrohttpd
+NODOGSPLASH_INSTALL_STAGING = YES
+
+define NODOGSPLASH_BUILD_CMDS
+	$(MAKE1) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)
+endef
+
+define NODOGSPLASH_INSTALL_EXTRA_FILES
+	mkdir -p $(TARGET_DIR)/usr/bin
+	mkdir -p $(TARGET_DIR)/etc/nodogsplash/htdocs/images
+	cp $(@D)/resources/nodogsplash.conf $(TARGET_DIR)/etc/nodogsplash/
+	cp $(@D)/resources/splash.html $(TARGET_DIR)/etc/nodogsplash/htdocs/
+	cp $(@D)/resources/splash.css $(TARGET_DIR)/etc/nodogsplash/htdocs/
+	cp $(@D)/resources/status.html $(TARGET_DIR)/etc/nodogsplash/htdocs/
+	cp $(@D)/resources/splash.jpg $(TARGET_DIR)/etc/nodogsplash/htdocs/images/
+endef
+
+NODOGSPLASH_POST_INSTALL_TARGET_HOOKS += NODOGSPLASH_INSTALL_EXTRA_FILES
+
+define NODOGSPLASH_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/nodogsplash $(TARGET_DIR)/usr/bin
+	$(INSTALL) -D -m 0755 $(@D)/ndsctl $(TARGET_DIR)/usr/bin
+
+endef
+
+$(eval $(generic-package))
+
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
