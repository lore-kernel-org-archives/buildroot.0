From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 22:50:27 +0200
Subject: [Buildroot] [PATCH v7 09/13] qt5base: fix "Unable to find an
 X11 visual" error
In-Reply-To: <1430406748-8493-10-git-send-email-jezz@sysmic.org>
References: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
 <1430406748-8493-10-git-send-email-jezz@sysmic.org>
Message-ID: <20150501225027.73b368a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Thu, 30 Apr 2015 17:12:24 +0200, J?r?me Pouiller wrote:

> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 032ebed..1899479 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -167,6 +167,8 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_PRINTSUPPORT) += Qt5PrintSupport
>  
>  QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_DBUS) += Qt5DBus
>  
> +QT5BASE_EXTRA_CFLAGS = $(if $(BR2_PACKAGE_GPU_VIV_BIN_MX6Q),-DENABLE_MX6_WORKAROUND)

I've merged that to a previous BR2_PACKAGE_GPU_VIV_BIN_MX6Q conditional.

> +
>  define QT5BASE_CONFIGURE_CMDS
>  	(cd $(@D); \
>  		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
> @@ -187,8 +189,8 @@ define QT5BASE_CONFIGURE_CMDS
>  		-device buildroot \
>  		-device-option CROSS_COMPILE="$(TARGET_CROSS)" \
>  		-device-option BR_CCACHE="$(CCACHE)" \
> -		-device-option BR_COMPILER_CFLAGS="$(TARGET_CFLAGS)" \
> -		-device-option BR_COMPILER_CXXFLAGS="$(TARGET_CXXFLAGS)" \
> +		-device-option BR_COMPILER_CFLAGS="$(TARGET_CFLAGS)$(QT5BASE_EXTRA_CFLAGS)" \
> +		-device-option BR_COMPILER_CXXFLAGS="$(TARGET_CXXFLAGS)$(QT5BASE_EXTRA_CFLAGS)" \

And added spaces here between TARGET_CFLAGS/CXXFLAGS and
QT5BASE_EXTRA_CFLAGS.

Applied with those changes.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
