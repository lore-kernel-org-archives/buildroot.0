From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Wed, 5 May 2021 21:02:23 +0200
Subject: [Buildroot] [PATCH 2/2] package/cegui: add libfribidi optional
 dependency
In-Reply-To: <20200510085217.3626176-2-fontaine.fabrice@gmail.com>
References: <20200510085217.3626176-1-fontaine.fabrice@gmail.com>
 <20200510085217.3626176-2-fontaine.fabrice@gmail.com>
Message-ID: <75c15639-a433-1fa5-1f6f-c2b48f2f17b6@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On 10.05.2020 10:52, Fabrice Fontaine wrote:
> libfribidi is an optional dependency (enabled by default) since version
> 0.8.0 and
> https://github.com/cegui/cegui/commit/17974582e6b6a7d8f5853b0272433f130f82e52a
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/cegui/cegui.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
> index 6158ef129c..73d0c22ce5 100644
> --- a/package/cegui/cegui.mk
> +++ b/package/cegui/cegui.mk
> @@ -62,6 +62,13 @@ else
>   CEGUI_CONF_OPTS += -DCEGUI_HAS_FREETYPE=OFF
>   endif
>   
> +ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
> +CEGUI_DEPENDENCIES += libfribidi
> +CEGUI_CONF_OPTS += -DCEGUI_USE_FRIBIDI=ON
> +else
> +CEGUI_CONF_OPTS += -DCEGUI_USE_FRIBIDI=OFF
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LIBXML2),y)
>   CEGUI_DEPENDENCIES += libxml2
>   CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_LIBXML2=ON

Tested-by: Bartosz Bilas<b.bilas@grinn-global.com>
Reviewed-by: Bartosz Bilas<b.bilas@grinn-global.com>

Best
Bartek
