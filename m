From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 27 May 2015 22:55:59 +0300
Subject: [Buildroot] [PATCH] gdbm: handle optional dependency gettext
In-Reply-To: <1432755579-10890-1-git-send-email-francois.perrad@gadz.org>
References: <1432755579-10890-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20150527195559.GZ2260@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francois,

On Wed, May 27, 2015 at 09:39:39PM +0200, Francois Perrad wrote:
> gdbm itself is an optional dependency of perl

Is this a fix for
http://autobuild.buildroot.net/results/940/9404e004ac24c5f3eedc8e7bc8afadd35983de70/

?

baruch

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/gdbm/gdbm.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
> index 12e1dac..f7a4370 100644
> --- a/package/gdbm/gdbm.mk
> +++ b/package/gdbm/gdbm.mk
> @@ -10,4 +10,8 @@ GDBM_LICENSE = GPLv3+
>  GDBM_LICENSE_FILES = COPYING
>  GDBM_INSTALL_STAGING = YES
>  
> +ifeq ($(BR2_PACKAGE_GETTEXT),y)
> +GDBM_DEPENDENCIES += gettext
> +endif
> +
>  $(eval $(autotools-package))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
