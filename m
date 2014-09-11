From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 11 Sep 2014 13:29:41 +0200
Subject: [Buildroot] [v2 1/1] ipmitool: new package
In-Reply-To: <1410430154-29353-1-git-send-email-david.bachelart@bbright.com>
References: <1410430154-29353-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <541187A5.3010901@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi David,

> Signed-off-by: David Bachelart <david.bachelart@bbright.com>
> ---
>   package/Config.in            |    1 +
>   package/ipmitool/Config.in   |    9 +++++++++
>   package/ipmitool/ipmiutil.mk |   16 ++++++++++++++++

Should not this be:

package/ipmitool/ipmitool.mk ?

Regards,
Jerzy

>   3 files changed, 26 insertions(+)
>   create mode 100644 package/ipmitool/Config.in
>   create mode 100644 package/ipmitool/ipmiutil.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 883dd66..302a638 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -321,6 +321,7 @@ endif
>   	source "package/input-tools/Config.in"
>   	source "package/intel-microcode/Config.in"
>   	source "package/iostat/Config.in"
> +	source "package/ipmitool/Config.in"
>   	source "package/irda-utils/Config.in"
>   	source "package/iucode-tool/Config.in"
>   	source "package/kbd/Config.in"
> diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
> new file mode 100644
> index 0000000..3afbd35
> --- /dev/null
> +++ b/package/ipmitool/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_IPMITOOL
> +	bool "ipmitool"
> +	depends on BR2_USE_MMU # fork()
> +	help
> +	  IPMItool provides a simple command-line interface to IPMI-enabled devices
> +	  through an IPMIv1.5 or IPMIv2.0 LAN interface or Linux/Solaris kernel
> +	  driver.
> +
> +	  http://ipmitool.sourceforge.net/
> diff --git a/package/ipmitool/ipmiutil.mk b/package/ipmitool/ipmiutil.mk
> new file mode 100644
> index 0000000..212b863
> --- /dev/null
> +++ b/package/ipmitool/ipmiutil.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# ipmitool
> +#
> +################################################################################
> +
> +IPMITOOL_VERSION = 1.8.14
> +IPMITOOL_SITE = http://sourceforge.net/projects/ipmitool/files/ipmitool/$(IPMITOOL_VERSION)
> +IPMITOOL_SOURCE = ipmitool-$(IPMITOOL_VERSION).tar.bz2
> +
> +IPMITOOL_LICENSE = MIT
> +IPMITOOL_LICENSE_FILES = COPYING
> +
> +IPMITOOL_CONF_OPTS = --enable-ipmishell
> +
> +$(eval $(autotools-package))
