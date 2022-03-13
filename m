Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4804FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 12:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D026440144;
	Sun, 13 Mar 2022 12:21:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aL6y-Rfz1jue; Sun, 13 Mar 2022 12:21:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44D92400E2;
	Sun, 13 Mar 2022 12:21:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 948191BF45A
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 12:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DD9C8190B
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 12:21:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OLvGa7GNSXP9 for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 12:21:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58C37818C0
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 12:21:20 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id x9so2546895ilc.3
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 05:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PI/pso/UjiLBzdbq0BiEgSGxE0BaUgU5P6jugTIAxuc=;
 b=keo/B+r3q7j1NBUvwudBB0kfXFZU3votiKREwb111Kv0ZG+Lg9JSZC1wHwTnCGyj9e
 Zi7kztWolUzjZhBQyimpN2uMOMyMbBgAZhJlpN2HytRTvKzHpOfNDNMlVzpzcBOWoCYT
 tzxdcGoIE6+HgRJrfpYlex157rFKt6M2m3UhdOLXLaNjjnWsCX/hlIPN4V8GzL8K7VCo
 TodAIZ/Zx1dvoBw3vOHXaFVFccZXEr2rkBlbAstoxdVF7lDffvNKmiGobD7xJmX/PdIH
 YUT0yLw6+wv9Qq1cp7N+ajH4RjpoE7Khi9iM60QU5punL7jsPGpuI8PwH/bkCmZo5DYI
 kONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PI/pso/UjiLBzdbq0BiEgSGxE0BaUgU5P6jugTIAxuc=;
 b=VenGEKfPlVhdq8TepmTH0+AfydlRVwStURFg/o8sh2sSlpI7u97C72TAffYvIoS5dV
 xceUMFmtpfEKFtCMl2jpU9PTh12co0AyoZhY1qAp+JCZIUcgzgBocKNf7foU0yO7smNF
 57o1IGhM0fbjKRCAV4o3eryRN1QcH2kKSdD7GsN6KdxGyyTMdcCX00qEqILMHhlCbYAN
 HIgMJ8MUyp5oKWEOg9VJtxOkoGlrwsI7a/oodCZktOi4g3TxhTuIzInGiuhRoilDEM81
 Zvy+ccarVOnVKDwzECdDwAyK+OjfTF9kozPonXrD4J5/3+8KXrJuzZpuwxnsKiakJ/XR
 4lYw==
X-Gm-Message-State: AOAM5309dAD7btdqClsX1j8z7mllsd1bSIUAF7tTa2ftYDcaPXVS92mx
 WqNS2PpBUREdV7xXoXvTVzqergT5HxM=
X-Google-Smtp-Source: ABdhPJyo9AVOMQYuv4kM/jXri4kMIA5Vh7UXy48yLts3ERc/BnQsLdDYDinbI5wWf8jmmOgp9dGRiQ==
X-Received: by 2002:a92:cbc3:0:b0:2c6:78fa:41e9 with SMTP id
 s3-20020a92cbc3000000b002c678fa41e9mr15637771ilq.112.1647174079116; 
 Sun, 13 Mar 2022 05:21:19 -0700 (PDT)
Received: from james-x399.localdomain (97-118-243-247.hlrn.qwest.net.
 [97.118.243.247]) by smtp.gmail.com with ESMTPSA id
 g7-20020a056e02198700b002c7887c006fsm2828964ilf.21.2022.03.13.05.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 05:21:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 06:21:11 -0600
Message-Id: <20220313122112.261290-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/pkg-python: migrate flit to new
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-python.mk                        | 28 +++++++++++++++++---
 package/python-flit-core/python-flit-core.mk |  2 +-
 package/python-installer/python-installer.mk |  3 ++-
 package/python-pep517/python-pep517.mk       |  2 +-
 package/python-tomli/python-tomli.mk         |  2 +-
 5 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 52ce402281..6dee8aa7d1 100644
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
@@ -212,7 +215,16 @@ $(2)_BASE_INSTALL_STAGING_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/*
 else
 $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
 $(2)_BASE_BUILD_CMD = -m build -n -w
-$(2)_BASE_INSTALL_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
+$(2)_BASE_BUILD_CMD = $$(if $$(filter \
+	host-python-flit-core \
+	host-python-installer \
+	host-python-pep517 \
+	host-python-tomli,$(1)),\
+	-m flit_core.wheel,\
+	-m build -n -w)
+$(2)_BASE_INSTALL_CMD = $$(if $$(filter host-python-flit-core,$(1)),\
+	-m bootstrap_install dist/* $$(HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS),\
+	$(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS))
 endif
 else
 $$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools', 'pep517' or 'flit'.")
@@ -235,9 +247,19 @@ endif # ($(4),target)
 ifeq ($$($(2)_SETUP_TYPE),setuptools)
 $(2)_DEPENDENCIES += $$(if $$(filter host-python-setuptools,$(1)),,host-python-setuptools)
 else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
-$(2)_DEPENDENCIES += host-python-pypa-build host-python-installer
+$(2)_DEPENDENCIES += $$(if $$(filter \
+	host-python-flit-core \
+	host-python-installer \
+	host-python-pep517 \
+	host-python-pypa-build \
+	host-python-tomli,$(1)),,\
+	host-python-pypa-build)
+$(2)_DEPENDENCIES += $$(if $$(filter \
+	host-python-flit-core \
+	host-python-installer,$(1)),,\
+	host-python-installer)
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
