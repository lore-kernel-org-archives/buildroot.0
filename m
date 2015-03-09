From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 09:33:51 +0100
Subject: [Buildroot] [PATCH 1/3] Added new package 'mc' (Midnight
 Commander).
In-Reply-To: <1425850629-14725-1-git-send-email-mc5686@mclink.it>
References: <1425850629-14725-1-git-send-email-mc5686@mclink.it>
Message-ID: <20150309093351.26a5ab73@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mauro Condarelli,

Thanks for this contribution!

On Sun,  8 Mar 2015 22:37:07 +0100, Mauro Condarelli wrote:

> diff --git a/package/mc/Config.in b/package/mc/Config.in
> new file mode 100644
> index 0000000..735523f
> --- /dev/null
> +++ b/package/mc/Config.in
> @@ -0,0 +1,10 @@
> +# mc prefers slang, but can use ncurses too

This comment should be right above the "select BR2_PACKAGE_SLANG" line.

> +config BR2_PACKAGE_MC
> +	bool "mc"
> +	select BR2_PACKAGE_LIBGLIB2

When you select a package, you need to replicate the dependencies of
this package. So here, you need to:

        depends on BR2_USE_WCHAR # libglib2
        depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
        depends on BR2_USE_MMU # libglib2, slang

> +	help
> +	  GNU Midnight Commander is a visual file manager, licensed under GNU General Public License.
> +	  It can use either SLang(preferred) or ncurses for screen handling; if neither is enabled SLang will be automatically chosen.

Please wrap text to 72 characters.

> +MC_VERSION_MAJOR = 4.8
> +MC_VERSION = $(MC_VERSION_MAJOR).13
> +MC_SOURCE = mc-$(MC_VERSION).tar.bz2
> +MC_SITE = http://ftp.midnight-commander.org
> +MC_INSTALL_STAGING = YES
> +MC_INSTALL_TARGET = YES
> +MC_CONF_OPTS = --disable-shared
> +MC_DEPENDENCIES = libglib2 host-pkgconf

You should add MC_LICENSE and MC_LICENSE_FILES variables.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
