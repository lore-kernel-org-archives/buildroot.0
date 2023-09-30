Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F71CE748ED
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 22:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BBBF83CB1;
	Sat, 30 Sep 2023 22:19:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BBBF83CB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7YPXTVAZXVpj; Sat, 30 Sep 2023 22:19:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5735083CBA;
	Sat, 30 Sep 2023 22:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5735083CBA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 03D471BF5F5
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 22:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D27D74168B
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 22:17:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D27D74168B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Re3VUbFKHiYZ for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 22:17:44 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCB154015F
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 22:17:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCB154015F
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-406618d0991so14612945e9.2
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696112262; x=1696717062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n8s4Yb0QGkzCe5ZF2qNM+ji0b8egX6h6UCB4rxqqy04=;
 b=vX12orsIEk+zjTG5CDWnxHvL40SaoWo5dfxMT4pSaBVyq32OLMEnlX0h4bStDqtZbH
 qTRr6NKjgKV0T7eCxZmdlSzgNwS1opBpvkFigrrY2x9QZmEkaxKBbkTaLrqbVtHnr0mD
 DD3/lZaH/LKo8xazada5vQsCIZEVXiynGW+rclwlvENqnSZfoyHLREI69+JT4hyekpcB
 G9n8jfD+/eZLcEe2sEM7ISJNR1cIySvx77+9T6JsPyNi+7Iqi0OG2TwR+Woyw36nlOv2
 UX+oAWNMXQAosOvqdeD2f7QBz0viapoJ9aCfwq1T//+gWfusnWxdReP+H/W62Il6wL1G
 dDDQ==
X-Gm-Message-State: AOJu0YxgxwOElaSniz1eSninWgYEpUqxUsUuDIzBkgnOXzaeArWhYO+/
 zp8do9aYOrJrg8hlRkHdHjhaRDc0y7/Yqyy83rz/mg==
X-Google-Smtp-Source: AGHT+IHtLc1xPA+QW2cJYfMt0mUFLCDxzQdMOX9BM4syvW6QhScIZ3sjDIMyEVOmqfKul2h0GQsnYg==
X-Received: by 2002:a1c:f709:0:b0:3fe:1cac:37d5 with SMTP id
 v9-20020a1cf709000000b003fe1cac37d5mr7012671wmh.4.1696112261963; 
 Sat, 30 Sep 2023 15:17:41 -0700 (PDT)
