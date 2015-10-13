From: Paul Cercueil <paul@crapouillou.net>
Date: Tue, 13 Oct 2015 13:29:54 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/mesa3d: Fix dri checks
Message-ID: <1444735794.2250.20.camel@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In-Reply-To: <1443263563-13588-1-git-send-email-bernd.kuhls@t-online.de
>

Hi,

> "MESA3D_EGL_PLATFORMS = drm" is only needed when dri drivers are
> enabled:
> http://cgit.freedesktop.org/mesa/mesa/tree/configure.ac?h=10.6#n1653

From what I can read from the link you pasted, your assumption is
wrong. the DRM backend of EGL can be enabled without any DRI drivers. 

Besides, there is actually a usecase for using the DRM backend of EGL
without DRI drivers: when your target platform has a DRM driver
(instead of fbdev) and does not use X11.

Regards,
-Paul
