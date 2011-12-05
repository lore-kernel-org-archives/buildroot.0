From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 5 Dec 2011 22:40:42 +0100
Subject: [Buildroot] [PATCH 4/4] Allow user to select nptl when using
	0.9.32 with ct-ng
In-Reply-To: <1323108498-2398-5-git-send-email-will_wagner@carallon.com>
References: <1323108498-2398-1-git-send-email-will_wagner@carallon.com>
 <1323108498-2398-5-git-send-email-will_wagner@carallon.com>
Message-ID: <201112052240.42674.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will, All,

On Monday 05 December 2011 19:08:18 Will Wagner wrote:
> Signed-off-by: Will Wagner <will_wagner@carallon.com>
> ---
>  toolchain/toolchain-crosstool-ng/Config.in |    8 +++++++-
>  1 files changed, 7 insertions(+), 1 deletions(-)
> 
> diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
> index 1669b12..5988952 100644
> --- a/toolchain/toolchain-crosstool-ng/Config.in
> +++ b/toolchain/toolchain-crosstool-ng/Config.in
> @@ -58,12 +58,17 @@ choice
>  
>  	config BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_30
>  		bool "uClibc 0.9.30.x"
> +		select BR2_TOOLCHAIN_CTNG_uClibc_NO_NPTL
> 
>  	config BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_32
>  		bool "uClibc 0.9.32.x"
>  
>  endchoice
>  
> +# hidden option to disable nptl with uClibc
> +config BR2_TOOLCHAIN_CTNG_uClibc_NO_NPTL
> +	bool

Aha! Clever! Well done! :-)

> +
>  config BR2_TOOLCHAIN_CTNG_uClibc_CONFIG
>  	string "uClibc configuration file to use?"
>  	default "toolchain/uClibc/uClibc-0.9.30.config" if BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_30
> @@ -154,7 +159,8 @@ choice
>  		bool "Native POSIX Threading (NPTL)"
>  		select BR2_TOOLCHAIN_HAS_THREADS
>  		depends on BR2_TOOLCHAIN_CTNG_eglibc || \
> -			   BR2_TOOLCHAIN_CTNG_glibc
> +		           BR2_TOOLCHAIN_CTNG_glibc || \
> +		           !BR2_TOOLCHAIN_CTNG_uClibc_NO_NPTL
>  endchoice
>  
>  endif # BR2_TOOLCHAIN_CTNG

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
