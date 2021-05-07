From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 7 May 2021 22:13:03 +0200
Subject: [Buildroot] [PATCH 2/2] package/cegui: add libfribidi optional
 dependency
In-Reply-To: <20200510085217.3626176-2-fontaine.fabrice@gmail.com>
References: <20200510085217.3626176-1-fontaine.fabrice@gmail.com>
 <20200510085217.3626176-2-fontaine.fabrice@gmail.com>
Message-ID: <20210507201303.GB2137340@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-05-10 10:52 +0200, Fabrice Fontaine spake thusly:
> libfribidi is an optional dependency (enabled by default) since version
> 0.8.0 and
> https://github.com/cegui/cegui/commit/17974582e6b6a7d8f5853b0272433f130f82e52a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/cegui/cegui.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
> index 6158ef129c..73d0c22ce5 100644
> --- a/package/cegui/cegui.mk
> +++ b/package/cegui/cegui.mk
> @@ -62,6 +62,13 @@ else
>  CEGUI_CONF_OPTS += -DCEGUI_HAS_FREETYPE=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
> +CEGUI_DEPENDENCIES += libfribidi
> +CEGUI_CONF_OPTS += -DCEGUI_USE_FRIBIDI=ON
> +else
> +CEGUI_CONF_OPTS += -DCEGUI_USE_FRIBIDI=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBXML2),y)
>  CEGUI_DEPENDENCIES += libxml2
>  CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_LIBXML2=ON
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
