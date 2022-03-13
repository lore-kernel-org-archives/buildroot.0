Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA53C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 17:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5556040120;
	Sun, 13 Mar 2022 17:56:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TldBfKTulVyI; Sun, 13 Mar 2022 17:56:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E123840235;
	Sun, 13 Mar 2022 17:56:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FDC61BF41D
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 17:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B6D4408C9
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 17:56:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yizsh9ZZKAfQ for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 17:56:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 807C44051E
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 17:56:37 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id r2so4544829ilh.0
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 10:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OBoBZOvCYEdaYGI+ffSHOkULfcW8cIxZ4FXf0eFs0vE=;
 b=noigDj05LLw1oWg/Kvt6U4ytvoa/aehSRUHDoBF66s4jxj+QmsQ1BgYmZjnfhbKfI3
 6BEYwQRDUv2iZolFTIb8pUIughLqWih5Z1req8wX4PnCGfxOP+zA906Lwxhv2Jvnev6o
 M94tCzCkYQaWeg5EdYzG7kxwMbxElRXh2tbJ7uLSo+SOGxoZ7Zz1KNQJ/HSjQfm+oIX6
 T7vhMZFewffhJHd7P/KrFjZf5/E3YYuU+ZMBg5qjJaAXdR/y+zn6awjItzifUAUDUZEY
 29O8dRPU1nhrvfNZKzhCHX5CQwqaizf72DROuKREfehNuTFhNJYbpxFzpG5yY7CcUmuF
 II2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OBoBZOvCYEdaYGI+ffSHOkULfcW8cIxZ4FXf0eFs0vE=;
 b=UKEuZltIn8lw1J46rI5B1nctMqkmnK+r8Q0pByJ5CFK7F2of7kPCRdr6ecIyirDGzR
 APwpX0kvMlJ81xjorH6lORGp2SpW1nvOOvaKl0WaojyCG3Xc3b0JlfgBRGX0S/IxCPv7
 Paah2sqoIfmNxusM5THoD63wOq2JqPV8iFKvsJdKMQIvGd/ZwJoLuh4WtUechTZj2rTQ
 qqm3CxZlVEeho6Kb4huUm8fi9puWQhFvcJquKR9EKtbDRXfKeFOPFxg/HY7b6yd9AaTe
 LUM74tId3C54r2f7dmHkiuR7HMoUH1O4lC13/R1oikDcKNpMwSXCOMIYpUWLSOPpR96I
 almQ==
X-Gm-Message-State: AOAM532la3/FI0nUHdwBpHZbi3IDSTVugfY74A1KmvDLxjabhgRt24IR
 qe87IEEkT54nP6nZB4qLVx+w7JioCdM=
X-Google-Smtp-Source: ABdhPJyHLoj+5JKJhpMgdkvHHrPp2deRN0o3NtdUaM7oxVUHNKi7MMuQ27WfFqH6wcDZMmnJa5Z5bA==
X-Received: by 2002:a05:6e02:1584:b0:2b9:7a3d:8937 with SMTP id
 m4-20020a056e02158400b002b97a3d8937mr16576783ilu.192.1647194196302; 
 Sun, 13 Mar 2022 10:56:36 -0700 (PDT)
Received: from james-x399.localdomain (97-118-243-247.hlrn.qwest.net.
 [97.118.243.247]) by smtp.gmail.com with ESMTPSA id
 g4-20020a92cda4000000b002c24724f23csm8107651ild.13.2022.03.13.10.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 10:56:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 11:56:14 -0600
Message-Id: <20220313175615.406390-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/pkg-python: migrate flit to new
 bootstrapping sequence
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There are a number of flit toolchain dependencies currently in the
process of deprecating distutils based fallbacks.

This will be needed in order to update tomli.

We need to migrate these to use a new bootstrap based build+install
sequence which relies on flit's bootstrap wheel build+install
features to build and install host-python-pypa-build and
host-python-installer which gives us a full pep517 toolchain.

Note that one can run host-python-flit-core commands for building
and installing itself since the package build directory is the cwd.

For host-python-installer to do this we need to add the package src
directory to PYTHONPATH as we need to run it from the source directory
for installing itself. This is due to a directory structure that does
not let us run directly from the top level.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - formatting/cleanup
  - add comments
---
 package/pkg-python.mk                        | 45 ++++++++++++++++++--
 package/python-flit-core/python-flit-core.mk |  2 +-
 package/python-installer/python-installer.mk |  3 +-
 package/python-pep517/python-pep517.mk       |  2 +-
 package/python-tomli/python-tomli.mk         |  2 +-
 5 files changed, 46 insertions(+), 8 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 52ce402281..f08d8ce04c 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -154,6 +154,9 @@ HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
 	--scripts=$(HOST_DIR)/usr/bin \
 	--data=$(HOST_DIR)/usr
 
+HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS = \
+	--installdir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
+
 ################################################################################
 # inner-python-package -- defines how the configuration, compilation
 # and installation of a Python package should be done, implements a
@@ -211,8 +214,25 @@ $(2)_BASE_INSTALL_TARGET_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $
 $(2)_BASE_INSTALL_STAGING_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS)
 else
 $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
