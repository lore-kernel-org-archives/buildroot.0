From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 19 Sep 2017 09:51:30 +0200
Subject: [Buildroot] [PATCH v2 09/11] package/kodi: fix build with glibc
	2.26
References: <20170902205423.21288-1-romain.naour@gmail.com>
 <20170902205423.21288-10-romain.naour@gmail.com>
Message-ID: <2tu69ex7qp.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

Am Sat, 02 Sep 2017 22:54:21 +0200 schrieb Romain Naour:

> Kodi fail to build with glibc 2.26 release:
> In file included from
> [...]/host/x86_64-buildroot-linux-gnu/include/c++/7.2.0/cmath:45:0,
>                  from
>                  [...]/build/kodi-17.3-Krypton/xbmc/dialogs/
GUIDialogExtendedProgressBar.cpp:21:
> [...]/build/kodi-17.3-Krypton/xbmc/dialogs/
GUIDialogExtendedProgressBar.cpp:
> In member function 'void CGUIDialogProgressBarHandle::SetProgress(int,
> int)':
> [...]/build/kodi-17.3-Krypton/xbmc/dialogs/
GUIDialogExtendedProgressBar.cpp:55:13:
> error: '__builtin_isnan' is not a member of 'std'
>    if (!std::isnan(fPercentage))
>              ^
> [...]/build/kodi-17.3-Krypton/xbmc/dialogs/
GUIDialogExtendedProgressBar.cpp:55:13:
> note: suggested alternative:
> <built-in>: note:   '__builtin_isnan'
> 
> Signed-off-by: Romain Naour
> <romain.naour@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[build-tested using this defconfig:
BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PY_ONLY=y]

Kodi still builds using an uClibc-toolchain. Please send the patch 
upstream.

Regards, Bernd
