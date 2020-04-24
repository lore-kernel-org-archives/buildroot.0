From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Apr 2020 11:56:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/libtasn1: needs autoreconf
In-Reply-To: <20200424091824.17492-1-fontaine.fabrice@gmail.com>
References: <20200424091824.17492-1-fontaine.fabrice@gmail.com>
Message-ID: <20200424095612.GC5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-04-24 11:18 +0200, Fabrice Fontaine spake thusly:
> Commit 6e1fde98e4deda8506e694c6d3ffba3fbd4d1d0e forgot to set
> LIBTASN1_AUTORECONF
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/383e3cba56894df0e3dd53bfe9cee3f4bb80d412
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

libtasn1 uses pkg-config, so I've added a dependency on host-pkgconf,
and applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libtasn1/libtasn1.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
> index d721e79a6a..e61741043f 100644
> --- a/package/libtasn1/libtasn1.mk
> +++ b/package/libtasn1/libtasn1.mk
> @@ -12,5 +12,7 @@ LIBTASN1_LICENSE_FILES = LICENSE doc/COPYING doc/COPYING.LESSER
>  LIBTASN1_INSTALL_STAGING = YES
>  # 'missing' fallback logic botched so disable it completely
>  LIBTASN1_CONF_ENV = MAKEINFO="true"
> +# We're patching fuzz/Makefile.am
> +LIBTASN1_AUTORECONF = YES
>  
>  $(eval $(autotools-package))
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
