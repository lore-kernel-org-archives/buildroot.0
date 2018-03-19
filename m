From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 19 Mar 2018 18:04:50 +0100
Subject: [Buildroot] [PATCH 1/1] libv4l: qv4l2 doesn't support GLES
In-Reply-To: <20180319105531.34918-1-phil@zankapfel.net>
References: <20180319105531.34918-1-phil@zankapfel.net>
Message-ID: <20180319180450.14dd21d9@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Phil,

On Mon, 19 Mar 2018 11:55:31 +0100, Phil Eichinger <phil@zankapfel.net> wrote:

> qv4l2 explicitly sets QT_NO_OPENGL_ES_2 because GLES is not supported
> yet. So compiling with Qt5 which has only GLES enabled fails.
> 
> https://git.linuxtv.org/v4l-utils.git/commit/utils/qv4l2?id=c185420d494d8985ec3aab6b2a28f858046052b5
> Signed-off-by: Phil Eichinger <phil@zankapfel.net>
> ---
>  package/libv4l/libv4l.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
> index 11061306c7..5eb26ee16c 100644
> --- a/package/libv4l/libv4l.mk
> +++ b/package/libv4l/libv4l.mk
> @@ -51,7 +51,7 @@ endif
>  ifeq ($(BR2_PACKAGE_LIBV4L_UTILS),y)
>  LIBV4L_CONF_OPTS += --enable-v4l-utils
>  LIBV4L_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
> -ifeq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_WIDGETS),yyy)
> +ifeq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_WIDGETS)$(BR2_PACKAGE_QT5BASE_OPENGL_DESKTOP),yyyy)

NAK, qv4l2 builds just fine with framebuffer/widgets support, see libv4l-1.14.1/config.h
HAVE_QTGL configure logic and libv4l-1.14.1/utils/qv4l2/* conditional compile logic...

Do your have a (minimal) buildroot defconfig which failes to build libv4l?

Regards,
Peter

>  LIBV4L_CONF_OPTS += --enable-qv4l2
>  LIBV4L_DEPENDENCIES += qt5base
>  # protect against host version detection of moc-qt5/rcc-qt5/uic-qt5
