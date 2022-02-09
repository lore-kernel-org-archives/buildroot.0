Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B19C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 17:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7EC941515;
	Wed,  9 Feb 2022 17:07:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mlMqsi7fO5Qy; Wed,  9 Feb 2022 17:07:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0F4E40209;
	Wed,  9 Feb 2022 17:07:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E4141BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32DAF60BAF
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uC82alSZG-9w for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:53:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E01E660C08
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:53:17 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7154724000B;
 Wed,  9 Feb 2022 16:53:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqDR-0001R1-0T; Wed, 09 Feb 2022 17:53:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:52:05 +0100
Message-Id: <20220209165213.4498-100-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 099/107] package/python-subprocess32: drop
 python2 specific package
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

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                              |  6 ++++
 package/Config.in                             |  1 -
 package/python-subprocess32/Config.in         | 13 --------
 .../python-subprocess32.hash                  |  5 ---
 .../python-subprocess32.mk                    | 31 -------------------
 5 files changed, 6 insertions(+), 50 deletions(-)
 delete mode 100644 package/python-subprocess32/Config.in
 delete mode 100644 package/python-subprocess32/python-subprocess32.hash
 delete mode 100644 package/python-subprocess32/python-subprocess32.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 3cd78ccf1c..8db9558ed4 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_SUBPROCESS32
+	bool "python-subprocess32 removed"
+	select BR2_LEGACY
+	help
+	  Package was removed together with python 2.7 support.
+
 config BR2_PACKAGE_PYTHON_SINGLEDISPATCH
 	bool "python-singledispatch removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 0261463f45..18de2a32a5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1243,7 +1243,6 @@ menu "External python modules"
 	source "package/python-sqlalchemy/Config.in"
 	source "package/python-sqliteschema/Config.in"
 	source "package/python-sqlparse/Config.in"
-	source "package/python-subprocess32/Config.in"
 	source "package/python-systemd/Config.in"
 	source "package/python-tabledata/Config.in"
 	source "package/python-tempora/Config.in"
diff --git a/package/python-subprocess32/Config.in b/package/python-subprocess32/Config.in
deleted file mode 100644
index d7fe84f1e6..0000000000
--- a/package/python-subprocess32/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_PYTHON_SUBPROCESS32
-	bool "python-subprocess32"
-	depends on BR2_PACKAGE_PYTHON
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_MIPS_NABI64
-	help
-	  A backport of the Python 3 subprocess module for use
-	  on Python 2.
-
-	  https://github.com/google/python-subprocess32
-
-comment "python-subprocess32 needs a toolchain w/ headers >= 3.10 on MIPS N64"
-	depends on BR2_MIPS_NABI64
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
diff --git a/package/python-subprocess32/python-subprocess32.hash b/package/python-subprocess32/python-subprocess32.hash
deleted file mode 100644
index 65d18763d1..0000000000
--- a/package/python-subprocess32/python-subprocess32.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/subprocess32/json
-md5	748844d560be5f0c707931cba1cdb48b  subprocess32-3.5.4.tar.gz
-sha256	eb2937c80497978d181efa1b839ec2d9622cf9600a039a79d0e108d1f9aec79d  subprocess32-3.5.4.tar.gz
-# Locally computed sha256 checksums
-sha256	826b43437249d39422642f695154d064da64de92eb1476048a615f50bc1beb4a  LICENSE
diff --git a/package/python-subprocess32/python-subprocess32.mk b/package/python-subprocess32/python-subprocess32.mk
deleted file mode 100644
index fb8a47f974..0000000000
--- a/package/python-subprocess32/python-subprocess32.mk
+++ /dev/null
@@ -1,31 +0,0 @@
-################################################################################
-#
-# python-subprocess32
-#
-################################################################################
-
-PYTHON_SUBPROCESS32_VERSION = 3.5.4
-PYTHON_SUBPROCESS32_SOURCE = subprocess32-$(PYTHON_SUBPROCESS32_VERSION).tar.gz
-PYTHON_SUBPROCESS32_SITE = https://files.pythonhosted.org/packages/32/c8/564be4d12629b912ea431f1a50eb8b3b9d00f1a0b1ceff17f266be190007
-PYTHON_SUBPROCESS32_SETUP_TYPE = setuptools
-PYTHON_SUBPROCESS32_LICENSE = Python-2.0
-PYTHON_SUBPROCESS32_LICENSE_FILES = LICENSE
-
-# The configure step needs to be run outside of the setup.py since it isn't
-# run correctly for cross-compiling
-define PYTHON_SUBPROCESS32_CONFIGURE_CMDS
-	(cd $(@D) && \
-	$(TARGET_CONFIGURE_OPTS) \
-	$(TARGET_CONFIGURE_ARGS) \
-	./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--sysconfdir=/etc \
-		--program-prefix="" \
-	)
-endef
-
-$(eval $(python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
