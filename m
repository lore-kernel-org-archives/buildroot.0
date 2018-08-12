From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Aug 2018 11:33:45 +0200
Subject: [Buildroot] [PATCH] bzip2: change upstream site
In-Reply-To: <7f5f3c1bfdc21cad97c41dfba00c53f935ef6a73.1533875056.git.baruch@tkos.co.il>
References: <7f5f3c1bfdc21cad97c41dfba00c53f935ef6a73.1533875056.git.baruch@tkos.co.il>
Message-ID: <20180812093345.GE2402@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2018-08-10 07:24 +0300, Baruch Siach spake thusly:
> The bzip.org website is down. Use the Buildroot backup download site.
> Change the website link to a gitlab repo that mirrors the content of the
> tarball.
> 
>   https://lwn.net/Articles/762264/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/bzip2/Config.in | 2 +-
>  package/bzip2/bzip2.mk  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/bzip2/Config.in b/package/bzip2/Config.in
> index dbc82496df7e..89e4d5de9a03 100644
> --- a/package/bzip2/Config.in
> +++ b/package/bzip2/Config.in
> @@ -6,4 +6,4 @@ config BR2_PACKAGE_BZIP2
>  	  available techniques, while being around twice as fast at
>  	  compression and six times faster at decompression.
>  
> -	  http://www.bzip.org
> +	  https://gitlab.com/bzip/bzip2

Not sure this is the best upstream location. The LWN thread also has
this comment https://lwn.net/Articles/762340/ which points to this
webpage https://sourceware.org/bzip2 which has a canonical locations
pointing to https://www.sourceware.org/bzip2/

So, I am not sure which is better: an out-dated (but soon to be revived)
webpage, or a git tree made by a random guy on a random forge (there are
also github trees as well, and no doubt we can also find more random git
trees elesewhere).

Regards,
Yann E. MORIN.

> diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
> index e43533072b2d..a3af32299370 100644
> --- a/package/bzip2/bzip2.mk
> +++ b/package/bzip2/bzip2.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  BZIP2_VERSION = 1.0.6
> -BZIP2_SITE = http://www.bzip.org/$(BZIP2_VERSION)
> +BZIP2_SITE = http://sources.buildroot.net
>  BZIP2_INSTALL_STAGING = YES
>  BZIP2_LICENSE = bzip2 license
>  BZIP2_LICENSE_FILES = LICENSE
> -- 
> 2.18.0
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
