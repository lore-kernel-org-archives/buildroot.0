From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Tue, 27 Feb 2018 17:28:06 -0500
Subject: [Buildroot] [git commit] qt5wayland: fix build issue with
 mesa3d w/out xcb
In-Reply-To: <20180227231125.528dcbf9@windsurf.lan>
References: <20180227210121.125F78137A@busybox.osuosl.org>
 <20180227231125.528dcbf9@windsurf.lan>
Message-ID: <20180227222806.pzbq5wz6fftrxqj3@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Feb 27, 2018 at 11:11:25PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 27 Feb 2018 21:48:17 +0100, Peter Korsgaard wrote:
> 
> > +# The mesa's EGL/eglplatform.h header includes X11 headers unless the flag
> > +# MESA_EGL_NO_X11_HEADERS is defined. Tell to not include X11 headers if
> > +# the libxcb is not selected.
> > +ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL)x$(BR2_PACKAGE_LIBXCB),yx)
> > +QT5WAYLAND_QMAKEFLAGS += QMAKE_CXXFLAGS+=-DMESA_EGL_NO_X11_HEADERS
> > +endif
> 
> I should have replied to the patch, but: I'm not happy with this
> change. Indeed this -D flag should be part of mesa's pkg-config files,
> and be picked up by Qt.
> 
> The simple fact that this identical fix had to be added to qt5wayland,
> qt5webkit and qt5multimedia is a good indication that the fix is not
> the appropriate one. We may have to replicate this fix to lots of other
> qt5 packages.
> 
> So the right fix is to propagate the flag using pkg-config.
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> http://bootlin.com

Peter Seiderer sent me an hint[1].

I have to find time to send a proper patch. Do not worry, I have that
fix in mind.

Gael

[1]: http://lists.busybox.net/pipermail/buildroot/2018-February/214210.html
