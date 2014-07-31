From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Jul 2014 22:55:38 +0200
Subject: [Buildroot] [PATCH] libevdev: use tarball instead of git
	repository
In-Reply-To: <1406839768-7896-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1406839768-7896-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140731205538.GJ3960@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-31 22:49 +0200, Thomas Petazzoni spake thusly:
> Tarballs are now provided for libevdev, so use that instead of the Git
> repository, as it allows to avoid autoreconf for the package.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libevdev/libevdev.mk | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
> index a9a1d41..fde7d3c 100644
> --- a/package/libevdev/libevdev.mk
> +++ b/package/libevdev/libevdev.mk
> @@ -5,16 +5,14 @@
>  ################################################################################
>  
>  LIBEVDEV_VERSION = 1.2.2
> -LIBEVDEV_SITE = http://cgit.freedesktop.org/libevdev/snapshot
> +LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev/
> +LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
>  LIBEVDEV_LICENSE = X11
>  LIBEVDEV_LICENSE_FILES = COPYING
>  
>  # Uses PKG_CHECK_MODULES() in configure.ac
>  LIBEVDEV_DEPENDENCIES = host-pkgconf
>  
> -# package source code coming from git, so it doesn't have generated
> -# configure and Makefile.in
> -LIBEVDEV_AUTORECONF = YES
>  LIBEVDEV_INSTALL_STAGING = YES
>  
>  $(eval $(autotools-package))
> -- 
> 2.0.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
