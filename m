From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Aug 2016 23:45:21 +0200
Subject: [Buildroot] [PATCH] linknx: deprecate the package
In-Reply-To: <1471554442-4397-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1471554442-4397-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160819214521.GB6096@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-08-18 23:07 +0200, Thomas Petazzoni spake thusly:
> The upstream for this package is dead: the last release is from 2013,
> the project is still using a CVS repository on SourceForge, and the
> build breaks with gcc 6.x. Let's deprecate this package.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I just patched it to drop a musl compatibility patch... Sob... :.-/

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/linknx/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/linknx/Config.in b/package/linknx/Config.in
> index ca55c8b..0da136b 100644
> --- a/package/linknx/Config.in
> +++ b/package/linknx/Config.in
> @@ -6,6 +6,9 @@ config BR2_PACKAGE_LINKNX
>  	       if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_MMU # libpthsem
> +	# upstream is dead (CVS on SourceForge), no release since
> +	# 2013, build breaks with gcc 6.x
> +	depends on BR2_DEPRECATED_SINCE_2016_08
>  	help
>  	  Linknx is an automation platform providing high level functionalities
>  	  to EIB/KNX installation.
> @@ -15,3 +18,4 @@ config BR2_PACKAGE_LINKNX
>  comment "linknx needs a toolchain w/ C++"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_DEPRECATED_SINCE_2016_08
> -- 
> 2.7.4
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
