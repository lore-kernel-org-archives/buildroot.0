From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Aug 2016 13:56:26 +0200
Subject: [Buildroot] [PATCH 1/2] core/pkg-autotools: don't use
 APPLY_PATCHES for libtool patches
In-Reply-To: <1471259370-2914-1-git-send-email-romain.naour@gmail.com>
References: <1471259370-2914-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160815115626.GC5822@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-08-15 13:09 +0200, Romain Naour spake thusly:
> Since 19241598147e7555dce40b6dd44b28ef22b67ed9 <package>-reconfigure
> target is broken.
[--SNIP--]
> So for 2016.08 use patch directly rather than apply-patches.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2016-August/169810.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-autotools.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index 75e2df0..d1cdb89 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -65,14 +65,14 @@ define LIBTOOL_PATCH_HOOK
>  		ltmain_patchlevel=`sed -n '/^[ \t]*VERSION=/{s/^[ \t]*VERSION=//;p;q;}' $$i | \
>  		sed -e 's/\([0-9]*\.[0-9]*\.*\)\([0-9]*\).*/\2/' -e 's/\"//'`; \
>  		if test $${ltmain_version} = '1.5'; then \
> -			$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
> +			patch -i support/libtool/buildroot-libtool-v1.5.patch $${i}; \
>  		elif test $${ltmain_version} = "2.2"; then\
> -			$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
> +			patch -i support/libtool/buildroot-libtool-v2.2.patch $${i}; \
>  		elif test $${ltmain_version} = "2.4"; then\
>  			if test $${ltmain_patchlevel:-0} -gt 2; then\
> -				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.4.4.patch; \
> +				patch -i support/libtool/buildroot-libtool-v2.4.4.patch $${i}; \
>  			else \
> -				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
> +				patch -i support/libtool/buildroot-libtool-v2.4.patch $${i}; \
>  			fi \
>  		fi \
>  	done
> -- 
> 2.5.5
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
