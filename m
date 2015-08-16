From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 16 Aug 2015 16:43:25 +0300
Subject: [Buildroot] [PATCH] [autobuild] package/oprofile: fix static
 linking
In-Reply-To: <1439732249-14832-1-git-send-email-yann.morin.1998@free.fr>
References: <1439732249-14832-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150816134325.GF7325@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Aug 16, 2015 at 03:37:29PM +0200, Yann E. MORIN wrote:
> +# popt links with -lintl and specifies it in its popt.pc, and has done
> +# so for the past 6+ years, but oprofile does not use pkconfig to find
> +# popt, so we need to tell it to link with -lintl for a static build.
> +ifeq ($(BR2_PACKAGE_GETTEXT)$(BR2_STATIC_LIBS),yy)
> +OPROFILE_CONF_OPTS += LIBS=-lintl
> +endif

Why not run $(PKG_CONFIG_HOST_BINARY) directly like we do in 
package/logrotate/logrotate.mk for popt?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
