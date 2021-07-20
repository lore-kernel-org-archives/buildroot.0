From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 23:40:55 +0200
Subject: [Buildroot] [PATCH 3/4] package/mupdf: bump to version 1.18.0
In-Reply-To: <20210630234717.21742-3-raphael.melotte@mind.be>
References: <20210630234717.21742-1-raphael.melotte@mind.be>
 <20210630234717.21742-3-raphael.melotte@mind.be>
Message-ID: <20210720234055.14967287@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Rapha?l,

On Thu,  1 Jul 2021 01:47:15 +0200
Rapha?l M?lotte <raphael.melotte@mind.be> wrote:

> diff --git a/package/mupdf/Config.in b/package/mupdf/Config.in
> index dc296b3e8a..f796965751 100644
> --- a/package/mupdf/Config.in
> +++ b/package/mupdf/Config.in
> @@ -10,6 +10,7 @@ config BR2_PACKAGE_MUPDF
>  	select BR2_PACKAGE_JPEG
>  	select BR2_PACKAGE_LCMS2
>  	select BR2_PACKAGE_OPENJPEG
> +	select BR2_PACKAGE_GUMBO_PARSER

I fixed the alphabetic ordering here.

> -# Modern versions of mupdf depend on OpenGL,
> -# we disable it because it may not be available:
> +ifneq ($(BR2_PACKAGE_FREEGLUT),y)

And here fixed the option name (it's BR2_PACKAGE_LIBFREEGLUT) and
switched to positive logic, i.e:

ifeq ($(BR2_PACKAGE_LIBFREEGLUT),y)
... do stuff if enabled
else
... do stuff if disabled
endif

Applied with those changes.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
