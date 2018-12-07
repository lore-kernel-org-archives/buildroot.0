From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 7 Dec 2018 20:28:48 +0100
Subject: [Buildroot] [PATCH 1/1] qt5virtualkeyboard: add arrow key
 navigation build option
In-Reply-To: <20181203082509.25936-1-sebastien.szymanski@armadeus.com>
References: <20181203082509.25936-1-sebastien.szymanski@armadeus.com>
Message-ID: <20181207202848.11e494aa@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello S?bastien,

On Mon,  3 Dec 2018 09:25:09 +0100, S?bastien Szymanski <sebastien.szymanski@armadeus.com> wrote:

> It allows controlling the keyboard using the arrow and return keys.
> 
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
>  package/qt5/qt5virtualkeyboard/Config.in             | 5 +++++
>  package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk | 4 ++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/package/qt5/qt5virtualkeyboard/Config.in b/package/qt5/qt5virtualkeyboard/Config.in
> index 57b0c703b0..c3f2f37604 100644
> --- a/package/qt5/qt5virtualkeyboard/Config.in
> +++ b/package/qt5/qt5virtualkeyboard/Config.in
> @@ -53,4 +53,9 @@ config BR2_PACKAGE_QT5VIRTUALKEYBOARD_HANDWRITING
>  	  Lipi Toolkit (LipiTk) is an open source toolkit for online
>  	  Handwriting Recognition.
>  
> +config BR2_PACKAGE_QT5VIRTUALKEYBOARD_ARROW_KEY_NAVIGATION
> +	bool "Arrow key navigation"
> +	help
> +	  Allows controlling the keyboard using the arrow and return keys.
> +
>  endif
> diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> index 4aa5fc9575..8ce3169774 100644
> --- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> +++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> @@ -53,6 +53,10 @@ QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/lipi-toolkit/MI
>  endif
>  endif
>  
> +ifeq ($(BR2_PACKAGE_QT5VIRTUALKEYBOARD_ARROW_KEY_NAVIGATION),y)
> +QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+=arrow-key-navigation
> +endif
> +
>  ifdef QT5VIRTUALKEYBOARD_3RDPARTY_PARTS
>  define QT5VIRTUALKEYBOARD_INSTALL_TARGET_3RDPARTY_PARTS
>  	cp -dpfr $(STAGING_DIR)/usr/qtvirtualkeyboard $(TARGET_DIR)/usr

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter
