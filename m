Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21F9C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 22:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7654841694;
	Mon, 21 Mar 2022 22:07:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EKRj5Oc1T_jb; Mon, 21 Mar 2022 22:07:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FAF14168C;
	Mon, 21 Mar 2022 22:07:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 853A41BF275
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 22:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 824A7842B4
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 22:07:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dX1y8W8VxvyK for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 22:07:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9184F842B3
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 22:07:07 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id y7so4306323ilv.6
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 15:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VSylfwb2o8FqsbCakdzONOhsZ2fql2aYeqtAoJsbP/U=;
 b=nwv4+nWsvAXjXbkfKBFHld9MBREaopwUSDhVe2Z8XCcmKm7M8iFtH83PgfDYiqgjWf
 Z5e840BuieUxB/x8VbxT094pXrmn5eJCrGG6qMHgAhf3LCWkVr23euX5LNcedrESyZvN
 VAV33/aLJwidmSABq+XEtPwbLESE+F+qomSIUefyP4lugG9kc3jkFZ7TdWrZ5t1E7gZs
 69vO8jCnUoJt4KY+zbDOobSc0M6D6lR3OhJhlgBmuoDCWH1kFWsNM7bPdGP/OIjwQ687
 27Tdfh1x2SfKbdZJOh4sOTOZE1cCRoh6iZ+vO3og8lBVg4B42H3EwlrrRswtLfSe+miP
 IBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VSylfwb2o8FqsbCakdzONOhsZ2fql2aYeqtAoJsbP/U=;
 b=jBQeIX9sBJ9bHZekcbDrqQH7Ov+k+cl6Y5W57kMSLDZH5Bi2UMJ938VZn6U+/8RojV
 RjLZE/NI4r1VCB16VGe3If3loPryQFAZWTFUe64gzKw42y8VnpCoP3D830YV3RPEGdk+
 zcImOwxODQEZNwa3ZG33Ok0LAeirHBhdh8FRRv0FuaDIRf9JYg1lVPUOMkKYJwZava4t
 /PMV40GXdM1B03GK69+xyVonQvDTTa+yBBteqgFdrbldgBKOGF5w+rTIBaiMQ24CxySm
 bY/TJWrtglnzn2YbMpnC0duwfb5SBipZd/58KY7LLfa/IP6dsEP1t30EiDn0aKPmdX8i
 WRAg==
X-Gm-Message-State: AOAM5306pQ5iSm1UXyclWllXRmltj6SASmkPjwskC7ELEzVBk6ut8kir
 yc8wYEssgWz/i8KWULv3Jqv4EO64WWU=
X-Google-Smtp-Source: ABdhPJw7DlzctqjsiCQ1ca6dxIL7g/XgpCaMjikOMS6nzpyYWFfzN0gZY/oE7SNQTa+ECjZNefRRTQ==
X-Received: by 2002:a05:6e02:12eb:b0:2c7:dbc3:642e with SMTP id
 l11-20020a056e0212eb00b002c7dbc3642emr10312268iln.125.1647900426380; 
 Mon, 21 Mar 2022 15:07:06 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 a4-20020a92c544000000b002c815471f32sm4196230ilj.70.2022.03.21.15.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 15:07:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 16:07:04 -0600
Message-Id: <20220321220704.284635-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/1] package/python-pillow: fix pkg-config
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
Changes v2 -> v3:
  - actually remove MAX_CONCURRENCY env variable
Changes v1 -> v2:
  - remove unrelated MAX_CONCURRENCY env variable
---
 ...Search-pkg-config-system-libs-cflags.patch | 33 +++++++++++++++++++
 package/python-pillow/python-pillow.mk        | 22 ++-----------
 2 files changed, 36 insertions(+), 19 deletions(-)
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
index 901876e0ee..bea129889b 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -12,7 +12,9 @@ PYTHON_PILLOW_LICENSE_FILES = LICENSE
 PYTHON_PILLOW_CPE_ID_VENDOR = python
 PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
 PYTHON_PILLOW_SETUP_TYPE = setuptools
-PYTHON_PILLOW_BUILD_OPTS = --disable-platform-guessing
+
+PYTHON_PILLOW_DEPENDENCIES = host-pkgconf
+PYTHON_PILLOW_BUILD_OPTS = build_ext --disable-platform-guessing
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 PYTHON_PILLOW_DEPENDENCIES += freetype
@@ -68,22 +70,4 @@ else
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
