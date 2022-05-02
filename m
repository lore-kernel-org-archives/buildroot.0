Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC3BC433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 22:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28FA841511;
	Mon,  2 May 2022 22:09:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FpEnHKR3SWx5; Mon,  2 May 2022 22:09:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB179414E5;
	Mon,  2 May 2022 22:09:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EAFBF1BF33A
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 22:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E850A81A15
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 22:09:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9rc1Qqyxec5B for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 22:09:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04B50819F3
 for <buildroot@buildroot.org>; Mon,  2 May 2022 22:09:23 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id e194so17331575iof.11
 for <buildroot@buildroot.org>; Mon, 02 May 2022 15:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yz9RkeZ0eZtjz3fgdvDtTBlZ9JFmMo6GilDuF7vqG60=;
 b=fBplHIHJHkYWnchJM1Q9iIFDJccAjTQkaQ2geXKW51C7Ohf+zrILrLJEw9rhuP2v8m
 AwF/3BZ+jtuHeMhAJel65bgybfUIHcDpznT2s50NrvwVul8j4AtGe/70HbugqGELGCmc
 U1roi3T9xp4PnW6TufTKiaa9vaAOUT9X3u05jOwit52GfmbHjKhkOujfTpX057/m8hHJ
 /KrIp5rT5aHDvJxnAh4LFOhT83x58R0zOKxwZs32cd7QxVS7gWj1PN6Ru0NK7+Vdb6zh
 tKUWbe2JLhxQrv+aibG3kokQlt6EgU3ypMFJj5NhObYjgo6DXhyPMI3JyGz19iUnSShe
 bXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yz9RkeZ0eZtjz3fgdvDtTBlZ9JFmMo6GilDuF7vqG60=;
 b=uyO+FxzvVnL6O5JJiQsFYV044CPgXgRWBUM9dnhEV8ax9cuKYJ+TF0XECwzUcSkfrk
 ZunCUvwOpWoFTmUp6OnFKWuLOcf/SRqVDno1KGSn7zULoZjSWSeOiE2rqwrpvF0xY4EH
 AajkmJleDeXz8kLWX7kDRYBRQQ1BC++KMaqCehp5OrnxIDq2A6d9JU7F8xW6xpz789sk
 geaHL+VtVMlIVwC8zYgrNQjtO4/Dto1MgA1sqOyiQ/cF4ksI347WsPOrO596jb1Wxy46
 DV+9ck8hWOSt3X6ItLUF+v3ymRDy6+Sz6Ve0kAeT8CCR6C6Aj30sWTpywfr+NQWykb3E
 tJSA==
X-Gm-Message-State: AOAM5302RaNk/nPZINYDt6Pv2Xl9QHB0i3Xz8R6RIhCX+BQeKkqAKouQ
 dvT36etdAhKPyega75jzY1Yw4lVQGlk=
X-Google-Smtp-Source: ABdhPJyxFcMU4NN4U1jaSpNgDKZjUsR7U6zRiojlzM6phN6SuZoBAtArsuyPGhtFlRhLZmFEdQpceA==
X-Received: by 2002:a05:6602:14c7:b0:65a:5046:5c7f with SMTP id
 b7-20020a05660214c700b0065a50465c7fmr3923430iow.42.1651529362885; 
 Mon, 02 May 2022 15:09:22 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 12-20020a92c64c000000b002cde6e352ddsm2933603ill.39.2022.05.02.15.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 15:09:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 May 2022 16:09:19 -0600
Message-Id: <20220502220919.1313508-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 1/1] package/python-pillow: fix pkg-config
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

This is due to pillow implementing custom header validation
checks which need system paths present to function correctly:
https://github.com/python-pillow/Pillow/blob/9.0.1/setup.py#L633

Removed custom BUILD_CMDS and INSTALL_TARGET_CMDS which were
causing python-pillow to be installed for the host, they are
not required, we just need to set build_ext at the start
of PYTHON_PILLOW_BUILD_OPTS instead.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v4 -> v5:
  - use backported upstream patch
Changes v3 -> v4:
  - pass BUILD_OPTS to INSTALL_TARGET_OPTS
Changes v2 -> v3:
  - actually remove MAX_CONCURRENCY env variable
Changes v1 -> v2:
  - remove unrelated MAX_CONCURRENCY env variable
---
 ...Search-pkg-config-system-libs-cflags.patch | 33 +++++++++++++++++++
 package/python-pillow/python-pillow.mk        | 23 +++----------
 2 files changed, 37 insertions(+), 19 deletions(-)
 create mode 100644 package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch

diff --git a/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch b/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
new file mode 100644
index 0000000000..d0552ce0f4
--- /dev/null
+++ b/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
@@ -0,0 +1,33 @@
+From 9ea46247048f861f088f09541cd434aeb16e6f9c Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 15 Mar 2022 23:31:59 -0600
+Subject: [PATCH] Search pkg-config system libs/cflags.
+
+We need to search the system paths as well from pkg-config for
+some packages to be found properly.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+9ea46247048f861f088f09541cd434aeb16e6f9c]
+---
+ setup.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 9a05e5105..d41aedbd6 100755
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
+2.25.1
+
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 901876e0ee..1d99f44fa1 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -12,7 +12,10 @@ PYTHON_PILLOW_LICENSE_FILES = LICENSE
 PYTHON_PILLOW_CPE_ID_VENDOR = python
 PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
 PYTHON_PILLOW_SETUP_TYPE = setuptools
-PYTHON_PILLOW_BUILD_OPTS = --disable-platform-guessing
+
+PYTHON_PILLOW_DEPENDENCIES = host-pkgconf
+PYTHON_PILLOW_BUILD_OPTS = build_ext --disable-platform-guessing
+PYTHON_PILLOW_INSTALL_TARGET_OPTS = $(PYTHON_PILLOW_BUILD_OPTS)
 
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
