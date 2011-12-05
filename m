From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 5 Dec 2011 22:38:50 +0100
Subject: [Buildroot] [PATCH 3/4] Allow user to specify a custom uClibc
	config file when using ct-ng
In-Reply-To: <1323108498-2398-4-git-send-email-will_wagner@carallon.com>
References: <1323108498-2398-1-git-send-email-will_wagner@carallon.com>
 <1323108498-2398-4-git-send-email-will_wagner@carallon.com>
Message-ID: <201112052238.50842.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will, All,

On Monday 05 December 2011 19:08:17 Will Wagner wrote:
> Signed-off-by: Will Wagner <will_wagner@carallon.com>
> ---
>  toolchain/toolchain-crosstool-ng/Config.in |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
> index bc14d75..1669b12 100644
> --- a/toolchain/toolchain-crosstool-ng/Config.in
> +++ b/toolchain/toolchain-crosstool-ng/Config.in
> @@ -65,8 +65,14 @@ choice
>  endchoice
>  
>  config BR2_TOOLCHAIN_CTNG_uClibc_CONFIG
> +	string "uClibc configuration file to use?"
>  	default "toolchain/uClibc/uClibc-0.9.30.config" if BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_30
>  	default "toolchain/uClibc/uClibc-0.9.32.config" if BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_32
> +	help
> +	  Some people may wish to use their own modified uClibc configuration
> +	  file and will specify their config file location with this option.
> +	  See also docs/README in this package.

That last sentence should not be there. It is misleading in this context.

> +	  If unsure, use the default.
>  
>  config BR2_TOOLCHAIN_CTNG_uClibc_LARGEFILE
>  	bool "Enable large file (files > 2 GB) support"

After removing the incriminated line above, you can add my:
    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
