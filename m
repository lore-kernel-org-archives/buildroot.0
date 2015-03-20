From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Mar 2015 00:20:01 +0100
Subject: [Buildroot] [PATCH 3/5] busybox: add option to specify config
 fragments
In-Reply-To: <1424003638-21689-3-git-send-email-bos@je-eigen-domein.nl>
References: <1424003638-21689-1-git-send-email-bos@je-eigen-domein.nl>
 <1424003638-21689-3-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20150320232001.GH3979@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Floris, All,

On 2015-02-15 13:33 +0100, Floris Bos spake thusly:
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  package/busybox/Config.in  | 6 ++++++
>  package/busybox/busybox.mk | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/package/busybox/Config.in b/package/busybox/Config.in
> index f2f2990..5bc6f9d 100644
> --- a/package/busybox/Config.in
> +++ b/package/busybox/Config.in
> @@ -20,6 +20,12 @@ config BR2_PACKAGE_BUSYBOX_CONFIG
>  
>  	  Most people will just use the default BusyBox configuration file.
>  
> +config BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES
> +	string "Additional BusyBox configuration fragment files"
> +	help
> +	  A space-seperated list of configuration fragment files,

separated

Otherwise, OK:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +	  that will be merged to the main BusyBox configuration file.
> +
>  config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	bool "Show packages that are also provided by busybox"
>  	help
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 61f6a16..7d2fb79 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -46,6 +46,7 @@ ifndef BUSYBOX_CONFIG_FILE
>  endif
>  
>  BUSYBOX_KCONFIG_FILE = $(BUSYBOX_CONFIG_FILE)
> +BUSYBOX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES))
>  BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
>  BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)
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
