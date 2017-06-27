From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 27 Jun 2017 21:18:20 +0200
Subject: [Buildroot] [PATCH v2 1/2] qt5multimedia: conditionally add
 pulseaudio & libglib2 to dependencies
In-Reply-To: <1498549990-3548-2-git-send-email-brgl@bgdev.pl>
References: <1498549990-3548-1-git-send-email-brgl@bgdev.pl>
 <1498549990-3548-2-git-send-email-brgl@bgdev.pl>
Message-ID: <20170627211820.65b42a83@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 27 Jun 2017 09:53:08 +0200, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Qt5Multimedia includes support for pulseaudio if it detects libpulse
> and libpulse-mainloop-glib in the system at build-time. We need to
> depend on pulseaudio and libglib2 if it is selected.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  package/qt5/qt5multimedia/qt5multimedia.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
> index 133536e..19312ff 100644
> --- a/package/qt5/qt5multimedia/qt5multimedia.mk
> +++ b/package/qt5/qt5multimedia/qt5multimedia.mk
> @@ -26,6 +26,10 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
>  QT5MULTIMEDIA_DEPENDENCIES += qt5declarative
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBGLIB2)$(BR2_PACKAGE_PULSEAUDIO),yy)
> +QT5MULTIMEDIA_DEPENDENCIES += libglib2 pulseaudio
> +endif
> +
>  define QT5MULTIMEDIA_CONFIGURE_CMDS
>  	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
>  endef

Reviewed-by: Peter Seiderer <ps.report@gmx.net>
