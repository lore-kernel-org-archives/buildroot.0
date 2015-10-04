From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Oct 2015 12:27:07 +0100
Subject: [Buildroot] [PATCH] toolchain: Remove useless printf
In-Reply-To: <1443957460-26432-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443957460-26432-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20151004112707.GA7334@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2015-10-04 13:17 +0200, Maxime Hadjinlian spake thusly:
> Introduced by previous patch 0f75b2635ee564fbbdb9ea631cf39fa8731d6d6c,
> this printf doesn't serve any purposes.

This is even worth than that. It actually breaks the build because there
is not format to printf:
    printf: usage: printf [-v var] format [arguments]

So the glibc build fails.

With that fixed in the commit log;

    Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>


> Signed-off-by Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

And I think this would also be valid;

Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

;-)

Regards,
Yann E. MORIN.

> ---
>  toolchain/helpers.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index a4fa815..1452ec6 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -79,9 +79,7 @@ copy_toolchain_lib_root = \
>  			fi ; \
>  			LIBPATH="`readlink -f $${LIBPATH}`"; \
>  		done; \
> -	done; \
> -\
> -	printf
> +	done
>  
>  #
>  # Copy the full external toolchain sysroot directory to the staging
> -- 
> 2.5.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
