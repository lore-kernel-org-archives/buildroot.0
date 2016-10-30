From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Oct 2016 21:29:22 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/libfribidi: remove optional
 dependency to libglib
In-Reply-To: <20161030172918.29960-1-bernd.kuhls@t-online.de>
References: <20161030172918.29960-1-bernd.kuhls@t-online.de>
Message-ID: <20161030202922.GD18077@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2016-10-30 18:29 +0100, Bernd Kuhls spake thusly:
> Fixes vdr compile error:
> http://autobuild.buildroot.net/results/725/7252decffe29e19051eed0554786651aee216573/
> 
> Instead of fixing fribidi.pc or adding optional CFLAGS to the vdr
> package we remove the optional libglib dependency because it does not
> contain "any thing substantial" as pointed out in an pull request sent
> upstream: https://github.com/behdad/fribidi/pull/14
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v3: instead of patching libfribidi we force glib=no (Thomas)
> v2: added patch 0003 to fix fribidi.pc
> 
>  package/libfribidi/libfribidi.mk | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
> index 4e82a5e..86e722a 100644
> --- a/package/libfribidi/libfribidi.mk
> +++ b/package/libfribidi/libfribidi.mk
> @@ -14,11 +14,9 @@ LIBFRIBIDI_INSTALL_STAGING = YES
>  # Run autoreconf to regenerate ltmain.sh.
>  LIBFRIBIDI_AUTORECONF = YES
>  LIBFRIBIDI_DEPENDENCIES = host-pkgconf
> -
> -ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
> -LIBFRIBIDI_DEPENDENCIES += libglib2
> -else
> -LIBFRIBIDI_CONF_OPTS += --with-glib=no
> -endif
> +# libglib2 dependency causes a build failure, and this optional
> +# dependency is going to be removed usptream, see
> +# https://github.com/behdad/fribidi/pull/14
> +LIBFRIBIDI_CONF_OPTS = --with-glib=no
>  
>  $(eval $(autotools-package))
> -- 
> 2.10.1
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
