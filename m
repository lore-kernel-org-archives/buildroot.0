From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 Apr 2021 23:04:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/yavta: bump to latest version
In-Reply-To: <20210415112056.27521-1-tolvupostur@gmail.com>
References: <20210415112056.27521-1-tolvupostur@gmail.com>
Message-ID: <20210415210401.GH359705@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Einar, All,

On 2021-04-15 13:20 +0200, Einar Jon Gunnarsson spake thusly:
> Add hash file
> Convert to meson build
> Use https instead of http
> 
> Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>

I also switched the repo to use https, and applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/yavta/Config.in  |  2 +-
>  package/yavta/yavta.hash |  3 +++
>  package/yavta/yavta.mk   | 13 +++----------
>  3 files changed, 7 insertions(+), 11 deletions(-)
>  create mode 100644 package/yavta/yavta.hash
> 
> diff --git a/package/yavta/Config.in b/package/yavta/Config.in
> index 6a42a944d6..8119133c33 100644
> --- a/package/yavta/Config.in
> +++ b/package/yavta/Config.in
> @@ -3,4 +3,4 @@ config BR2_PACKAGE_YAVTA
>  	help
>  	  Yet Another V4L2 Test Application
>  
> -	  http://git.ideasonboard.org/yavta.git
> +	  https://git.ideasonboard.org/yavta.git
> diff --git a/package/yavta/yavta.hash b/package/yavta/yavta.hash
> new file mode 100644
> index 0000000000..aa74284d89
> --- /dev/null
> +++ b/package/yavta/yavta.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  108a0ceec862b56a3fbcb3ad28a8744d9800555ccb3e11bdd94c8cd4614296d5  yavta-583bedefc2a247d2cfd32d1b4a0abbe3e2015c70-br1.tar.gz
> +sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.GPL
> diff --git a/package/yavta/yavta.mk b/package/yavta/yavta.mk
> index 4e3d76e3de..073ec2510c 100644
> --- a/package/yavta/yavta.mk
> +++ b/package/yavta/yavta.mk
> @@ -4,17 +4,10 @@
>  #
>  ################################################################################
>  
> -YAVTA_VERSION = 82ff2efdb9787737b9f21b6f4759f077c827b238
> +YAVTA_VERSION = 583bedefc2a247d2cfd32d1b4a0abbe3e2015c70
>  YAVTA_SITE = git://git.ideasonboard.org/yavta.git
> +YAVTA_SITE_METHOD = git
>  YAVTA_LICENSE = GPL-2.0+
>  YAVTA_LICENSE_FILES = COPYING.GPL
>  
> -define YAVTA_BUILD_CMDS
> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> -endef
> -
> -define YAVTA_INSTALL_TARGET_CMDS
> -	$(INSTALL) -m 0755 -D $(@D)/yavta $(TARGET_DIR)/usr/bin/yavta
> -endef
> -
> -$(eval $(generic-package))
> +$(eval $(meson-package))
> -- 
> 2.17.1
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
