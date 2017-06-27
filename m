From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 27 Jun 2017 21:20:00 +0200
Subject: [Buildroot] [PATCH v2 2/2] qt5multimedia: conditionally add
 alsa-lib to dependencies
In-Reply-To: <1498549990-3548-3-git-send-email-brgl@bgdev.pl>
References: <1498549990-3548-1-git-send-email-brgl@bgdev.pl>
 <1498549990-3548-3-git-send-email-brgl@bgdev.pl>
Message-ID: <20170627212000.5e09dca9@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bartoz,

On Tue, 27 Jun 2017 09:53:09 +0200, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Qt5Multimedia builds the alsa plugin if it detects libasound in the
> system. Add alsa-lib to dependencies if BR2_PACKAGE_ALSA_LIB is
> selected.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  package/qt5/qt5multimedia/qt5multimedia.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
> index 19312ff..062d980 100644
> --- a/package/qt5/qt5multimedia/qt5multimedia.mk
> +++ b/package/qt5/qt5multimedia/qt5multimedia.mk
> @@ -30,6 +30,10 @@ ifeq ($(BR2_PACKAGE_LIBGLIB2)$(BR2_PACKAGE_PULSEAUDIO),yy)
>  QT5MULTIMEDIA_DEPENDENCIES += libglib2 pulseaudio
>  endif
>  
> +ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
> +QT5MULTIMEDIA_DEPENDENCIES += alsa-lib
> +endif
> +
>  define QT5MULTIMEDIA_CONFIGURE_CMDS
>  	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
>  endef

Thanks for taking care of it...

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter
