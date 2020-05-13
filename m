From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 May 2020 22:37:09 +0200
Subject: [Buildroot] [PATCH 1/2] package/cegui: remove tinyxml2
 dependency
In-Reply-To: <20200510085217.3626176-1-fontaine.fabrice@gmail.com>
References: <20200510085217.3626176-1-fontaine.fabrice@gmail.com>
Message-ID: <20200513203709.GC12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-05-10 10:52 +0200, Fabrice Fontaine spake thusly:
> Remove tinyxml2 dependency as tinyxml2 is not a part of version 0.8.7.
> 
> Indeed, tinyxml2 has been added in September 2016 with
> https://github.com/cegui/cegui/commit/49b3fd9d6f0d7555198379514b155bcd61daef67
> whereas version 0.8.7 has been released in April 2016
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/cegui/cegui.mk | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
> index 9640a15116..6158ef129c 100644
> --- a/package/cegui/cegui.mk
> +++ b/package/cegui/cegui.mk
> @@ -83,13 +83,6 @@ else
>  CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_TINYXML=OFF
>  endif
>  
> -ifeq ($(BR2_PACKAGE_TINYXML2),y)
> -CEGUI_DEPENDENCIES += tinyxml2
> -CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_TINYXML2=ON
> -else
> -CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_TINYXML2=OFF
> -endif
> -
>  ifeq ($(BR2_PACKAGE_LIBFREEIMAGE),y)
>  CEGUI_DEPENDENCIES += libfreeimage
>  CEGUI_CONF_OPTS += -DCEGUI_BUILD_IMAGECODEC_FREEIMAGE=ON
> -- 
> 2.26.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
