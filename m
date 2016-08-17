From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Aug 2016 08:27:20 +0200
Subject: [Buildroot] [PATCHv2] package/qt: webkit needs gst-plugins-base
In-Reply-To: <1471259233-1711-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Mon, 15 Aug 2016 13:07:13 +0200")
References: <1471259233-1711-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <878tvvuczb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > QtWebkit needs gstreamer-0.10 and the 'app' plugins, so we depend on
 > gstreamer and select the required plugins.

 > We can't select gstreamer or that would cause circular dependencies in
 > kconfig:

 >     package/kodi/Config.in:37:error: recursive dependency detected!
 >     package/kodi/Config.in:37:      symbol BR2_PACKAGE_KODI depends on BR2_PACKAGE_KODI_EGL_GLES
 >     package/kodi/Config.in:16:      symbol BR2_PACKAGE_KODI_EGL_GLES depends on BR2_PACKAGE_HAS_LIBEGL
 >     package/opengl/libegl/Config.in:1:      symbol BR2_PACKAGE_HAS_LIBEGL is selected by BR2_PACKAGE_MESA3D_OPENGL_EGL
 >     package/mesa3d/Config.in:150:   symbol BR2_PACKAGE_MESA3D_OPENGL_EGL is selected by BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL
 >     package/mesa3d/Config.in:92:    symbol BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL depends on BR2_PACKAGE_MESA3D
 >     package/mesa3d/Config.in:1:     symbol BR2_PACKAGE_MESA3D is selected by BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
 >     package/x11r7/xdriver_xf86-video-imx-viv/Config.in:1:   symbol BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV depends on BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
 >     package/freescale-imx/imx-gpu-viv/Config.in:34: symbol BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11 is part of choice <choice>
 >     package/freescale-imx/imx-gpu-viv/Config.in:27: choice <choice> contains symbol <choice>
 >     package/freescale-imx/imx-gpu-viv/Config.in:27: choice <choice> contains symbol BR2_PACKAGE_FREESCALE_IMX
 >     package/freescale-imx/Config.in:1:      symbol BR2_PACKAGE_FREESCALE_IMX is selected by BR2_PACKAGE_GST_FSL_PLUGINS
 >     package/gstreamer/gst-fsl-plugins/Config.in:8:  symbol BR2_PACKAGE_GST_FSL_PLUGINS depends on BR2_PACKAGE_GSTREAMER
 >     package/gstreamer/gstreamer/Config.in:5:        symbol BR2_PACKAGE_GSTREAMER is selected by BR2_PACKAGE_QT_WEBKIT
 >     package/qt/Config.in:464:       symbol BR2_PACKAGE_QT_WEBKIT depends on BR2_PACKAGE_QT
 >     package/qt/Config.in:5: symbol BR2_PACKAGE_QT is selected by BR2_PACKAGE_PYTHON_PYQT
 >     package/python-pyqt/Config.in:5:        symbol BR2_PACKAGE_PYTHON_PYQT depends on BR2_PACKAGE_PYTHON
 >     package/python/Config.in:5:     symbol BR2_PACKAGE_PYTHON is selected by BR2_PACKAGE_KODI

 > This one is fairly complicated to fix properly, so it is easier to just
 > depend on gstreamer.

That is also how we handle it for phonon.

Committed, thanks.

-- 
Bye, Peter Korsgaard
