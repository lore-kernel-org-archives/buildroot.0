From: Carlos Santos <casantos@datacom.com.br>
Date: Tue, 3 Jul 2018 08:12:05 -0300 (BRT)
Subject: [Buildroot] [PATCH 05/50] package/busybox: invert dependency
 with util-linux
In-Reply-To: <f912f91cbc5add301f9e2f0b516951eab7e86f76.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
 <f912f91cbc5add301f9e2f0b516951eab7e86f76.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <1621730672.1181164.1530616325917.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Yann Morin" <yann.morin.1998@free.fr>
> To: "buildroot" <buildroot@buildroot.org>
> Cc: "Yann Morin" <yann.morin.1998@free.fr>
> Sent: Monday, July 2, 2018 6:11:39 PM
> Subject: [Buildroot] [PATCH 05/50] package/busybox: invert dependency with util-linux

> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
> package/busybox/busybox.mk       | 1 +
> package/util-linux/util-linux.mk | 6 ------
> 2 files changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index eb3c848bac..5d212e66e4 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
> 
> # Packages that provide commands that may also be busybox applets:
> BUSYBOX_DEPENDENCIES = \
> +	$(if $(BR2_PACKAGE_UTIL_LINUX),util-linux) \
> 	$(if $(BR2_PACKAGE_VIM),vim) \
> 	$(if $(BR2_PACKAGE_WGET),wget) \
> 	$(if $(BR2_PACKAGE_WHOIS),whois)
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 80a8a08051..76f4b97f5f 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -31,12 +31,6 @@ HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
> # We also don't want the host-python dependency
> HOST_UTIL_LINUX_CONF_OPTS = --without-python
> 
> -# If both util-linux and busybox are selected, make certain util-linux
> -# wins the fight over who gets to have their utils actually installed
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -UTIL_LINUX_DEPENDENCIES += busybox
> -endif
> -
> # Prevent the installation from attempting to move shared libraries from
> # ${usrlib_execdir} (/usr/lib) to ${libdir} (/lib), since both paths are
> # the same when merged usr is in use.
> --
> 2.14.1

Reviewed-by: Carlos Santos <casantos@datacom.com.br>

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
