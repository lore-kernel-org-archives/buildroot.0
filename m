From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Fri, 11 Jul 2008 01:02:29 -0700 (PDT)
Subject: [Buildroot] Makefile.autotools.in problems
In-Reply-To: <48760F3F.6030406@atmel.com>
References: <18377517.post@talk.nabble.com>
	<87y74aqiyy.fsf@macbook.be.48ers.dk> <48760F3F.6030406@atmel.com>
Message-ID: <18398681.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I have searched for all packages that use the AUTOTOOLS system and then
looked at those that have patches as well.  The list is below:

ace_of_penguins/ace_of_penguins.mk:$(eval $(call
AUTOTARGETS,package,ace_of_penguins))
beecrypt/beecrypt.mk:$(eval $(call AUTOTARGETS,package,beecrypt))
blackbox/blackbox.mk:$(eval $(call AUTOTARGETS,package,blackbox))
docker/docker.mk:$(eval $(call AUTOTARGETS,package,docker))
festival/festival/festival.mk:$(eval $(call
AUTOTARGETS,package/festival,festival))
festival/speech-tools/speech-tools.mk:$(eval $(call
AUTOTARGETS,package/festival,speech-tools))
fltk/fltk.mk:$(eval $(call AUTOTARGETS,package,fltk))
gamin/gamin.mk:$(eval $(call AUTOTARGETS,package,gamin))
gnuchess/gnuchess.mk:$(eval $(call AUTOTARGETS,package,gnuchess))
gqview/gqview.mk:$(eval $(call AUTOTARGETS,package,gqview))
ifplugd/ifplugd.mk:$(eval $(call AUTOTARGETS,package,ifplugd))
libglib2/libglib2.mk:$(eval $(call AUTOTARGETS,package,libglib2))
libgtk2/libgtk2.mk:$(eval $(call AUTOTARGETS,package,libgtk2))
lite/lite.mk:$(eval $(call AUTOTARGETS,package,lite))
lxdoom/lxdoom.mk:$(eval $(call AUTOTARGETS,package,lxdoom))
magiccube4d/magiccube4d.mk:$(eval $(call AUTOTARGETS,package,magiccube4d))
midori/midori.mk:$(eval $(call AUTOTARGETS,package,midori))
ng-spice-rework/ng-spice-rework.mk:$(eval $(call
AUTOTARGETS,package,ng-spice-rework))
pango/pango.mk:$(eval $(call AUTOTARGETS,package,pango))
popt/popt.mk:$(eval $(call AUTOTARGETS,package,popt))
rpm/rpm.mk:$(eval $(call AUTOTARGETS,package,rpm))
rubix/rubix.mk:$(eval $(call AUTOTARGETS,package,rubix))
screen/screen.mk:$(eval $(call AUTOTARGETS,package,screen))
sylpheed/sylpheed.mk:$(eval $(call AUTOTARGETS,package,sylpheed))
vice/vice.mk:$(eval $(call AUTOTARGETS,package,vice))
webkit/webkit.mk:$(eval $(call AUTOTARGETS,package,webkit))
x11r7/pixman/pixman.mk:$(eval $(call AUTOTARGETS,package/x11r7,pixman))
x11r7/xapp_xauth/xapp_xauth.mk:$(eval $(call
AUTOTARGETS,package/x11r7,xapp_xauth))
x11r7/xapp_xrandr/xapp_xrandr.mk:$(eval $(call
AUTOTARGETS,package/x11r7,xapp_xrandr))
x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk:$(eval $(call
AUTOTARGETS,package/x11r7,xdriver_xf86-input-evdev))
x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk:$(eval
$(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-synaptics))
x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk:$(eval $(call
AUTOTARGETS,package/x11r7,xdriver_xf86-video-ati))
x11r7/xdriver_xf86-video-cyrix/xdriver_xf86-video-cyrix.mk:$(eval $(call
AUTOTARGETS,package/x11r7,xdriver_xf86-video-cyrix))
x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk:$(eval $(call
AUTOTARGETS,package/x11r7,xdriver_xf86-video-glint))
x11r7/xdriver_xf86-video-i810/xdriver_xf86-video-i810.mk:$(eval $(call
AUTOTARGETS,package/x11r7,xdriver_xf86-video-i810))
x11r7/xdriver_xf86-video-imstt/xdriver_xf86-video-imstt.mk:$(eval $(call
AUTOTARGETS,package/x11r7,xdriver_xf86-video-imstt))
x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk:$(eval $(call
AUTOTARGETS,package/x11r7,xdriver_xf86-video-intel))
x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk:$(eval $(call
AUTOTARGETS,package/x11r7,xdriver_xf86-video-mga))
x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk:$(eval $(call
AUTOTARGETS,package/x11r7,xdriver_xf86-video-newport))
x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk:$(eval $(call
AUTOTARGETS,package/x11r7,xdriver_xf86-video-savage))
x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk:$(eval $(call
AUTOTARGETS,package/x11r7,xdriver_xf86-video-sis))
x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk:$(eval $(call
AUTOTARGETS,package/x11r7,xdriver_xf86-video-sunffb))
x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk:$(eval $(call
AUTOTARGETS,package/x11r7,xdriver_xf86-video-tdfx))
x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk:$(eval $(call
AUTOTARGETS,package/x11r7,xdriver_xf86-video-tga))
x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk:$(eval $(call
AUTOTARGETS,package/x11r7,xdriver_xf86-video-vesa))
x11r7/xdriver_xf86-video-via/xdriver_xf86-video-via.mk:$(eval $(call
AUTOTARGETS,package/x11r7,xdriver_xf86-video-via))
x11r7/xfont_encodings/xfont_encodings.mk:$(eval $(call
AUTOTARGETS,package/x11r7,xfont_encodings))
x11r7/xlib_liblbxutil/xlib_liblbxutil.mk:$(eval $(call
AUTOTARGETS,package/x11r7,xlib_liblbxutil))
x11r7/xlib_libX11/xlib_libX11.mk:$(eval $(call
AUTOTARGETS,package/x11r7,xlib_libX11))x11r7/xlib_libXfontcache/xlib_libXfontcache.mk:$(eval
$(call AUTOTARGETS,package/x11r7,xlib_libXfontcache))
x11r7/xlib_libXfont/xlib_libXfont.mk:$(eval $(call
AUTOTARGETS,package/x11r7,xlib_libXfont))x11r7/xlib_libXt/xlib_libXt.mk:$(eval
$(call AUTOTARGETS,package/x11r7,xlib_libXt))
x11r7/xserver_xorg-server/xserver_xorg-server.mk:$(eval $(call
AUTOTARGETS,package/x11r7,xserver_xorg-server))
x11r7/xutil_util-macros/xutil_util-macros.mk:$(eval $(call
AUTOTARGETS,package/x11r7,xutil_util-macros))
xboard/xboard.mk:$(eval $(call AUTOTARGETS,package,xboard))
xpdf/xpdf.mk:$(eval $(call AUTOTARGETS,package,xpdf))
xvkbd/xvkbd.mk:$(eval $(call AUTOTARGETS,package,xvkbd))

