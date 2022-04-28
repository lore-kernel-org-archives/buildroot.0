Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6540C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 22:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F5D982EA1;
	Thu, 28 Apr 2022 22:17:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sN87aBD095BI; Thu, 28 Apr 2022 22:17:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80B2E8294A;
	Thu, 28 Apr 2022 22:17:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E67C81BF2B9
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 22:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3E4582784
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 22:17:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hbuX9SQh4qJj for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 22:17:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF028827DE
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 22:17:30 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id y16so2882451ilc.7
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 15:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zQsTS+ROby2B8QNj46xQkLxP0s1qB0/uXWZqEHU3JnU=;
 b=g7OK5Tz2nA986RtIh3ViVH2Q39OBg7ZP7NDLprc6jHzyN6yhd+1U+GJhZevW7c1jnH
 10/ysqsg/B/6fQsWAHHsRWmptf2eD2fLqSjA/ZZzSzS84szkmUz41Jzwwwq33y0MtHkk
 OA1t7LdDO5/2DBIjHFRqOEUKfL3lXpaCbCgffwFPJL4yq1ETqdxqEvmJXidtfX34oR/H
 oYl4KAK7t4FsLYChOaFDJhrOK8jhSAmBcAMYHO5aVomqVFQ5glrT89TZJ83mhdBONCqR
 ZYItsuXX0zz5r54H/zd65v3LsnEGKBAxj+w8Nixwlvezh0Cpi3iSi3sFU6VSja8A47k1
 me/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zQsTS+ROby2B8QNj46xQkLxP0s1qB0/uXWZqEHU3JnU=;
 b=iseU1ZKR3+IqbCuqhtHwdmEcVdF4e8OuTNpoPHQvT4PgWmtvHImeLG2jGdlznI6Rw+
 G0FWkctXgaTTOzf3OLD/afa/BfGFScswAvnFdsl5tRN1a7P/yN/qPsMvujwqKAzUCAfd
 aPQDQPVdAdhBdYFSRUzl/yPtzsCcolzuxA9bKnAx6r8pW6SLvJUSsITX2H4otAizWJLp
 5kkU8jz1DQFxOcRYbr4H9iflq9up8HBBiPKHWuUap4UHmDUMT5akvKz56oC9B32xPCij
 fx2lcmmxnHPG5EDk/nG348xkOUegvp6urms40cuXH/ubEw9hVlC9GOdP450TFNM3T5wf
 dFmA==
X-Gm-Message-State: AOAM533xLiBUKSjx1WCNU0G0ll/a/0OaRhxwPYYuWTYkrNla6eQl8MzR
 ViAHEQ27+8rCQmYxy3zQuKR8MElezZ4=
X-Google-Smtp-Source: ABdhPJzSlif5ti3QjLaCXVeGz+T9b3yVXwYwaW47sSzOHY/6IlPs6G0M+YAHT0Vi+7gSgIdHAvz1jw==
X-Received: by 2002:a05:6e02:2197:b0:2cc:38bc:4f42 with SMTP id
 j23-20020a056e02219700b002cc38bc4f42mr14173596ila.96.1651184249807; 
 Thu, 28 Apr 2022 15:17:29 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 f15-20020a92b50f000000b002cde6e352e8sm57103ile.50.2022.04.28.15.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 15:17:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 16:17:26 -0600
Message-Id: <20220428221727.1680234-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428221727.1680234-1-james.hilliard1@gmail.com>
References: <20220428221727.1680234-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/3] package/pkg-python: add setuptools-rust
 infrastructure
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

The setuptools-rust package infrastructure is essentially a variant
of the setuptools package infrastructure which sets up the env
and download hooks required for building setuptools-rust packages.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-python.mk | 46 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index b86e12423f..a9bb12550c 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -110,6 +110,24 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--root=/ \
 	--single-version-externally-managed
 
+# Target setuptools-rust-based packages
+PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
+	$(PKG_PYTHON_SETUPTOOLS_ENV) \
+	$(PKG_CARGO_ENV) \
+	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+
+PKG_PYTHON_SETUPTOOLS_RUST_DL_ENV = \
+	$(PKG_CARGO_ENV)
+
+# Host setuptools-rust-based packages
+HOST_PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
+	$(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
+	$(HOST_PKG_CARGO_ENV) \
+	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+
+HOST_PKG_PYTHON_SETUPTOOLS_RUST_DL_ENV = \
+	$(HOST_PKG_CARGO_ENV)
+
 # Target pep517-based packages
 PKG_PYTHON_PEP517_ENV = \
 	$(PKG_PYTHON_ENV)
@@ -177,14 +195,30 @@ $(2)_BASE_BUILD_CMD   = setup.py build
 $(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)
 endif
 # Setuptools
-else ifeq ($$($(2)_SETUP_TYPE),setuptools)
+else ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
 ifeq ($(4),target)
+ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
+$(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_RUST_ENV)
+$(2)_DL_ENV = $$(PKG_PYTHON_SETUPTOOLS_RUST_DL_ENV)
+$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_CARGO_MANIFEST_PATH)
+else
 $(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_ENV)
+endif
 $(2)_BASE_BUILD_CMD = setup.py build
 $(2)_BASE_INSTALL_TARGET_CMD = setup.py install --no-compile $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
 $(2)_BASE_INSTALL_STAGING_CMD = setup.py install $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
 else
+ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
+$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_RUST_ENV)
+$(2)_DL_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_RUST_DL_ENV)
+ifndef $(2)_CARGO_MANIFEST_PATH
+$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(3)_CARGO_MANIFEST_PATH)
+else
+$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_CARGO_MANIFEST_PATH)
+endif
+else
 $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
+endif
 $(2)_BASE_BUILD_CMD = setup.py build
 $(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
 endif
@@ -208,7 +242,7 @@ $(2)_BASE_BUILD_CMD = -m flit_core.wheel
 $(2)_BASE_INSTALL_CMD ?= -m installer dist/*
 endif
 else
-$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools', 'pep517' or 'flit'.")
+$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools', 'setuptools-rust', 'pep517' or 'flit'.")
 endif
 
 # Target packages need both the python interpreter on the target (for
@@ -225,8 +259,14 @@ endif # ($(4),target)
 # Setuptools based packages will need setuptools for the host Python
 # interpreter (both host and target).
 #
-ifeq ($$($(2)_SETUP_TYPE),setuptools)
+ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
 $(2)_DEPENDENCIES += $$(if $$(filter host-python-setuptools,$(1)),,host-python-setuptools)
+ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
+$(2)_DEPENDENCIES += host-python-setuptools-rust host-rustc
+# We need to vendor the Cargo crates at download time
+$(2)_DOWNLOAD_POST_PROCESS = cargo
+$(2)_DOWNLOAD_DEPENDENCIES = host-rustc
+endif
 else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
 $(2)_DEPENDENCIES += host-python-pypa-build host-python-installer
 ifeq ($$($(2)_SETUP_TYPE),flit)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
