From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Mar 2015 00:15:24 +0100
Subject: [Buildroot] [PATCH 2/5] linux: add option to specify config
 fragments
In-Reply-To: <1424003638-21689-2-git-send-email-bos@je-eigen-domein.nl>
References: <1424003638-21689-1-git-send-email-bos@je-eigen-domein.nl>
 <1424003638-21689-2-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20150320231524.GG3979@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Floris, All,

On 2015-02-15 13:33 +0100, Floris Bos spake thusly:
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  linux/Config.in | 6 ++++++
>  linux/linux.mk  | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 95c847b..15dc3b4 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -161,6 +161,12 @@ config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
>  	help
>  	  Path to the kernel configuration file
>  
> +config BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES
> +	string "Additional configuration fragment files"
> +	help
> +	  A space-seperated list of kernel configuration fragment files,

separated

Otherwise, OK:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +	  that will be merged to the main kernel configuration file.
> +
>  #
>  # Binary format
>  #
> diff --git a/linux/linux.mk b/linux/linux.mk
> index fc90fc5..f564530 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -175,6 +175,7 @@ KERNEL_SOURCE_CONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
>  endif
>  
>  LINUX_KCONFIG_FILE = $(KERNEL_SOURCE_CONFIG)
> +LINUX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES))
>  LINUX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
>  LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS)
>  
> -- 
> 1.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
