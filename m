Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B7BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 20:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6083460ABE;
	Sun, 24 Apr 2022 20:56:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4UdzVUvajN18; Sun, 24 Apr 2022 20:56:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B7A560AB3;
	Sun, 24 Apr 2022 20:56:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57E9E1BF404
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 20:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 382AB81468
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 20:56:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K_UIKvV6BG9b for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 20:56:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07DD581467
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 20:56:47 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id o5so8222469ils.11
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 13:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6g1qqKZJHH9b6BoXwiYhtLZFzqMMh76bIhbpnmDevMM=;
 b=aozrYRxHHOulCC6cqVjyXgiTjcK8jCxvb9bTrgZg9IMU1tnPb1NxBKpRFjhks6wmVQ
 FeiBQ7udmqGLoUcTSTvixlCBfk+xC1WMAAw7BntzGBnRaSZgwizgEgdc4HT41odMbwJA
 8ggNkWfL3ezcxzcVw+ahn4LJLRXueDKKHKFzCcU8vetDuYNCz/ZhH51+AGez7hS8BGXl
 fWBIl1Rm7agF/q6zrm3TOqYi0kPX/e6qTRe3XH9CXhAMXWfn81nuDYzjCL+vd8OgBt3j
 Usns5hOCxZV9dYhB3y+H87IUu5nLXnFYu97uCDhX09N6zxX1/NKRwpu6UlildkxGn0BA
 2Fbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6g1qqKZJHH9b6BoXwiYhtLZFzqMMh76bIhbpnmDevMM=;
 b=e5hB4Qa8v4cWTf0jJ5e1q/m7rtCmgm5OUlUyJDpwmEMPlAHbCPzSkFNq8fnY56lR/Z
 tmr215ybitcTeAE7OHZqGKNeMfsPS8f8bF+tC1b8Kmx2fRT5r3cgZQri8NQvSL9ZOZWK
 KbgE2YGiOBUeaxKELy+Eufs0gZxKPc+aSEP964vjab1mN/11R2wsRoLxJJyiogGc4ZVx
 KWfZlR795dY+iya9Yzohj7NGAVWBexdKKzR1E682MGfileNyjgHEvIxGKKFOLcYxNDsD
 oFS4Dt6Ld29SBJw6QjYaaC7r36UKbBSqesw5f6LfhJX4PjPoWKxSgLhhj+hoDwQnp36N
 Puog==
X-Gm-Message-State: AOAM532HHRdRBpcuq8WAUz6JBmIzWMEhuCfonh0pSWPB8waWd1aBabce
 bZdf+wwwnIs3P9srOjAcLVUNOVf1bdCbXg==
X-Google-Smtp-Source: ABdhPJw9v32UdPGh+H7NqF6DENsUTP0z+i6be40RNFssKhxWKpcWB5jaDEB1eYMLAzi6VVirAjx+xQ==
X-Received: by 2002:a05:6e02:1cad:b0:2cb:f94c:2eab with SMTP id
 x13-20020a056e021cad00b002cbf94c2eabmr5317711ill.259.1650833806862; 
 Sun, 24 Apr 2022 13:56:46 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 j1-20020a926e01000000b002cc52449a19sm5152350ilc.35.2022.04.24.13.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 13:56:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 14:56:35 -0600
Message-Id: <20220424205639.1618386-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 1/5] package/pkg-python: migrate flit to new
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
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

We need to add a special flit-bootstrap SETUP_TYPE for dependencies
of host-python-pypa-build and host-python-installer which can not
use the normal flit SETUP_TYPE which would cause a circular dependency
issue.

We need to special case dependency exclusions for
host-python-flit-core and host-python-installer to avoid circular
dependencies in the flit-bootstrap SETUP_TYPE.

We also need to special case the installation command for
host-python-flit-core since it can not depend on host-python-installer
due to host-python-installer requiring host-python-flit-core.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
Changes v3 -> v4:
  - rebase
Changes v2 -> v3:
  - add special flit-bootstrap SETUP_TYPE
  - don't change package SETUP_TYPE's yet
Changes v1 -> v2:
  - formatting/cleanup
  - add comments
---
 package/pkg-python.mk | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 867341fc7b..2e7704a0a9 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -154,6 +154,9 @@ HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
 	--scripts=$(HOST_DIR)/bin \
 	--data=$(HOST_DIR)
 
+HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS = \
+	--installdir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
+
 ################################################################################
 # inner-python-package -- defines how the configuration, compilation
 # and installation of a Python package should be done, implements a
@@ -203,7 +206,7 @@ $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
 $(2)_BASE_BUILD_CMD = setup.py build
 $(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
 endif
-else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
+else ifneq ($$(filter flit flit-bootstrap pep517,$$($(2)_SETUP_TYPE)),)
 ifeq ($(4),target)
 $(2)_BASE_ENV = $$(PKG_PYTHON_PEP517_ENV)
 $(2)_BASE_BUILD_CMD = -m build -n -w
@@ -211,9 +214,24 @@ $(2)_BASE_INSTALL_TARGET_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $
 $(2)_BASE_INSTALL_STAGING_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS)
 else
 $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
+# Use flit built in wheel builder for packages that are flit-bootstrap packages.
+# This is needed to avoid a circular with host-python-pypa-build and those dependencies.
+#
+ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
+$(2)_BASE_BUILD_CMD = -m flit_core.wheel
+ifeq ($(1),host-python-flit-core)
+# Use flit built in bootstrap_install for installing host-python-flit-core.
+# This is due to host-python-installer depending on host-python-flit-core.
+#
+$(2)_BASE_INSTALL_CMD = -m bootstrap_install dist/* $$(HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS)
+else
+$(2)_BASE_INSTALL_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
+endif
+else
 $(2)_BASE_BUILD_CMD = -m build -n -w
 $(2)_BASE_INSTALL_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
 endif
+endif
 else
 $$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools', 'pep517' or 'flit'.")
 endif
@@ -239,6 +257,12 @@ $(2)_DEPENDENCIES += host-python-pypa-build host-python-installer
 ifeq ($$($(2)_SETUP_TYPE),flit)
 $(2)_DEPENDENCIES += host-python-flit-core
 endif
+else ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
+ifneq ($$(filter host-python-flit-core host-python-installer,$(1)),)
+$(2)_DEPENDENCIES += $$(if $$(filter host-python-flit-core,$(1)),,host-python-flit-core)
+else
+$(2)_DEPENDENCIES += host-python-flit-core host-python-installer
+endif
 endif # SETUP_TYPE
 
 # Python interpreter to use for building the package.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
