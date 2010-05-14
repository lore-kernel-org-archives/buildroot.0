From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 May 2010 10:48:22 +0200
Subject: [Buildroot] [PATCH v2] package: Add support for clex
 filemanager (v 3.19)
In-Reply-To: <201005140122.57084.PeterHuewe@gmx.de>
References: <201005130115.00927.PeterHuewe@gmx.de>
	<20100513152315.322e934f@surf>
	<201005140122.57084.PeterHuewe@gmx.de>
Message-ID: <20100514104822.0bda583a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

On Fri, 14 May 2010 01:22:56 +0200
Peter Huewe <PeterHuewe@gmx.de> wrote:

> --- /dev/null
> +++ b/package/clex/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_CLEX
> +	bool "clex filemanager"

As clex appears to be based on LIBNCURSES, you should add here:

	select BR2_PACKAGE_NCURSES

and maybe one of BR2_PACKAGE_NCURSES_TARGET_PANEL,
BR2_PACKAGE_NCURSES_TARGET_FORM, BR2_PACKAGE_NCURSES_TARGET_MENU if
these are used by your package.

> +CLEX_VERSION:=3.19
> +CLEX_SOURCE:=clex-$(CLEX_VERSION).tar.gz
> +CLEX_SITE:=http://www.clex.sk/download/
> +CLEX_INSTALL_TARGET = YES
> +CLEX_CONF_OPT = $(DISABLE_NLS) $(DISABLE_LARGEFILE)

No need to add these, they are already part of the default options
passed to the configure script by Buildroot.

However, you need to add:

CLEX_DEPENDENCIES = ncurses

to make sure that ncurses gets built *before* clex.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
