From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Mar 2014 22:24:00 +0100
Subject: [Buildroot] [PATCH] toolchain: control GNU_TARGET_NAME vendor
 part
In-Reply-To: <884EA965490E3C4D8E66AEF41E98025006C816@ezex10.ezchip.com>
References: <884EA965490E3C4D8E66AEF41E98025006BF23@ezex10.ezchip.com>
 <20140223104658.4088cdc6@skate>
 <884EA965490E3C4D8E66AEF41E98025006C3BB@ezex10.ezchip.com>
 <20140223125102.025dd91a@skate>
 <884EA965490E3C4D8E66AEF41E98025006C816@ezex10.ezchip.com>
Message-ID: <20140303212359.GG3380@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Noam, All,

On 2014-02-23 15:41 +0000, Noam Camus spake thusly:
[--SNIP--]
> Below is the revised patch.
> Is it OK?
> Is it the right way to bring up the corrections?

Please just re-send the patch as you did the first time.
Be sure to annotate it as:
    [PATCH v2] blabla

You can do that with:
    git send-email --annotate [...]

[--SNIP--]
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index cd88889..216f308 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -69,6 +69,18 @@ config BR2_TOOLCHAIN_BUILDROOT_LIBC
>  	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
>  	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
>  
> +config BR2_TOOLCHAIN_BUILDROOT_VENDOR
> +	string "custom toolchain vendor name"
> +	default "buildroot"
> +	help
> +	  This option accepts name for vendor field in toolchain tuple.
> +	  The toolchain tuple full format is:
> +	  cpu-vendor-kernel-os
> +	  You may use it in case of custom toolchain.
> +	  e.g. if your gcc depend on this field to make decisions.
> +	  NOTE: "unknown" is not allowed since it may be confused
> +	  with host toolchain.

I think Thomas said on IRC that he will have a better wording for the
help text. Wait a little bit for his suggestion, before re-sending.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
