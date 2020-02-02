From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Feb 2020 12:34:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi: use github helper for
 KODI_EXTRA_DOWNLOADS
In-Reply-To: <20200201141459.1762745-1-bernd.kuhls@t-online.de>
References: <20200201141459.1762745-1-bernd.kuhls@t-online.de>
Message-ID: <20200202113438.GB2643@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-02-01 15:14 +0100, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master with the additional explanations you rprovided in
reply to Thomas' questions. Thanks.

Regards,
Yann E. MORIN.

> ---
>  package/kodi/kodi.hash | 12 ++++--------
>  package/kodi/kodi.mk   | 29 ++++++++++++-----------------
>  2 files changed, 16 insertions(+), 25 deletions(-)
> 
> diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
> index cc248e537e..578befec1b 100644
> --- a/package/kodi/kodi.hash
> +++ b/package/kodi/kodi.hash
> @@ -1,11 +1,7 @@
>  # Locally computed
>  sha256 108979df8b41ab4168f5cdc0233f46e38767eda5921f4ccae16584e98d0d6b29  kodi-18.5-Leia.tar.gz
> +sha256 e11e7594af35f36ab2711252c3d6bb106908f26605498aef4a9be2d7bc001db2  kodi-ffmpeg-4.0.4-Leia-18.4.tar.gz
> +sha256 38816f8373e243bc5950449b4f3b18938c4e1c59348e3411e23f31db4072e40d  kodi-libdvdcss-1.4.2-Leia-Beta-5.tar.gz
> +sha256 071e414e61b795f2ff9015b21a85fc009dde967f27780d23092643916538a57a  kodi-libdvdnav-6.0.0-Leia-Alpha-3.tar.gz
> +sha256 a30b6aa0aad0f2c505bc77948af2d5531a80b6e68112addb4c123fca24d5d3bf  kodi-libdvdread-6.0.0-Leia-Alpha-3.tar.gz
>  sha256 9d2396ef3e091d3b82bc84143e070700412984e8589513570f54e0675d1e8851  LICENSE.md
> -# Locally computed - ffmpeg
> -sha256 e11e7594af35f36ab2711252c3d6bb106908f26605498aef4a9be2d7bc001db2  4.0.4-Leia-18.4.tar.gz
> -# Locally computed - libdvdcss
> -sha256 d816ed421ca5b70319298bda7830cff475a77d446539c54cf6d576dd6c651cee  e646b950095589e74a2c08cf0c34b758c669aa75.tar.gz
> -# Locally computed - libdvdnav
> -sha256 e50db40a823ddc795d1fe5f18db2517fb3e05fe0c4a88abf1578d95d7a1cce63  9277007ce2263b908e9ce3091cc31b3dd87c351c.tar.gz
> -# Locally computed - libdvdread
> -sha256 2d9d6d185dd25a983d6dfc2a00207cafdc396a969c227d5edd84b6215b2fba89  bd6b329f0137ab6a9f779a28dd96f04713735e17.tar.gz
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index 435f47cae8..1036151a89 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -49,21 +49,16 @@ KODI_DEPENDENCIES = \
>  	tinyxml \
>  	zlib
>  
> -# taken from tools/depends/target/ffmpeg/FFMPEG-VERSION
> +# taken from tools/depends/target/*/*-VERSION
>  KODI_FFMPEG_VERSION = 4.0.4-Leia-18.4
> +KODI_LIBDVDCSS_VERSION = 1.4.2-Leia-Beta-5
> +KODI_LIBDVDNAV_VERSION = 6.0.0-Leia-Alpha-3
> +KODI_LIBDVDREAD_VERSION = 6.0.0-Leia-Alpha-3
>  KODI_EXTRA_DOWNLOADS += \
> -	https://github.com/xbmc/FFmpeg/archive/$(KODI_FFMPEG_VERSION).tar.gz
> -
> -# 1.4.2-Leia-Beta-5
> -KODI_LIBDVDCSS_VERSION = e646b950095589e74a2c08cf0c34b758c669aa75
> -# 6.0.0-Leia-Alpha-3
> -KODI_LIBDVDNAV_VERSION = 9277007ce2263b908e9ce3091cc31b3dd87c351c
> -# 6.0.0-Leia-Alpha-3
> -KODI_LIBDVDREAD_VERSION = bd6b329f0137ab6a9f779a28dd96f04713735e17
> -KODI_EXTRA_DOWNLOADS += \
> -	https://github.com/xbmc/libdvdcss/archive/$(KODI_LIBDVDCSS_VERSION).tar.gz \
> -	https://github.com/xbmc/libdvdnav/archive/$(KODI_LIBDVDNAV_VERSION).tar.gz \
> -	https://github.com/xbmc/libdvdread/archive/$(KODI_LIBDVDREAD_VERSION).tar.gz
> +	$(call github,xbmc,FFmpeg,$(KODI_FFMPEG_VERSION))/kodi-ffmpeg-$(KODI_FFMPEG_VERSION).tar.gz \
> +	$(call github,xbmc,libdvdcss,$(KODI_LIBDVDCSS_VERSION))/kodi-libdvdcss-$(KODI_LIBDVDCSS_VERSION).tar.gz \
> +	$(call github,xbmc,libdvdnav,$(KODI_LIBDVDNAV_VERSION))/kodi-libdvdnav-$(KODI_LIBDVDNAV_VERSION).tar.gz \
> +	$(call github,xbmc,libdvdread,$(KODI_LIBDVDREAD_VERSION))/kodi-libdvdread-$(KODI_LIBDVDREAD_VERSION).tar.gz
>  
>  define KODI_CPLUFF_AUTOCONF
>  	cd $(KODI_SRCDIR)/lib/cpluff && ./autogen.sh
> @@ -80,16 +75,16 @@ KODI_CONF_OPTS += \
>  	-DENABLE_INTERNAL_CROSSGUID=OFF \
>  	-DENABLE_INTERNAL_FFMPEG=ON \
>  	-DENABLE_INTERNAL_FLATBUFFERS=OFF \
> -	-DFFMPEG_URL=$(KODI_DL_DIR)/$(KODI_FFMPEG_VERSION).tar.gz \
> +	-DFFMPEG_URL=$(KODI_DL_DIR)/kodi-ffmpeg-$(KODI_FFMPEG_VERSION).tar.gz \
>  	-DKODI_DEPENDSBUILD=OFF \
>  	-DENABLE_LDGOLD=OFF \
>  	-DNATIVEPREFIX=$(HOST_DIR) \
>  	-DDEPENDS_PATH=$(STAGING_DIR)/usr \
>  	-DWITH_JSONSCHEMABUILDER=$(HOST_DIR)/bin/JsonSchemaBuilder \
>  	-DWITH_TEXTUREPACKER=$(HOST_DIR)/bin/TexturePacker \
> -	-DLIBDVDCSS_URL=$(KODI_DL_DIR)/$(KODI_LIBDVDCSS_VERSION).tar.gz \
> -	-DLIBDVDNAV_URL=$(KODI_DL_DIR)/$(KODI_LIBDVDNAV_VERSION).tar.gz \
> -	-DLIBDVDREAD_URL=$(KODI_DL_DIR)/$(KODI_LIBDVDREAD_VERSION).tar.gz
> +	-DLIBDVDCSS_URL=$(KODI_DL_DIR)/kodi-libdvdcss-$(KODI_LIBDVDCSS_VERSION).tar.gz \
> +	-DLIBDVDNAV_URL=$(KODI_DL_DIR)/kodi-libdvdnav-$(KODI_LIBDVDNAV_VERSION).tar.gz \
> +	-DLIBDVDREAD_URL=$(KODI_DL_DIR)/kodi-libdvdread-$(KODI_LIBDVDREAD_VERSION).tar.gz
>  
>  ifeq ($(BR2_ENABLE_LOCALE),)
>  KODI_DEPENDENCIES += libiconv
> -- 
> 2.20.1
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