Received: from arnoutx1.home
 (2a01cb0404ad0b005ddb2bcd94e35264.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a5d4d0f000000b00324ae863ac1sm5681274wrt.35.2023.09.30.15.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 15:17:41 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 00:16:33 +0200
Message-ID: <20230930221727.1458825-10-arnout@mind.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230930221727.1458825-1-arnout@mind.be>
References: <20230930221727.1458825-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696112262; x=1696717062; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n8s4Yb0QGkzCe5ZF2qNM+ji0b8egX6h6UCB4rxqqy04=;
 b=cyv5bGzdeI9t3c/z/B+5fO80CZBC7Zf/fnUPHVElegPF0j/Va9xT5UPM08XKi7yyVi
 ecJzxBHon/1OCtVLX8/MuDQcKjQ1Lsn2eKME7+Gek2kzmjz57G8UcnteOn6qWjxsfjJG
 H+8VvB98G2xM2f0B1Henh5RPLI009kMBhK5pfvaI2UWFBahInkNqE95VoFah0UtP3Dja
 GDKfp5ZCDkhaaZajZNNHaI8lpb/H3+dMMBSPW+VCdx0Z+UQhmWHzfW4SVWAcjDdrakDX
 kMc5XUe+Gps127XuCnaDiqV7/x5hp2E2ul7IJt4SbnnNfK/S76wxmKIrTferVTBXj+hW
 365Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cyv5bGzd
Subject: [Buildroot] [PATCH 09/10] package/pkg-python.mk: replace
 $(_BASE_INSTALL*_CMD) with $($(SETUP_TYPE)_INSTALL*_CMD)
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Signed-off-by : Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The _BASE_INSTALL*_CMD variables are set based on the setup type, and
only based on the setup type. Because of this, we have a large
conditional tree in inner-python-package which makes things hard to
read.

Rather than conditions, it's also possible to use indirect variables.
Concretely, we can define PKG_PYTHON_DISTUTILS_INSTALL_TARGET_CMD etc.,
and use $(PKG_PYTHON_$($(PKG)_SETUP_TYPE)_INSTALL_TARGET_CMD) instead of
$($(PKG)_BASE_INSTALL_TARGET_CMD) to dispatch to the right
_INSTALL_TARGET_CMD variable. The same applies to _INSTALL_STAGING_CMD
and HOST_..._INSTALL_CMD.

Since the _INSTALL*_OPTS variables are not (or no longer) used anywhere
else, we can fold them into the _INSTALL*_CMD variables.

setuptools-rust, flit and maturin didn't have their own definition of
_BUILD_CMD but were under the setuptools resp. pep517 condition. For
these, we have to define new variables that copy the value from
PKG_PYTHON_SETUPTOOLS_BUILD_CMD resp. PKG_PYTHON_PEP517_BUILD_CMD.

The condition tree is now empty, except for the error handling. Rework
the conditions for the error handling and remove all other conditions.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-python.mk | 101 +++++++++++++++++++++++++-----------------
 1 file changed, 60 insertions(+), 41 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index be9756acc4..bda79116c8 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -65,11 +65,13 @@ PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--prefix=/usr
 
-PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS = \
+PKG_PYTHON_DISTUTILS_INSTALL_TARGET_CMD = \
+	setup.py install --no-compile \
 	$(PKG_PYTHON_DISTUTILS_INSTALL_OPTS) \
 	--root=$(TARGET_DIR)
 
-PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS = \
+PKG_PYTHON_DISTUTILS_INSTALL_STAGING_CMD = \
+	setup.py install \
 	$(PKG_PYTHON_DISTUTILS_INSTALL_OPTS) \
 	--root=$(STAGING_DIR)
 
@@ -80,7 +82,8 @@ HOST_PKG_PYTHON_DISTUTILS_ENV = \
 HOST_PKG_PYTHON_DISTUTILS_BUILD_CMD = \
 	setup.py build \
 
-HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
+HOST_PKG_PYTHON_DISTUTILS_INSTALL_CMD = \
+	setup.py install \
 	--prefix=$(HOST_DIR)
 
 # Target setuptools-based packages
@@ -99,11 +102,15 @@ PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--executable=/usr/bin/python \
 	--single-version-externally-managed
 
-PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS = \
+PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_CMD = \
+	$(PKG_PYTHON_SETUPTOOLS_CMD) \
+	install --no-compile \
 	$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
 	--root=$(TARGET_DIR)
 
-PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS = \
+PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_CMD = \
+	$(PKG_PYTHON_SETUPTOOLS_CMD) \
+	install \
 	$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
 	--root=$(STAGING_DIR)
 
@@ -114,7 +121,9 @@ HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
 HOST_PKG_PYTHON_SETUPTOOLS_BUILD_CMD = \
 	$(PKG_PYTHON_SETUPTOOLS_CMD) build
 
-HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
+HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_CMD = \
+	$(PKG_PYTHON_SETUPTOOLS_CMD) \
+	install \
 	--prefix=$(HOST_DIR) \
 	--root=/ \
 	--single-version-externally-managed
@@ -128,6 +137,12 @@ PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
 PKG_PYTHON_SETUPTOOLS_RUST_BUILD_CMD = \
 	$(PKG_PYTHON_SETUPTOOLS_BUILD_CMD)
 
+PKG_PYTHON_SETUPTOOLS_RUST_INSTALL_TARGET_CMD = \
+	$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_CMD)
+
+PKG_PYTHON_SETUPTOOLS_RUST_INSTALL_STAGING_CMD = \
+	$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_CMD)
+
 # Host setuptools-rust-based packages
 HOST_PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
 	$(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
@@ -137,6 +152,9 @@ HOST_PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
 HOST_PKG_PYTHON_SETUPTOOLS_RUST_BUILD_CMD = \
 	$(HOST_PKG_PYTHON_SETUPTOOLS_BUILD_CMD)
 
+HOST_PKG_PYTHON_SETUPTOOLS_RUST_INSTALL_CMD = \
+	$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_CMD)
+
 # Target pep517-based packages
 PKG_PYTHON_PEP517_ENV = \
 	$(PKG_PYTHON_ENV)
