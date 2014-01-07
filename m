From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Jan 2014 10:04:57 +0100
Subject: [Buildroot] [PATCH 05/36] xorg: Bump xdriver_xf86-video-intel
	version to 2.99.907
In-Reply-To: <BLU0-SMTP26103E1E7CD46937C9949F7D9B50@phx.gbl> (Bernd Kuhls's
 message of "Sat, 4 Jan 2014 14:38:34 +0100")
References: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP26103E1E7CD46937C9949F7D9B50@phx.gbl>
Message-ID: <87iotwxiva.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <berndkuhls@hotmail.com> writes:

 > - enable sna support by default, disable unneeded stuff
 >   ported from OpenELEC:
 >   https://github.com/OpenELEC/OpenELEC.tv/blob/master/packages/x11/driver/xf86-video-intel/package.mk
 > - add xlib_libXtst dependency

 > Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
 > ---
 >  .../xdriver_xf86-video-intel.mk                    |   20 ++++++++++++++++----
 >  1 file changed, 16 insertions(+), 4 deletions(-)

 > diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
 > index 97fef99..34624d3 100644
 > --- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
 > +++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
 > @@ -1,16 +1,28 @@
 >  ################################################################################
 >  #
 > -# xdriver_xf86-video-intel
 > +# xdriver_xf86-video-intel -- Intel video driver

Please don't do that. The style we use is to only list the package name.

 >  #
 >  ################################################################################
 
 > -XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.19.0
 > +XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.99.907
 >  XDRIVER_XF86_VIDEO_INTEL_SOURCE = xf86-video-intel-$(XDRIVER_XF86_VIDEO_INTEL_VERSION).tar.bz2
 >  XDRIVER_XF86_VIDEO_INTEL_SITE = http://xorg.freedesktop.org/releases/individual/driver
 >  XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
 >  XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
 >  XDRIVER_XF86_VIDEO_INTEL_AUTORECONF = YES
 > -XDRIVER_XF86_VIDEO_INTEL_CONF_OPT = --enable-dri
 > -XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto libdrm xlib_libpciaccess
 > +
 > +XDRIVER_XF86_VIDEO_INTEL_CONF_OPT = \
 > +	--enable-dri \
 > +	--enable-kms-only \
 > +	--disable-xvmc \
 > +	--disable-ums-only \
 > +	--enable-sna \
 > +	--disable-uxa \
 > +	--disable-glamor \
 > +	--disable-xaa \
 > +	--disable-dga \
 > +	--disable-async-swap
 > +
 > +XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto libdrm xlib_libpciaccess xlib_libXtst

From configure.ac Xtst seems to only be needed for the
intel-virtual-output tool, that I don't think we should enforce, so I've
dropped this.

-- 
Bye, Peter Korsgaard
