From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Mar 2015 00:23:20 +0100
Subject: [Buildroot] [PATCH 5/5] barebox: add option to specify config
 fragments
In-Reply-To: <1424003638-21689-5-git-send-email-bos@je-eigen-domein.nl>
References: <1424003638-21689-1-git-send-email-bos@je-eigen-domein.nl>
 <1424003638-21689-5-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20150320232320.GJ3979@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Floris, All,

On 2015-02-15 13:33 +0100, Floris Bos spake thusly:
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  boot/barebox/Config.in  | 6 ++++++
>  boot/barebox/barebox.mk | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
> index 48431bd..64e3196 100644
> --- a/boot/barebox/Config.in
> +++ b/boot/barebox/Config.in
> @@ -91,6 +91,12 @@ config BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE
>  	help
>  	  Path to the barebox configuration file
>  
> +config BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES
> +	string "Additional configuration fragment files"
> +	help
> +	  A space-seperated list of configuration fragment files,

separated   (lotta copy-paste, eh?)

Otherwise, OK:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +	  that will be merged to the main Barebox configuration file.
> +
>  config BR2_TARGET_BAREBOX_BAREBOXENV
>  	bool "bareboxenv tool in target"
>  	help
> diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
> index b829ae7..41f487b 100644
> --- a/boot/barebox/barebox.mk
> +++ b/boot/barebox/barebox.mk
> @@ -59,6 +59,7 @@ BAREBOX_SOURCE_CONFIG = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE))
>  endif
>  
>  BAREBOX_KCONFIG_FILE = $(BAREBOX_SOURCE_CONFIG)
> +BAREBOX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES))
>  BAREBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
>  BAREBOX_KCONFIG_OPTS = $(BAREBOX_MAKE_FLAGS)
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