@@ -148,14 +166,18 @@ PKG_PYTHON_PEP517_INSTALL_OPTS = \
 	--interpreter=/usr/bin/python \
 	--script-kind=posix
 
-PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
+PKG_PYTHON_PEP517_INSTALL_TARGET_CMD = \
+	$(TOPDIR)/support/scripts/pyinstaller.py \
+	dist/* \
 	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
 	--purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
 	--headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--scripts=$(TARGET_DIR)/usr/bin \
 	--data=$(TARGET_DIR)/usr
 
-PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
+PKG_PYTHON_PEP517_INSTALL_STAGING_CMD = \
+	$(TOPDIR)/support/scripts/pyinstaller.py \
+	dist/* \
 	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
 	--purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
 	--headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
@@ -169,7 +191,9 @@ HOST_PKG_PYTHON_PEP517_ENV = \
 HOST_PKG_PYTHON_PEP517_BUILD_CMD = \
 	-m build -n -w
 
-HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
+HOST_PKG_PYTHON_PEP517_INSTALL_CMD = \
+	$(TOPDIR)/support/scripts/pyinstaller.py \
+	dist/* \
 	--interpreter=$(HOST_DIR)/bin/python \
 	--script-kind=posix \
 	--purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
@@ -184,6 +208,12 @@ PKG_PYTHON_FLIT_ENV = \
 PKG_PYTHON_FLIT_BUILD_CMD = \
 	$(PKG_PYTHON_PEP517_BUILD_CMD)
 
+PKG_PYTHON_FLIT_INSTALL_TARGET_CMD = \
+	$(PKG_PYTHON_PEP517_INSTALL_TARGET_CMD)
+
+PKG_PYTHON_FLIT_INSTALL_STAGING_CMD = \
+	$(PKG_PYTHON_PEP517_INSTALL_STAGING_CMD)
+
 # Host flit packages
 HOST_PKG_PYTHON_FLIT_ENV = \
 	$(HOST_PKG_PYTHON_PEP517_ENV)
@@ -191,6 +221,9 @@ HOST_PKG_PYTHON_FLIT_ENV = \
 HOST_PKG_PYTHON_FLIT_BUILD_CMD = \
 	$(HOST_PKG_PYTHON_PEP517_BUILD_CMD)
 
+HOST_PKG_PYTHON_FLIT_INSTALL_CMD = \
+	$(HOST_PKG_PYTHON_PEP517_INSTALL_CMD)
+
 # Host flit-bootstrap packages
 HOST_PKG_PYTHON_FLIT_BOOTSTRAP_ENV = \
 	$(HOST_PKG_PYTHON_PEP517_ENV)
@@ -198,6 +231,9 @@ HOST_PKG_PYTHON_FLIT_BOOTSTRAP_ENV = \
 HOST_PKG_PYTHON_FLIT_BOOTSTRAP_BUILD_CMD = \
 	-m flit_core.wheel
 
+HOST_PKG_PYTHON_FLIT_BOOTSTRAP_INSTALL_CMD = \
+	$(HOST_PKG_PYTHON_PEP517_INSTALL_CMD)
+
 # Target maturin packages
 PKG_PYTHON_MATURIN_ENV = \
 	$(PKG_PYTHON_PEP517_ENV) \
@@ -207,6 +243,12 @@ PKG_PYTHON_MATURIN_ENV = \
 PKG_PYTHON_MATURIN_BUILD_CMD = \
 	$(PKG_PYTHON_PEP517_BUILD_CMD)
 
+PKG_PYTHON_MATURIN_INSTALL_TARGET_CMD = \
+	$(PKG_PYTHON_PEP517_INSTALL_TARGET_CMD)
+
+PKG_PYTHON_MATURIN_INSTALL_STAGING_CMD = \
+	$(PKG_PYTHON_PEP517_INSTALL_STAGING_CMD)
+
 # Host maturin packages
 HOST_PKG_PYTHON_MATURIN_ENV = \
 	$(HOST_PKG_PYTHON_PEP517_ENV) \
@@ -216,6 +258,9 @@ HOST_PKG_PYTHON_MATURIN_ENV = \
 HOST_PKG_PYTHON_MATURIN_BUILD_CMD = \
 	$(HOST_PKG_PYTHON_PEP517_BUILD_CMD)
 
+PKG_PYTHON_MATURIN_INSTALL_CMD = \
+	$(PKG_PYTHON_PEP517_INSTALL_CMD)
+
 ################################################################################
 # inner-python-package -- defines how the configuration, compilation
 # and installation of a Python package should be done, implements a
@@ -242,37 +287,11 @@ endif
 
 $(2)_SETUP_TYPE_UPPER = $$(call UPPERCASE,$$($(2)_SETUP_TYPE))
 
-# Distutils
-ifeq ($$($(2)_SETUP_TYPE),distutils)
-ifeq ($(4),target)
-$(2)_BASE_INSTALL_TARGET_CMD  = setup.py install --no-compile $$(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS)
-$(2)_BASE_INSTALL_STAGING_CMD = setup.py install $$(PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS)
-else
-$(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)
-endif
-# Setuptools
-else ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
-ifeq ($(4),target)
-$(2)_BASE_INSTALL_TARGET_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install --no-compile $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
-$(2)_BASE_INSTALL_STAGING_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
-else
-$(2)_BASE_INSTALL_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
-endif
-else ifneq ($$(filter flit maturin pep517,$$($(2)_SETUP_TYPE)),)
-ifeq ($(4),target)
-$(2)_BASE_INSTALL_TARGET_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS)
-$(2)_BASE_INSTALL_STAGING_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS)
-else
-$(2)_BASE_INSTALL_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
+ifneq ($$(filter-out distutils setuptools setuptools-rust pep517 flit flit-bootstrap maturin,$$($(2)_SETUP_TYPE)),)
+$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'maturin', 'setuptools', 'setuptools-rust', 'pep517' or 'flit'.")
 endif
-else ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
-ifeq ($(4),target)
+ifeq ($(4)-$$($(2)_SETUP_TYPE),target-flit-bootstrap)
 $$(error flit-bootstrap setup type only supported for host packages)
-else
-$(2)_BASE_INSTALL_CMD ?= $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
-endif
-else
-$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'maturin', 'setuptools', 'setuptools-rust', 'pep517' or 'flit'.")
 endif
 
 # We need to vendor the Cargo crates at download time for pyo3 based
@@ -368,7 +387,7 @@ define $(2)_INSTALL_TARGET_CMDS
 		$$(PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_ENV) \
 		$$($$(PKG)_ENV) \
 		$$(HOST_DIR)/bin/python3 \
-		$$($$(PKG)_BASE_INSTALL_TARGET_CMD) \
+		$$(PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_INSTALL_TARGET_CMD) \
 		$$($$(PKG)_INSTALL_TARGET_OPTS))
 endef
 endif
@@ -383,7 +402,7 @@ define $(2)_INSTALL_STAGING_CMDS
 		$$(PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_ENV) \
 		$$($$(PKG)_ENV) \
 		$$(HOST_DIR)/bin/python3 \
-		$$($$(PKG)_BASE_INSTALL_STAGING_CMD) \
+		$$(PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_INSTALL_STAGING_CMD) \
 		$$($$(PKG)_INSTALL_STAGING_OPTS))
 endef
 endif
@@ -415,7 +434,7 @@ define $(2)_INSTALL_CMDS
 		$$(HOST_PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_ENV) \
 		$$($$(PKG)_ENV) \
 		$$(HOST_DIR)/bin/python3 \
-		$$($$(PKG)_BASE_INSTALL_CMD) \
+		$$(HOST_PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_INSTALL_CMD) \
 		$$($$(PKG)_INSTALL_OPTS))
 endef
 endif
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
