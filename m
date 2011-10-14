From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Fri, 14 Oct 2011 09:51:28 +0200
Subject: [Buildroot] [PATCH v2] New package: ImLib2
In-Reply-To: <20111014083650.46368731@skate>
References: <1318328770-9496-1-git-send-email-yegorslists@googlemail.com>
 <4E95618E.6010203@visionsystems.de> <20111012115317.3cc2fc4e@skate>
 <201110140009.13963.arnout@mind.be> <20111014083650.46368731@skate>
Message-ID: <4E97EA00.8060103@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 14.10.2011 08:36, schrieb Thomas Petazzoni:
> Le Fri, 14 Oct 2011 00:09:13 +0200,
> Arnout Vandecappelle <arnout@mind.be> a ?crit :
> 
>>  Actually that would only be for Makefile dependencies, not for
>> Kconfig dependencies...
> 
> True, but this is also wrong currently for Makefile dependencies:
> 
> cairo/cairo.mk: CAIRO_DEPENDENCIES += xserver_xorg-server
> docker/docker.mk:DOCKER_DEPENDENCIES = host-pkg-config libglib2 xserver_xorg-server
> fltk/fltk.mk:FLTK_DEPENDENCIES = xserver_xorg-server xlib_libXt
> games/rubix/rubix.mk:RUBIX_DEPENDENCIES = xserver_xorg-server
> java/classpath/classpath.mk:    CLASSPATH_DEPENDENCIES+= xserver_xorg-server
> java/jamvm/jamvm.mk:    JAMVM_DEPENDENCIES+= xserver_xorg-server
> libgtk2/libgtk2.mk:     LIBGTK2_DEPENDENCIES += xlib_libXcomposite xserver_xorg-server
> metacity/metacity.mk:METACITY_DEPENDENCIES = libgtk2 xserver_xorg-server
> pango/pango.mk: PANGO_DEPENDENCIES += xserver_xorg-server
> pcmanfm/pcmanfm.mk:PCMANFM_DEPENDENCIES = host-pkg-config libgtk2 gamin startup-notification xserver_xorg-server
> sdl/sdl.mk:SDL_DEPENDENCIES += xserver_xorg-server
> synergy/synergy.mk:SYNERGY_DEPENDENCIES = xserver_xorg-server xlib_libXtst
> torsmo/torsmo.mk:TORSMO_DEPENDENCIES = xserver_xorg-server
> webkit/webkit.mk:       WEBKIT_DEPENDENCIES += xserver_xorg-server xlib_libXt
> 
> I don't think any of these actually require the X.org server to be built.

As far as I understand the dependencies should look like this:

for ImLib2

depends on BR2_PACKAGE_XORG7 /* because it is some kind of subsystem */
select BR2_PACKAGE_XLIB_LIBX11
select BR2_PACKAGE_XLIB_LIBXEXT

for feh

depends on BR2_PACKAGE_XORG7 /* because it is some kind of subsystem */
select BR2_PACKAGE_XLIB_LIBXINERAMA
select BR2_PACKAGE_XLIB_LIBXT

Do we agree on this scheme?

Yegor
