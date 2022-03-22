Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478FEC433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 18:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E561C418A2;
	Tue, 22 Mar 2022 18:30:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bw0zYTh0Mr4l; Tue, 22 Mar 2022 18:30:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C995B4189C;
	Tue, 22 Mar 2022 18:30:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AAA4B1BF9B2
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 18:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A722361263
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 18:30:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bOy2u2aXsyFC for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 18:29:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0C1460BCC
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 18:29:59 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id c23so21227711ioi.4
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 11:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+M6hsZBgf779tP2kSS6oFU330ZmdcVzAtGrx7hIx13A=;
 b=aMh8fBoHSKoteO/nm9C29Yn+JbgSWpEf4GBniAdpJx92UD+RUM3bIsZyme6F9tuKo3
 YwpSkdLqnKDhnFkJ5dWE4BRvzv3mqR5fQgtxpDU/GomOMZ+c0q83Kir3I6Lih2DgHrwp
 XDtY3uYHyAQ8gHPPlydbEmrCL9yR6NY+7wTJJXLWZL4RYORLw9IvgHKobIGneixadUKV
 aUJxBeAqxPbcCBiv8YfYGkW8mhCNAl/hsZ3/z6eWWARUbA9lZfnJ8IcpdohAnQ1JjSk+
 7ktgUsoWUEOWmXBILF1z+HHdmvkUtcTPfvpwFw+mOYDky7DtDt8kFHvoChPZ9LVXWSEP
 bl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+M6hsZBgf779tP2kSS6oFU330ZmdcVzAtGrx7hIx13A=;
 b=CyX/Gv/OYOvq3C/BQnuAnQFAuWKVmSrnZCsM1EvgArUpIgGePg4VwyXXXyGwsvZOIp
 bb99Te8spmCc68kxpHzEzcdpSS1tX4ntRLt1FU8j/NxRFDII/kGyBwNoR392CUaUhqNF
 3hTBovuyte9S7prQEi86F3pQZgodMlsWNDObtPM/3gyrmf5jKGUJOqwgZPhNSNAstt10
 Ta89zgbksJvXjQP528qpW3CYHKnTFf92FTTf0Pgw+HZGtwDGE7QB4MjdHDOHzRaAb8iU
 iNho8ufxXnijzH3px2sze5Kul6jydYqpzxTXTFSWodwPMMRU/nqGVa23iKAHDt6Ogda+
 beGQ==
X-Gm-Message-State: AOAM532dsfVn7vjUzfNSQAOQjJiZtFDQsyVHO3kyzdXMJE3h9WQTWKYu
 ubdaKt8wkJUTHTneci2SpdUvgYV0YywGyw==
X-Google-Smtp-Source: ABdhPJxJLXkHsPp4xLdFd7WpJafOXklnqGl3WkkxJXAWhM2hkRhEfX5b48cDto8p+qDqcZt8OzXQig==
X-Received: by 2002:a05:6602:2d44:b0:648:c8a4:c6a with SMTP id
 d4-20020a0566022d4400b00648c8a40c6amr12859842iow.89.1647973798458; 
 Tue, 22 Mar 2022 11:29:58 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 c22-20020a5ea816000000b00649d360663asm545678ioa.40.2022.03.22.11.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 11:29:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 12:29:52 -0600
Message-Id: <20220322182952.935255-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 1/1] package/python-pillow: fix pkg-config
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
