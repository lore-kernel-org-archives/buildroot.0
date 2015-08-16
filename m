From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 16 Aug 2015 21:02:45 +0300
Subject: [Buildroot] [PATCHv2] [autobuild] package/oprofile: fix static
	linking
In-Reply-To: <1439736807-29324-1-git-send-email-yann.morin.1998@free.fr>
References: <1439736807-29324-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150816180245.GE2765@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Aug 16, 2015 at 04:53:27PM +0200, Yann E. MORIN wrote:
> +# popt links with -lintl and specifies it in its popt.pc, and has done
> +# so for the past 6+ years, but oprofile does not use pkconfig to find
> +# popt, so we need to tell it to link with -lintl for a static build.
> +ifeq ($(BR2_PACKAGE_GETTEXT)$(BR2_STATIC_LIBS),yy)
> +OPROFILE_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs popt`"
> +endif

Well, the whole point of running $(PKG_CONFIG_HOST_BINARY) is that its output 
matches the actual build dependencies. So the 'ifeq' should not be needed, 
just like logrotate.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
