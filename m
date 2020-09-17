From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 14:55:51 +0200
Subject: [Buildroot] [PATCH 1/3 v4] package/qt5/qt5webengine: fix
 ffmpeg/codec/alsa option handling for latest
In-Reply-To: <73c8adc83c7e856136f5eacd8aab44631b0a64cc.1600290685.git.yann.morin.1998@free.fr>
References: <cover.1600290685.git.yann.morin.1998@free.fr>
 <73c8adc83c7e856136f5eacd8aab44631b0a64cc.1600290685.git.yann.morin.1998@free.fr>
Message-ID: <20200917145551.3f4a7187@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Sep 2020 23:11:32 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
> index 9101f35937..5df6942977 100644
> --- a/package/qt5/qt5webengine/qt5webengine.mk
> +++ b/package/qt5/qt5webengine/qt5webengine.mk
> @@ -29,16 +29,16 @@ endif
>  
>  QT5WEBENGINE_DEPENDENCIES += host-libpng host-libnss libnss
>  
> -QT5WEBENGINE_CONF_OPTS += WEBENGINE_CONFIG+=use_system_ffmpeg
> +QT5WEBENGINE_CONF_OPTS = -webengine-ffmpeg
>  
>  ifeq ($(BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS),y)
> -QT5WEBENGINE_CONF_OPTS += WEBENGINE_CONFIG+=use_proprietary_codecs
> +QT5WEBENGINE_CONF_OPTS += -webengine-proprietary-codecs
>  endif
>  
>  ifeq ($(BR2_PACKAGE_QT5WEBENGINE_ALSA),y)
>  QT5WEBENGINE_DEPENDENCIES += alsa-lib
>  else
> -QT5WEBENGINE_CONF_OPTS += QT_CONFIG-=alsa
> +QT5WEBENGINE_CONF_OPTS += -no-webengine-alsa
>  endif

In the original patch, there was a "--" that was added to separate
these webengine options from the main options. You have not kept that.
Are you sure this is OK ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
