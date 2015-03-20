From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Mar 2015 00:22:06 +0100
Subject: [Buildroot] [PATCH 4/5] uclibc: add option to specify config
 fragments
In-Reply-To: <1424003638-21689-4-git-send-email-bos@je-eigen-domein.nl>
References: <1424003638-21689-1-git-send-email-bos@je-eigen-domein.nl>
 <1424003638-21689-4-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20150320232206.GI3979@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Floris, All,

On 2015-02-15 13:33 +0100, Floris Bos spake thusly:
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  package/uclibc/Config.in | 6 ++++++
>  package/uclibc/uclibc.mk | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index aa99a6f..1be9195 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -53,6 +53,12 @@ config BR2_UCLIBC_CONFIG
>  	  See also docs/README in this package.
>  	  If unsure, use the default.
>  
> +config BR2_UCLIBC_CONFIG_FRAGMENT_FILES
> +	string "Additional uClibc configuration fragment files"
> +	help
> +	  A space-seperated list of configuration fragment files,

separated     Well... you know the tune, now. ;-)

Otherwise, OK:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +	  that will be merged to the main uClibc configuration file.
> +
>  config BR2_TOOLCHAIN_BUILDROOT_LARGEFILE
>  	bool "Enable large file (files > 2 GB) support"
>  	select BR2_LARGEFILE
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index 40e6c6c..9d73b39 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -38,6 +38,7 @@ UCLIBC_CONFIG_FILE = $(call qstrip,$(BR2_UCLIBC_CONFIG))
>  endif
>  
>  UCLIBC_KCONFIG_FILE = $(UCLIBC_CONFIG_FILE)
> +UCLIBC_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_UCLIBC_CONFIG_FRAGMENT_FILES))
>  
>  UCLIBC_KCONFIG_OPTS = \
>  	$(UCLIBC_MAKE_FLAGS) \
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
