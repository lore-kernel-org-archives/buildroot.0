From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Mar 2009 19:19:12 +0000 (UTC)
Subject: [Buildroot] svn commit: [25722] trunk/buildroot: docs package/atk
	package/cairo package/d etc...
Message-ID: <20090318191912.C1ED476459@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-18 19:19:10 +0000 (Wed, 18 Mar 2009)
New Revision: 25722

Log:
pkgconfig: add pkgconfig package for target

The host versions shouldn't be visible in Kconfig, so remove the
reference to BR2_PACKAGE_PKGCONFIG everywhere and prefix the host targets
with host-.

At the same time add pkgconfig for the target (E.G. for development) and
let BR2_PACKAGE_PKGCONFIG control that package.

Notice: all defconfigs in the tree have been updated, but make sure to
disable the pkgconfig package (unless you want it) if you use an external
config, otherwise you'll end up with pkgconfig and glib2 in the target.

Modified:
   trunk/buildroot/docs/buildroot.html
   trunk/buildroot/package/atk/Config.in
   trunk/buildroot/package/atk/atk.mk
   trunk/buildroot/package/cairo/Config.in
   trunk/buildroot/package/cairo/cairo.mk
   trunk/buildroot/package/dbus-glib/Config.in
   trunk/buildroot/package/dbus-glib/dbus-glib.mk
   trunk/buildroot/package/dbus/Config.in
   trunk/buildroot/package/dbus/dbus.mk
   trunk/buildroot/package/docker/Config.in
   trunk/buildroot/package/docker/docker.mk
   trunk/buildroot/package/editors/vim/Config.in
   trunk/buildroot/package/editors/vim/vim.mk
   trunk/buildroot/package/expat/Config.in
   trunk/buildroot/package/expat/expat.mk
   trunk/buildroot/package/freetype/Config.in
   trunk/buildroot/package/freetype/freetype.mk
   trunk/buildroot/package/gettext/Config.in
   trunk/buildroot/package/gettext/gettext.mk
   trunk/buildroot/package/gmpc/Config.in
   trunk/buildroot/package/gqview/Config.in
   trunk/buildroot/package/gqview/gqview.mk
   trunk/buildroot/package/hal/Config.in
   trunk/buildroot/package/hal/hal.mk
   trunk/buildroot/package/java/classpath/Config.in
   trunk/buildroot/package/java/classpath/classpath.mk
   trunk/buildroot/package/java/jamvm/Config.in
   trunk/buildroot/package/java/jamvm/jamvm.mk
   trunk/buildroot/package/libdaemon/Config.in
   trunk/buildroot/package/libdaemon/libdaemon.mk
   trunk/buildroot/package/libdrm/Config.in
   trunk/buildroot/package/libdrm/libdrm.mk
   trunk/buildroot/package/libglade/Config.in
   trunk/buildroot/package/libglade/libglade.mk
   trunk/buildroot/package/libglib2/Config.in
   trunk/buildroot/package/libglib2/libglib2.mk
   trunk/buildroot/package/libgtk2/Config.in
   trunk/buildroot/package/libgtk2/libgtk2.mk
   trunk/buildroot/package/libidn/libidn.mk
   trunk/buildroot/package/libpng/Config.in
   trunk/buildroot/package/libpng/libpng.mk
   trunk/buildroot/package/libusb/Config.in
   trunk/buildroot/package/libusb/libusb.mk
   trunk/buildroot/package/libxslt/Config.in
   trunk/buildroot/package/matchbox/Config.in
   trunk/buildroot/package/matchbox/matchbox.mk
   trunk/buildroot/package/midori/Config.in
   trunk/buildroot/package/midori/midori.mk
   trunk/buildroot/package/multimedia/gstreamer/Config.in
   trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk
   trunk/buildroot/package/multimedia/libmpd/Config.in
   trunk/buildroot/package/multimedia/libogg/Config.in
   trunk/buildroot/package/multimedia/libogg/libogg.mk
   trunk/buildroot/package/multimedia/libtheora/Config.in
   trunk/buildroot/package/multimedia/libtheora/libtheora.mk
   trunk/buildroot/package/multimedia/libvorbis/Config.in
   trunk/buildroot/package/multimedia/libvorbis/libvorbis.mk
   trunk/buildroot/package/neon/Config.in
   trunk/buildroot/package/ntfs-3g/Config.in
   trunk/buildroot/package/ntfs-3g/ntfs-3g.mk
   trunk/buildroot/package/pango/Config.in
   trunk/buildroot/package/pango/pango.mk
   trunk/buildroot/package/pcmanfm/Config.in
   trunk/buildroot/package/pcmanfm/pcmanfm.mk
   trunk/buildroot/package/pkgconfig/Config.in
   trunk/buildroot/package/pkgconfig/pkgconfig.mk
   trunk/buildroot/package/sylpheed/Config.in
   trunk/buildroot/package/sylpheed/sylpheed.mk
   trunk/buildroot/package/tiff/tiff.mk
   trunk/buildroot/package/x11r7/Config.in
   trunk/buildroot/package/x11r7/xfont_font-util/xfont_font-util.mk
   trunk/buildroot/scripts/test/Config.in.test.buildall
   trunk/buildroot/target/device/ARMLTD/integrator926/integrator926_defconfig
   trunk/buildroot/target/device/ARMLTD/integrator926_huge/integrator926_huge_defconfig
   trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
   trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_ext_bare_defconfig
   trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_ext_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/arm_toolchain_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_bare_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9260pf/at91sam9260pf_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_bare_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_bare_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_bare_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_defconfig
   trunk/buildroot/target/device/Atmel/atngw100-base/atngw100-base_defconfig
   trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig
   trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
   trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig
   trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig
   trunk/buildroot/target/device/KwikByte/kb9202/kb9202_defconfig
   trunk/buildroot/target/device/valka/v100sc2_defconfig
   trunk/buildroot/target/device/x86/i686/i386_defconfig
   trunk/buildroot/target/device/x86/i686/i686_defconfig


Changeset:

Sorry, the patch is too large to include (1369 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=25722
