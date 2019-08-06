From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Aug 2019 23:10:28 +0200
Subject: [Buildroot] [PATCH v3] package/sdbusplus: new package
In-Reply-To: <20190805225228.16904-1-jfaith@impinj.com>
References: <710b4b46-81d6-e5e6-4820-f8e1fb435750@mind.be>
 <20190805225228.16904-1-jfaith@impinj.com>
Message-ID: <20190806231028.60b9437e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello John,

Thanks for this new iteration!

On Mon, 5 Aug 2019 22:52:42 +0000
John Faith <jfaith@impinj.com> wrote:

> +comment "sdbusplus needs systemd and a toolchain w/ C++"

This needs to have:

	depends on !BR2_PACKAGE_SYSTEMD || !BR2_INSTALL_LIBSTDCPP

> +SDBUSPLUS_VERSION = 4212292bcf136d04b38ba5116aa568b0fa312798
> +SDBUSPLUS_SITE = $(call github,openbmc,sdbusplus,$(SDBUSPLUS_VERSION))
> +SDBUSPLUS_DEPENDENCIES = host-autoconf-archive host-pkgconf systemd
> +HOST_SDBUSPLUS_DEPENDENCIES = \
> +	host-autoconf-archive \
> +	host-pkgconf \
> +	$(PKG_PYTHON_HOST_PYTHON) \

I'm not sure to understand where is this variable defined. I don't see
where Buildroot defines it, and "make printvars
VARS=PKG_PYTHON_HOST_PYTHON" doesn't return anything useful. It's
getting late here so perhaps I'm msising the point. Could you enlighten me ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
