From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Mar 2021 23:13:54 +0100
Subject: [Buildroot] [PATCH] toolchain: disable gcc bug 68485 if gcc
 version >= 10.x
In-Reply-To: <20210305153730.3671327-1-giulio.benetti@benettiengineering.com>
References: <20210305153730.3671327-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210306221354.GS2275@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio, All,

On 2021-03-05 16:37 +0100, Giulio Benetti spake thusly:
> Since gcc version 10.x bug 68485 doesn't show anymore, so let's make it
> enabled up to versino 10.x excluded.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  toolchain/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 553612c4aa..0cd8b82059 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -131,11 +131,12 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
>  	default y if !BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS && \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
>  
> -# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. This bug still
> -# exists in gcc 9.x
> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. This bug no
> +# longer exists in gcc 10.x

I don;t understand, because you said exactly the opposite ion that bug
tracker:
    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485#c9

    bug still exists on gcc 10.2, is there any news about it?

So what? ;-)

Regards,
Yann E. MORIN.

>  config BR2_TOOLCHAIN_HAS_GCC_BUG_68485
>  	bool
>  	default y if BR2_microblaze
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  
>  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. This bug no
>  # longer exists in gcc 8.x.
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
