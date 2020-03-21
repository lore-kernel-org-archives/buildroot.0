From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Mar 2020 17:38:38 +0100
Subject: [Buildroot] [PATCH] package/localedef: add missing dependeny on
 host-gawk
In-Reply-To: <20200317220204.40127-1-romain.naour@gmail.com>
References: <20200317220204.40127-1-romain.naour@gmail.com>
Message-ID: <20200321163838.GC4290@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-03-17 23:02 +0100, Romain Naour spake thusly:
> While reviewing the patch [1], we noticed that host-gawk dependency
> was missing. I may trigger an issue if gawk is missing on the host
> since it's a "critical tool" [2].
> Indeed, localedef package is actually glibc sources that check gawk
> host binary.
> host-gawk is listed in glibc package dependency [3], so add it now.
> 
> [1] af90a104c06542a1bf5545eaf9b9c7beb7176e80
> [2] https://sourceware.org/git/?p=glibc.git;a=blob;f=configure.ac;h=49b900c1ed68fa4dd1dadca809ceb6e8b237a89c;hb=9ea3686266dca3f004ba874745a4087a89682617#l1021
> [3] https://git.buildroot.net/buildroot/tree/package/glibc/glibc.mk?h=2020.02#n38
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/localedef/localedef.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
> index 3e22f68039..1093e106fa 100644
> --- a/package/localedef/localedef.mk
> +++ b/package/localedef/localedef.mk
> @@ -14,7 +14,8 @@ HOST_LOCALEDEF_DL_SUBDIR = glibc
>  
>  HOST_LOCALEDEF_DEPENDENCIES = \
>  	$(BR2_MAKE_HOST_DEPENDENCY) \
> -	host-bison
> +	host-bison \
> +	host-gawk
>  
>  HOST_LOCALEDEF_CONF_ENV += ac_cv_prog_MAKE="$(BR2_MAKE)"
>  
> -- 
> 2.24.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
