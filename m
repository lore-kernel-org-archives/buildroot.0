Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31F4C433FE
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 06:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 469DB842AE;
	Wed, 16 Mar 2022 06:02:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YpT61Du1ty6s; Wed, 16 Mar 2022 06:02:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4FA98428F;
	Wed, 16 Mar 2022 06:02:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F2E491BF9AC
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 06:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E08124059F
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 06:02:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BUEl7vu1s1M5 for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 06:02:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4E99404F5
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 06:02:30 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id e9so143166ilu.9
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 23:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yZWTq88UoXG32x5YL6KfDMWUd1LHv75z25cn+F/NqaE=;
 b=o5+kzQrdqkyVxUeMKE5NB0BaORGnC1nleJd4st2dIgMWT0PCGHOv8McGDRyVWxpMBV
 tIlWda5XPLeLvEN5T6FqMs8k4Hc9e66GTQ60SnRVbJNHDUL/yQdP0gFAwpn4NYO8GLG5
 QmHaSnK0JO2I9vtZqo/b6d7NCa4tu9g1/agFvPhxCp2JpBpQiZT1xfM/W5GRvqQlEBO6
 Iibf3RoMFM/QEYiLs3Pd9Ke0hplOv4dNHsbEfopCjJrHp3DVqAjmfrwVGDaKIHLbDdWw
 HjxR3imLbV7ltBFtzAvM/N0FaFUmGq9yw2+8WehwscTP17lhfKsL2N0BpeX9OHm+B8y0
 P/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yZWTq88UoXG32x5YL6KfDMWUd1LHv75z25cn+F/NqaE=;
 b=8MAKE1SU/oxmMc9hnhEecekjasCabZW+mWfrS8W+6+b8/Tt9qw/QZutdga7zRaJRiA
 D+NgYoMvN0dW8eYVC/wDo6PZstKosz+JUy94KPMfpJfg1QZcMwGU2Ur8efZ4gBpvRcCu
 6KToxCpswaweQyq8bKTV8do6lwxI5IeDmUYuvI9PmhU8cWEQpeXLpmVGtxPfWGzHikav
 bZMwj4mI/6/L5ilGE28z5ZjbnRFLMjH+18RSI5zTq39hE777nt7EO5lkFthyjZ6kQU/f
 mb0XXD8QI8GOJ2eHX8GHJD75HHIe/vR9OZna3V0Hp+WSx1WGRUoztgrGuQ46llcWlTH4
 y3pA==
X-Gm-Message-State: AOAM530wyW1E8nNBTaWTUvPnXS6Hdw3OVj0Cp6dMWnabvnE1Y166DbaW
 9Rs3hIXIGzyYULLd2WZtrondsHfeecY=
X-Google-Smtp-Source: ABdhPJxzmh8XVISC2KcD0i7N5d+VD+GiebwujA1f8C/Ig6FnQSU/fKzSTqVLBdeYabnMTH4Rgm2Kfw==
X-Received: by 2002:a05:6e02:198b:b0:2c2:c454:ea7 with SMTP id
 g11-20020a056e02198b00b002c2c4540ea7mr23153967ilf.151.1647410549358; 
 Tue, 15 Mar 2022 23:02:29 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 x8-20020a0566022c4800b006464119d985sm534039iov.43.2022.03.15.23.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 23:02:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 00:02:19 -0600
Message-Id: <20220316060219.3448648-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pillow: fix pkg-config
 search paths
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently pillow doesn't correctly search pkg-config system paths
for some libraries which can prevent some libraries from being
properly detected/enabled in pillow.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...Search-pkg-config-system-libs-cflags.patch | 33 +++++++++++++++++++
 package/python-pillow/python-pillow.mk        | 23 +++----------
 2 files changed, 37 insertions(+), 19 deletions(-)
 create mode 100644 package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch

diff --git a/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch b/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
new file mode 100644
index 0000000000..9f979b048f
--- /dev/null
+++ b/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
@@ -0,0 +1,33 @@
+From 89c9c347bb7437d5ea559930e315f42a0236761f Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 15 Mar 2022 23:31:59 -0600
+Subject: [PATCH] Search pkg-config system libs/cflags.
+
+We need to search the system paths as well from pkg-config for
+some packages to be found properly.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/python-pillow/Pillow/pull/6138]
+---
+ setup.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 3468b260..59d65ce2 100755
+--- a/setup.py
++++ b/setup.py
+@@ -252,8 +252,8 @@ def _cmd_exists(cmd):
+ def _pkg_config(name):
+     try:
+         command = os.environ.get("PKG_CONFIG", "pkg-config")
+-        command_libs = [command, "--libs-only-L", name]
+-        command_cflags = [command, "--cflags-only-I", name]
++        command_libs = [command, "--libs-only-L", "--keep-system-libs", name]
++        command_cflags = [command, "--cflags-only-I", "--keep-system-cflags", name]
+         if not DEBUG:
+             command_libs.append("--silence-errors")
+             command_cflags.append("--silence-errors")
+-- 
+2.35.1
+
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 901876e0ee..ef677855b2 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -12,7 +12,10 @@ PYTHON_PILLOW_LICENSE_FILES = LICENSE
 PYTHON_PILLOW_CPE_ID_VENDOR = python
 PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
 PYTHON_PILLOW_SETUP_TYPE = setuptools
-PYTHON_PILLOW_BUILD_OPTS = --disable-platform-guessing
+PYTHON_PILLOW_ENV = MAX_CONCURRENCY="$(PARALLEL_JOBS)"
+
+PYTHON_PILLOW_DEPENDENCIES = host-pkgconf
+PYTHON_PILLOW_BUILD_OPTS = build_ext --disable-platform-guessing
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 PYTHON_PILLOW_DEPENDENCIES += freetype
@@ -68,22 +71,4 @@ else
 PYTHON_PILLOW_BUILD_OPTS += --disable-webp --disable-webpmux
 endif
 
-define PYTHON_PILLOW_BUILD_CMDS
-	cd $(PYTHON_PILLOW_BUILDDIR); \
-		PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
-		$(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
-		$(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
-		$(PYTHON_PILLOW_BASE_BUILD_OPTS) $(PYTHON_PILLOW_BUILD_OPTS)
-endef
-
-define PYTHON_PILLOW_INSTALL_TARGET_CMDS
-	cd $(PYTHON_PILLOW_BUILDDIR); \
-		PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
-		$(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
-		$(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
-		$(PYTHON_PILLOW_BUILD_OPTS) install \
-		$(PYTHON_PILLOW_BASE_INSTALL_TARGET_OPTS) \
-		$(PYTHON_PILLOW_INSTALL_TARGET_OPTS)
-endef
-
 $(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
