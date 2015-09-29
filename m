From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Sep 2015 19:41:54 +0200
Subject: [Buildroot] [PATCH 1/2] libbluray: add optional fontconfig
 dependency
In-Reply-To: <c0676cbc3b883de88e98c9ba28d8023f17cb5e88.1443531503.git.baruch@tkos.co.il>
References: <c0676cbc3b883de88e98c9ba28d8023f17cb5e88.1443531503.git.baruch@tkos.co.il>
Message-ID: <20150929194154.5377bd2a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Tue, 29 Sep 2015 15:58:22 +0300, Baruch Siach wrote:

> diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
> index e10f7dbc8c73..f6a501a1083f 100644
> --- a/package/libbluray/libbluray.mk
> +++ b/package/libbluray/libbluray.mk
> @@ -24,6 +24,12 @@ else
>  LIBBLURAY_CONF_OPTS += --without-freetype
>  endif
>  
> +ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
> +LIBBLURAY_DEPENDENCIES += fontconfig
> +else
> +LIBBLURAY_CONF_OPTS += --without-fontconfig
> +endif

I would prefer to have an explicit --with-fontconfig when
BR2_PACKAGE_FONTCONFIG=y. I know it's not the case for the other
dependencies already handled by libbluray.mk, so I've applied your
patch as is, and my comment can be fixed for all optional dependencies
of libbluray in a separate patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
