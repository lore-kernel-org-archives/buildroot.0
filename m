From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Oct 2017 21:23:52 +0200
Subject: [Buildroot] [PATCH v2] axel: bump to version 2.15
In-Reply-To: <20171016191127.14704-1-ismael@iodev.co.uk>
References: <20171016191127.14704-1-ismael@iodev.co.uk>
Message-ID: <20171016212352.4707159c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Oct 2017 16:11:27 -0300, Ismael Luceno wrote:
> - Change upstream URL.
> - Add optional dependency on libressl/openssl.
> - Switch to autotools-package.
> 
> Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
> ---

You forgot to add a changelog here, describing what changes since v1.


> -AXEL_VERSION = 2.4
> -AXEL_SITE = http://sources.buildroot.net
> +AXEL_VERSION = 2.15
> +AXEL_SITE = https://github.com/axel-download-accelerator/axel/releases/download/v$(AXEL_VERSION)
> +AXEL_SOURCE = axel-$(AXEL_VERSION).tar.xz
>  AXEL_LICENSE = GPL-2.0+
>  AXEL_LICENSE_FILES = COPYING
>  AXEL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
> -AXEL_LDFLAGS = -lpthread $(TARGET_NLS_LIBS)
>  
> -ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
> -AXEL_DISABLE_I18N = --i18n=0
> -endif
> -
> -define AXEL_CONFIGURE_CMDS
> -	(cd $(@D); \
> -		./configure \
> -			--prefix=/usr \
> -			--debug=1 \
> -			$(AXEL_DISABLE_I18N) \
> -	)
> -endef
> +AXEL_CFLAGS = -D_POSIX_C_SOURCE=200112L
> +AXEL_CONF_OPTS = \
> +	ac_cv_prog_cc_c99=-std=c99 \
> +	CFLAGS="$(TARGET_CFLAGS) $(AXEL_CFLAGS)"

Why do you need these? It should be explained in the commit log, or
perhaps even better with a short comment.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
