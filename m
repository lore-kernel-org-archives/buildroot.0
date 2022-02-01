Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C68C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 20:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70E0060BA8;
	Tue,  1 Feb 2022 20:43:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jzHfeqBx0VMU; Tue,  1 Feb 2022 20:43:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A0B660767;
	Tue,  1 Feb 2022 20:43:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 531971BF4E2
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 20:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4177040302
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 20:43:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ignavus-net.20210112.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9LMNKKOfYgJd for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 20:43:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A81040300
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 20:43:51 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 s2-20020a17090ad48200b001b501977b23so4548247pju.2
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 12:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ignavus-net.20210112.gappssmtp.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=vx+8lMO/jhKvmxdbKosY1wYl7RgphLlJfASMbb7Jxd4=;
 b=trnbz2qRf6x5f2u+5N5mBBQZHIgrcQ4KzD6yqUynmuOteF3+RwwWct+VLiY4ScqG4a
 jWPQXkMD7YDfrhGSQfjjhYc6FTr1OoPXWqRQTnO4yE8KGlfltnphNTHHBzHFQuqtG49k
 O9aG3qdLTgfMM7VLTDpIgHMispY6rk3k1VHrLk0ShFhSqGf07qrxamVrPc5Y7O2SVSC+
 flcxgZBCRtWd6tJ42vNFB0NUInfY9mStCxA2ZzVSPyu9vAuTHwJ7bfOJecMrZX7mG33W
 67j81WzQB0cYhgfvBxFnLLzN11qToJ2tWaZiIV/Ukcubys+5Hg4a/Ykrx1FDYsYOiw4F
 tM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=vx+8lMO/jhKvmxdbKosY1wYl7RgphLlJfASMbb7Jxd4=;
 b=7ROzsPtVUTK6hC1SeuZFDxDQnzTxMg8wMRWtWWUZqbOessEsx6U9/EMLvBgn0UiwOO
 hulvmqxqefykUqyiCkX5xg028z//WoxbGBGX4RVaflfkAM5gBMWunaNPPFm9+PApNYOc
 IjlvrluSi5UACg5OHaeymrwQlr7mu5B81bnae38+XvyrfPF7dSoL/UD69OD62Du8mXYT
 8KjUzGwZPjpHkpV2dYV61CV/GUXIqGngAHx4XUZ3GVZQk26OOa9gRFUk7J48saqD2+pH
 JkU1nU4KE/8Sz6ke/CWGhRC5yc9eUPPXnF00zGQGD3jyJVE372Hj2GSC7rZKZxP4N6nz
 XuJQ==
X-Gm-Message-State: AOAM53117Rz+EyyyPYEaHZEzGP202pexdjWKNfsAepK99LcIOgbCvjzu
 ndBGG4p7hOvmjJ7HaesbkqTnyH8HTH/IwA57
X-Google-Smtp-Source: ABdhPJzZRzaRl/W2yiiiWAEysPTCREkR1DGCRYXrQbjqrU7aRte/euy7SYfeuShAAeMat/h6fP+x9Q==
X-Received: by 2002:a17:90b:4d12:: with SMTP id
 mw18mr4357664pjb.104.1643748230829; 
 Tue, 01 Feb 2022 12:43:50 -0800 (PST)
Received: from smtpclient.apple ([202.124.120.130])
 by smtp.gmail.com with ESMTPSA id q17sm14593774pgh.58.2022.02.01.12.43.49
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Feb 2022 12:43:50 -0800 (PST)
From: Andre Renaud <andre@ignavus.net>
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Message-Id: <8B42D9C7-D86C-4A08-B552-3523E7D0C50D@ignavus.net>
Date: Wed, 2 Feb 2022 09:43:45 +1300
To: buildroot@buildroot.org
X-Mailer: Apple Mail (2.3693.60.0.1.1)
Subject: [Buildroot] [PATCH] package/libglfw: bump to 3.3.6 and enable
 Wayland/libGLES support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Andre Renaud <andre@ignavus.net>
