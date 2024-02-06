Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E983C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 22:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 261CE42098;
	Tue,  6 Feb 2024 22:31:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WZ-8plKDIqQe; Tue,  6 Feb 2024 22:31:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 545244203B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 545244203B;
	Tue,  6 Feb 2024 22:31:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF8A31BF5A4
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC18E403AC
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:31:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ueAtNHC8VZFB for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 22:31:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DB3F14031E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB3F14031E
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB3F14031E
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 22:31:07 +0000 (UTC)
Received: from [10.11.2.50] (220.211-78-194.adsl-static.isp.belgacom.be
 [194.78.211.220])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 656672C80CDD;
 Tue,  6 Feb 2024 23:31:05 +0100 (CET)
Message-ID: <6049c19d-3ba6-4991-b47f-72b5d46c1e91@bubu1.eu>
Date: Tue, 6 Feb 2024 23:31:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231126180840.2081945-1-james.hilliard1@gmail.com>
 <20231126180840.2081945-5-james.hilliard1@gmail.com>
In-Reply-To: <20231126180840.2081945-5-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707258665; bh=rnfrK6jtAGseQipLeyvhzlgR/Z6ZJoJCR7Ok2QCzp3c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=El4Pr6c1BBnaluf/p+xH+w4UwgQkYYHXPow7p56aUHPFRowryFsZZHzr5p/8TB2Bi
 fxGQ5JY55p2ENAomV6zPnXgeNkfRFNIR5g1DwaZTgwHj+C3F+MUC/qNRVGDSyETK6M
 NReaJYX7qv8numGCTQT0Rv+WY7gOl/9MWKkTyC6m7fUXFlbxT1bG3IB3fgTIArXJ2O
 +tDC7MlhTuXw6A0v/pfbhtzOQVfp+Nq/JWcx9G4tx47y9LdEQeO8dm6L/lKGn0drrq
 YivwRlp1AHJYr3LG7o4OWPJWdtF8ZZ1AX0oOwLzKEem0AkvHRZlat+rd+cEeAa8q3S
 ld1shhRkL5jGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=El4Pr6c1
Subject: Re: [Buildroot] [PATCH v6 5/5] package/pkg-python.mk: migrate
 setuptools to pep517
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Gustavo Heinz <gustavo@gsthnz.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James, all

On 26.11.23 19:08, James Hilliard wrote:
> Now that setuptools and its dependencies are using pep517 we can
> migrate the setuptools infrastructure itself to use the pep517
> build frontend.
> 
> As part of this we need to migrate the all python packages using
> _BUILD_OPTS to the new config settings format used by the pep517
> build frontend.
> 
> Use new setup type variables to define setup type specific
> dependencies instead of using the conditional block.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

I tested this with all python packages we use in our project and except 
for uvloop (see below) it all went well.

The patch looks sensible to me as well.

Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>
Tested-by: Marcus Hoffmann <buildroot@bubu1.eu>

> ---
> Changes v5 -> v6:
>    - use setup type variables for dependencies
> Changes v4 -> v5:
>    - rebase on next
> Changes v1 -> v3:
>    - rebase on master
>    - combine setuptools-rust and maturin env variables
>    - drop patch which is now upstream
> ---
>   package/pkg-python.mk                      | 160 ++++++++++-----------
>   package/python-evdev/python-evdev.mk       |   4 +-
>   package/python-lxml/python-lxml.mk         |   8 +-
>   package/python-m2crypto/python-m2crypto.mk |   4 +-
>   package/python-pillow/python-pillow.mk     |  35 +++--
>   package/python-psycopg2/python-psycopg2.mk |   5 +-
>   package/python-pyzmq/python-pyzmq.mk       |   4 +-

This parts needs a rebase.

