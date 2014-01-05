From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 05 Jan 2014 21:59:17 +0100
Subject: [Buildroot] [PATCH 04/36] xorg: Bump xapp_xrandr version to
	1.4.1
In-Reply-To: <BLU0-SMTP451CF1192E7F15E363FE1A5D9B50@phx.gbl> (Bernd Kuhls's
 message of "Sat, 4 Jan 2014 14:38:33 +0100")
References: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP451CF1192E7F15E363FE1A5D9B50@phx.gbl>
Message-ID: <87a9fa5emy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <berndkuhls@hotmail.com> writes:

 > Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
 > ---
 >  package/x11r7/xapp_xrandr/xapp_xrandr.mk |    2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.mk b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
 > index 9ba7332..7e03d29 100644
 > --- a/package/x11r7/xapp_xrandr/xapp_xrandr.mk
 > +++ b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -XAPP_XRANDR_VERSION = 1.3.5
 > +XAPP_XRANDR_VERSION = 1.4.1

That doesn't work:

checking for XRANDR... configure: error: Package requirements (xrandr >= 1.4 xrender x11 xproto >= 7.0.17) were not met:

Package dependency requirement 'xrandr >= 1.4' could not be satisfied.
Package 'xrandr' has version '1.3.2', required version is '>= 1.4'

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

I guess this should come after the xproto_randrproto bump?

-- 
Bye, Peter Korsgaard
