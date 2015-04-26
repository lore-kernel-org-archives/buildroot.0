From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 26 Apr 2015 21:08:52 +0300
Subject: [Buildroot] [PATCH 1/1] package/libical: bump version to v1.0.1
In-Reply-To: <1430059941-3692-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430059941-3692-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150426180852.GM2258@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Sun, Apr 26, 2015 at 04:52:21PM +0200, Bernd Kuhls wrote:
> Project moved to github according to http://sourceforge.net/projects/freeassociation
> 
> "As of 2014-06-14, this project may now be found at http://github.com/libical."
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>  
> -comment "libical needs a toolchain w/ wchar"
> +comment "libical needs a toolchain w/ dynamic library, wchar"
>  	depends on !BR2_USE_WCHAR
> +	depends on BR2_STATIC_LIBS

Should be:

	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS

> -$(eval $(autotools-package))
> +# building without this option is broken, it is used by
> +# Gentoo/alpinelinux as well
> +LIBICAL_CONF_OPTS = -DSHARED_ONLY=true
> +
> +$(eval $(cmake-package))

Please add a note on this in the commit log.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
