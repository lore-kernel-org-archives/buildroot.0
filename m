From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Sat, 25 May 2019 17:35:24 +0300
Subject: [Buildroot] [PATCH] linux: enable UEVENT_HELPER when mdev is
 used
In-Reply-To: <20190525130755.25678-1-peter@korsgaard.com>
References: <20190525130755.25678-1-peter@korsgaard.com>
Message-ID: <20190525143524.GD9224@smile.fi.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 25, 2019 at 03:07:55PM +0200, Peter Korsgaard wrote:
> S10mdev uses /proc/sys/kernel/hotplug, which is only available if
> CONFIG_UEVENT_HELPER is enabled in the kernel, so ensure it is.
> 

Thanks!

> Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  linux/linux.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index dd182d06b2..3a5eee63df 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -333,6 +333,8 @@ define LINUX_KCONFIG_FIXUP_CMDS
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
>  	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV),
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config))
> +	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
> +		$(call KCONFIG_ENABLE_OPT,CONFIG_UEVENT_HELPER,$(@D)/.config))
>  	$(if $(BR2_PACKAGE_AUDIT),
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_NET,$(@D)/.config)
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_AUDIT,$(@D)/.config))
> -- 
> 2.11.0
> 

-- 
With Best Regards,
Andy Shevchenko
