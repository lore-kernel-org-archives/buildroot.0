From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Nov 2014 23:17:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_bdftopcf: Fix
	linking error
In-Reply-To: <1417035000-22176-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Wed, 26 Nov 2014 21:50:00 +0100")
References: <1417035000-22176-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87d288nv8o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes
 > http://autobuild.buildroot.net/results/242/24297c948c0eee684e868ad4bd12f11c3a759248/
 > http://autobuild.buildroot.net/results/464/464fdc71690a437c1782dd8e4c75d78195bf8bfd/
 > http://autobuild.buildroot.net/results/77c/77c26d14c8906b44f7c3fa1b3d759556c7318a7e/
 > and many others ( http://autobuild.buildroot.net/?reason=xapp_bdftopcf-1.0.4 )

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk |    3 +++
 >  1 file changed, 3 insertions(+)

 > diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
 > index 950d988..1bf74aa 100644
 > --- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
 > +++ b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
 > @@ -11,5 +11,8 @@ XAPP_BDFTOPCF_LICENSE = MIT
 >  XAPP_BDFTOPCF_LICENSE_FILES = COPYING
 >  XAPP_BDFTOPCF_DEPENDENCIES = xlib_libXfont
 
 > +# needed for linking against libXfont
 > +XAPP_BDFTOPCF_MAKE_OPTS += LDFLAGS+=-ldl

Does this end up at the very back of the linker command line? Why not
XAPP_BDFTOPCF_CONF_ENV += LIBS=-ldl like we do elsewhere?

-- 
Bye, Peter Korsgaard