>   package/python-uvloop/python-uvloop.mk     |   6 +-
>   8 files changed, 113 insertions(+), 113 deletions(-)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index bda79116c8..cb9f6ab5e6 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -86,15 +86,62 @@ HOST_PKG_PYTHON_DISTUTILS_INSTALL_CMD = \
>   	setup.py install \
>   	--prefix=$(HOST_DIR)
>   
> -# Target setuptools-based packages
> -PKG_PYTHON_SETUPTOOLS_ENV = \
> +# Target pep517-based packages
> +PKG_PYTHON_PEP517_ENV = \
>   	$(PKG_PYTHON_ENV)
>   
> -PKG_PYTHON_SETUPTOOLS_CMD = \
> -	$(if $(wildcard $($(PKG)_BUILDDIR)/setup.py),setup.py,-c 'from setuptools import setup;setup()')
> +PKG_PYTHON_PEP517_BUILD_CMD = \
> +	-m build -n -w
> +
> +PKG_PYTHON_PEP517_INSTALL_OPTS = \
> +	--interpreter=/usr/bin/python \
> +	--script-kind=posix
> +
> +PKG_PYTHON_PEP517_INSTALL_TARGET_CMD = \
> +	$(TOPDIR)/support/scripts/pyinstaller.py \
> +	dist/* \
> +	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
> +	--purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> +	--headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
> +	--scripts=$(TARGET_DIR)/usr/bin \
> +	--data=$(TARGET_DIR)/usr
> +
> +PKG_PYTHON_PEP517_INSTALL_STAGING_CMD = \
> +	$(TOPDIR)/support/scripts/pyinstaller.py \
> +	dist/* \
> +	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
> +	--purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> +	--headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
> +	--scripts=$(STAGING_DIR)/usr/bin \
> +	--data=$(STAGING_DIR)/usr
> +
> +PKG_PYTHON_PEP517_DEPENDENCIES = \
> +	host-python-pypa-build \
> +	host-python-installer
> +
> +# Host pep517-based packages
> +HOST_PKG_PYTHON_PEP517_ENV = \
> +	$(HOST_PKG_PYTHON_ENV)
> +
> +HOST_PKG_PYTHON_PEP517_BUILD_CMD = \
> +	-m build -n -w
> +
> +HOST_PKG_PYTHON_PEP517_INSTALL_CMD = \
> +	$(TOPDIR)/support/scripts/pyinstaller.py \
> +	dist/* \
> +	--interpreter=$(HOST_DIR)/bin/python \
> +	--script-kind=posix \
> +	--purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> +	--headers=$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR) \
> +	--scripts=$(HOST_DIR)/bin \
> +	--data=$(HOST_DIR)
> +
> +# Target setuptools-based packages
> +PKG_PYTHON_SETUPTOOLS_ENV = \
> +	$(PKG_PYTHON_PEP517_ENV)
>   
>   PKG_PYTHON_SETUPTOOLS_BUILD_CMD = \
> -	$(PKG_PYTHON_SETUPTOOLS_CMD) build
> +	$(PKG_PYTHON_PEP517_BUILD_CMD)
>   
>   PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
>   	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
> @@ -103,30 +150,24 @@ PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
>   	--single-version-externally-managed
>   
>   PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_CMD = \
> -	$(PKG_PYTHON_SETUPTOOLS_CMD) \
> -	install --no-compile \
> -	$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
> -	--root=$(TARGET_DIR)
> +	$(PKG_PYTHON_PEP517_INSTALL_TARGET_CMD)
>   
>   PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_CMD = \
> -	$(PKG_PYTHON_SETUPTOOLS_CMD) \
> -	install \
> -	$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
> -	--root=$(STAGING_DIR)
> +	$(PKG_PYTHON_PEP517_INSTALL_STAGING_CMD)
> +
> +PKG_PYTHON_SETUPTOOLS_DEPENDENCIES = \
> +	$(PKG_PYTHON_PEP517_DEPENDENCIES) \
> +	host-python-setuptools
>   
>   # Host setuptools-based packages
>   HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
> -	$(HOST_PKG_PYTHON_ENV)
> +	$(HOST_PKG_PYTHON_PEP517_ENV)
>   
>   HOST_PKG_PYTHON_SETUPTOOLS_BUILD_CMD = \
> -	$(PKG_PYTHON_SETUPTOOLS_CMD) build
> +	$(HOST_PKG_PYTHON_PEP517_BUILD_CMD)
>   
>   HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_CMD = \
> -	$(PKG_PYTHON_SETUPTOOLS_CMD) \
> -	install \
> -	--prefix=$(HOST_DIR) \
> -	--root=/ \
> -	--single-version-externally-managed
> +	$(HOST_PKG_PYTHON_PEP517_INSTALL_CMD)
>   
>   # Target setuptools-rust-based packages
>   PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
> @@ -143,6 +184,10 @@ PKG_PYTHON_SETUPTOOLS_RUST_INSTALL_TARGET_CMD = \
>   PKG_PYTHON_SETUPTOOLS_RUST_INSTALL_STAGING_CMD = \
>   	$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_CMD)
>   
> +PKG_PYTHON_SETUPTOOLS_RUST_DEPENDENCIES = \
> +	$(PKG_PYTHON_SETUPTOOLS_DEPENDENCIES) \
> +	host-python-setuptools-rust
> +
>   # Host setuptools-rust-based packages
>   HOST_PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
>   	$(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
> @@ -155,52 +200,6 @@ HOST_PKG_PYTHON_SETUPTOOLS_RUST_BUILD_CMD = \
>   HOST_PKG_PYTHON_SETUPTOOLS_RUST_INSTALL_CMD = \
>   	$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_CMD)
>   
> -# Target pep517-based packages
> -PKG_PYTHON_PEP517_ENV = \
> -	$(PKG_PYTHON_ENV)
> -
> -PKG_PYTHON_PEP517_BUILD_CMD = \
> -	-m build -n -w
> -
> -PKG_PYTHON_PEP517_INSTALL_OPTS = \
> -	--interpreter=/usr/bin/python \
> -	--script-kind=posix
> -
> -PKG_PYTHON_PEP517_INSTALL_TARGET_CMD = \
> -	$(TOPDIR)/support/scripts/pyinstaller.py \
> -	dist/* \
> -	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
> -	--purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> -	--headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
> -	--scripts=$(TARGET_DIR)/usr/bin \
> -	--data=$(TARGET_DIR)/usr
> -
> -PKG_PYTHON_PEP517_INSTALL_STAGING_CMD = \
> -	$(TOPDIR)/support/scripts/pyinstaller.py \
> -	dist/* \
> -	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
> -	--purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> -	--headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
> -	--scripts=$(STAGING_DIR)/usr/bin \
> -	--data=$(STAGING_DIR)/usr
> -
> -# Host pep517-based packages
> -HOST_PKG_PYTHON_PEP517_ENV = \
> -	$(HOST_PKG_PYTHON_ENV)
> -
> -HOST_PKG_PYTHON_PEP517_BUILD_CMD = \
> -	-m build -n -w
> -
> -HOST_PKG_PYTHON_PEP517_INSTALL_CMD = \
> -	$(TOPDIR)/support/scripts/pyinstaller.py \
> -	dist/* \
> -	--interpreter=$(HOST_DIR)/bin/python \
> -	--script-kind=posix \
> -	--purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> -	--headers=$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR) \
> -	--scripts=$(HOST_DIR)/bin \
> -	--data=$(HOST_DIR)
> -
>   # Target flit packages
>   PKG_PYTHON_FLIT_ENV = \
>   	$(PKG_PYTHON_PEP517_ENV)
> @@ -214,6 +213,10 @@ PKG_PYTHON_FLIT_INSTALL_TARGET_CMD = \
>   PKG_PYTHON_FLIT_INSTALL_STAGING_CMD = \
>   	$(PKG_PYTHON_PEP517_INSTALL_STAGING_CMD)
>   
> +PKG_PYTHON_FLIT_DEPENDENCIES = \
> +	$(PKG_PYTHON_PEP517_DEPENDENCIES) \
> +	host-python-flit-core
> +
>   # Host flit packages
>   HOST_PKG_PYTHON_FLIT_ENV = \
>   	$(HOST_PKG_PYTHON_PEP517_ENV)
> @@ -249,6 +252,10 @@ PKG_PYTHON_MATURIN_INSTALL_TARGET_CMD = \
>   PKG_PYTHON_MATURIN_INSTALL_STAGING_CMD = \
>   	$(PKG_PYTHON_PEP517_INSTALL_STAGING_CMD)
>   
> +PKG_PYTHON_MATURIN_DEPENDENCIES = \
> +	$(PKG_PYTHON_PEP517_DEPENDENCIES) \
> +	host-python-maturin
> +
>   # Host maturin packages
>   HOST_PKG_PYTHON_MATURIN_ENV = \
>   	$(HOST_PKG_PYTHON_PEP517_ENV) \
> @@ -327,28 +334,17 @@ else
>   $(2)_DEPENDENCIES += host-python3
>   endif # ($(4),target)
>   
> -# Setuptools based packages will need setuptools for the host Python
> -# interpreter (both host and target).
> +# Setup type specific dependencies are the same whether we are
> +# building for the host or the target.
>   #
> -ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
> -$(2)_DEPENDENCIES += host-python-setuptools
> -ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
> -$(2)_DEPENDENCIES += host-python-setuptools-rust
> -endif
> -else ifneq ($$(filter flit maturin pep517,$$($(2)_SETUP_TYPE)),)
> -$(2)_DEPENDENCIES += host-python-pypa-build host-python-installer
> -ifeq ($$($(2)_SETUP_TYPE),flit)
> -$(2)_DEPENDENCIES += host-python-flit-core
> -endif
> -ifeq ($$($(2)_SETUP_TYPE),maturin)
> -$(2)_DEPENDENCIES += host-python-maturin
> -endif
> -else ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
> +ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
>   # Don't add dependency on host-python-installer for
>   # host-python-installer itself, and its dependencies.
>   ifeq ($$(filter host-python-flit-core host-python-installer,$(1)),)
>   $(2)_DEPENDENCIES += host-python-installer
>   endif
> +else
> +$(2)_DEPENDENCIES += $$(PKG_PYTHON_$$($(2)_SETUP_TYPE_UPPER)_DEPENDENCIES)
>   endif
>   
>   # Pyo3 based packages(setuptools-rust and maturin) will need rust
> diff --git a/package/python-evdev/python-evdev.mk b/package/python-evdev/python-evdev.mk
> index 5cf62b5160..b509b43e8a 100644
> --- a/package/python-evdev/python-evdev.mk
> +++ b/package/python-evdev/python-evdev.mk
> @@ -12,7 +12,7 @@ PYTHON_EVDEV_LICENSE = Revised BSD License
>   PYTHON_EVDEV_LICENSE_FILES = LICENSE
>   
>   PYTHON_EVDEV_BUILD_OPTS = \
> -	build_ecodes \
> -	--evdev-headers $(STAGING_DIR)/usr/include/linux/input.h:$(STAGING_DIR)/usr/include/linux/input-event-codes.h:$(STAGING_DIR)/usr/include/linux/uinput.h
> +	-C--build-option=build_ecodes \
> +	-C--build-option=--evdev-headers=$(STAGING_DIR)/usr/include/linux/input.h:$(STAGING_DIR)/usr/include/linux/input-event-codes.h:$(STAGING_DIR)/usr/include/linux/uinput.h
>   
>   $(eval $(python-package))
> diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
> index 3ef3aabdbc..4454f5aa0c 100644
> --- a/package/python-lxml/python-lxml.mk
> +++ b/package/python-lxml/python-lxml.mk
> @@ -28,11 +28,11 @@ HOST_PYTHON_LXML_DEPENDENCIES = host-libxml2 host-libxslt host-zlib
>   # python-lxml needs these scripts in order to properly detect libxml2 and
>   # libxslt compiler and linker flags
>   PYTHON_LXML_BUILD_OPTS = \
> -	--xslt-config=$(STAGING_DIR)/usr/bin/xslt-config \
> -	--xml2-config=$(STAGING_DIR)/usr/bin/xml2-config
> +	-C--build-option=--xslt-config=$(STAGING_DIR)/usr/bin/xslt-config \
> +	-C--build-option=--xml2-config=$(STAGING_DIR)/usr/bin/xml2-config
>   HOST_PYTHON_LXML_BUILD_OPTS = \
> -	--xslt-config=$(HOST_DIR)/bin/xslt-config \
> -	--xml2-config=$(HOST_DIR)/bin/xml2-config
> +	-C--build-option=--xslt-config=$(HOST_DIR)/bin/xslt-config \
> +	-C--build-option=--xml2-config=$(HOST_DIR)/bin/xml2-config
>   
>   $(eval $(python-package))
>   $(eval $(host-python-package))
> diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
> index 69a0c28df5..6c07f42d06 100644
> --- a/package/python-m2crypto/python-m2crypto.mk
> +++ b/package/python-m2crypto/python-m2crypto.mk
> @@ -13,6 +13,8 @@ PYTHON_M2CRYPTO_LICENSE_FILES = LICENCE
>   PYTHON_M2CRYPTO_CPE_ID_VENDOR = m2crypto_project
>   PYTHON_M2CRYPTO_CPE_ID_PRODUCT = m2crypto
>   PYTHON_M2CRYPTO_DEPENDENCIES = openssl host-swig
> -PYTHON_M2CRYPTO_BUILD_OPTS = --openssl=$(STAGING_DIR)/usr
> +PYTHON_M2CRYPTO_BUILD_OPTS = \
> +	-C--build-option=build_ext \
> +	-C--build-option=--openssl=$(STAGING_DIR)/usr
>   
>   $(eval $(python-package))
> diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
> index bc94062da8..e2077654d2 100644
> --- a/package/python-pillow/python-pillow.mk
> +++ b/package/python-pillow/python-pillow.mk
> @@ -14,61 +14,60 @@ PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
>   PYTHON_PILLOW_SETUP_TYPE = setuptools
>   
>   PYTHON_PILLOW_DEPENDENCIES = host-pkgconf
> -PYTHON_PILLOW_BUILD_OPTS = build_ext --disable-platform-guessing
> -PYTHON_PILLOW_INSTALL_TARGET_OPTS = $(PYTHON_PILLOW_BUILD_OPTS)
> +PYTHON_PILLOW_BUILD_OPTS = -C--build-option=build_ext -C--build-option=--disable-platform-guessing
>   
>   ifeq ($(BR2_PACKAGE_FREETYPE),y)
>   PYTHON_PILLOW_DEPENDENCIES += freetype
> -PYTHON_PILLOW_BUILD_OPTS += --enable-freetype
> +PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-freetype
>   else
> -PYTHON_PILLOW_BUILD_OPTS += --disable-freetype
> +PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-freetype
>   endif
>   
>   ifeq ($(BR2_PACKAGE_JPEG),y)
>   PYTHON_PILLOW_DEPENDENCIES += jpeg
> -PYTHON_PILLOW_BUILD_OPTS += --enable-jpeg
> +PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-jpeg
>   else
> -PYTHON_PILLOW_BUILD_OPTS += --disable-jpeg
> +PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-jpeg
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LCMS2),y)
>   PYTHON_PILLOW_DEPENDENCIES += lcms2
> -PYTHON_PILLOW_BUILD_OPTS += --enable-lcms
> +PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-lcms
>   else
> -PYTHON_PILLOW_BUILD_OPTS += --disable-lcms
> +PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-lcms
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBXCB),y)
>   PYTHON_PILLOW_DEPENDENCIES += libxcb
> -PYTHON_PILLOW_BUILD_OPTS += --enable-xcb
> +PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-xcb
>   else
> -PYTHON_PILLOW_BUILD_OPTS += --disable-xcb
> +PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-xcb
>   endif
>   
>   ifeq ($(BR2_PACKAGE_OPENJPEG),y)
>   PYTHON_PILLOW_DEPENDENCIES += openjpeg
> -PYTHON_PILLOW_BUILD_OPTS += --enable-jpeg2000
> +PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-jpeg2000
>   else
> -PYTHON_PILLOW_BUILD_OPTS += --disable-jpeg2000
> +PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-jpeg2000
>   endif
>   
>   ifeq ($(BR2_PACKAGE_TIFF),y)
>   PYTHON_PILLOW_DEPENDENCIES += tiff
> -PYTHON_PILLOW_BUILD_OPTS += --enable-tiff
> +PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-tiff
>   else
> -PYTHON_PILLOW_BUILD_OPTS += --disable-tiff
> +PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-tiff
>   endif
>   
>   ifeq ($(BR2_PACKAGE_WEBP),y)
>   PYTHON_PILLOW_DEPENDENCIES += webp
> -PYTHON_PILLOW_BUILD_OPTS += --enable-webp
> +PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-webp
>   ifeq ($(BR2_PACKAGE_WEBP_DEMUX)$(BR2_PACKAGE_WEBP_MUX),yy)
> -PYTHON_PILLOW_BUILD_OPTS += --enable-webpmux
> +PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-webpmux
>   else
> -PYTHON_PILLOW_BUILD_OPTS += --disable-webpmux
> +PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-webpmux
>   endif
>   else
> -PYTHON_PILLOW_BUILD_OPTS += --disable-webp --disable-webpmux
> +PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-webp -C--build-option=--disable-webpmux
>   endif
>   
>   $(eval $(python-package))
> diff --git a/package/python-psycopg2/python-psycopg2.mk b/package/python-psycopg2/python-psycopg2.mk
> index 0149b8d185..1b33b7505d 100644
> --- a/package/python-psycopg2/python-psycopg2.mk
> +++ b/package/python-psycopg2/python-psycopg2.mk
> @@ -13,7 +13,8 @@ PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE
>   PYTHON_PSYCOPG2_DEPENDENCIES = postgresql
>   # Force psycopg2 to use the Buildroot provided postgresql version
>   # instead of the one from the host machine
> -PYTHON_PSYCOPG2_BUILD_OPTS = build_ext --pg-config=$(STAGING_DIR)/usr/bin/pg_config
> -PYTHON_PSYCOPG2_INSTALL_TARGET_OPTS = build_ext --pg-config=$(STAGING_DIR)/usr/bin/pg_config
> +PYTHON_PSYCOPG2_BUILD_OPTS = \
> +	-C--build-option=build_ext \
> +	-C--build-option=--pg-config=$(STAGING_DIR)/usr/bin/pg_config
>   
>   $(eval $(python-package))
> diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
> index 5792957eaf..1b7bceae5e 100644
> --- a/package/python-pyzmq/python-pyzmq.mk
> +++ b/package/python-pyzmq/python-pyzmq.mk
> @@ -12,7 +12,7 @@ PYTHON_PYZMQ_LICENSE = LGPL-3.0+, BSD-3-Clause, Apache-2.0
>   PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
>   PYTHON_PYZMQ_DEPENDENCIES = host-python-packaging zeromq
>   PYTHON_PYZMQ_SETUP_TYPE = setuptools
> -PYTHON_PYZMQ_BUILD_OPTS = --zmq=$(STAGING_DIR)/usr
> +PYTHON_PYZMQ_BUILD_OPTS = -C--build-option=--zmq=$(STAGING_DIR)/usr
>   
>   # Due to issues with cross-compiling, hardcode to the zeromq in BR
>   define PYTHON_PYZMQ_PATCH_ZEROMQ_VERSION
> @@ -23,7 +23,7 @@ endef
>   PYTHON_PYZMQ_POST_PATCH_HOOKS += PYTHON_PYZMQ_PATCH_ZEROMQ_VERSION
>   
>   ifeq ($(BR2_PACKAGE_ZEROMQ_DRAFTS),y)
> -PYTHON_PYZMQ_BUILD_OPTS += --enable-drafts
> +PYTHON_PYZMQ_BUILD_OPTS += -C--build-option=--enable-drafts
>   endif
>   
>   $(eval $(python-package))
> diff --git a/package/python-uvloop/python-uvloop.mk b/package/python-uvloop/python-uvloop.mk
> index 285884a2bb..70508fb6de 100644
> --- a/package/python-uvloop/python-uvloop.mk
> +++ b/package/python-uvloop/python-uvloop.mk
> @@ -10,8 +10,10 @@ PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/9c/16/728cc5dde368e
>   PYTHON_UVLOOP_SETUP_TYPE = setuptools
>   PYTHON_UVLOOP_LICENSE = Apache-2.0, MIT
>   PYTHON_UVLOOP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> -PYTHON_UVLOOP_BUILD_OPTS = build_ext --inplace --use-system-libuv
> -PYTHON_UVLOOP_INSTALL_TARGET_OPTS = build_ext --inplace --use-system-libuv
>   PYTHON_UVLOOP_DEPENDENCIES = libuv

This needs a new dependency on host-python-cython now. Otherwise it 
fails with the following error:

ERROR Missing dependencies:
	Cython<0.30.0,>=0.29.36


> +PYTHON_UVLOOP_BUILD_OPTS = \
> +	-C--build-option=build_ext \
> +	-C--build-option=--inplace \
> +	-C--build-option=--use-system-libuv
>   
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
