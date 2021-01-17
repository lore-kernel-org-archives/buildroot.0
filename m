From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 12:24:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/neofetch: new package
In-Reply-To: <20210115193539.471638-1-christian@paral.in>
References: <20210115193539.471638-1-christian@paral.in>
Message-ID: <20210117112412.GD2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2021-01-15 11:35 -0800, Christian Stewart spake thusly:
> Signed-off-by: Christian Stewart <christian@paral.in>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/Config.in              |  1 +
>  package/neofetch/Config.in     | 10 ++++++++++
>  package/neofetch/neofetch.hash |  2 ++
>  package/neofetch/neofetch.mk   | 17 +++++++++++++++++
>  4 files changed, 30 insertions(+)
>  create mode 100644 package/neofetch/Config.in
>  create mode 100644 package/neofetch/neofetch.hash
>  create mode 100644 package/neofetch/neofetch.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 81ad4979a1..54b917b736 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2379,6 +2379,7 @@ comment "Utilities"
>  	source "package/lockfile-progs/Config.in"
>  	source "package/logrotate/Config.in"
>  	source "package/logsurfer/Config.in"
> +	source "package/neofetch/Config.in"
>  	source "package/pdmenu/Config.in"
>  	source "package/pinentry/Config.in"
>  	source "package/qprint/Config.in"
> diff --git a/package/neofetch/Config.in b/package/neofetch/Config.in
> new file mode 100644
> index 0000000000..409466bc15
> --- /dev/null
> +++ b/package/neofetch/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_NEOFETCH
> +	bool "neofetch"
> +	depends on BR2_USE_MMU # bash
> +	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
> +	select BR2_PACKAGE_BASH # runtime dependency
> +	help
> +	  Neofetch is a bash script to display system information,
> +	  including hardware, in a visually pleasing way.
> +
> +	  https://github.com/dylanaraps/neofetch
> diff --git a/package/neofetch/neofetch.hash b/package/neofetch/neofetch.hash
> new file mode 100644
> index 0000000000..0927715143
> --- /dev/null
> +++ b/package/neofetch/neofetch.hash
> @@ -0,0 +1,2 @@
> +sha256  58a95e6b714e41efc804eca389a223309169b2def35e57fa934482a6b47c27e7  neofetch-7.1.0.tar.gz
> +sha256  fc3034b3dd3a08db109949b629210213bba52aa95455cbc5c2fefa2fc1183efe  LICENSE.md
> diff --git a/package/neofetch/neofetch.mk b/package/neofetch/neofetch.mk
> new file mode 100644
> index 0000000000..4ea6c27b2d
> --- /dev/null
> +++ b/package/neofetch/neofetch.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# neofetch
> +#
> +################################################################################
> +
> +NEOFETCH_VERSION = 7.1.0
> +NEOFETCH_SITE = $(call github,dylanaraps,neofetch,$(NEOFETCH_VERSION))
> +NEOFETCH_LICENSE = MIT
> +NEOFETCH_LICENSE_FILES = LICENSE.md
> +
> +define NEOFETCH_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/neofetch \
> +		$(TARGET_DIR)/usr/bin/neofetch
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.30.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
