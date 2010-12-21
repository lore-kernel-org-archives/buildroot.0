From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Tue, 21 Dec 2010 18:07:59 +0800
Subject: [Buildroot] [PATCH] New package: bwm-ng
In-Reply-To: <1292921723-3372-1-git-send-email-keguang.zhang@gmail.com>
References: <1292921723-3372-1-git-send-email-keguang.zhang@gmail.com>
Message-ID: <AANLkTinAe00qo8PuVJW4qCZbbRAz7GaDP0KuAf5TWuWb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Please review this patch.
Thanks!

2010/12/21 <keguang.zhang@gmail.com>

> From: Kelvin Cheung <keguang.zhang@gmail.com>
>
> Add new package: bwm-ng
>
> Bandwidth Monitor NG is a small and console-based live network and
> disk-io bandwidth monitor for Linux, BSD, Solaris, Mac OS X and others.
>
> Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
> ---
>  package/Config.in        |    1 +
>  package/bwm-ng/Config.in |    7 +++++++
>  package/bwm-ng/bwm-ng.mk |   16 ++++++++++++++++
>  3 files changed, 24 insertions(+), 0 deletions(-)
>  create mode 100644 package/bwm-ng/Config.in
>  create mode 100644 package/bwm-ng/bwm-ng.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index d3ae75e..2648062 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -148,6 +148,7 @@ endmenu
>
>  menu "Hardware handling"
>  source "package/acpid/Config.in"
> +source "package/bwm-ng/Config.in"
>  source "package/cdrkit/Config.in"
>  source "package/cramfs/Config.in"
>  source "package/dbus/Config.in"
> diff --git a/package/bwm-ng/Config.in b/package/bwm-ng/Config.in
> new file mode 100644
> index 0000000..f2f8b12
> --- /dev/null
> +++ b/package/bwm-ng/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_BWM_NG
> +       bool "bwm-ng"
> +       help
> +         Bandwidth Monitor NG is a small and console-based live network
> and
> +         disk-io bandwidth monitor for Linux, BSD, Solaris, Mac OS X and
> others.
> +
> +         http://sourceforge.net/projects/bwmng/
> diff --git a/package/bwm-ng/bwm-ng.mk b/package/bwm-ng/bwm-ng.mk
> new file mode 100644
> index 0000000..7fd5b38
> --- /dev/null
> +++ b/package/bwm-ng/bwm-ng.mk
> @@ -0,0 +1,16 @@
> +#############################################################
> +#
> +# bwm-ng
> +#
> +#############################################################
> +BWM_NG_VERSION:=0.6
> +BWM_NG:=bwm-ng-$(BWM_NG_VERSION).tar.gz
> +BWM_NG_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).
> dl.sourceforge.net/project/bwmng/bwmng/0.6/
> +BWM_NG_CONF_OPT = --with-procnetdev --with-diskstats
> +
> +ifeq ($(BR2_PACKAGE_NCURSES),y)
> +BWM_NG_CONF_OPT += --with-ncurses
> +BWM_NG_DEPENDENCIES += ncurses
> +endif
> +
> +$(eval $(call AUTOTARGETS,package,bwm-ng))
> --
> 1.7.1
>
>


-- 
Best Regards!
Kelvin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101221/aa1bbad1/attachment.html>
