From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 1 Apr 2016 11:42:09 +0300
Subject: [Buildroot] [PATCH 3/3] dropbear: use libtomath & libtomcrypt
In-Reply-To: <1459498030-19700-3-git-send-email-francois.perrad@gadz.org>
References: <1459498030-19700-1-git-send-email-francois.perrad@gadz.org>
 <1459498030-19700-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <20160401084209.GB2406@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francois,

On Fri, Apr 01, 2016 at 10:07:10AM +0200, Francois Perrad wrote:
> +ifeq ($(BR2_PACKAGE_LIBTOMMATH)$(BR2_PACKAGE_LIBTOMCRYPT),yy)
> +DROPBEAR_DEPENDENCIES += libtommath libtomcrypt

Does dropbear code use libtommath directly? If not, listing only libtomcrypt 
should be enough. The check for BR2_PACKAGE_LIBTOMMATH can also be dropped in 
this case.

> +DROPBEAR_CONF_OPTS += --disable-bundled-libtom
> +else
> +DROPBEAR_CONF_OPTS += --enable-bundled-libtom
> +endif
> +
>  ifeq ($(BR2_PACKAGE_DROPBEAR_CLIENT),y)
>  # Build dbclient, and create a convenience symlink named ssh
>  DROPBEAR_PROGRAMS += dbclient

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
