From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Oct 2011 08:36:50 +0200
Subject: [Buildroot] [PATCH v2] New package: ImLib2
In-Reply-To: <201110140009.13963.arnout@mind.be>
References: <1318328770-9496-1-git-send-email-yegorslists@googlemail.com>
 <4E95618E.6010203@visionsystems.de> <20111012115317.3cc2fc4e@skate>
 <201110140009.13963.arnout@mind.be>
Message-ID: <20111014083650.46368731@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 14 Oct 2011 00:09:13 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>  Actually that would only be for Makefile dependencies, not for
> Kconfig dependencies...

True, but this is also wrong currently for Makefile dependencies:

cairo/cairo.mk: CAIRO_DEPENDENCIES += xserver_xorg-server
docker/docker.mk:DOCKER_DEPENDENCIES = host-pkg-config libglib2 xserver_xorg-server
fltk/fltk.mk:FLTK_DEPENDENCIES = xserver_xorg-server xlib_libXt
games/rubix/rubix.mk:RUBIX_DEPENDENCIES = xserver_xorg-server
java/classpath/classpath.mk:    CLASSPATH_DEPENDENCIES+= xserver_xorg-server
java/jamvm/jamvm.mk:    JAMVM_DEPENDENCIES+= xserver_xorg-server
libgtk2/libgtk2.mk:     LIBGTK2_DEPENDENCIES += xlib_libXcomposite xserver_xorg-server
metacity/metacity.mk:METACITY_DEPENDENCIES = libgtk2 xserver_xorg-server
pango/pango.mk: PANGO_DEPENDENCIES += xserver_xorg-server
pcmanfm/pcmanfm.mk:PCMANFM_DEPENDENCIES = host-pkg-config libgtk2 gamin startup-notification xserver_xorg-server
sdl/sdl.mk:SDL_DEPENDENCIES += xserver_xorg-server
synergy/synergy.mk:SYNERGY_DEPENDENCIES = xserver_xorg-server xlib_libXtst
torsmo/torsmo.mk:TORSMO_DEPENDENCIES = xserver_xorg-server
webkit/webkit.mk:       WEBKIT_DEPENDENCIES += xserver_xorg-server xlib_libXt

I don't think any of these actually require the X.org server to be built.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
