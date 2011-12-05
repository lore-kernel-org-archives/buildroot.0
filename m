From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 5 Dec 2011 22:24:11 +0100
Subject: [Buildroot] [PATCH 1/4] Allow user to pick uClibc version when
	using ct-ng
In-Reply-To: <1323108498-2398-2-git-send-email-will_wagner@carallon.com>
References: <1323108498-2398-1-git-send-email-will_wagner@carallon.com>
 <1323108498-2398-2-git-send-email-will_wagner@carallon.com>
Message-ID: <201112052224.11404.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will, All,

On Monday 05 December 2011 19:08:15 Will Wagner wrote:
[--SNIP--]
> diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
> index 3a205dd..192c6ff 100644
> --- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
> +++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
> @@ -267,6 +267,13 @@ CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_SYSROOT_DIR_PREFIX)=.*:\1="":;
>  # uClibc specific options
>  ifeq ($(BR2_TOOLCHAIN_CTNG_uClibc),y)
>  
> +# Set version
> +ifeq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_32)),y)
> +CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_V)(.+)=y$$:\# \1\2 is not set\n\1_0_9_32=y:;
-------------------------------------------------^^

You missed the trailing underscore. Without it, the folowing option
would also match: CT_LIBC_UCLIBC_VERBOSITY_0 (and _1 and _2, too).

Yes, I also forgot it in my answer to your initial mail, but I just
wrote that regexp directly in the mail, and said:
    "untested, may need some tweaking"

;-)

> +else ifeq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_30)),y)
> +CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_V)(.+)=y$$:\# \1\2 is not set\n\1_0_9_30_3=y:;
-------------------------------------------------^^
Ditto.

You can resping an ammended patch with my:
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
