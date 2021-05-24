From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 10:52:21 +0200
Subject: [Buildroot] [PATCH 1/4] package/python-pillow: add lcms2 support
In-Reply-To: <20210522174159.278657-1-fontaine.fabrice@gmail.com>
References: <20210522174159.278657-1-fontaine.fabrice@gmail.com>
Message-ID: <20210524085221.GH3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-22 19:41 +0200, Fabrice Fontaine spake thusly:
> lcms2 is an optional dependency since version 2.3.0 and
> https://github.com/python-pillow/Pillow/commit/6d9f34914021951bba42ffe5b6cd80147e7f538f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This is fixing a hidden depenency, so: applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-pillow/python-pillow.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
> index f71fa156e2..3018758b48 100644
> --- a/package/python-pillow/python-pillow.mk
> +++ b/package/python-pillow/python-pillow.mk
> @@ -28,6 +28,13 @@ else
>  PYTHON_PILLOW_BUILD_OPTS += --disable-jpeg
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LCMS2),y)
> +PYTHON_PILLOW_DEPENDENCIES += lcms2
> +PYTHON_PILLOW_BUILD_OPTS += --enable-lcms
> +else
> +PYTHON_PILLOW_BUILD_OPTS += --disable-lcms
> +endif
> +
>  ifeq ($(BR2_PACKAGE_OPENJPEG),y)
>  PYTHON_PILLOW_DEPENDENCIES += openjpeg
>  PYTHON_PILLOW_BUILD_OPTS += --enable-jpeg2000
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
