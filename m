From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 16 Jan 2014 14:24:41 +0100
Subject: [Buildroot] [RFC,
 PATCH 7/8] package/iprutils: Add IBM Power RAID utilities
In-Reply-To: <1389862338.919734.499084473099.7.gpush@pablo>
References: <1389862338.919734.499084473099.7.gpush@pablo>
Message-ID: <52D7DD99.2020805@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Jeremy,

> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
>
> ---
>   package/Config.in                                |    1
>   package/iprutils/Config.in                       |   10 +++++
>   package/iprutils/iprutils-dont-use-gettext.patch |   30 +++++++++++++++

iprutils-01-dont-use-gettext.patch


>   package/iprutils/iprutils.mk                     |   27 +++++++++++++
>   4 files changed, 68 insertions(+)

[...]

> diff --git a/package/iprutils/iprutils.mk b/package/iprutils/iprutils.mk
> new file mode 100644
> index 00000000..0aa94f38
> --- /dev/null
> +++ b/package/iprutils/iprutils.mk
> @@ -0,0 +1,27 @@
> +#############################################################

80 of # signs

> +#
> +# iprutils
> +#
> +#############################################################

ditto

> +
> +IPRUTILS_VERSION = 2.3.15
> +IPRUTILS_SITE = http://downloads.sourceforge.net/project/iprdd/iprutils%20for%202.6%20kernels/$(IPRUTILS_VERSION)
> +IPRUTILS_SOURCE=iprutils-$(IPRUTILS_VERSION)-src.tgz

IPRUTILS_SOURCE = iprutils-$(IPRUTILS_VERSION)-src.tgz


Regards,
Jerzy

> +IPRUTILS_DEPENDENCIES = ncurses libsysfs pciutils
> +IPRUTILS_LICENSE = Common Public License Version 1.0
> +IPRUTILS_LICENSE_FILES = LICENSE
> +
> +define IPRUTILS_BUILD_CMDS
> +	$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D) all
> +endef
> +
> +define IPRUTILS_INSTALL_TARGET_CMDS
> +        $(INSTALL) -d $(TARGET_DIR)/sbin
> +        $(INSTALL) -D --mode=755 $(@D)/iprconfig $(TARGET_DIR)/sbin/
> +        $(INSTALL) -D --mode=755 $(@D)/iprupdate $(TARGET_DIR)/sbin/
> +        $(INSTALL) -D --mode=755 $(@D)/iprdump $(TARGET_DIR)/sbin/
> +        $(INSTALL) -D --mode=755 $(@D)/iprinit $(TARGET_DIR)/sbin/
> +        $(INSTALL) -D --mode=700 $(@D)/iprdbg $(TARGET_DIR)/sbin/
> +endef
> +
> +$(eval $(generic-package))
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
