From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 10:16:53 +0200
Subject: [Buildroot] [PATCH v2 1/1] acpica: new package
In-Reply-To: <20160703104535.10401-1-nunes.erico@gmail.com>
References: <20160703104535.10401-1-nunes.erico@gmail.com>
Message-ID: <20160705101653.365090c4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Jul 2016 12:45:35 +0200, Erico Nunes wrote:

> +ACPICA_VERSION = 20160527
> +ACPICA_SOURCE = acpica-unix2-$(ACPICA_VERSION).tar.gz
> +ACPICA_SITE = https://acpica.org/sites/acpica/files
> +ACPICA_LICENSE = BSD-3c or GPLv2
> +ACPICA_LICENSE_FILES = source/include/acpi.h
> +ACPICA_DEPENDENCIES = host-bison host-flex
> +
> +define ACPICA_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +		HARDWARE_NAME=$(BR2_ARCH) HOST=_LINUX CC="$(TARGET_CC)" \

The HARDWARE_NAME variable is pretty useless, it's only used to echo
some messages. But I've kept it since it's used, and sent a patch
upstream to get rid of it (https://github.com/acpica/acpica/pull/152).

> +define ACPICA_INSTALL_TARGET_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +		HARDWARE_NAME=$(BR2_ARCH) DESTDIR="$(TARGET_DIR)" \
> +		INSTALLFLAGS=-m555 install

555 is a bit unusual for binaries, we prefer to use 755. I've changed
it and applied your patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
