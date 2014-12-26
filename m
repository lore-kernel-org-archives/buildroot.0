From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Dec 2014 16:02:41 +0100
Subject: [Buildroot] [PATCH 3/4] qt5: bump to version 5.4.0
In-Reply-To: <1419595603-15591-3-git-send-email-fatih.asici@gmail.com>
References: <1419595603-15591-1-git-send-email-fatih.asici@gmail.com>
 <1419595603-15591-3-git-send-email-fatih.asici@gmail.com>
Message-ID: <20141226160241.574a1ae0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fatih A??c?,

On Fri, 26 Dec 2014 14:06:42 +0200, Fatih A??c? wrote:
> qt5base:
>   - Add patches to fix uClibc build.
>   - Remove -no-c++11 option since qt5connectivity needs some C++11
>     features.

Hum, we don't really have a good "handling" of C++11 in Buildroot. I
believe C++11 is only available starting from certain gcc versions, no?
So maybe not all toolchains will support C++11 ?

> qt5webkit:
>   - Remove egl patch. This should be fixed with CONFIG += egl option.

Hum, looking at the patch, I don't really understand this. The patch
does add some include paths when EGL is enabled. How does CONFIG += egl
solves the problem?

>  ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
>  QT5BASE_CONFIGURE_OPTS += -opensource -confirm-license
> -QT5BASE_LICENSE = LGPLv2.1 or GPLv3.0
> -QT5BASE_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
> +QT5BASE_LICENSE = LGPLv2.1 with exception or LGPLv3
> +QT5BASE_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3

So the license of qt5base is not the same as the license of the other
Qt modules?

For the other Qt modules, I see:

> +QT5CONNECTIVITY_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
> +QT5CONNECTIVITY_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2

> +QT5DECLARATIVE_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
> +QT5DECLARATIVE_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2

Qt5enginio is also different?

> +QT5ENGINIO_LICENSE = LGPLv2.1 with exception or LGPLv3
> +QT5ENGINIO_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3

> +QT5GRAPHICALEFFECTS_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
> +QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2

> +QT5IMAGEFORMATS_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
> +QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2

> +QT5MULTIMEDIA_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
> +QT5MULTIMEDIA_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2

> +QT5QUICK1_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
> +QT5QUICK1_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2

> +QT5QUICKCONTROLS_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
> +QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2

> +QT5SCRIPT_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
> +QT5SCRIPT_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2

> +QT5SENSORS_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
> +QT5SENSORS_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2

> +QT5SERIALPORT_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
> +QT5SERIALPORT_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2

> +QT5SVG_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
> +QT5SVG_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2

> +QT5WEBKIT_EXAMPLES_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
> +# Source files contain references to LGPL_EXCEPTION.txt but it is not included
> +# in the archive.
> +QT5WEBKIT_EXAMPLES_LICENSE_FILES = LICENSE.LGPLv21 LICENSE.LGPLv3 LICENSE.GPLv2

For qt5webkit, I can understand why the license is different.

> +QT5WEBKIT_LICENSE = LGPLv2+ (WebCore), LGPLv2.1 with exception or LGPLv3 or GPLv2
> +# Source files contain references to LGPL_EXCEPTION.txt but it is not included
> +# in the archive.
> +QT5WEBKIT_LICENSE_FILES += LICENSE.LGPLv21 LICENSE.LGPLv3 LICENSE.GPLv2
>  else
> -QT5WEBKIT_LICENSE = LGPLv2+, MIT, Commercial license
> +QT5WEBKIT_LICENSE = LGPLv2+ (WebCore), Commercial license


> +QT5WEBSOCKETS_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
> +# Source files contain references to LGPL_EXCEPTION.txt but it is not included
> +# in the archive.
> +QT5WEBSOCKETS_LICENSE_FILES = LICENSE.LGPLv21 LICENSE.LGPLv3 LICENSE.GPLv2


> +QT5X11EXTRAS_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
> +QT5X11EXTRAS_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2

> +QT5XMLPATTERNS_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
> +QT5XMLPATTERNS_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2

Maybe we should define some variables in package/qt5/qt5.mk for the
license stuff, and re-use $(QT5_LICENSE) and $(QT5_LICENSE_FILES) in
the various packages in order to avoid this duplication?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
