From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 18 Dec 2015 22:09:29 +0100
Subject: [Buildroot] [PATCH v2 1/5] package/nodejs: bump version to 5.3.0
In-Reply-To: <1450394426-3349-1-git-send-email-martin@barkynet.com>
References: <1450394426-3349-1-git-send-email-martin@barkynet.com>
Message-ID: <20151218210929.GC27578@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2015-12-17 23:20 +0000, Martin Bark spake thusly:
> Replace 4.2.3 with 5.3.0.  5.3.0 is the current Stable release. See
> https://nodejs.org/en/blog/release/v5.3.0 for details on the release.
> 
> Copied 4.2.3 patched to 5.3.0 with the following exceptions:
>  - Removed 0004-fix-arm-vfpv2.patch, committed upstream and included in
>    5.3.0.  See https://github.com/nodejs/node/commit/84dea1bd0c
>  - Added 0004-Fix-va_list-not-declared.patch, fix for a new bug.  This
>    has already been fixed upstream but is not in 5.3.0
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
[--SNIP--]
> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> index b0f4f2b..769710c 100644
> --- a/package/nodejs/Config.in
> +++ b/package/nodejs/Config.in
> @@ -48,14 +48,16 @@ config BR2_BR2_PACKAGE_NODEJS_0_12_X
>  	bool "v0.12.9"
>  	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
>  
> -config BR2_BR2_PACKAGE_NODEJS_4_X
> -	bool "v4.2.3"
> +config BR2_PACKAGE_NODEJS_5_X
> +	bool "v5.3.0"
>  	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +	depends on BR2_USE_WCHAR
> 
> -comment "v4.2.3 needs a toolchain w/ gcc >= 4.8"
> +comment "v5.3.0 needs a toolchain w/ gcc >= 4.8, wchar"
>  	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +	depends on !BR2_USE_WCHAR

Wrong, this should be:

    depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR

Otherwise OK for me...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
