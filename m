From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 05 Jan 2014 23:27:39 +0100
Subject: [Buildroot] [PATCH 06/36] xorg: Bump xkeyboard-config version
	to 2.10.1
In-Reply-To: <BLU0-SMTP3298535457054AB31AAA84FD9B50@phx.gbl> (Bernd Kuhls's
 message of "Sat, 4 Jan 2014 14:38:35 +0100")
References: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP3298535457054AB31AAA84FD9B50@phx.gbl>
Message-ID: <87wqieysh0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <berndkuhls@hotmail.com> writes:

 > - add missing dependencies

 > Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
 > ---
 >  package/x11r7/xkeyboard-config/xkeyboard-config.mk |    4 ++--
 >  1 file changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
 > index 49540df..b8afc46 100644
 > --- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
 > +++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
 > @@ -4,13 +4,13 @@
 >  #
 >  ################################################################################
 
 > -XKEYBOARD_CONFIG_VERSION = 2.6
 > +XKEYBOARD_CONFIG_VERSION = 2.10.1
 >  XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
 >  XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config/
 >  XKEYBOARD_CONFIG_LICENSE = MIT
 >  XKEYBOARD_CONFIG_LICENSE_FILES = COPYING
 
 > -XKEYBOARD_CONFIG_DEPENDENCIES = host-gettext host-intltool host-xapp_xkbcomp
 > +XKEYBOARD_CONFIG_DEPENDENCIES = host-gettext host-intltool host-xapp_xkbcomp xlib_libX11 xproto_xproto

Those extra dependencies don't seem to be needed (and weren't added in
Config.in). It would be odd if it really needed libX11 as it is also
used by wayland.

So committed without those extra dependencies, thanks.

-- 
Bye, Peter Korsgaard
