Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C5DC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 22:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CB9161172;
	Wed,  6 Apr 2022 22:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nwl_ArBNROk5; Wed,  6 Apr 2022 22:29:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69CA461168;
	Wed,  6 Apr 2022 22:29:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27E8B1BF3C0
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 22:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16A61415BB
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 22:29:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3JsKron1s5yJ for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 22:29:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B609415AC
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 22:29:12 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id m17so2948450ilj.13
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 15:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6g1qqKZJHH9b6BoXwiYhtLZFzqMMh76bIhbpnmDevMM=;
 b=axfwv5BDYatl2s+NY8TfjBDLBsv7L2+VsVNNoIyMvfwbV6RyOlV1Hy+4+hb5UNoJrj
 RaPRi7PWFOaoHvurVKOSZ9KQpHr7s8ckDHj+wEED60IURR2QfZAWiNeSpeQxQ9eatyyM
 LbDppt41jw6ijIYNWVqbr0k6CTSZuZtUo1uUJ9G8xhItTV27EKBN4cO4ESZw/Kmiw18X
 fLrBCveuROh/SXxGjKAUm3tRzHQnr4TNLZVezBuoQMi/YDN+gX0Q0l9qqKpBbDbGqhN/
 dfhBjJ6bykobISDc3cHdJMuqd89/4rEdkKALWvo1D9DnaVCwTLz1qrfKU6531LJfetMu
 hWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6g1qqKZJHH9b6BoXwiYhtLZFzqMMh76bIhbpnmDevMM=;
 b=ZZvXtmuDtjWVDlg4PG8cxME+8YmRyhsGlO1M3Aqj9e1Xw2yGC/xqPiXM80YV+aye5y
 MVmxcEQGRmRYFVf7a+kvcQ/z43lwZ2lZtm0ncvQ5J4gohksGvGFMJ18t3UNwa+JvFIgt
 UCrB85EE+Cmn1NJ+veSJG+PkTHhwx5hTRfLBFpF+dpkNkFs5I2PY6utpZtbv1n7x+iJO
 QF+RV5SbuROLeHKqa2wZWHqReJbnflNgHXZYVNhuVOVCAfI3FESXas/05MRgNz2CKjMo
 /dDHcSazdk0Rnn6gilEs6eZOlRDUpJSyXrRMNew3HxDH+B7CQA6Bf7hauFFl1J8oGMV5
 +VMQ==
X-Gm-Message-State: AOAM530iAw7usXbEFzqJqtuXLSojJq7uE6XhTx6p+JCpvSVpv2v+YSk/
 9mZpicIJXsbjsk3BXhy2zfM4vckocyv01A==
X-Google-Smtp-Source: ABdhPJynLrBaD7JIOa8B1wtBjPUYg+UHTDOv7PU3yRwUBbC6FGitV+IFdtF8o+sYYteWyf6AfFJCbg==
X-Received: by 2002:a05:6e02:180c:b0:2c8:825c:5052 with SMTP id
 a12-20020a056e02180c00b002c8825c5052mr5568760ilv.0.1649284151302; 
 Wed, 06 Apr 2022 15:29:11 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 d15-20020a92d78f000000b002ca4c409d1asm5389739iln.83.2022.04.06.15.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 15:29:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Apr 2022 16:29:03 -0600
Message-Id: <20220406222904.421610-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 1/2] package/pkg-python: migrate flit to new
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
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
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