-$(2)_BASE_BUILD_CMD = -m build -n -w
-$(2)_BASE_INSTALL_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
+# Use flit built in wheel builder for packages that are host-python-pypa-build dependencies.
+# This is needed to avoid a circular with host-python-pypa-build and those dependencies.
+#
+$(2)_BASE_BUILD_CMD = $$(if \
+		$$(filter \
+			host-python-flit-core host-python-installer host-python-pep517 host-python-tomli, \
+			$(1)) \
+		, \
+		-m flit_core.wheel, \
+		-m build -n -w \
+	)
+# Use flit built in bootstrap_install for installing host-python-flit-core.
+# This is due to host-python-installer depending on host-python-flit-core.
+#
+$(2)_BASE_INSTALL_CMD = $$(if \
+		$$(filter host-python-flit-core,$(1)), \
+		-m bootstrap_install dist/* $$(HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS), \
+		$(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS) \
+	)
 endif
 else
 $$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools', 'pep517' or 'flit'.")
@@ -235,9 +255,26 @@ endif # ($(4),target)
 ifeq ($$($(2)_SETUP_TYPE),setuptools)
 $(2)_DEPENDENCIES += $$(if $$(filter host-python-setuptools,$(1)),,host-python-setuptools)
 else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
-$(2)_DEPENDENCIES += host-python-pypa-build host-python-installer
+# Filter out host-python-pypa-build and any of its dependencies that need a flit based build.
+#
+$(2)_DEPENDENCIES += $$(if \
+		$$(filter \
+			host-python-flit-core host-python-installer host-python-pep517 host-python-pypa-build host-python-tomli, \
+			$(1)) \
+		,, \
+		host-python-pypa-build \
+	)
+# Filter out host-python-installer and any of its dependencies that need a flit based build.
+#
+$(2)_DEPENDENCIES += $$(if \
+		$$(filter \
+			host-python-flit-core host-python-installer, \
+			$(1)) \
+		,, \
+		host-python-installer \
+	)
 ifeq ($$($(2)_SETUP_TYPE),flit)
-$(2)_DEPENDENCIES += host-python-flit-core
+$(2)_DEPENDENCIES += $$(if $$(filter host-python-flit-core,$(1)),,host-python-flit-core)
 endif
 endif # SETUP_TYPE
 
diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
index 0e058a1f17..d206a72f82 100644
--- a/package/python-flit-core/python-flit-core.mk
+++ b/package/python-flit-core/python-flit-core.mk
@@ -8,6 +8,6 @@ PYTHON_FLIT_CORE_VERSION = 3.7.1
 PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
 PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/15/d1/d8798b83e953fd6f86ca9b50f93eec464a9305b0661469c8234e61095481
 PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
-PYTHON_FLIT_CORE_SETUP_TYPE = pep517
+PYTHON_FLIT_CORE_SETUP_TYPE = flit
 
 $(eval $(host-python-package))
diff --git a/package/python-installer/python-installer.mk b/package/python-installer/python-installer.mk
index 862a251415..97a158b738 100644
--- a/package/python-installer/python-installer.mk
+++ b/package/python-installer/python-installer.mk
@@ -9,6 +9,7 @@ PYTHON_INSTALLER_SOURCE = installer-$(PYTHON_INSTALLER_VERSION).tar.gz
 PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/74/b7/9187323cd732840f1cddd6a9f05961406636b50c799eef37c920b63110c0
 PYTHON_INSTALLER_LICENSE = MIT
 PYTHON_INSTALLER_LICENSE_FILES = LICENSE
-PYTHON_INSTALLER_SETUP_TYPE = distutils
+PYTHON_INSTALLER_SETUP_TYPE = flit
+HOST_PYTHON_INSTALLER_ENV = PYTHONPATH=$(@D)/src
 
 $(eval $(host-python-package))
diff --git a/package/python-pep517/python-pep517.mk b/package/python-pep517/python-pep517.mk
index 99aa62d51d..1ca1bc4e35 100644
--- a/package/python-pep517/python-pep517.mk
+++ b/package/python-pep517/python-pep517.mk
@@ -9,7 +9,7 @@ PYTHON_PEP517_SOURCE = pep517-$(PYTHON_PEP517_VERSION).tar.gz
 PYTHON_PEP517_SITE = https://files.pythonhosted.org/packages/0a/65/6e656d49c679136edfba25f25791f45ffe1ea4ae2ec1c59fe9c35e061cd1
 PYTHON_PEP517_LICENSE = MIT
 PYTHON_PEP517_LICENSE_FILES = LICENSE
-PYTHON_PEP517_SETUP_TYPE = distutils
+PYTHON_PEP517_SETUP_TYPE = flit
 HOST_PYTHON_PEP517_DEPENDENCIES = host-python-tomli
 
 $(eval $(host-python-package))
diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
index b8c20ca736..3539a505be 100644
--- a/package/python-tomli/python-tomli.mk
+++ b/package/python-tomli/python-tomli.mk
@@ -7,7 +7,7 @@
 PYTHON_TOMLI_VERSION = 1.2.0
 PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
 PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/ec/38/8eccdc662c61aed187d5f5b168c18b1d2de3827976c3691e4da8be7375aa
-PYTHON_TOMLI_SETUP_TYPE = distutils
+PYTHON_TOMLI_SETUP_TYPE = flit
 PYTHON_TOMLI_LICENSE = MIT
 PYTHON_TOMLI_LICENSE_FILES = LICENSE
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
