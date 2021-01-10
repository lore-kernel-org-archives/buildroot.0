From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jan 2021 22:28:49 +0100
Subject: [Buildroot] [PATCH-2020.11.x] package/glibc: security bump for
 additional post-2.31.x fixes
In-Reply-To: <20210110211825.7966-1-peter@korsgaard.com>
References: <20210110211825.7966-1-peter@korsgaard.com>
Message-ID: <20210110212849.GV3044608@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-01-10 22:18 +0100, Peter Korsgaard spake thusly:
> Fixes the following security issues:
> 
> CVE-2020-27618: An infinite loop has been fixed in the iconv program when
> invoked with input containing redundant shift sequences in the IBM1364,
> IBM1371, IBM1388, IBM1390, or IBM1399 character sets.
> 
> CVE-2020-29562: An assertion failure has been fixed in the iconv function
> when invoked with UCS4 input containing an invalid character.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  .../glibc.hash                                                  | 2 +-
>  package/glibc/glibc.mk                                          | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename package/glibc/{2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d => 2.31-70-gc4f5e32aae3094491641025a42fe2d55222c8f16}/glibc.hash (70%)
> 
> diff --git a/package/glibc/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/glibc.hash b/package/glibc/2.31-70-gc4f5e32aae3094491641025a42fe2d55222c8f16/glibc.hash
> similarity index 70%
> rename from package/glibc/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/glibc.hash
> rename to package/glibc/2.31-70-gc4f5e32aae3094491641025a42fe2d55222c8f16/glibc.hash
> index a1b2ae12fd..e7aaeab07c 100644
> --- a/package/glibc/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/glibc.hash
> +++ b/package/glibc/2.31-70-gc4f5e32aae3094491641025a42fe2d55222c8f16/glibc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from Github)
> -sha256  e1f2c9b424a4e0c00e7ad123a4204f7bc8afd3c504aeb8c79b1086509fd67176  glibc-2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d.tar.gz
> +sha256  9897155423ea50bfa255b0130d13608b7d11129e79848a52cf82670bb206439a  glibc-2.31-70-gc4f5e32aae3094491641025a42fe2d55222c8f16.tar.gz
>  
>  # Hashes for license files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 4721177d83..f4bba24ca0 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -20,7 +20,7 @@ else ifeq ($(BR2_RISCV_32),y)
>  # Until 2.33 is released, just use master
>  GLIBC_VERSION = 2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99
>  else
> -GLIBC_VERSION = 2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d
> +GLIBC_VERSION = 2.31-70-gc4f5e32aae3094491641025a42fe2d55222c8f16
>  endif
>  # Upstream doesn't officially provide an https download link.
>  # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
> -- 
> 2.20.1
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
