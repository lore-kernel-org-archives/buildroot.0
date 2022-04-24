Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C361BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 21:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 782C140598;
	Sun, 24 Apr 2022 21:40:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cgSA-ZoQPAub; Sun, 24 Apr 2022 21:40:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25B2E4022A;
	Sun, 24 Apr 2022 21:40:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C7F211BF962
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 21:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0DFC60A6F
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 21:40:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qX8LQ4kUrEHB for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 21:40:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBF4C605B0
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 21:40:07 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id 125so13995405iov.10
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 14:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6g1qqKZJHH9b6BoXwiYhtLZFzqMMh76bIhbpnmDevMM=;
 b=Feh9q6s5mc5/uHgBj7lEmvUysbRksAqJFhUgSq6JiTFzuDCePNNhdTBxFDaaYxWnn2
 4SwtSRezUNc1K9WS3tWTtbDxirmekCj4vn3R3GDRtjPmD++J2kNqyqy3VAo6F07k50bR
 a66y0c7Z7BbnrHNpOQMWzXoLIw79aa14ivA78587tKxEvqz/J4Pxozmj7Kf5e6VxIJrr
 RVkH5YHtjlydQ6keqNrK3pSvzurA1ascTiyEkyRbkjZMaZvbXsSBUDXyS6/r08oWc7Li
 I6sevzlCiAZvsdiTpKKpZDxRVAHHaaXqiRSfFw8C9Uh5UHbfpUs2gMl3+1N+B8xkwo/L
 2Pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6g1qqKZJHH9b6BoXwiYhtLZFzqMMh76bIhbpnmDevMM=;
 b=uasDVoqJkSF+6IricW/5jxd3kpvTaPiwimO1yURvCCxMjBo584rmdcAPgdg0jFFqRw
 Ql/FesihaD9FRdmDo1jt7EA44lEWXiPq5hp9T5LwiHKrNCjycU+TfU+qRRhxVTXqtdPz
 wA2zKTOpEYxpU5hLTo99692gwT26WgkDLyCmbXVIxcWv06HLgLAwKAGQrhTbtPrkHTMc
 rFaI86AKUv9BGQUSIVjjat5WjubfUfARE60iEmNxX68P3nEC3DnovKsLrGxFUhaDF0wj
 me1sJmlCEkXgIrH+UfjGtHjZIJqSEPPk0Jd6T6OD4vIe9mNcZM1c8ED/EoallWkfWzx6
 WMcg==
X-Gm-Message-State: AOAM530lS4hIiPq7rT1ff2f9oD9VYRvI+1AvNCL2NBMuhUnkjIiilnIM
 1qujRX56Z/Qx3lnfr1e3H+YmlbPu5CUW/w==
X-Google-Smtp-Source: ABdhPJyuByCm+r5q9J2Dm027GpQ9z9sIcIYQXtIUDk6sgZNtlPXoGMKrnmu4DopSpAHWDqsWEmn2yQ==
X-Received: by 2002:a05:6638:3714:b0:328:8647:3457 with SMTP id
 k20-20020a056638371400b0032886473457mr6266664jav.299.1650836405379; 
 Sun, 24 Apr 2022 14:40:05 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 o19-20020a056e0214d300b002cbec3af6casm5385084ilk.30.2022.04.24.14.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 14:40:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 15:39:54 -0600
Message-Id: <20220424213958.1747120-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v7 1/5] package/pkg-python: migrate flit to new
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