---
 package/libglfw/Config.in    | 19 ++++++++++---------
 package/libglfw/libglfw.hash |  2 +-
 package/libglfw/libglfw.mk   | 16 ++++++++++++++--
 3 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/package/libglfw/Config.in b/package/libglfw/Config.in
index 06f4376453..9705fef432 100644
--- a/package/libglfw/Config.in
+++ b/package/libglfw/Config.in
@@ -1,17 +1,18 @@
 config BR2_PACKAGE_LIBGLFW
 	bool "libglfw"
-	depends on BR2_PACKAGE_XORG7
-	depends on BR2_PACKAGE_HAS_LIBGL
-	select BR2_PACKAGE_XLIB_LIBXCURSOR
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXI
-	select BR2_PACKAGE_XLIB_LIBXINERAMA
-	select BR2_PACKAGE_XLIB_LIBXRANDR
+	depends on BR2_PACKAGE_XORG7 || BR2_PACKAGE_WAYLAND
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_XLIB_LIBXCURSOR if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXI if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXINERAMA if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7
 	help
 	  GLFW is an Open Source, multi-platform library for creating
 	  windows with OpenGL contexts and receiving input and events.

 	  http://www.glfw.org

-comment "libglfw depends on X.org and needs an OpenGL backend"
-	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_HAS_LIBGL
+comment "libglfw depends on X.org/Wayland and needs an OpenGL/GLES backend"
+	depends on !(BR2_PACKAGE_XORG7 || BR2_PACKAGE_WAYLAND)
+	depends on !(BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES)
diff --git a/package/libglfw/libglfw.hash b/package/libglfw/libglfw.hash
index c21a595bbc..5bffc55d26 100644
--- a/package/libglfw/libglfw.hash
+++ b/package/libglfw/libglfw.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  98768e12e615fbe9f3386f5bbfeb91b5a3b45a8c4c77159cef06b1f6ff749537  libglfw-3.3.2.tar.gz
+sha256  ed07b90e334dcd39903e6288d90fa1ae0cf2d2119fec516cf743a0a404527c02  libglfw-3.3.6.tar.gz
 sha256  149704059b5d0bf551637e50042dd4de9c2cae921021f6636298911e3a5f9462  LICENSE.md
diff --git a/package/libglfw/libglfw.mk b/package/libglfw/libglfw.mk
index 63d2a88bf8..7daf61af0e 100644
--- a/package/libglfw/libglfw.mk
+++ b/package/libglfw/libglfw.mk
@@ -4,11 +4,19 @@
 #
 ################################################################################

-LIBGLFW_VERSION = 3.3.2
+LIBGLFW_VERSION = 3.3.6
 LIBGLFW_SITE = $(call github,glfw,glfw,$(LIBGLFW_VERSION))
 LIBGLFW_INSTALL_STAGING = YES
-LIBGLFW_DEPENDENCIES = libgl xlib_libXcursor xlib_libXext \
+ifeq ($(BR2_PACKAGE_XORG7),y)
+LIBGLFW_DEPENDENCIES = xlib_libXcursor xlib_libXext \
 	xlib_libXi xlib_libXinerama xlib_libXrandr
+endif
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+LIBGLFW_DEPENDENCIES += libgl
+endif
+ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
+LIBGLFW_DEPENDENCIES += libgles
+endif
 LIBGLFW_LICENSE = Zlib
 LIBGLFW_LICENSE_FILES = LICENSE.md

@@ -17,6 +25,10 @@ LIBGLFW_CONF_OPTS += \
 	-DGLFW_BUILD_TESTS=OFF \
 	-DGLFW_BUILD_DOCS=OFF

+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+LIBGLFW_CONF_OPTS +=  -DGLFW_USE_WAYLAND=1
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86VM),y)
 LIBGLFW_DEPENDENCIES += xlib_libXxf86vm
 endif
--
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
