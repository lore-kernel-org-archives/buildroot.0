From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 22:50:06 +0200
Subject: [Buildroot] [PATCH v2 10/14] imx-parser: rename from
 libfslparser and bump version to 4.0.9
In-Reply-To: <605423330d42aee494d4b1addf05e08df982ad49.1465578220.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <cover.1465578220.git.awebster@arcx.com>
 <605423330d42aee494d4b1addf05e08df982ad49.1465578220.git.awebster@arcx.com>
Message-ID: <20160615225006.7a12bd7a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Jun 2016 14:13:18 -0400, Andrew Webster wrote:

> +IMX_PARSER_VERSION = 4.0.9
> +IMX_PARSER_SITE = $(FREESCALE_IMX_SITE)
> +IMX_PARSER_SOURCE = imx-parser-$(IMX_PARSER_VERSION).bin
> +IMX_PARSER_INSTALL_STAGING = YES
> +
> +IMX_PARSER_LICENSE = NXP Semiconductor Software License Agreement
> +IMX_PARSER_LICENSE_FILES = EULA COPYING
> +IMX_PARSER_REDISTRIBUTE = NO
> +
> +define IMX_PARSER_EXTRACT_CMDS
> +	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(IMX_PARSER_SOURCE))
> +endef
> +
> +# The Makefile installs several versions of the libraries, but we only
> +# need one of them, depending on the platform.

This package seems to have several variants of the libraries, including
some that are enabled/disabled with --enable-fsw / --enable-fhw. It
would be good to understand what those variants are, and if they are
related to ARM EABIhf or not.

Indeed, it is a bit strange that some parts of the i.MX6 blobs are
EABIhf only (imx-gpu-viv), while some other parts don't see to be
EABIhf. Or maybe imx-parser has both EABI and EABIhf variants ?

In any case, a clarification would be good. I've nonetheless applied,
since it was already something that wasn't clear in the pre-existing
libfslparser package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
