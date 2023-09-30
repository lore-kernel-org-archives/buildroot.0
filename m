Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B76E748EA
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 22:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E8B783CA9;
	Sat, 30 Sep 2023 22:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E8B783CA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dqHly-G1ustb; Sat, 30 Sep 2023 22:18:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AC9F83CBA;
	Sat, 30 Sep 2023 22:18:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AC9F83CBA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 067951BF86C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 22:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1BCB4015F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 22:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1BCB4015F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cA48kx9V6AvX for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 22:17:39 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D00204168B
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 22:17:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D00204168B
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-31fa15f4cc6so14594959f8f.2
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696112257; x=1696717057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MY8z4hCI2vGdJpkYi6ghxDNyaDi4gEYy3tIDl4XStp8=;
 b=TdZm1YOc2K8/CMc/Wmi7cN+De78YgxO8KY0FTIv0yexV1eeLs3KQ9plzT8PPCGAOxP
 NkuV5nkWxTl0FKT+lF/XJIGG5cNur+emI0rKKAMcAGzmtjG1o6Zc8MAOUXvaJu1stBRi
 RikG0a7HlNQtfNHyP81oWMx5POSbVUivuzNImtmRpySbVhq5egx6jZdBKtk/FYoFM1Dc
 sNlNaHSPOqSzpwhQwCFls6g2Vw3+GbKx/BCdHPym0CyZXCkR8gesobYpDPYsbTZNmaol
 h/CkzwG1JS9bBT5r29Ttye8vwCTV1znS4pAiQ7236pGv5WB5eGT+j71yTyt45BbiE67n
 Ny3w==
X-Gm-Message-State: AOJu0YwToYsScHUqUN2C9y9cGzlKJIW6PfnEr1w+5+CdbWHhYCCe9y/+
 FntPzyaeQjD0Dz+uXygds4FXbLwCwZarLNfmHDmiAQ==
X-Google-Smtp-Source: AGHT+IG+V9J55N3npGL0FB+Vl0bttufodsQoTFoNo4KNCYkUWXgd9NUyOB7O40qy/RRT02GW6cUsGg==
X-Received: by 2002:adf:e892:0:b0:319:731f:748c with SMTP id
 d18-20020adfe892000000b00319731f748cmr6670164wrm.34.1696112257002; 
 Sat, 30 Sep 2023 15:17:37 -0700 (PDT)
Received: from arnoutx1.home
 (2a01cb0404ad0b005ddb2bcd94e35264.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a5d4d0f000000b00324ae863ac1sm5681274wrt.35.2023.09.30.15.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 15:17:36 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 00:16:28 +0200
Message-ID: <20230930221727.1458825-5-arnout@mind.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230930221727.1458825-1-arnout@mind.be>
References: <20230930221727.1458825-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696112257; x=1696717057; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MY8z4hCI2vGdJpkYi6ghxDNyaDi4gEYy3tIDl4XStp8=;
 b=BssxrnI5THNNl2LYx6NCVVttW5Wl2ZhbXCfjIP4g56Atqp88++Mx8qNwN9uZkLO13E
 SRNwtZ5n/hja6I70WE+KDIc3yxfNmcwKlz0fW1/4JXIOEC09KRBjhvI9JYp2aaL1g1Vs
 PL08Orvl2FaWYd7JXluakX6xXat278RPX9BRghuMbEC2P3v9mV44bjniDKeANXZtPE3u
 SaKMKmjSlT+EE/V/jWkM5emXt3/fxX0wHDtZEaoNBLWHncFcePDMzZmesyUskIuWW2yZ
 oUbB88emeDf5tEfQh0YmFdUaYhL5BuEkr2459OcmMoGITUTHX6LEuVwaP0rvKmUmUPHD
 +SCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BssxrnI5
Subject: [Buildroot] [PATCH 04/10] package/pkg-python.mk: replace
 $(_BASE_ENV) with $($(SETUP_TYPE)_ENV)
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

The _BASE_ENV variable is set based on the setup type, and only based on
the setup type. Because of this, we have a large conditional tree in
inner-python-package which makes things hard to read.

Rather than conditions, it's also possible to use indirect variables.
Concretely, we can use $(PKG_PYTHON_$($(PKG)_SETUP_TYPE)_ENV) instead
of $($(PKG)_BASE_ENV) to dispatch to the right ENV variable.

Once we do the same for all other variables that are set in the
condition tree, we'll be able to remove the condition tree entirely.

Because $($(PKG)_SETUP_TYPE) is lowercase (e.g. 'setuptools' or
'pep517'), while the existing _ENV variables have uppercase names (e.g.
PKG_PYTHON_SETUPTOOLS_ENV), we need to convert the setup type to
uppercase. Introduce the variable $(PKG)_SETUP_TYPE_UPPER for this.

flit was reusing the _BASE_ENV definition from pep517, and flit-bootstrap
also didn't have its own _ENV definition yet, so those have to be added.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-python.mk | 52 ++++++++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 28 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index c1640d71bb..8e8955f3c4 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -158,6 +158,18 @@ HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
 HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS = \
 	--installdir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
 
+# Target flit packages
+PKG_PYTHON_FLIT_ENV = \
+	$(PKG_PYTHON_PEP517_ENV)
+
+# Host flit packages
+HOST_PKG_PYTHON_FLIT_ENV = \
+	$(HOST_PKG_PYTHON_PEP517_ENV)
+
+# Host flit-bootstrap packages
+HOST_PKG_PYTHON_FLIT_BOOTSTRAP_ENV = \
+	$(HOST_PKG_PYTHON_PEP517_ENV)
+
 # Target maturin packages
 PKG_PYTHON_MATURIN_ENV = \
 	$(PKG_PYTHON_PEP517_ENV) \
@@ -194,54 +206,34 @@ ifndef $(2)_SETUP_TYPE
  endif
 endif
 
+$(2)_SETUP_TYPE_UPPER = $$(call UPPERCASE,$$($(2)_SETUP_TYPE))
+
 # Distutils
 ifeq ($$($(2)_SETUP_TYPE),distutils)
 ifeq ($(4),target)
-$(2)_BASE_ENV = $$(PKG_PYTHON_DISTUTILS_ENV)
 $(2)_BASE_BUILD_CMD = setup.py build $$(PKG_PYTHON_DISTUTILS_BUILD_OPTS)
 $(2)_BASE_INSTALL_TARGET_CMD  = setup.py install --no-compile $$(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS)
 $(2)_BASE_INSTALL_STAGING_CMD = setup.py install $$(PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS)
 else
-$(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_DISTUTILS_ENV)
 $(2)_BASE_BUILD_CMD   = setup.py build
 $(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)
 endif
 # Setuptools
 else ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
 ifeq ($(4),target)
-ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
-$(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_RUST_ENV)
-else
-$(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_ENV)
-endif
 $(2)_BASE_BUILD_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) build
 $(2)_BASE_INSTALL_TARGET_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install --no-compile $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
 $(2)_BASE_INSTALL_STAGING_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
 else
-ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
-$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_RUST_ENV)
-else
-$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
-endif
 $(2)_BASE_BUILD_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) build
 $(2)_BASE_INSTALL_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
 endif
 else ifneq ($$(filter flit maturin pep517,$$($(2)_SETUP_TYPE)),)
 ifeq ($(4),target)
-ifeq ($$($(2)_SETUP_TYPE),maturin)
-$(2)_BASE_ENV = $$(PKG_PYTHON_MATURIN_ENV)
-else
-$(2)_BASE_ENV = $$(PKG_PYTHON_PEP517_ENV)
-endif
 $(2)_BASE_BUILD_CMD = -m build -n -w
 $(2)_BASE_INSTALL_TARGET_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS)
 $(2)_BASE_INSTALL_STAGING_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS)
 else
-ifeq ($$($(2)_SETUP_TYPE),maturin)
-$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_MATURIN_ENV)
-else
-$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
-endif
 $(2)_BASE_BUILD_CMD = -m build -n -w
 $(2)_BASE_INSTALL_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
 endif
@@ -249,7 +241,6 @@ else ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
 ifeq ($(4),target)
 $$(error flit-bootstrap setup type only supported for host packages)
 else
-$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
 $(2)_BASE_BUILD_CMD = -m flit_core.wheel
 $(2)_BASE_INSTALL_CMD ?= $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
 endif
@@ -332,7 +323,8 @@ ifeq ($(4),target)
 ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
-		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
+		$$(PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_ENV) \
+		$$($$(PKG)_ENV) \
 		$$(HOST_DIR)/bin/python3 \
 		$$($$(PKG)_BASE_BUILD_CMD) \
 		$$($$(PKG)_BUILD_OPTS))
@@ -346,7 +338,8 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
-		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
+		$$(PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_ENV) \
+		$$($$(PKG)_ENV) \
 		$$(HOST_DIR)/bin/python3 \
 		$$($$(PKG)_BASE_INSTALL_TARGET_CMD) \
 		$$($$(PKG)_INSTALL_TARGET_OPTS))
@@ -360,7 +353,8 @@ endif
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
-		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
+		$$(PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_ENV) \
+		$$($$(PKG)_ENV) \
 		$$(HOST_DIR)/bin/python3 \
 		$$($$(PKG)_BASE_INSTALL_STAGING_CMD) \
 		$$($$(PKG)_INSTALL_STAGING_OPTS))
@@ -376,7 +370,8 @@ else # host
 ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
-		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
+		$$(HOST_PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_ENV) \
+		$$($$(PKG)_ENV) \
 		$$(HOST_DIR)/bin/python3 \
 		$$($$(PKG)_BASE_BUILD_CMD) \
 		$$($$(PKG)_BUILD_OPTS))
@@ -390,7 +385,8 @@ endif
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
-		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
+		$$(HOST_PKG_PYTHON_$$($$(PKG)_SETUP_TYPE_UPPER)_ENV) \
+		$$($$(PKG)_ENV) \
 		$$(HOST_DIR)/bin/python3 \
 		$$($$(PKG)_BASE_INSTALL_CMD) \
 		$$($$(PKG)_INSTALL_OPTS))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