These packages are the ones whose patches would have to be moved into
patch-$(VERSION) directories.
The Autotools.in could then do if -d PKG_NAME/patch-$(VERSION) then apply
those patches.
The question is should it apply a patch that is in the toplevel (i.e
package/pango/generic.patch.  If the patch applies across multiple versions?
Or should we be strict and apply patches in the top level if no version
specific patches.  If a directory called patch-$(VERSION) only apply those
patches?
I prefer the latter option

Cheers
Dan



Ulf Samuelsson-4 wrote:
> 
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Peter Korsgaard skrev:
>>>>>>> "Daniel" == Daniel Laird <daniel.j.laird@nxp.com> writes:
>> 
>> Hi,
>> 
>>  Daniel> This is only a problem as I have not deleted patches
>>  Daniel> associated with an old version.  However I wanted to raise
>>  Daniel> the issue in case it was originally planned that you could
>>  Daniel> have multiple patches in the directory for different versions
>>  Daniel> and it would apply only those patches that match.
>> 
>> Yes, the Makefile.autotools.in is kinda half baked still.
>> 
>>  Daniel> Perhaps we could have a PKG_STRICT_PATCH variable.  That if
>>  Daniel> set to true would only apply patches that match the version
>>  Daniel> string, if not set it would apply all patches.
>> 
>> That or put the patches in version specific sub directories like
>> openembedded does.
>> 
> I vote for the latter.
> 
> BR
> ulf Samuelsson
> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (GNU/Linux)
> Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org
> 
> iD8DBQFIdg8/AyRRH5cXxqwRAmzjAJ4p57bU6fsdPWkpfyFHhzdTw587agCeIAkn
> 4JGH6fXyR/gHE24lpqg5kEM=
> =EBnh
> -----END PGP SIGNATURE-----
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
> 

-- 
View this message in context: http://www.nabble.com/Makefile.autotools.in-problems-tp18377517p18398681.html
Sent from the BuildRoot mailing list archive at Nabble.com.
