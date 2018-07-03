From: Carlos Santos <casantos@datacom.com.br>
Date: Tue, 3 Jul 2018 08:13:49 -0300 (BRT)
Subject: [Buildroot] [PATCH 11/50] package/busybox: invert dependency
 with sysvinit
In-Reply-To: <da0c668f7707c0d68a57dc73d0be09bdbca6ee16.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
 <da0c668f7707c0d68a57dc73d0be09bdbca6ee16.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <1073599069.1181410.1530616429174.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Yann Morin" <yann.morin.1998@free.fr>
> To: "buildroot" <buildroot@buildroot.org>
> Cc: "Yann Morin" <yann.morin.1998@free.fr>
> Sent: Monday, July 2, 2018 6:11:45 PM
> Subject: [Buildroot] [PATCH 11/50] package/busybox: invert dependency with sysvinit

> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
> package/busybox/busybox.mk   | 1 +
> package/sysvinit/sysvinit.mk | 5 -----
> 2 files changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 76a195d1f5..2e80c5fa14 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
> 
> # Packages that provide commands that may also be busybox applets:
> BUSYBOX_DEPENDENCIES = \
> +	$(if $(BR2_PACKAGE_SYSVINIT),sysvinit) \
> 	$(if $(BR2_PACKAGE_TAR),tar) \
> 	$(if $(BR2_PACKAGE_TFTPD),tftpd) \
> 	$(if $(BR2_PACKAGE_TRACEROUTE),traceroute) \
> diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
> index a606ddabf0..993e399e73 100644
> --- a/package/sysvinit/sysvinit.mk
> +++ b/package/sysvinit/sysvinit.mk
> @@ -13,11 +13,6 @@ SYSVINIT_LICENSE_FILES = COPYING
> 
> SYSVINIT_MAKE_OPTS = SYSROOT=$(STAGING_DIR)
> 
> -# Override BusyBox implementations if BusyBox is enabled.
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -SYSVINIT_DEPENDENCIES = busybox
> -endif
> -
> ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> SYSVINIT_DEPENDENCIES += libselinux
> SYSVINIT_MAKE_OPTS += WITH_SELINUX="yes"
> --
> 2.14.1

Reviewed-by: Carlos Santos <casantos@datacom.com.br>

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
