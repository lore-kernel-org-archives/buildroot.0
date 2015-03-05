From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Mar 2015 19:30:04 +0100
Subject: [Buildroot] [PATCH] linux: clarify kernel configuration entries
In-Reply-To: <1425578112-7407-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1425578112-7407-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <20150305183004.GC3944@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vivien, Thomas, All,

On 2015-03-05 12:55 -0500, Vivien Didelot spake thusly:
> Since BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE can either be a complete
> .config file or a defconfig file, it can be confusing to the user
> whether to choose BR2_LINUX_KERNEL_USE_DEFCONFIG or
> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG.
> 
> To avoid that confusion, clarify Kconfig entry messages for in-tree
> defconfig and custom (def)config files.
> 
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  linux/Config.in | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 95c847b..36d7691 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -140,10 +140,10 @@ choice
>  	default BR2_LINUX_KERNEL_USE_DEFCONFIG
>  
>  config BR2_LINUX_KERNEL_USE_DEFCONFIG
> -	bool "Using a defconfig"
> +	bool "Using an in-tree defconfig file"
>  
>  config BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG
> -	bool "Using a custom config file"
> +	bool "Using a custom (def)config file"
>  
>  endchoice
>  
> @@ -161,6 +161,9 @@ config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
>  	help
>  	  Path to the kernel configuration file
>  
> +	  Note: this can be a defconfig file or a complete .config file,
> +	  which can later be saved back with make linux-update-(def)config.
> +
>  #
>  # Binary format
>  #
> -- 
> 2.3.1
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
