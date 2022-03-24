Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF112C433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 22:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46E2261047;
	Thu, 24 Mar 2022 22:37:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tlpo3Oi4brw5; Thu, 24 Mar 2022 22:37:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56A7C60A9E;
	Thu, 24 Mar 2022 22:37:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C1EC71BF36A
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 22:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B021360A9E
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 22:37:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id agDRbAp8RnQ1 for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 22:37:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA46560A8D
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 22:37:33 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id e22so7066983ioe.11
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 15:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OND0mMEjIQwGqbApL7XMWsGTbmgDhaDaT5eLLZ8MPtQ=;
 b=d8QWitHW0Bk8NxGCfjuOPC71Out8LoxsKfu6VL7iLpEPUt4Pgsu+BZ8OIpatQkhJfi
 tlhE9TgRTYnsPD98ENXVd6yW5brd7fGGwe7AXXk/AnPX07npc9EZEQlVu5wMIw+bHpia
 cUwEEesDFmyKVLlhuQWteg5MJEwMlRca5uumV0SbYw0BrJapHhzj2MarohAmU1uRyhFD
 3gLJxf56wWdmHCHaiCH+dssIp/DbBkHqC2Zkv4kN9zRb2KqVZ8R6H2z9V6oTkxa/OdPr
 jRrKe6q8OZiNzdr7O1fwOtb2FVQyl1J3giB856B27Ss31OQ5DPcykWPMi6FLOcKP3qwV
 tTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OND0mMEjIQwGqbApL7XMWsGTbmgDhaDaT5eLLZ8MPtQ=;
 b=zagA9avsNxpXuVi0xjAzQxq+k8YAevtGflF3KpX5pGn+g53Urg740AQ/fmoIZMcBBv
 TGKJbV2bhuLx1r7pp9vco4UUXy/s9UJObaZ7ZegQnV4ybPl8qCFx68xLfejf9F7HSDEl
 mQEp/fSOLUD9ejx54TLF/xRm95fDfFU7aQbfZZ0xtlsmjuzGUwbmSWnb6l/YZBbitRDl
 /gFMNArxLDGV/wXkoDizRq7sUCMJBbyckFn2/2Ao2KqJAVgqiPUcG5ipS6lGSV8KE1iz
 HtFQEfyrLUdLGuS7lRo8+ob++57Q+Z3l4s+7VDaIiFlup3rUIrx9tCI1FWmJoL9BU5Ad
 Zk5w==
X-Gm-Message-State: AOAM531IzfBmYlAMRYJidhAKO/XvbCKkXkMNHi69DVPlrc8eRIhTrEWT
 WaudF3GuIhzhmkRr9WhVA9XbF3zL5Oz3fw==
X-Google-Smtp-Source: ABdhPJy6AZH2ZAE47GQqka9i05lFBCusYd3Y+ZhNdJ/40MC0tWyBxxH+vlXMBajprvBtAyak3gzNgQ==
X-Received: by 2002:a05:6638:d87:b0:319:b50c:5efc with SMTP id
 l7-20020a0566380d8700b00319b50c5efcmr4110730jaj.5.1648161452262; 
 Thu, 24 Mar 2022 15:37:32 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 c6-20020a056e020bc600b002c6731e7cb8sm2112666ilu.31.2022.03.24.15.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 15:37:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 24 Mar 2022 16:37:15 -0600
Message-Id: <20220324223715.1961461-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/1] package/pkg-python: migrate flit to new
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
index 52ce402281..353bbada65 100644
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
