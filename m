Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B34C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8364A60B6A;
	Tue,  4 Jan 2022 18:13:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RaXG9IuR2edZ; Tue,  4 Jan 2022 18:13:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7EB160D6B;
	Tue,  4 Jan 2022 18:13:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA3581BF5DB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E77B0414C4
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oIrCrVP8rLM3 for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:12:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D62B140137
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:12:24 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id k18so41119119wrg.11
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 10:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y+oMGjDoGXHUPvTpVV4F2bg9aJiogypwrEUXy06BXfs=;
 b=EJ2f0qla4++6PLm1Gbd1B7XxMM6rVri6zGgSeVJBvM7S/UUx/spzflFG2bS70Z3Jod
 9jE184InxC8/rR7djmA6iOz8ntCVpdRod1Z9YPyn4FcIbFHCCz05+Y0+QZ1nvXOJN3wu
 uKpUpupLTmqK6o1nYzyalH6RJKqVpryPlR9H4TE54rPu15Gtpe/CTYvAheippiHrsG3x
 GpAr7iFotqkYXveTtbAPRfSteJ4CS6+wA06pJPJv7SQv5MMtSeXp/mZZLdEGego7wcGU
 pyZx4Q11h+9HYZYHoGBwu4mpOr4vOMHHyEi8wRcMzPMpr9YUnDYeuDoXI4dJlC+BrcSm
 X8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y+oMGjDoGXHUPvTpVV4F2bg9aJiogypwrEUXy06BXfs=;
 b=BUtgmOgSmYyZkkW0vmQ4lUyY3meEJjbH9/HfacFKhZ/CmhYaUAyX1YnKHk74QlVpvt
 yj0hdeAKgGFGfgy8u1U2fHN89CdKvc/I8dhvOwXKTQ1m5deiYeBdbEjEge+0p2zdWqQg
 eOa+utSI4+yia+gFq3pkRxWdwoWrWtcP4zKQ+xRiqoiVMUUcypHKjbnLbmLI1YUGw1Ed
 +3sIyTA4iEGm/fy5mIzCLpqFKImlTTrtYTEiBXW5nB9v1lqGMar9Ys0OwG7fZgWrQhnY
 VBB4k0fF6VmaoVkJYgcpAuwUtcUZqtX6yEAW5GaE5h4MAOP7WClaFnZawkORQVJ6oXkA
 TPjw==
X-Gm-Message-State: AOAM532BgL/qXQrgSfaNAVDW4CLReQyWhvyFA1V+uoqKmiEOSBzovmaO
 P3FUSFwPx/lYUWmyiw1v1H+w5KMiXNg=
X-Google-Smtp-Source: ABdhPJz4lmdDsOh9bv5skNhKffozie3e1d5/poU98N9dUmhtWyXPAHHDewlHJIbPDMUdz/gK7Zf4lw==
X-Received: by 2002:a5d:6f02:: with SMTP id ay2mr5986776wrb.269.1641319942906; 
 Tue, 04 Jan 2022 10:12:22 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id r1sm44067491wrz.30.2022.01.04.10.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 10:12:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 19:11:06 +0100
Message-Id: <20220104181107.3171973-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/liburing: new package
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
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is the io_uring library, liburing. liburing provides helpers to
setup and teardown io_uring instances, and also a simplified interface
for applications that don't need (or want) to deal with the full kernel
side implementation.

https://git.kernel.dk/cgit/liburing

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/liburing/Config.in     | 13 ++++++++++++
 package/liburing/liburing.hash |  8 ++++++++
 package/liburing/liburing.mk   | 36 ++++++++++++++++++++++++++++++++++
 5 files changed, 59 insertions(+)
 create mode 100644 package/liburing/Config.in
 create mode 100644 package/liburing/liburing.hash
 create mode 100644 package/liburing/liburing.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 444e58714c..5017dde56e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -904,6 +904,7 @@ F:	package/librsync/
 F:	package/libsoup/
 F:	package/libsoxr/
 F:	package/libupnp/
+F:	package/liburing/
 F:	package/libv4l/
 F:	package/libxslt/
 F:	package/mbedtls/
diff --git a/package/Config.in b/package/Config.in
index e09e4aad3f..1f3ec9a334 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2001,6 +2001,7 @@ menu "Other"
 	source "package/libuci/Config.in"
 	source "package/libunwind/Config.in"
 	source "package/liburcu/Config.in"
+	source "package/liburing/Config.in"
 	source "package/libuv/Config.in"
 	source "package/lightning/Config.in"
 	source "package/linux-pam/Config.in"
diff --git a/package/liburing/Config.in b/package/liburing/Config.in
new file mode 100644
index 0000000000..898d95cfa6
--- /dev/null
+++ b/package/liburing/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBURING
+	bool "liburing"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
+	help
+	  This is the io_uring library, liburing. liburing provides
+	  helpers to setup and teardown io_uring instances, and also a
+	  simplified interface for applications that don't need (or
+	  want) to deal with the full kernel side implementation.
+
+	  https://git.kernel.dk/cgit/liburing
+
+comment "liburing needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/liburing/liburing.hash b/package/liburing/liburing.hash
new file mode 100644
index 0000000000..56e90d71cc
--- /dev/null
+++ b/package/liburing/liburing.hash
@@ -0,0 +1,8 @@
+# Locally calculated
+sha256  df7c8fd05fd39da622b2814e06f815f11f1beb429487a4330eed64bb7f353dbf  liburing-2.1.tar.bz2
+
+# Hash for license files
+sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
+sha256  d0b225f17ef2d05d5cda6b25b2dc334ef6f5f12537c20edf6e391852a095ec19  LICENSE
+sha256  97d62ff5d7cf0b1cef34c33a89877352911278ca4ac1c6c4f24a835baa5ea10b  README
diff --git a/package/liburing/liburing.mk b/package/liburing/liburing.mk
new file mode 100644
index 0000000000..a977e74b4f
--- /dev/null
+++ b/package/liburing/liburing.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# liburing
+#
+################################################################################
+
+LIBURING_VERSION = 2.1
+LIBURING_SOURCE = liburing-$(LIBURING_VERSION).tar.bz2
+LIBURING_SITE = https://git.kernel.dk/cgit/liburing/snapshot
+LIBURING_LICENSE = (GPL-2.0 with exceptions and LGPL-2.1+) or MIT
+LIBURING_LICENSE_FILES = COPYING COPYING.GPL LICENSE README
+LIBURING_INSTALL_STAGING = YES
+
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBURING_MAKE_OPTS += ENABLE_SHARED=0
+else
+LIBURING_MAKE_OPTS += ENABLE_SHARED=1
+endif
+
+define LIBURING_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure)
+endef
+
+define LIBURING_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(LIBURING_MAKE_OPTS) -C $(@D)/src
+endef
+
+define LIBURING_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+define LIBURING_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
