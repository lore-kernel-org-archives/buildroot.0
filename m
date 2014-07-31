From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 31 Jul 2014 10:46:58 +0200
Subject: [Buildroot] [PATCH v3 1/1] package: remove the trailing slash sign
	from <PKG>_SITE variable
In-Reply-To: <1406796418-27918-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1406796418-27918-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1406796418-27918-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the trailing slash is stripped from $($(PKG)_SITE) by pkg-generic.mk:

$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE))

so it is redundant.
This patch removes it from $(PKG)_SITE variable for BR consistency.


Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
Changes v2 -> v3
  - rebase on top of the master
Changes v1 -> v2
  - change title
    from: "package: remove the trailing slash sign from the URL address"
    to:   "package: remove the trailing slash sign from $(PKG)_SITE variable"
  - add description (Arnout Vandecappelle)

 boot/at91bootstrap/at91bootstrap.mk                |    2 +-
 boot/at91dataflashboot/at91dataflashboot.mk        |    2 +-
 boot/barebox/barebox.mk                            |    2 +-
 boot/grub/grub.mk                                  |    2 +-
 boot/grub2/grub2.mk                                |    2 +-
 boot/mxs-bootlets/mxs-bootlets.mk                  |    2 +-
 boot/syslinux/syslinux.mk                          |    2 +-
 linux/linux.mk                                     |    4 ++--
 package/aespipe/aespipe.mk                         |    2 +-
 package/aiccu/aiccu.mk                             |    2 +-
 package/alsamixergui/alsamixergui.mk               |    2 +-
 package/armadillo/armadillo.mk                     |    2 +-
 package/atftp/atftp.mk                             |    2 +-
 package/atk/atk.mk                                 |    2 +-
 package/avahi/avahi.mk                             |    2 +-
 package/axel/axel.mk                               |    2 +-
 package/b43-firmware/b43-firmware.mk               |    4 ++--
 package/b43-fwcutter/b43-fwcutter.mk               |    2 +-
 package/bc/bc.mk                                   |    2 +-
 package/bcusdk/bcusdk.mk                           |    2 +-
 package/boa/boa.mk                                 |    2 +-
 package/bonnie/bonnie.mk                           |    2 +-
 package/bustle/bustle.mk                           |    2 +-
 package/bwm-ng/bwm-ng.mk                           |    2 +-
 package/ca-certificates/ca-certificates.mk         |    2 +-
 package/ccrypt/ccrypt.mk                           |    2 +-
 package/chrony/chrony.mk                           |    2 +-
 package/cloog/cloog.mk                             |    2 +-
 package/cmake/cmake.mk                             |    2 +-
 package/connman/connman.mk                         |    2 +-
 package/ctorrent/ctorrent.mk                       |    2 +-
 package/cvs/cvs.mk                                 |    2 +-
 package/dbus-python/dbus-python.mk                 |    2 +-
 package/dcron/dcron.mk                             |    2 +-
 package/dfu-util/dfu-util.mk                       |    2 +-
 package/dhcpdump/dhcpdump.mk                       |    2 +-
 package/dhrystone/dhrystone.mk                     |    2 +-
 package/distcc/distcc.mk                           |    2 +-
 package/dmidecode/dmidecode.mk                     |    2 +-
 package/doom-wad/doom-wad.mk                       |    2 +-
 package/dropwatch/dropwatch.mk                     |    2 +-
 package/dsp-tools/dsp-tools.mk                     |    2 +-
 package/efl/expedite/expedite.mk                   |    2 +-
 package/efl/libecore/libecore.mk                   |    2 +-
 package/efl/libedbus/libedbus.mk                   |    2 +-
 package/efl/libedje/libedje.mk                     |    2 +-
 package/efl/libeet/libeet.mk                       |    2 +-
 package/efl/libefreet/libefreet.mk                 |    2 +-
 package/efl/libeina/libeina.mk                     |    2 +-
 package/efl/libeio/libeio.mk                       |    2 +-
 package/efl/libelementary/libelementary.mk         |    2 +-
 package/efl/libembryo/libembryo.mk                 |    2 +-
 package/efl/libethumb/libethumb.mk                 |    2 +-
 .../libevas-generic-loaders.mk                     |    2 +-
 package/efl/libevas/libevas.mk                     |    2 +-
 package/eigen/eigen.mk                             |    2 +-
 package/enlightenment/enlightenment.mk             |    2 +-
 package/enscript/enscript.mk                       |    2 +-
 package/explorercanvas/explorercanvas.mk           |    2 +-
 package/fakeroot/fakeroot.mk                       |    2 +-
 package/fan-ctrl/fan-ctrl.mk                       |    2 +-
 package/fconfig/fconfig.mk                         |    2 +-
 package/feh/feh.mk                                 |    2 +-
 package/fetchmail/fetchmail.mk                     |    2 +-
 package/flickcurl/flickcurl.mk                     |    2 +-
 package/freescale-imx/freescale-imx.mk             |    2 +-
 package/fswebcam/fswebcam.mk                       |    2 +-
 package/ftop/ftop.mk                               |    2 +-
 package/gadgetfs-test/gadgetfs-test.mk             |    2 +-
 package/gcc/gcc.mk                                 |    4 ++--
 package/gd/gd.mk                                   |    2 +-
 package/gdb/gdb.mk                                 |    2 +-
 package/genimage/genimage.mk                       |    2 +-
 package/genpart/genpart.mk                         |    2 +-
 package/gesftpserver/gesftpserver.mk               |    2 +-
 package/giblib/giblib.mk                           |    2 +-
 package/git/git.mk                                 |    2 +-
 package/glibc/glibc.mk                             |    2 +-
 package/gnu-efi/gnu-efi.mk                         |    2 +-
 package/gpm/gpm.mk                                 |    2 +-
 package/gstreamer/gst-dsp/gst-dsp.mk               |    2 +-
 package/gstreamer/gst-omapfb/gst-omapfb.mk         |    2 +-
 .../gstreamer/gst-plugin-x170/gst-plugin-x170.mk   |    2 +-
 package/gstreamer1/gst-omx/gst-omx.mk              |    2 +-
 package/gtest/gtest.mk                             |    2 +-
 .../gtk2-theme-hicolor/gtk2-theme-hicolor.mk       |    2 +-
 package/harfbuzz/harfbuzz.mk                       |    2 +-
 package/heirloom-mailx/heirloom-mailx.mk           |    2 +-
 package/hwdata/hwdata.mk                           |    2 +-
 package/iftop/iftop.mk                             |    2 +-
 package/igh-ethercat/igh-ethercat.mk               |    2 +-
 package/imagemagick/imagemagick.mk                 |    2 +-
 package/imlib2/imlib2.mk                           |    2 +-
 package/inotify-tools/inotify-tools.mk             |    2 +-
 package/input-tools/input-tools.mk                 |    2 +-
 package/intltool/intltool.mk                       |    2 +-
 package/ipsec-tools/ipsec-tools.mk                 |    2 +-
 package/iptraf-ng/iptraf-ng.mk                     |    2 +-
 package/iputils/iputils.mk                         |    2 +-
 package/isl/isl.mk                                 |    2 +-
 package/json-c/json-c.mk                           |    2 +-
 package/kmod/kmod.mk                               |    2 +-
 package/kobs-ng/kobs-ng.mk                         |    2 +-
 package/latencytop/latencytop.mk                   |    2 +-
 package/lbreakout2/lbreakout2.mk                   |    2 +-
 package/libaio/libaio.mk                           |    2 +-
 package/libart/libart.mk                           |    2 +-
 package/libassuan/libassuan.mk                     |    2 +-
 package/libcdaudio/libcdaudio.mk                   |    2 +-
 package/libconfig/libconfig.mk                     |    2 +-
 package/libdrm/libdrm.mk                           |    2 +-
 package/libeXosip2/libeXosip2.mk                   |    2 +-
 package/libebml/libebml.mk                         |    2 +-
 package/libedit/libedit.mk                         |    2 +-
 package/libee/libee.mk                             |    2 +-
 package/libelf/libelf.mk                           |    2 +-
 package/libestr/libestr.mk                         |    2 +-
 package/libev/libev.mk                             |    2 +-
 package/libffi/libffi.mk                           |    2 +-
 package/libfribidi/libfribidi.mk                   |    2 +-
 package/libftdi/libftdi.mk                         |    2 +-
 package/libgc/libgc.mk                             |    2 +-
 package/libglade/libglade.mk                       |    2 +-
 package/libgpgme/libgpgme.mk                       |    2 +-
 package/libhid/libhid.mk                           |    2 +-
 package/libjpeg/libjpeg.mk                         |    2 +-
 package/libllcp/libllcp.mk                         |    2 +-
 package/liblockfile/liblockfile.mk                 |    2 +-
 package/libmatroska/libmatroska.mk                 |    2 +-
 package/libmbim/libmbim.mk                         |    2 +-
 package/libmbus/libmbus.mk                         |    2 +-
 package/libmodbus/libmodbus.mk                     |    2 +-
 package/libnfc/libnfc.mk                           |    2 +-
 package/libnspr/libnspr.mk                         |    2 +-
 package/libplayer/libplayer.mk                     |    2 +-
 package/libpthread-stubs/libpthread-stubs.mk       |    2 +-
 package/libpthsem/libpthsem.mk                     |    2 +-
 package/libqmi/libqmi.mk                           |    2 +-
 package/libraw/libraw.mk                           |    2 +-
 package/libroxml/libroxml.mk                       |    2 +-
 package/librsvg/librsvg.mk                         |    2 +-
 package/libsepol/libsepol.mk                       |    2 +-
 package/libsexy/libsexy.mk                         |    2 +-
 package/libsocketcan/libsocketcan.mk               |    2 +-
 package/libssh2/libssh2.mk                         |    2 +-
 package/libsvg-cairo/libsvg-cairo.mk               |    2 +-
 package/libsvg/libsvg.mk                           |    2 +-
 package/liburcu/liburcu.mk                         |    2 +-
 package/libv4l/libv4l.mk                           |    2 +-
 package/libvorbis/libvorbis.mk                     |    2 +-
 package/libxkbcommon/libxkbcommon.mk               |    2 +-
 package/libyaml/libyaml.mk                         |    2 +-
 package/linux-headers/linux-headers.mk             |    4 ++--
 package/linux-pam/linux-pam.mk                     |    2 +-
 package/live555/live555.mk                         |    2 +-
 package/lmbench/lmbench.mk                         |    2 +-
 package/localedef/localedef.mk                     |    2 +-
 package/lockdev/lockdev.mk                         |    2 +-
 package/lockfile-progs/lockfile-progs.mk           |    2 +-
 package/logrotate/logrotate.mk                     |    2 +-
 package/lsof/lsof.mk                               |    2 +-
 package/ltris/ltris.mk                             |    2 +-
 package/lttng-babeltrace/lttng-babeltrace.mk       |    2 +-
 package/lttng-libust/lttng-libust.mk               |    2 +-
 package/lttng-modules/lttng-modules.mk             |    2 +-
 package/lttng-tools/lttng-tools.mk                 |    2 +-
 package/luarocks/luarocks.mk                       |    2 +-
 package/lzip/lzip.mk                               |    2 +-
 package/lzma/lzma.mk                               |    2 +-
 package/lzop/lzop.mk                               |    2 +-
 package/memtester/memtester.mk                     |    2 +-
 package/midori/midori.mk                           |    2 +-
 package/minicom/minicom.mk                         |    2 +-
 package/modem-manager/modem-manager.mk             |    2 +-
 package/mongrel2/mongrel2.mk                       |    2 +-
 package/monit/monit.mk                             |    2 +-
 package/mpdecimal/mpdecimal.mk                     |    2 +-
 package/msgpack/msgpack.mk                         |    2 +-
 package/mtdev/mtdev.mk                             |    2 +-
 package/mtools/mtools.mk                           |    2 +-
 package/musl/musl.mk                               |    2 +-
 package/ncdu/ncdu.mk                               |    2 +-
 package/ndisc6/ndisc6.mk                           |    2 +-
 package/neon/neon.mk                               |    2 +-
 package/newt/newt.mk                               |    2 +-
 package/ngircd/ngircd.mk                           |    2 +-
 package/numactl/numactl.mk                         |    2 +-
 package/nut/nut.mk                                 |    2 +-
 package/nuttcp/nuttcp.mk                           |    2 +-
 package/on2-8170-libs/on2-8170-libs.mk             |    2 +-
 package/open2300/open2300.mk                       |    2 +-
 package/openpgm/openpgm.mk                         |    2 +-
 package/opentyrian-data/opentyrian-data.mk         |    2 +-
 package/opentyrian/opentyrian.mk                   |    2 +-
 package/orc/orc.mk                                 |    2 +-
 package/perl-datetime-tiny/perl-datetime-tiny.mk   |    2 +-
 package/perl-gd/perl-gd.mk                         |    2 +-
 package/perl-gdgraph/perl-gdgraph.mk               |    2 +-
 package/perl-gdtextutil/perl-gdtextutil.mk         |    2 +-
 package/perl-io-socket-ssl/perl-io-socket-ssl.mk   |    2 +-
 package/perl-json-tiny/perl-json-tiny.mk           |    2 +-
 package/perl-module-build/perl-module-build.mk     |    2 +-
 package/perl-mojolicious/perl-mojolicious.mk       |    2 +-
 package/perl-net-ssleay/perl-net-ssleay.mk         |    2 +-
 package/perl-path-tiny/perl-path-tiny.mk           |    2 +-
 package/perl-try-tiny/perl-try-tiny.mk             |    2 +-
 package/perl-xml-libxml/perl-xml-libxml.mk         |    2 +-
 .../perl-xml-namespacesupport.mk                   |    2 +-
 package/perl-xml-parser/perl-xml-parser.mk         |    2 +-
 package/perl-xml-sax-base/perl-xml-sax-base.mk     |    2 +-
 package/perl-xml-sax/perl-xml-sax.mk               |    2 +-
 package/picocom/picocom.mk                         |    2 +-
 package/pkgconf/pkgconf.mk                         |    2 +-
 package/polkit/polkit.mk                           |    2 +-
 package/popt/popt.mk                               |    2 +-
 package/proftpd/proftpd.mk                         |    2 +-
 package/protobuf/protobuf.mk                       |    2 +-
 package/pulseaudio/pulseaudio.mk                   |    2 +-
 package/python-cffi/python-cffi.mk                 |    2 +-
 package/python-crc16/python-crc16.mk               |    2 +-
 package/python-daemon/python-daemon.mk             |    2 +-
 package/python-ipython/python-ipython.mk           |    2 +-
 .../python-json-schema-validator.mk                |    2 +-
 package/python-keyring/python-keyring.mk           |    2 +-
 package/python-mad/python-mad.mk                   |    2 +-
 package/python-meld3/python-meld3.mk               |    2 +-
 package/python-msgpack/python-msgpack.mk           |    2 +-
 package/python-posix-ipc/python-posix-ipc.mk       |    2 +-
 package/python-pyasn/python-pyasn.mk               |    2 +-
 package/python-pyrex/python-pyrex.mk               |    2 +-
 package/python-pyro/python-pyro.mk                 |    2 +-
 package/python-pyzmq/python-pyzmq.mk               |    2 +-
 package/python-simplejson/python-simplejson.mk     |    2 +-
 package/python-versiontools/python-versiontools.mk |    2 +-
 package/qextserialport/qextserialport.mk           |    2 +-
 package/qt5/qt5.mk                                 |    2 +-
 package/read-edid/read-edid.mk                     |    2 +-
 package/rpm/rpm.mk                                 |    2 +-
 package/rsyslog/rsyslog.mk                         |    2 +-
 package/rt-tests/rt-tests.mk                       |    2 +-
 package/rtai/rtai.mk                               |    2 +-
 package/rtptools/rtptools.mk                       |    2 +-
 package/sam-ba/sam-ba.mk                           |    2 +-
 package/sane-backends/sane-backends.mk             |    2 +-
 package/sdl_gfx/sdl_gfx.mk                         |    2 +-
 package/sdl_mixer/sdl_mixer.mk                     |    2 +-
 package/sdl_sound/sdl_sound.mk                     |    2 +-
 package/sdl_ttf/sdl_ttf.mk                         |    2 +-
 package/setserial/setserial.mk                     |    2 +-
 package/sg3_utils/sg3_utils.mk                     |    2 +-
 package/simicsfs/simicsfs.mk                       |    2 +-
 package/slang/slang.mk                             |    2 +-
 package/smstools3/smstools3.mk                     |    2 +-
 package/socat/socat.mk                             |    2 +-
 package/spice-protocol/spice-protocol.mk           |    2 +-
 package/spice/spice.mk                             |    2 +-
 package/statserial/statserial.mk                   |    2 +-
 package/stunnel/stunnel.mk                         |    2 +-
 package/supervisor/supervisor.mk                   |    2 +-
 package/systemd/systemd.mk                         |    2 +-
 package/thttpd/thttpd.mk                           |    2 +-
 package/ti-gfx/ti-gfx.mk                           |    2 +-
 package/tidsp-binaries/tidsp-binaries.mk           |    2 +-
 package/transmission/transmission.mk               |    2 +-
 package/tree/tree.mk                               |    2 +-
 package/tremor/tremor.mk                           |    2 +-
 package/tstools/tstools.mk                         |    2 +-
 package/ucl/ucl.mk                                 |    2 +-
 package/udisks/udisks.mk                           |    2 +-
 package/uemacs/uemacs.mk                           |    2 +-
 package/upx/upx.mk                                 |    2 +-
 package/urg/urg.mk                                 |    2 +-
 package/ux500-firmware/ux500-firmware.mk           |    2 +-
 package/valgrind/valgrind.mk                       |    2 +-
 package/wayland/wayland.mk                         |    2 +-
 .../webrtc-audio-processing.mk                     |    2 +-
 package/weston/weston.mk                           |    2 +-
 package/whetstone/whetstone.mk                     |    2 +-
 package/x11r7/libxcb/libxcb.mk                     |    2 +-
 package/x11r7/xcb-proto/xcb-proto.mk               |    2 +-
 package/x11r7/xcb-util-image/xcb-util-image.mk     |    2 +-
 package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk |    2 +-
 package/x11r7/xcb-util-wm/xcb-util-wm.mk           |    2 +-
 package/x11r7/xcb-util/xcb-util.mk                 |    2 +-
 .../xcursor-transparent-theme.mk                   |    2 +-
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    2 +-
 package/xenomai/xenomai.mk                         |    2 +-
 package/xerces/xerces.mk                           |    2 +-
 package/xz/xz.mk                                   |    2 +-
 package/yaffs2utils/yaffs2utils.mk                 |    2 +-
 package/yasm/yasm.mk                               |    2 +-
 package/zeromq/zeromq.mk                           |    2 +-
 292 files changed, 296 insertions(+), 296 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index c5fd099..d379580 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 AT91BOOTSTRAP_VERSION = 1.16
-AT91BOOTSTRAP_SITE = ftp://www.at91.com/pub/at91bootstrap/
+AT91BOOTSTRAP_SITE = ftp://www.at91.com/pub/at91bootstrap
 AT91BOOTSTRAP_SOURCE = AT91Bootstrap$(AT91BOOTSTRAP_VERSION).zip
 
 AT91BOOTSTRAP_BOARD = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_BOARD))
diff --git a/boot/at91dataflashboot/at91dataflashboot.mk b/boot/at91dataflashboot/at91dataflashboot.mk
index 2c2b4d9..0ad8b6f 100644
--- a/boot/at91dataflashboot/at91dataflashboot.mk
+++ b/boot/at91dataflashboot/at91dataflashboot.mk
@@ -6,7 +6,7 @@
 
 AT91DATAFLASHBOOT_VERSION = 1.05
 AT91DATAFLASHBOOT_SOURCE = DataflashBoot-$(AT91DATAFLASHBOOT_VERSION).tar.bz2
-AT91DATAFLASHBOOT_SITE = ftp://www.at91.com/pub/buildroot/
+AT91DATAFLASHBOOT_SITE = ftp://www.at91.com/pub/buildroot
 
 AT91DATAFLASHBOOT_INSTALL_TARGET = NO
 AT91DATAFLASHBOOT_INSTALL_IMAGES = YES
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index f57d297..2cf4d15 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -17,7 +17,7 @@ BAREBOX_SITE_METHOD = git
 else
 # Handle stable official Barebox versions
 BAREBOX_SOURCE = barebox-$(BAREBOX_VERSION).tar.bz2
-BAREBOX_SITE = http://www.barebox.org/download/
+BAREBOX_SITE = http://www.barebox.org/download
 endif
 
 BAREBOX_DEPENDENCIES = host-lzop
diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index dc11307..55a605c 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -7,7 +7,7 @@
 GRUB_VERSION = 0.97
 GRUB_SOURCE = grub_$(GRUB_VERSION).orig.tar.gz
 GRUB_PATCH  = grub_$(GRUB_VERSION)-67.diff.gz
-GRUB_SITE   = http://snapshot.debian.org/archive/debian/20130129T225227Z/pool/main/g/grub/
+GRUB_SITE   = http://snapshot.debian.org/archive/debian/20130129T225227Z/pool/main/g/grub
 
 GRUB_LICENSE = GPLv2+
 GRUB_LICENSE_FILES = COPYING
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index db0b4e1..c6945a4 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GRUB2_VERSION = 2.00
-GRUB2_SITE = $(BR2_GNU_MIRROR)/grub/
+GRUB2_SITE = $(BR2_GNU_MIRROR)/grub
 GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
 GRUB2_LICENSE = GPLv3+
 GRUB2_LICENSE_FILES = COPYING
diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
index c0c4b3d..87a36df 100644
--- a/boot/mxs-bootlets/mxs-bootlets.mk
+++ b/boot/mxs-bootlets/mxs-bootlets.mk
@@ -14,7 +14,7 @@ else ifeq ($(BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT),y)
 	MXS_BOOTLETS_VERSION = $(call qstrip,$(BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_VERSION))
 else
 	MXS_BOOTLETS_VERSION = 10.12.01
-	MXS_BOOTLETS_SITE = http://download.ossystems.com.br/bsp/freescale/source/
+	MXS_BOOTLETS_SITE = http://download.ossystems.com.br/bsp/freescale/source
 	MXS_BOOTLETS_SOURCE = imx-bootlets-src-$(MXS_BOOTLETS_VERSION).tar.gz
 endif
 
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 51b6417..18f2243 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -6,7 +6,7 @@
 
 SYSLINUX_VERSION = 6.02
 SYSLINUX_SOURCE  = syslinux-$(SYSLINUX_VERSION).tar.xz
-SYSLINUX_SITE    = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/
+SYSLINUX_SITE    = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux
 
 SYSLINUX_LICENSE = GPLv2+
 SYSLINUX_LICENSE_FILES = COPYING
diff --git a/linux/linux.mk b/linux/linux.mk
index 6c0b272..e433e0d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -28,9 +28,9 @@ LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
 # to use the $(word) function. We support versions such as 3.1,
 # 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
 ifeq ($(findstring x2.6.,x$(LINUX_VERSION)),x2.6.)
-LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
+LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
 else
-LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x/
+LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x
 endif
 # release candidates are in testing/ subdir
 ifneq ($(findstring -rc,$(LINUX_VERSION)),)
diff --git a/package/aespipe/aespipe.mk b/package/aespipe/aespipe.mk
index ed40568..a220688 100644
--- a/package/aespipe/aespipe.mk
+++ b/package/aespipe/aespipe.mk
@@ -6,7 +6,7 @@
 
 AESPIPE_VERSION = 2.4c
 AESPIPE_SOURCE = aespipe-v$(AESPIPE_VERSION).tar.bz2
-AESPIPE_SITE = http://loop-aes.sourceforge.net/aespipe/
+AESPIPE_SITE = http://loop-aes.sourceforge.net/aespipe
 AESPIPE_LICENSE = GPL
 
 $(eval $(autotools-package))
diff --git a/package/aiccu/aiccu.mk b/package/aiccu/aiccu.mk
index d698fa7..4413f86 100644
--- a/package/aiccu/aiccu.mk
+++ b/package/aiccu/aiccu.mk
@@ -6,7 +6,7 @@
 
 AICCU_VERSION = 20070115
 AICCU_SOURCE = aiccu_$(AICCU_VERSION).tar.gz
-AICCU_SITE = http://www.sixxs.net/archive/sixxs/aiccu/unix/
+AICCU_SITE = http://www.sixxs.net/archive/sixxs/aiccu/unix
 AICCU_LICENSE = SixXS License, concise redistribution license
 AICCU_LICENSE_FILES = doc/LICENSE
 AICCU_DEPENDENCIES = gnutls
diff --git a/package/alsamixergui/alsamixergui.mk b/package/alsamixergui/alsamixergui.mk
index 8f05350..c762543 100644
--- a/package/alsamixergui/alsamixergui.mk
+++ b/package/alsamixergui/alsamixergui.mk
@@ -6,7 +6,7 @@
 
 ALSAMIXERGUI_VERSION = 0.9.0rc2-1
 ALSAMIXERGUI_SOURCE = alsamixergui_$(ALSAMIXERGUI_VERSION).orig.tar.gz
-ALSAMIXERGUI_SITE = http://snapshot.debian.org/archive/debian/20080319T000000Z/pool/main/a/alsamixergui/
+ALSAMIXERGUI_SITE = http://snapshot.debian.org/archive/debian/20080319T000000Z/pool/main/a/alsamixergui
 ALSAMIXERGUI_AUTORECONF = YES
 
 ALSAMIXERGUI_CONF_ENV = ac_cv_lib_fltk_numericsort=yes \
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index b2cfdfc..58b8fc1 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -6,7 +6,7 @@
 
 ARMADILLO_VERSION_MAJOR = 4.000
 ARMADILLO_VERSION = $(ARMADILLO_VERSION_MAJOR).4
-ARMADILLO_SITE = http://downloads.sourceforge.net/project/arma/
+ARMADILLO_SITE = http://downloads.sourceforge.net/project/arma
 ARMADILLO_DEPENDENCIES = clapack
 ARMADILLO_INSTALL_STAGING = YES
 ARMADILLO_LICENSE = MPLv2.0
diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
index a018b9d..d2ba845 100644
--- a/package/atftp/atftp.mk
+++ b/package/atftp/atftp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ATFTP_VERSION  = 0.7.1
-ATFTP_SITE = http://sourceforge.net/projects/atftp/files/
+ATFTP_SITE = http://sourceforge.net/projects/atftp/files
 ATFTP_LICENSE = GPLv2+
 ATFTP_LICENSE_FILES = LICENSE
 ATFTP_CONF_OPT = --disable-libwrap --disable-mtftp
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 1a8bbea..9ccdd22 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -7,7 +7,7 @@
 ATK_VERSION_MAJOR = 2.10
 ATK_VERSION = $(ATK_VERSION_MAJOR).0
 ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
-ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)/
+ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
 ATK_LICENSE = LGPLv2+
 ATK_LICENSE_FILES = COPYING
 ATK_INSTALL_STAGING = YES
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 725e96b..08364df 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -12,7 +12,7 @@
 # later version.
 
 AVAHI_VERSION = 0.6.31
-AVAHI_SITE = http://www.avahi.org/download/
+AVAHI_SITE = http://www.avahi.org/download
 AVAHI_LICENSE = LGPLv2.1+
 AVAHI_LICENSE_FILES = LICENSE
 AVAHI_INSTALL_STAGING = YES
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index ea97d75..80c5d17 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 AXEL_VERSION = 2.4
-AXEL_SITE = http://sources.buildroot.net/
+AXEL_SITE = http://sources.buildroot.net
 AXEL_LICENSE = GPLv2+
 AXEL_LICENSE_FILES = COPYING
 
diff --git a/package/b43-firmware/b43-firmware.mk b/package/b43-firmware/b43-firmware.mk
index 5d036e0..601ab66 100644
--- a/package/b43-firmware/b43-firmware.mk
+++ b/package/b43-firmware/b43-firmware.mk
@@ -6,12 +6,12 @@
 
 ifeq ($(BR2_PACKAGE_B43_FIRMWARE_KERNEL_AFTER_3_2),y)
 B43_FIRMWARE_VERSION = 5.100.138
-B43_FIRMWARE_SITE = http://www.lwfinger.com/b43-firmware/
+B43_FIRMWARE_SITE = http://www.lwfinger.com/b43-firmware
 B43_FIRMWARE_SOURCE = broadcom-wl-$(B43_FIRMWARE_VERSION).tar.bz2
 B43_FIRMWARE_DRIVER_FILE = linux/wl_apsta.o
 else ifeq ($(BR2_PACKAGE_B43_FIRMWARE_KERNEL_BEFORE_3_2),y)
 B43_FIRMWARE_VERSION = 5.10.56.27.3
-B43_FIRMWARE_SITE = http://mirror2.openwrt.org/sources/
+B43_FIRMWARE_SITE = http://mirror2.openwrt.org/sources
 B43_FIRMWARE_SOURCE = broadcom-wl-$(B43_FIRMWARE_VERSION)_mipsel.tar.bz2
 B43_FIRMWARE_DRIVER_FILE = driver/wl_apsta/wl_prebuilt.o
 endif
diff --git a/package/b43-fwcutter/b43-fwcutter.mk b/package/b43-fwcutter/b43-fwcutter.mk
index bc11c0b..d264b64 100644
--- a/package/b43-fwcutter/b43-fwcutter.mk
+++ b/package/b43-fwcutter/b43-fwcutter.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 B43_FWCUTTER_VERSION = 015
-B43_FWCUTTER_SITE = http://bues.ch/b43/fwcutter/
+B43_FWCUTTER_SITE = http://bues.ch/b43/fwcutter
 B43_FWCUTTER_SOURCE = b43-fwcutter-$(B43_FWCUTTER_VERSION).tar.bz2
 B43_FWCUTTER_LICENSE = BSD-2c
 B43_FWCUTTER_LICENSE_FILES = COPYING
diff --git a/package/bc/bc.mk b/package/bc/bc.mk
index 293b80d..60530bd 100644
--- a/package/bc/bc.mk
+++ b/package/bc/bc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BC_VERSION = 1.06
-BC_SITE = $(BR2_GNU_MIRROR)/bc/
+BC_SITE = $(BR2_GNU_MIRROR)/bc
 BC_DEPENDENCIES = host-flex
 BC_LICENSE = GPLv2+ LGPLv2.1+
 BC_LICENSE_FILES = COPYING COPYING.LIB
diff --git a/package/bcusdk/bcusdk.mk b/package/bcusdk/bcusdk.mk
index 880b7d9..d551131 100644
--- a/package/bcusdk/bcusdk.mk
+++ b/package/bcusdk/bcusdk.mk
@@ -6,7 +6,7 @@
 
 BCUSDK_VERSION = 0.0.5
 BCUSDK_SOURCE = bcusdk_$(BCUSDK_VERSION).tar.gz
-BCUSDK_SITE = http://www.auto.tuwien.ac.at/~mkoegler/eib/
+BCUSDK_SITE = http://www.auto.tuwien.ac.at/~mkoegler/eib
 BCUSDK_LICENSE = GPLv2+
 BCUSDK_LICENSE_FILES = COPYING
 BCUSDK_INSTALL_STAGING = YES
diff --git a/package/boa/boa.mk b/package/boa/boa.mk
index 63a7569..ab23d90 100644
--- a/package/boa/boa.mk
+++ b/package/boa/boa.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BOA_VERSION = 0.94.14rc21
-BOA_SITE = http://www.boa.org/
+BOA_SITE = http://www.boa.org
 BOA_LICENSE = GPLv2+
 BOA_LICENSE_FILES = COPYING
 
diff --git a/package/bonnie/bonnie.mk b/package/bonnie/bonnie.mk
index b584b2a..787d180 100644
--- a/package/bonnie/bonnie.mk
+++ b/package/bonnie/bonnie.mk
@@ -6,7 +6,7 @@
 
 BONNIE_VERSION = 1.03e
 BONNIE_SOURCE = bonnie++-$(BONNIE_VERSION).tgz
-BONNIE_SITE = http://www.coker.com.au/bonnie++/
+BONNIE_SITE = http://www.coker.com.au/bonnie++
 BONNIE_LICENSE = GPLv2
 BONNIE_LICENSE_FILES = copyright.txt
 
diff --git a/package/bustle/bustle.mk b/package/bustle/bustle.mk
index 9222cdb..9943db5 100644
--- a/package/bustle/bustle.mk
+++ b/package/bustle/bustle.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BUSTLE_VERSION = 0.4.3
-BUSTLE_SITE = http://www.willthompson.co.uk/bustle/releases/$(BUSTLE_VERSION)/
+BUSTLE_SITE = http://www.willthompson.co.uk/bustle/releases/$(BUSTLE_VERSION)
 BUSTLE_LICENSE = LGPLv2.1+
 BUSTLE_LICENSE_FILES = LICENSE
 BUSTLE_DEPENDENCIES = libglib2 libpcap host-pkgconf
diff --git a/package/bwm-ng/bwm-ng.mk b/package/bwm-ng/bwm-ng.mk
index b7dc8b2..a9baafe 100644
--- a/package/bwm-ng/bwm-ng.mk
+++ b/package/bwm-ng/bwm-ng.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BWM_NG_VERSION = 0.6
-BWM_NG_SITE = http://downloads.sourceforge.net/project/bwmng/bwmng/$(BWM_NG_VERSION)/
+BWM_NG_SITE = http://downloads.sourceforge.net/project/bwmng/bwmng/$(BWM_NG_VERSION)
 BWM_NG_CONF_OPT = --with-procnetdev --with-diskstats
 BWM_NG_LICENSE = GPLv2
 BWM_NG_LICENSE_FILES = COPYING
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index f7c27bd..cd6a7f2 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -6,7 +6,7 @@
 
 CA_CERTIFICATES_VERSION = 20140223
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
-CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20140325T163435Z/pool/main/c/ca-certificates/
+CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20140325T163435Z/pool/main/c/ca-certificates
 CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python
 CA_CERTIFICATES_LICENSE = GPLv2+ (script), MPLv2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
diff --git a/package/ccrypt/ccrypt.mk b/package/ccrypt/ccrypt.mk
index bd48638..3beff40 100644
--- a/package/ccrypt/ccrypt.mk
+++ b/package/ccrypt/ccrypt.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CCRYPT_VERSION = 1.10
-CCRYPT_SITE = http://ccrypt.sourceforge.net/download/
+CCRYPT_SITE = http://ccrypt.sourceforge.net/download
 
 CCRYPT_LICENSE = GPLv2+
 CCRYPT_LICENSE_FILES = COPYING
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index edb5c24..09a4a1e 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CHRONY_VERSION = 1.29.1
-CHRONY_SITE = http://download.tuxfamily.org/chrony/
+CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPLv2
 CHRONY_LICENSE_FILES = COPYING
 
diff --git a/package/cloog/cloog.mk b/package/cloog/cloog.mk
index 2dc96c4..75a4903 100644
--- a/package/cloog/cloog.mk
+++ b/package/cloog/cloog.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CLOOG_VERSION = 0.18.2
-CLOOG_SITE = http://www.bastoul.net/cloog/pages/download/
+CLOOG_SITE = http://www.bastoul.net/cloog/pages/download
 CLOOG_LICENSE = LGPLv2.1+
 CLOOG_DEPENDENCIES = gmp isl
 # Our libtool patch doesn't apply, and since this package is only
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index ee49e80..6987f09 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 CMAKE_VERSION_MAJOR = 2.8
 CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).12.2
-CMAKE_SITE = http://www.cmake.org/files/v$(CMAKE_VERSION_MAJOR)/
+CMAKE_SITE = http://www.cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
 
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index fb698c4..9b5d15f 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -6,7 +6,7 @@
 
 CONNMAN_VERSION = 1.23
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
-CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman/
+CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables
 CONNMAN_INSTALL_STAGING = YES
 CONNMAN_LICENSE = GPLv2
diff --git a/package/ctorrent/ctorrent.mk b/package/ctorrent/ctorrent.mk
index de28dd7..de2dfd6 100644
--- a/package/ctorrent/ctorrent.mk
+++ b/package/ctorrent/ctorrent.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CTORRENT_VERSION = dnh3.3.2
-CTORRENT_SITE = http://www.rahul.net/dholmes/ctorrent/
+CTORRENT_SITE = http://www.rahul.net/dholmes/ctorrent
 CTORRENT_LICENSE = GPLv2
 CTORRENT_LICENSE_FILES = COPYING
 
diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index 596eabf..416f9b8 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -7,7 +7,7 @@
 CVS_VERSION = 1.12.13
 CVS_SOURCE = cvs_$(CVS_VERSION).orig.tar.gz
 CVS_PATCH = cvs_$(CVS_VERSION)-12.diff.gz
-CVS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/c/cvs/
+CVS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/c/cvs
 CVS_DEPENDENCIES = ncurses
 
 CVS_CONF_ENV = cvs_cv_func_printf_ptr=yes
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index 930eb2c..410884e 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DBUS_PYTHON_VERSION = 1.2.0
-DBUS_PYTHON_SITE = http://dbus.freedesktop.org/releases/dbus-python/
+DBUS_PYTHON_SITE = http://dbus.freedesktop.org/releases/dbus-python
 DBUS_PYTHON_INSTALL_STAGING = YES
 DBUS_PYTHON_LICENSE = MIT
 DBUS_PYTHON_LICENSE_FILES = COPYING
diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
index 8892b96..fcb585d 100644
--- a/package/dcron/dcron.mk
+++ b/package/dcron/dcron.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DCRON_VERSION = 4.5
-DCRON_SITE = http://www.jimpryor.net/linux/releases/
+DCRON_SITE = http://www.jimpryor.net/linux/releases
 # The source code does not specify the version of the GPL that is used.
 DCRON_LICENSE = GPL
 
diff --git a/package/dfu-util/dfu-util.mk b/package/dfu-util/dfu-util.mk
index e960a92..62d1ad9 100644
--- a/package/dfu-util/dfu-util.mk
+++ b/package/dfu-util/dfu-util.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DFU_UTIL_VERSION = 0.6
-DFU_UTIL_SITE = http://dfu-util.gnumonks.org/releases/
+DFU_UTIL_SITE = http://dfu-util.gnumonks.org/releases
 DFU_UTIL_LICENSE = GPLv2+
 DFU_UTIL_LICENSE_FILES = COPYING
 
diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
index 76b9def..64ea532 100644
--- a/package/dhcpdump/dhcpdump.mk
+++ b/package/dhcpdump/dhcpdump.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DHCPDUMP_VERSION = 1.8
-DHCPDUMP_SITE  = http://www.mavetju.org/download/
+DHCPDUMP_SITE  = http://www.mavetju.org/download
 DHCPDUMP_DEPENDENCIES = libpcap
 DHCPDUMP_LICENSE = BSD-2c
 DHCPDUMP_LICENSE_FILES = LICENSE
diff --git a/package/dhrystone/dhrystone.mk b/package/dhrystone/dhrystone.mk
index 856dff1..c0bca98 100644
--- a/package/dhrystone/dhrystone.mk
+++ b/package/dhrystone/dhrystone.mk
@@ -6,7 +6,7 @@
 
 DHRYSTONE_VERSION = 2
 DHRYSTONE_SOURCE = dhry-c
-DHRYSTONE_SITE = http://www.netlib.org/benchmark/
+DHRYSTONE_SITE = http://www.netlib.org/benchmark
 
 define DHRYSTONE_EXTRACT_CMDS
 	(cd $(@D) && $(SHELL) $(DL_DIR)/$($(PKG)_SOURCE))
diff --git a/package/distcc/distcc.mk b/package/distcc/distcc.mk
index 56f8ff8..023f18d 100644
--- a/package/distcc/distcc.mk
+++ b/package/distcc/distcc.mk
@@ -6,7 +6,7 @@
 
 DISTCC_VERSION = 2.18.3
 DISTCC_SOURCE = distcc-$(DISTCC_VERSION).tar.bz2
-DISTCC_SITE = http://distcc.googlecode.com/files/
+DISTCC_SITE = http://distcc.googlecode.com/files
 DISTCC_CONF_OPT = --with-included-popt --without-gtk --without-gnome
 DISTCC_LICENSE = GPLv2+
 DISTCC_LICENSE_FILES = COPYING
diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
index e39d97d..d99cb23 100644
--- a/package/dmidecode/dmidecode.mk
+++ b/package/dmidecode/dmidecode.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DMIDECODE_VERSION = 2.12
-DMIDECODE_SITE    = http://download.savannah.gnu.org/releases/dmidecode/
+DMIDECODE_SITE    = http://download.savannah.gnu.org/releases/dmidecode
 DMIDECODE_LICENSE = GPLv2+
 DMIDECODE_LICENSE_FILES = LICENSE
 
diff --git a/package/doom-wad/doom-wad.mk b/package/doom-wad/doom-wad.mk
index 41d8c97..6f4f9da 100644
--- a/package/doom-wad/doom-wad.mk
+++ b/package/doom-wad/doom-wad.mk
@@ -6,7 +6,7 @@
 
 DOOM_WAD_VERSION = 1.8
 DOOM_WAD_SOURCE = doom-$(DOOM_WAD_VERSION).wad.gz
-DOOM_WAD_SITE = ftp://ftp.idsoftware.com/idstuff/doom/
+DOOM_WAD_SITE = ftp://ftp.idsoftware.com/idstuff/doom
 
 define DOOM_WAD_EXTRACT_CMDS
 	$(ZCAT) $(DL_DIR)/$($(PKG)_SOURCE) > $(@D)/doom1.wad
diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
index 2825580..9c05845 100644
--- a/package/dropwatch/dropwatch.mk
+++ b/package/dropwatch/dropwatch.mk
@@ -6,7 +6,7 @@
 
 DROPWATCH_VERSION = 1.4
 DROPWATCH_SOURCE = dropwatch-$(DROPWATCH_VERSION).tar.xz
-DROPWATCH_SITE = https://git.fedorahosted.org/cgit/dropwatch.git/snapshot/
+DROPWATCH_SITE = https://git.fedorahosted.org/cgit/dropwatch.git/snapshot
 DROPWATCH_DEPENDENCIES = binutils libnl readline host-pkgconf
 DROPWATCH_LICENSE = GPLv2
 DROPWATCH_LICENSE_FILES = COPYING
diff --git a/package/dsp-tools/dsp-tools.mk b/package/dsp-tools/dsp-tools.mk
index c9f432c..64490b8 100644
--- a/package/dsp-tools/dsp-tools.mk
+++ b/package/dsp-tools/dsp-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DSP_TOOLS_VERSION = 2.0
-DSP_TOOLS_SITE = http://gst-dsp.googlecode.com/files/
+DSP_TOOLS_SITE = http://gst-dsp.googlecode.com/files
 DSP_TOOLS_DEPENDENCIES = tidsp-binaries
 DSP_TOOLS_LICENSE = LGPLv2.1
 DSP_TOOLS_LICENSE_FILES = LICENSE
diff --git a/package/efl/expedite/expedite.mk b/package/efl/expedite/expedite.mk
index dfd3a4a..f0361bf 100644
--- a/package/efl/expedite/expedite.mk
+++ b/package/efl/expedite/expedite.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 EXPEDITE_VERSION = $(EFL_VERSION)
-EXPEDITE_SITE = http://download.enlightenment.org/releases/
+EXPEDITE_SITE = http://download.enlightenment.org/releases
 EXPEDITE_LICENSE = BSD-2c
 EXPEDITE_LICENSE_FILES = COPYING
 
diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
index 98496ac..101fad4 100644
--- a/package/efl/libecore/libecore.mk
+++ b/package/efl/libecore/libecore.mk
@@ -6,7 +6,7 @@
 
 LIBECORE_VERSION = $(EFL_VERSION)
 LIBECORE_SOURCE = ecore-$(LIBECORE_VERSION).tar.bz2
-LIBECORE_SITE = http://download.enlightenment.org/releases/
+LIBECORE_SITE = http://download.enlightenment.org/releases
 LIBECORE_LICENSE = BSD-2c
 LIBECORE_LICENSE_FILES = COPYING
 
diff --git a/package/efl/libedbus/libedbus.mk b/package/efl/libedbus/libedbus.mk
index e6f9b08..c5e76c2 100644
--- a/package/efl/libedbus/libedbus.mk
+++ b/package/efl/libedbus/libedbus.mk
@@ -6,7 +6,7 @@
 
 LIBEDBUS_VERSION = $(EFL_VERSION)
 LIBEDBUS_SOURCE = e_dbus-$(LIBEDBUS_VERSION).tar.bz2
-LIBEDBUS_SITE = http://download.enlightenment.org/releases/
+LIBEDBUS_SITE = http://download.enlightenment.org/releases
 LIBEDBUS_LICENSE = BSD-2c
 LIBEDBUS_LICENSE_FILES = COPYING
 
diff --git a/package/efl/libedje/libedje.mk b/package/efl/libedje/libedje.mk
index 12d1999..52e54e0 100644
--- a/package/efl/libedje/libedje.mk
+++ b/package/efl/libedje/libedje.mk
@@ -6,7 +6,7 @@
 
 LIBEDJE_VERSION = $(EFL_VERSION)
 LIBEDJE_SOURCE = edje-$(LIBEDJE_VERSION).tar.bz2
-LIBEDJE_SITE =  http://download.enlightenment.org/releases/
+LIBEDJE_SITE =  http://download.enlightenment.org/releases
 LIBEDJE_LICENSE = GPLv2+ (epp binary), BSD-2c (everything else)
 LIBEDJE_LICENSE_FILES = COPYING
 
diff --git a/package/efl/libeet/libeet.mk b/package/efl/libeet/libeet.mk
index ee33a0d..455ea43 100644
--- a/package/efl/libeet/libeet.mk
+++ b/package/efl/libeet/libeet.mk
@@ -6,7 +6,7 @@
 
 LIBEET_VERSION = $(EFL_VERSION)
 LIBEET_SOURCE = eet-$(LIBEET_VERSION).tar.bz2
-LIBEET_SITE = http://download.enlightenment.org/releases/
+LIBEET_SITE = http://download.enlightenment.org/releases
 LIBEET_LICENSE = BSD-2c
 LIBEET_LICENSE_FILES = COPYING
 
diff --git a/package/efl/libefreet/libefreet.mk b/package/efl/libefreet/libefreet.mk
index 27b8fa2..670bbb5 100644
--- a/package/efl/libefreet/libefreet.mk
+++ b/package/efl/libefreet/libefreet.mk
@@ -6,7 +6,7 @@
 
 LIBEFREET_VERSION = $(EFL_VERSION)
 LIBEFREET_SOURCE = efreet-$(LIBEFREET_VERSION).tar.bz2
-LIBEFREET_SITE = http://download.enlightenment.org/releases/
+LIBEFREET_SITE = http://download.enlightenment.org/releases
 LIBEFREET_LICENSE = BSD-2c
 LIBEFREET_LICENSE_FILES = COPYING
 
diff --git a/package/efl/libeina/libeina.mk b/package/efl/libeina/libeina.mk
index 1a11ae0..5b288dd 100644
--- a/package/efl/libeina/libeina.mk
+++ b/package/efl/libeina/libeina.mk
@@ -6,7 +6,7 @@
 
 LIBEINA_VERSION = $(EFL_VERSION)
 LIBEINA_SOURCE = eina-$(LIBEINA_VERSION).tar.bz2
-LIBEINA_SITE = http://download.enlightenment.org/releases/
+LIBEINA_SITE = http://download.enlightenment.org/releases
 LIBEINA_LICENSE = LGPLv2.1+
 LIBEINA_LICENSE_FILES = COPYING
 
diff --git a/package/efl/libeio/libeio.mk b/package/efl/libeio/libeio.mk
index 65d2a32..6109f94 100644
--- a/package/efl/libeio/libeio.mk
+++ b/package/efl/libeio/libeio.mk
@@ -6,7 +6,7 @@
 
 LIBEIO_VERSION = $(EFL_VERSION)
 LIBEIO_SOURCE = eio-$(LIBEIO_VERSION).tar.bz2
-LIBEIO_SITE = http://download.enlightenment.org/releases/
+LIBEIO_SITE = http://download.enlightenment.org/releases
 LIBEIO_LICENSE = LGPLv2.1
 LIBEIO_LICENSE_FILES = COPYING
 
diff --git a/package/efl/libelementary/libelementary.mk b/package/efl/libelementary/libelementary.mk
index 82a8c1c..0b2141e 100644
--- a/package/efl/libelementary/libelementary.mk
+++ b/package/efl/libelementary/libelementary.mk
@@ -6,7 +6,7 @@
 
 LIBELEMENTARY_VERSION = $(EFL_VERSION)
 LIBELEMENTARY_SOURCE = elementary-$(LIBELEMENTARY_VERSION).tar.bz2
-LIBELEMENTARY_SITE = http://download.enlightenment.org/releases/
+LIBELEMENTARY_SITE = http://download.enlightenment.org/releases
 LIBELEMENTARY_LICENSE = LGPLv2.1
 LIBELEMENTARY_LICENSE_FILES = COPYING
 
diff --git a/package/efl/libembryo/libembryo.mk b/package/efl/libembryo/libembryo.mk
index 727c424..ebbf0b2 100644
--- a/package/efl/libembryo/libembryo.mk
+++ b/package/efl/libembryo/libembryo.mk
@@ -6,7 +6,7 @@
 
 LIBEMBRYO_VERSION = $(EFL_VERSION)
 LIBEMBRYO_SOURCE = embryo-$(LIBEMBRYO_VERSION).tar.bz2
-LIBEMBRYO_SITE = http://download.enlightenment.org/releases/
+LIBEMBRYO_SITE = http://download.enlightenment.org/releases
 LIBEMBRYO_LICENSE = BSD-2c, Embryo license
 LIBEMBRYO_LICENSE_FILES = COPYING
 
diff --git a/package/efl/libethumb/libethumb.mk b/package/efl/libethumb/libethumb.mk
index 62ce752..67231f0 100644
--- a/package/efl/libethumb/libethumb.mk
+++ b/package/efl/libethumb/libethumb.mk
@@ -6,7 +6,7 @@
 
 LIBETHUMB_VERSION = $(EFL_VERSION)
 LIBETHUMB_SOURCE = ethumb-$(LIBETHUMB_VERSION).tar.bz2
-LIBETHUMB_SITE = http://download.enlightenment.org/releases/
+LIBETHUMB_SITE = http://download.enlightenment.org/releases
 LIBETHUMB_LICENSE = LGPLv2.1+
 LIBETHUMB_LICENSE_FILES = COPYING
 
diff --git a/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk b/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
index 6de7d64..152a75b 100644
--- a/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
+++ b/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
@@ -6,7 +6,7 @@
 
 LIBEVAS_GENERIC_LOADERS_VERSION = $(EFL_VERSION)
 LIBEVAS_GENERIC_LOADERS_SOURCE = evas_generic_loaders-$(LIBEVAS_GENERIC_LOADERS_VERSION).tar.bz2
-LIBEVAS_GENERIC_LOADERS_SITE = http://download.enlightenment.org/releases/
+LIBEVAS_GENERIC_LOADERS_SITE = http://download.enlightenment.org/releases
 LIBEVAS_GENERIC_LOADERS_LICENSE = GPLv2
 LIBEVAS_GENERIC_LOADERS_LICENSE_FILES = COPYING
 
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 71f1aeb..003c844 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -6,7 +6,7 @@
 
 LIBEVAS_VERSION = $(EFL_VERSION)
 LIBEVAS_SOURCE = evas-$(LIBEVAS_VERSION).tar.bz2
-LIBEVAS_SITE = http://download.enlightenment.org/releases/
+LIBEVAS_SITE = http://download.enlightenment.org/releases
 LIBEVAS_LICENSE = BSD-2c
 LIBEVAS_LICENSE_FILES = COPYING
 
diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index 7fd3187..2bb118b 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -6,7 +6,7 @@
 
 # version 3.2
 EIGEN_VERSION = ffa86ffb5570
-EIGEN_SITE    = https://bitbucket.org/eigen/eigen/
+EIGEN_SITE    = https://bitbucket.org/eigen/eigen
 EIGEN_SITE_METHOD = hg
 EIGEN_LICENSE = MPL2, BSD-3c, LGPLv2.1
 EIGEN_LICENSE_FILES = COPYING.MPL2 COPYING.BSD COPYING.LGPL COPYING.README
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index b6fa62f..389636d 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ENLIGHTENMENT_VERSION = 0.17.3
-ENLIGHTENMENT_SITE = http://download.enlightenment.org/releases/
+ENLIGHTENMENT_SITE = http://download.enlightenment.org/releases
 ENLIGHTENMENT_LICENSE = BSD-2c
 ENLIGHTENMENT_LICENSE_FILES = COPYING
 
diff --git a/package/enscript/enscript.mk b/package/enscript/enscript.mk
index 3b15d55..1712560 100644
--- a/package/enscript/enscript.mk
+++ b/package/enscript/enscript.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ENSCRIPT_VERSION = 1.6.6
-ENSCRIPT_SITE = $(BR2_GNU_MIRROR)/enscript/
+ENSCRIPT_SITE = $(BR2_GNU_MIRROR)/enscript
 ENSCRIPT_LICENSE = GPLv3+
 ENSCRIPT_LICENSE_FILES = COPYING
 
diff --git a/package/explorercanvas/explorercanvas.mk b/package/explorercanvas/explorercanvas.mk
index c360e96..e45621b 100644
--- a/package/explorercanvas/explorercanvas.mk
+++ b/package/explorercanvas/explorercanvas.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 EXPLORERCANVAS_VERSION = r3
-EXPLORERCANVAS_SITE = http://explorercanvas.googlecode.com/files/
+EXPLORERCANVAS_SITE = http://explorercanvas.googlecode.com/files
 EXPLORERCANVAS_SOURCE = excanvas_$(EXPLORERCANVAS_VERSION).zip
 EXPLORERCANVAS_LICENSE = Apache-2.0
 EXPLORERCANVAS_LICENSE_FILES = COPYING
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index e655b8f..2f26b68 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -6,7 +6,7 @@
 
 FAKEROOT_VERSION = 1.18.2
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.bz2
-FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20111201T093630Z/pool/main/f/fakeroot/
+FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20111201T093630Z/pool/main/f/fakeroot
 FAKEROOT_LICENSE = GPLv3+
 FAKEROOT_LICENSE_FILES = COPYING
 
diff --git a/package/fan-ctrl/fan-ctrl.mk b/package/fan-ctrl/fan-ctrl.mk
index 2e8a6b0..4232286 100644
--- a/package/fan-ctrl/fan-ctrl.mk
+++ b/package/fan-ctrl/fan-ctrl.mk
@@ -7,7 +7,7 @@
 # no release, so grab .c file directly from viewvc
 FAN_CTRL_VERSION = 1.3
 FAN_CTRL_SOURCE = fan-ctrl.c?revision=$(FAN_CTRL_VERSION)
-FAN_CTRL_SITE = http://fan-ctrl.cvs.sourceforge.net/viewvc/fan-ctrl/fan-ctrl/
+FAN_CTRL_SITE = http://fan-ctrl.cvs.sourceforge.net/viewvc/fan-ctrl/fan-ctrl
 FAN_CTRL_LICENSE = GPLv2+
 FAN_CTRL_LICENSE_FILES = fan-ctrl.c
 
diff --git a/package/fconfig/fconfig.mk b/package/fconfig/fconfig.mk
index ee741d7..3a846f4 100644
--- a/package/fconfig/fconfig.mk
+++ b/package/fconfig/fconfig.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FCONFIG_VERSION = 20080329
-FCONFIG_SITE = http://andrzejekiert.ovh.org/software/fconfig/
+FCONFIG_SITE = http://andrzejekiert.ovh.org/software/fconfig
 FCONFIG_LICENSE = GPLv2+
 FCONFIG_LICENSE_FILES = fconfig.c
 
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 681fdc4..15d3218 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -6,7 +6,7 @@
 
 FEH_VERSION = 2.12
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
-FEH_SITE = http://feh.finalrewind.org/
+FEH_SITE = http://feh.finalrewind.org
 FEH_DEPENDENCIES = libcurl imlib2 libpng xlib_libXinerama xlib_libXt
 FEH_LICENSE = MIT
 FEH_LICENSE_FILES = COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 7154ea4..c2ad59a 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -7,7 +7,7 @@
 FETCHMAIL_VERSION_MAJOR = 6.3
 FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).26
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
-FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)/
+FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPLv2; some exceptions are mentioned in COPYING
 FETCHMAIL_LICENSE_FILES = COPYING
 FETCHMAIL_AUTORECONF = YES
diff --git a/package/flickcurl/flickcurl.mk b/package/flickcurl/flickcurl.mk
index 4302745..bb7d604 100644
--- a/package/flickcurl/flickcurl.mk
+++ b/package/flickcurl/flickcurl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FLICKCURL_VERSION = 1.25
-FLICKCURL_SITE = http://download.dajobe.org/flickcurl/
+FLICKCURL_SITE = http://download.dajobe.org/flickcurl
 FLICKCURL_LICENSE = LGPLv2.1+ or GPLv2+ or Apache 2.0+
 FLICKCURL_LICENSE_FILES = COPYING COPYING.LIB LICENSE-2.0.txt LICENSE.html
 FLICKCURL_INSTALL_STAGING = YES
diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
index 843ba61..64ea1f9 100644
--- a/package/freescale-imx/freescale-imx.mk
+++ b/package/freescale-imx/freescale-imx.mk
@@ -5,6 +5,6 @@
 ################################################################################
 
 FREESCALE_IMX_VERSION = 3.10.17-1.0.0
-FREESCALE_IMX_SITE    = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/
+FREESCALE_IMX_SITE    = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO
 
 include $(sort $(wildcard package/freescale-imx/*/*.mk))
diff --git a/package/fswebcam/fswebcam.mk b/package/fswebcam/fswebcam.mk
index 357341c..8cb40d6 100644
--- a/package/fswebcam/fswebcam.mk
+++ b/package/fswebcam/fswebcam.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FSWEBCAM_VERSION = 20140113
-FSWEBCAM_SITE = http://www.firestorm.cx/fswebcam/files/
+FSWEBCAM_SITE = http://www.firestorm.cx/fswebcam/files
 FSWEBCAM_LICENSE = GPLv2
 FSWEBCAM_LICENSE_FILES = LICENSE
 
diff --git a/package/ftop/ftop.mk b/package/ftop/ftop.mk
index 2220317..c8d0f93 100644
--- a/package/ftop/ftop.mk
+++ b/package/ftop/ftop.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FTOP_VERSION = 1.0
-FTOP_SITE = http://ftop.googlecode.com/files/
+FTOP_SITE = http://ftop.googlecode.com/files
 FTOP_DEPENDENCIES = ncurses
 FTOP_LICENSE = GPLv3+
 FTOP_LICENSE_FILES = COPYING
diff --git a/package/gadgetfs-test/gadgetfs-test.mk b/package/gadgetfs-test/gadgetfs-test.mk
index fe6296b..655f50a 100644
--- a/package/gadgetfs-test/gadgetfs-test.mk
+++ b/package/gadgetfs-test/gadgetfs-test.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GADGETFS_TEST_SOURCE = gadgetfs-test.tar.bz2
-GADGETFS_TEST_SITE = http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/GadgetFsTest/
+GADGETFS_TEST_SITE = http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/GadgetFsTest
 
 GADGETFS_TEST_MAKEOPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 5b60bc3..b344a14 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -16,9 +16,9 @@ GCC_SNAP_DATE = $(call qstrip,$(BR2_GCC_SNAP_DATE))
 endif
 
 ifneq ($(GCC_SNAP_DATE),)
-GCC_SITE = ftp://gcc.gnu.org/pub/gcc/snapshots/$(GCC_SNAP_DATE)/
+GCC_SITE = ftp://gcc.gnu.org/pub/gcc/snapshots/$(GCC_SNAP_DATE)
 else ifeq ($(findstring avr32,$(GCC_VERSION)),avr32)
-GCC_SITE = ftp://www.at91.com/pub/buildroot/
+GCC_SITE = ftp://www.at91.com/pub/buildroot
 else ifeq ($(BR2_arc),y)
 GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index f4d54ab..0c03ad4 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -6,7 +6,7 @@
 
 GD_VERSION = 2.1.0
 GD_SOURCE = libgd-$(GD_VERSION).tar.xz
-GD_SITE = https://bitbucket.org/libgd/gd-libgd/downloads/
+GD_SITE = https://bitbucket.org/libgd/gd-libgd/downloads
 GD_INSTALL_STAGING = YES
 GD_LICENSE = GD license
 GD_LICENSE_FILES = COPYING
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 063a7ac..8ab264b 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -20,7 +20,7 @@ GDB_FROM_GIT = y
 endif
 
 ifeq ($(GDB_VERSION),6.7.1-avr32-2.1.5)
-GDB_SITE = ftp://www.at91.com/pub/buildroot/
+GDB_SITE = ftp://www.at91.com/pub/buildroot
 endif
 
 GDB_SOURCE ?= gdb-$(GDB_VERSION).tar.bz2
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index 07d1e0c..a353c62 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -6,7 +6,7 @@
 
 GENIMAGE_VERSION        = 6
 GENIMAGE_SOURCE         = genimage-$(GENIMAGE_VERSION).tar.xz
-GENIMAGE_SITE           = http://www.pengutronix.de/software/genimage/download/
+GENIMAGE_SITE           = http://www.pengutronix.de/software/genimage/download
 GENIMAGE_DEPENDENCIES   = host-pkgconf libconfuse
 GENIMAGE_LICENSE        = GPLv2
 
diff --git a/package/genpart/genpart.mk b/package/genpart/genpart.mk
index 3c26af2..c95acaf 100644
--- a/package/genpart/genpart.mk
+++ b/package/genpart/genpart.mk
@@ -6,7 +6,7 @@
 
 GENPART_VERSION       = 1.0.2
 GENPART_SOURCE        = genpart-$(GENPART_VERSION).tar.bz2
-GENPART_SITE          = http://www.pengutronix.de/software/genpart/download/
+GENPART_SITE          = http://www.pengutronix.de/software/genpart/download
 # genpart has no license embedded in its source release.
 # However, their project page mentions:
 #   > This community portal offers an overview about our own OSS
diff --git a/package/gesftpserver/gesftpserver.mk b/package/gesftpserver/gesftpserver.mk
index 2a09927..16f70fd 100644
--- a/package/gesftpserver/gesftpserver.mk
+++ b/package/gesftpserver/gesftpserver.mk
@@ -6,7 +6,7 @@
 
 GESFTPSERVER_VERSION = 0.1
 GESFTPSERVER_SOURCE = sftpserver-$(GESFTPSERVER_VERSION).tar.gz
-GESFTPSERVER_SITE = http://www.greenend.org.uk/rjk/sftpserver/
+GESFTPSERVER_SITE = http://www.greenend.org.uk/rjk/sftpserver
 GESFTPSERVER_LICENSE = GPLv2+
 GESFTPSERVER_LICENSE_FILES = COPYING
 # forgets to link against pthread when cross compiling
diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
index c4caf27..4d40b91 100644
--- a/package/giblib/giblib.mk
+++ b/package/giblib/giblib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GIBLIB_VERSION = 1.2.4
-GIBLIB_SITE = http://linuxbrit.co.uk/downloads/
+GIBLIB_SITE = http://linuxbrit.co.uk/downloads
 GIBLIB_INSTALL_STAGING = YES
 GIBLIB_DEPENDENCIES = imlib2
 GIBLIB_AUTORECONF = YES
diff --git a/package/git/git.mk b/package/git/git.mk
index 63862f2..0cd85a6 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GIT_VERSION         = 1.8.5.4
-GIT_SITE            = http://git-core.googlecode.com/files/
+GIT_SITE            = http://git-core.googlecode.com/files
 GIT_LICENSE         = GPLv2 LGPLv2.1+
 GIT_LICENSE_FILES   = COPYING LGPL-2.1
 GIT_DEPENDENCIES    = zlib host-gettext
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index a0077d2..4cbca88 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 GLIBC_VERSION = $(call qstrip,$(BR2_GLIBC_VERSION_STRING))
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT_EGLIBC),y)
-GLIBC_SITE = http://downloads.yoctoproject.org/releases/eglibc/
+GLIBC_SITE = http://downloads.yoctoproject.org/releases/eglibc
 GLIBC_SOURCE = eglibc-$(GLIBC_VERSION).tar.bz2
 GLIBC_SRC_SUBDIR = libc
 else
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index 93c7b2c..a35a60d 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -6,7 +6,7 @@
 
 GNU_EFI_VERSION = 3.0u
 GNU_EFI_SOURCE = gnu-efi_$(GNU_EFI_VERSION).orig.tar.gz
-GNU_EFI_SITE = http://downloads.sourceforge.net/project/gnu-efi/
+GNU_EFI_SITE = http://downloads.sourceforge.net/project/gnu-efi
 GNU_EFI_INSTALL_STAGING = YES
 GNU_EFI_LICENSE = GPLv2+ (gnuefi), BSD (efilib)
 GNU_EFI_LICENSE_FILES = debian/copyright
diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
index d37b4ed..5adec43 100644
--- a/package/gpm/gpm.mk
+++ b/package/gpm/gpm.mk
@@ -6,7 +6,7 @@
 
 GPM_VERSION = 1.20.7
 GPM_SOURCE = gpm-$(GPM_VERSION).tar.bz2
-GPM_SITE = http://www.nico.schottelius.org/software/gpm/archives/
+GPM_SITE = http://www.nico.schottelius.org/software/gpm/archives
 GPM_LICENSE = GPLv2+
 GPM_LICENSE_FILES = COPYING
 GPM_INSTALL_STAGING = YES
diff --git a/package/gstreamer/gst-dsp/gst-dsp.mk b/package/gstreamer/gst-dsp/gst-dsp.mk
index 4127538..d9e202d 100644
--- a/package/gstreamer/gst-dsp/gst-dsp.mk
+++ b/package/gstreamer/gst-dsp/gst-dsp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GST_DSP_VERSION = 0.10.2
-GST_DSP_SITE = http://gst-dsp.googlecode.com/files/
+GST_DSP_SITE = http://gst-dsp.googlecode.com/files
 
 define GST_DSP_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e
diff --git a/package/gstreamer/gst-omapfb/gst-omapfb.mk b/package/gstreamer/gst-omapfb/gst-omapfb.mk
index 97b7eeb..bd545f9 100644
--- a/package/gstreamer/gst-omapfb/gst-omapfb.mk
+++ b/package/gstreamer/gst-omapfb/gst-omapfb.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GST_OMAPFB_VERSION = 1.0
-GST_OMAPFB_SITE = http://gst-dsp.googlecode.com/files/
+GST_OMAPFB_SITE = http://gst-dsp.googlecode.com/files
 
 define GST_OMAPFB_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e
diff --git a/package/gstreamer/gst-plugin-x170/gst-plugin-x170.mk b/package/gstreamer/gst-plugin-x170/gst-plugin-x170.mk
index e14d460..29929bc 100644
--- a/package/gstreamer/gst-plugin-x170/gst-plugin-x170.mk
+++ b/package/gstreamer/gst-plugin-x170/gst-plugin-x170.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GST_PLUGIN_X170_VERSION = 1.0
-GST_PLUGIN_X170_SITE = ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec/
+GST_PLUGIN_X170_SITE = ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec
 
 GST_PLUGIN_X170_LICENSE = BSD-1c
 #A license file is included but it is just a placeholder
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index 4b92584..ea5648e 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -6,7 +6,7 @@
 
 GST_OMX_VERSION = 1.0.0
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
-GST_OMX_SITE = http://gstreamer.freedesktop.org/src/gst-omx/
+GST_OMX_SITE = http://gstreamer.freedesktop.org/src/gst-omx
 
 GST_OMX_LICENSE = LGPLv2.1
 GST_OMX_LICENSE_FILES = COPYING
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index c7b2cf0..8ff4669 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -6,7 +6,7 @@
 
 GTEST_VERSION = 1.7.0
 GTEST_SOURCE = gtest-$(GTEST_VERSION).zip
-GTEST_SITE = http://googletest.googlecode.com/files/
+GTEST_SITE = http://googletest.googlecode.com/files
 GTEST_INSTALL_STAGING = YES
 GTEST_INSTALL_TARGET = NO
 GTEST_LICENSE = BSD-3c
diff --git a/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk b/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
index 24c5959..84df23f 100644
--- a/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
+++ b/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
@@ -6,7 +6,7 @@
 
 GTK2_THEME_HICOLOR_VERSION = 0.10
 GTK2_THEME_HICOLOR_SOURCE = hicolor-icon-theme-$(GTK2_THEME_HICOLOR_VERSION).tar.gz
-GTK2_THEME_HICOLOR_SITE = http://icon-theme.freedesktop.org/releases/
+GTK2_THEME_HICOLOR_SITE = http://icon-theme.freedesktop.org/releases
 GTK2_THEME_HICOLOR_DEPENDENCIES = libgtk2
 GTK2_THEME_HICOLOR_LICENSE = GPLv2
 GTK2_THEME_HICOLOR_LICENSE_FILES = COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index ed440ed..ae3a853 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HARFBUZZ_VERSION = 0.9.22
-HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release/
+HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
 HARFBUZZ_LICENSE_FILES = COPYING src/hb-ucdn/COPYING
diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
index a4d94b6..75221d4 100644
--- a/package/heirloom-mailx/heirloom-mailx.mk
+++ b/package/heirloom-mailx/heirloom-mailx.mk
@@ -6,7 +6,7 @@
 
 HEIRLOOM_MAILX_VERSION = 12.5
 HEIRLOOM_MAILX_SOURCE  = heirloom-mailx_$(HEIRLOOM_MAILX_VERSION).orig.tar.gz
-HEIRLOOM_MAILX_SITE    = http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/h/heirloom-mailx/
+HEIRLOOM_MAILX_SITE    = http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/h/heirloom-mailx
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 HEIRLOOM_MAILX_DEPENDENCIES += openssl
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 8fca346..a830263 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -7,7 +7,7 @@
 HWDATA_VERSION = 0.230
 HWDATA_SOURCE = hwdata_$(HWDATA_VERSION).orig.tar.gz
 HWDATA_PATCH = hwdata_$(HWDATA_VERSION)-1.diff.gz
-HWDATA_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/h/hwdata/
+HWDATA_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/h/hwdata
 HWDATA_LICENSE = GPLv2+ or XFree86 1.0 license
 HWDATA_LICENSE_FILES = COPYING LICENSE
 
diff --git a/package/iftop/iftop.mk b/package/iftop/iftop.mk
index 91bd6cc..24f8b53 100644
--- a/package/iftop/iftop.mk
+++ b/package/iftop/iftop.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IFTOP_VERSION = 1.0pre4
-IFTOP_SITE = http://www.ex-parrot.com/pdw/iftop/download/
+IFTOP_SITE = http://www.ex-parrot.com/pdw/iftop/download
 IFTOP_DEPENDENCIES = ncurses libpcap
 IFTOP_LICENSE = GPLv2+
 IFTOP_LICENSE_FILES = COPYING
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index 63bda2f..b1cbc90 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IGH_ETHERCAT_VERSION = 1.5.1
-IGH_ETHERCAT_SITE    = http://etherlab.org/download/ethercat/
+IGH_ETHERCAT_SITE    = http://etherlab.org/download/ethercat
 IGH_ETHERCAT_SOURCE  = ethercat-$(IGH_ETHERCAT_VERSION).tar.bz2
 IGH_ETHERCAT_LICENSE = GPLv2 (IgH EtherCAT master), LGPLv2.1 (libraries)
 IGH_ETHERCAT_LICENSE_FILES = COPYING COPYING.LESSER
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index b713f98..9e5ad27 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -9,7 +9,7 @@ IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
 # older versions.
-IMAGEMAGICK_SITE = ftp://ftp.nluug.nl/pub/ImageMagick/
+IMAGEMAGICK_SITE = ftp://ftp.nluug.nl/pub/ImageMagick
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
 
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index 5b9d6b0..05ec16b 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -6,7 +6,7 @@
 
 IMLIB2_VERSION = 1.4.5
 IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
-IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)/
+IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)
 IMLIB2_LICENSE = imlib2 license
 IMLIB2_LICENSE_FILES = COPYING
 
diff --git a/package/inotify-tools/inotify-tools.mk b/package/inotify-tools/inotify-tools.mk
index 1a988a3..96b23ce 100644
--- a/package/inotify-tools/inotify-tools.mk
+++ b/package/inotify-tools/inotify-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 INOTIFY_TOOLS_VERSION = 3.14
-INOTIFY_TOOLS_SITE = http://github.com/downloads/rvoicilas/inotify-tools/
+INOTIFY_TOOLS_SITE = http://github.com/downloads/rvoicilas/inotify-tools
 INOTIFY_TOOLS_LICENSE = GPL
 INOTIFY_TOOLS_LICENSE_FILES = COPYING
 INOTIFY_TOOLS_INSTALL_STAGING = YES
diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
index ae3f7d2..e7b1561 100644
--- a/package/input-tools/input-tools.mk
+++ b/package/input-tools/input-tools.mk
@@ -7,7 +7,7 @@
 INPUT_TOOLS_VERSION = 20051019
 INPUT_TOOLS_SOURCE = joystick_$(INPUT_TOOLS_VERSION).orig.tar.gz
 INPUT_TOOLS_PATCH = joystick_$(INPUT_TOOLS_VERSION)-5.diff.gz
-INPUT_TOOLS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/j/joystick/
+INPUT_TOOLS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/j/joystick
 INPUT_TOOLS_LICENSE = GPLv2+
 INPUT_TOOLS_LICENSE_FILES = utils/Makefile
 
diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index 6b2a704..5c2dca8 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 INTLTOOL_VERSION = 0.50.2
-INTLTOOL_SITE = https://launchpad.net/intltool/trunk/$(INTLTOOL_VERSION)/+download/
+INTLTOOL_SITE = https://launchpad.net/intltool/trunk/$(INTLTOOL_VERSION)/+download
 INTLTOOL_LICENSE = GPLv2+
 INTLTOOL_LICENSE_FILES = COPYING
 
diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index 870588d..2be32be 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -7,7 +7,7 @@
 IPSEC_TOOLS_VERSION_MAJOR = 0.8
 IPSEC_TOOLS_VERSION = $(IPSEC_TOOLS_VERSION_MAJOR).2
 IPSEC_TOOLS_SOURCE = ipsec-tools-$(IPSEC_TOOLS_VERSION).tar.bz2
-IPSEC_TOOLS_SITE = http://ftp.sunet.se/pub/NetBSD/misc/ipsec-tools/$(IPSEC_TOOLS_VERSION_MAJOR)/
+IPSEC_TOOLS_SITE = http://ftp.sunet.se/pub/NetBSD/misc/ipsec-tools/$(IPSEC_TOOLS_VERSION_MAJOR)
 IPSEC_TOOLS_INSTALL_STAGING = YES
 IPSEC_TOOLS_MAKE = $(MAKE1)
 IPSEC_TOOLS_DEPENDENCIES = openssl flex host-flex
diff --git a/package/iptraf-ng/iptraf-ng.mk b/package/iptraf-ng/iptraf-ng.mk
index ae69680..7313873 100644
--- a/package/iptraf-ng/iptraf-ng.mk
+++ b/package/iptraf-ng/iptraf-ng.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IPTRAF_NG_VERSION = 1.1.4
-IPTRAF_NG_SITE = https://fedorahosted.org/releases/i/p/iptraf-ng/
+IPTRAF_NG_SITE = https://fedorahosted.org/releases/i/p/iptraf-ng
 IPTRAF_NG_LICENSE = GPLv2+
 IPTRAF_NG_LICENSE_FILES = LICENSE
 IPTRAF_NG_DEPENDENCIES = ncurses
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 33665f6..71300a5 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IPUTILS_VERSION = s20121011
-IPUTILS_SITE = http://www.skbuff.net/iputils/
+IPUTILS_SITE = http://www.skbuff.net/iputils
 IPUTILS_SOURCE = iputils-$(IPUTILS_VERSION).tar.bz2
 IPUTILS_LICENSE = GPLv2+ BSD-3c
 # Only includes a license file for BSD
diff --git a/package/isl/isl.mk b/package/isl/isl.mk
index 2a630a4..55cff9d 100644
--- a/package/isl/isl.mk
+++ b/package/isl/isl.mk
@@ -9,7 +9,7 @@
 # published.
 ISL_VERSION = 0.12.2
 ISL_SOURCE = isl-$(ISL_VERSION).tar.bz2
-ISL_SITE = http://isl.gforge.inria.fr/
+ISL_SITE = http://isl.gforge.inria.fr
 ISL_LICENSE = MIT
 ISL_LICENSE_FILES = LICENSE
 ISL_DEPENDENCIES = gmp
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 0a2f70e..b7b92eb 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 JSON_C_VERSION = 0.11
-JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases/
+JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases
 JSON_C_INSTALL_STAGING = YES
 JSON_C_MAKE = $(MAKE1)
 JSON_C_CONF_OPT = --disable-oldname-compat
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index a60b4c0..6338065 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -6,7 +6,7 @@
 
 KMOD_VERSION = 18
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
-KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod/
+KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
 KMOD_DEPENDENCIES = host-pkgconf
 HOST_KMOD_DEPENDENCIES = host-pkgconf
diff --git a/package/kobs-ng/kobs-ng.mk b/package/kobs-ng/kobs-ng.mk
index f7e65e7..13d1faf 100644
--- a/package/kobs-ng/kobs-ng.mk
+++ b/package/kobs-ng/kobs-ng.mk
@@ -6,7 +6,7 @@
 
 # kobs-ng versions have never made much sense :(
 KOBS_NG_VERSION = 3.0.35-4.0.0
-KOBS_NG_SITE = http://repository.timesys.com/buildsources/k/kobs-ng/kobs-ng-$(KOBS_NG_VERSION)/
+KOBS_NG_SITE = http://repository.timesys.com/buildsources/k/kobs-ng/kobs-ng-$(KOBS_NG_VERSION)
 KOBS_NG_LICENSE = GPLv2+
 KOBS_NG_LICENSE_FILES = COPYING
 
diff --git a/package/latencytop/latencytop.mk b/package/latencytop/latencytop.mk
index 7b96c2b..935b2a3 100644
--- a/package/latencytop/latencytop.mk
+++ b/package/latencytop/latencytop.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LATENCYTOP_VERSION = 0.5
-LATENCYTOP_SITE = http://www.latencytop.org/download/
+LATENCYTOP_SITE = http://www.latencytop.org/download
 LATENCYTOP_DEPENDENCIES = libglib2 ncurses
 LATENCYTOP_LICENSE = GPLv2
 LATENCYTOP_LICENSE_FILES = latencytop.c
diff --git a/package/lbreakout2/lbreakout2.mk b/package/lbreakout2/lbreakout2.mk
index a246ba3..8f4e27d 100644
--- a/package/lbreakout2/lbreakout2.mk
+++ b/package/lbreakout2/lbreakout2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LBREAKOUT2_SITE = http://downloads.sourceforge.net/lgames/lbreakout2/2.6/
+LBREAKOUT2_SITE = http://downloads.sourceforge.net/lgames/lbreakout2/2.6
 LBREAKOUT2_VERSION = 2.6.4
 LBREAKOUT2_LICENSE = GPLv2+
 LBREAKOUT2_LICENSE_FILES = COPYING
diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index 664640b..545a299 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -6,7 +6,7 @@
 
 LIBAIO_VERSION = 0.3.109
 LIBAIO_SOURCE = libaio_$(LIBAIO_VERSION).orig.tar.gz
-LIBAIO_SITE = http://snapshot.debian.org/archive/debian/20110227T085214Z/pool/main/liba/libaio/
+LIBAIO_SITE = http://snapshot.debian.org/archive/debian/20110227T085214Z/pool/main/liba/libaio
 LIBAIO_INSTALL_STAGING = YES
 LIBAIO_LICENSE = LGPLv2.1+
 LIBAIO_LICENSE_FILES = COPYING
diff --git a/package/libart/libart.mk b/package/libart/libart.mk
index a103f23..85ee37c 100644
--- a/package/libart/libart.mk
+++ b/package/libart/libart.mk
@@ -7,7 +7,7 @@
 LIBART_VERSION_MAJOR = 2.3
 LIBART_VERSION = $(LIBART_VERSION_MAJOR).21
 LIBART_SOURCE = libart_lgpl-$(LIBART_VERSION).tar.gz
-LIBART_SITE = http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/$(LIBART_VERSION_MAJOR)/
+LIBART_SITE = http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/$(LIBART_VERSION_MAJOR)
 LIBART_AUTORECONF = YES
 LIBART_INSTALL_STAGING = YES
 LIBART_CONFIG_SCRIPTS = libart2-config
diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index 5f5378b..595baa7 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBASSUAN_VERSION = 2.1.1
-LIBASSUAN_SITE = ftp://ftp.gnupg.org/gcrypt/libassuan/
+LIBASSUAN_SITE = ftp://ftp.gnupg.org/gcrypt/libassuan
 LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
 LIBASSUAN_LICENSE = LGPLv2.1+ (library), GPLv3 (tests, doc)
 LIBASSUAN_LICENSE_FILES = COPYING.LIB COPYING
diff --git a/package/libcdaudio/libcdaudio.mk b/package/libcdaudio/libcdaudio.mk
index 814239b..bee1fe3 100644
--- a/package/libcdaudio/libcdaudio.mk
+++ b/package/libcdaudio/libcdaudio.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCDAUDIO_VERSION = 0.99.12p2
-LIBCDAUDIO_SITE = http://downloads.sourceforge.net/project/libcdaudio/libcdaudio/$(LIBCDAUDIO_VERSION)/
+LIBCDAUDIO_SITE = http://downloads.sourceforge.net/project/libcdaudio/libcdaudio/$(LIBCDAUDIO_VERSION)
 LIBCDAUDIO_INSTALL_STAGING = YES
 LIBCDAUDIO_CONFIG_SCRIPTS = libcdaudio-config
 LIBCDAUDIO_LICENSE = GPLv2+
diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index 7a80df3..d2cc9e3 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCONFIG_VERSION = 1.4.9
-LIBCONFIG_SITE = http://www.hyperrealm.com/libconfig/
+LIBCONFIG_SITE = http://www.hyperrealm.com/libconfig
 LIBCONFIG_LICENSE = LGPLv2.1+
 LIBCONFIG_LICENSE_FILES = COPYING.LIB
 LIBCONFIG_INSTALL_STAGING = YES
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 1c6ae78..cb9d3a9 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -6,7 +6,7 @@
 
 LIBDRM_VERSION = 2.4.56
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
-LIBDRM_SITE = http://dri.freedesktop.org/libdrm/
+LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
 
 LIBDRM_INSTALL_STAGING = YES
diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index 8683046..9eace96 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBEXOSIP2_VERSION = 3.6.0
-LIBEXOSIP2_SITE = http://download.savannah.gnu.org/releases/exosip/
+LIBEXOSIP2_SITE = http://download.savannah.gnu.org/releases/exosip
 LIBEXOSIP2_INSTALL_STAGING = YES
 LIBEXOSIP2_LICENSE = GPLv2+
 LIBEXOSIP2_LICENSE_FILES = COPYING
diff --git a/package/libebml/libebml.mk b/package/libebml/libebml.mk
index 9aeab77..e555922 100644
--- a/package/libebml/libebml.mk
+++ b/package/libebml/libebml.mk
@@ -6,7 +6,7 @@
 
 LIBEBML_VERSION = 1.2.2
 LIBEBML_SOURCE = libebml-$(LIBEBML_VERSION).tar.bz2
-LIBEBML_SITE = http://dl.matroska.org/downloads/libebml/
+LIBEBML_SITE = http://dl.matroska.org/downloads/libebml
 LIBEBML_INSTALL_STAGING = YES
 LIBEBML_LICENSE = LGPLv2.1+
 LIBEBML_LICENSE_FILES = LICENSE.LGPL
diff --git a/package/libedit/libedit.mk b/package/libedit/libedit.mk
index 927626f..d8a0ebf 100644
--- a/package/libedit/libedit.mk
+++ b/package/libedit/libedit.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBEDIT_VERSION = 20130712-3.1
-LIBEDIT_SITE = http://www.thrysoee.dk/editline/
+LIBEDIT_SITE = http://www.thrysoee.dk/editline
 LIBEDIT_INSTALL_STAGING = YES
 LIBEDIT_DEPENDENCIES = ncurses
 LIBEDIT_LICENSE = BSD-3c
diff --git a/package/libee/libee.mk b/package/libee/libee.mk
index f6d36b6..23441bc 100644
--- a/package/libee/libee.mk
+++ b/package/libee/libee.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBEE_VERSION = 0.4.1
-LIBEE_SITE = http://www.libee.org/download/files/download/
+LIBEE_SITE = http://www.libee.org/download/files/download
 LIBEE_LICENSE = LGPLv2.1+
 LIBEE_LICENSE_FILES = COPYING
 LIBEE_DEPENDENCIES = libestr host-pkgconf
diff --git a/package/libelf/libelf.mk b/package/libelf/libelf.mk
index 047d00b..0c37697 100644
--- a/package/libelf/libelf.mk
+++ b/package/libelf/libelf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBELF_VERSION = 0.8.12
-LIBELF_SITE = http://www.mr511.de/software/
+LIBELF_SITE = http://www.mr511.de/software
 LIBELF_INSTALL_STAGING = YES
 LIBELF_INSTALL_STAGING_OPT = instroot=$(STAGING_DIR) install
 LIBELF_INSTALL_TARGET_OPT = instroot=$(TARGET_DIR) install
diff --git a/package/libestr/libestr.mk b/package/libestr/libestr.mk
index ea6011c..d5ff986 100644
--- a/package/libestr/libestr.mk
+++ b/package/libestr/libestr.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBESTR_VERSION = 0.1.9
-LIBESTR_SITE = http://libestr.adiscon.com/files/download/
+LIBESTR_SITE = http://libestr.adiscon.com/files/download
 LIBESTR_LICENSE = LGPLv2.1+
 LIBESTR_LICENSE_FILES = COPYING
 LIBESTR_INSTALL_STAGING = YES
diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index e4b6c73..a6ff3a9 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBEV_VERSION = 4.15
-LIBEV_SITE = http://dist.schmorp.de/libev/
+LIBEV_SITE = http://dist.schmorp.de/libev
 LIBEV_INSTALL_STAGING = YES
 LIBEV_LICENSE = BSD-2c or GPLv2+
 LIBEV_LICENSE_FILES = LICENSE
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 1377b8f..69b64e8 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBFFI_VERSION = 3.1
-LIBFFI_SITE    = ftp://sourceware.org/pub/libffi/
+LIBFFI_SITE    = ftp://sourceware.org/pub/libffi
 LIBFFI_LICENSE = MIT
 LIBFFI_LICENSE_FILES = LICENSE
 LIBFFI_INSTALL_STAGING = YES
diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index 32f414e..2474d7a 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -6,7 +6,7 @@
 
 LIBFRIBIDI_VERSION = 0.19.6
 LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.bz2
-LIBFRIBIDI_SITE = http://www.fribidi.org/download/
+LIBFRIBIDI_SITE = http://www.fribidi.org/download
 LIBFRIBIDI_LICENSE = LGPLv2.1+
 LIBFRIBIDI_LICENSE_FILES = COPYING
 LIBFRIBIDI_INSTALL_STAGING = YES
diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
index 6c405bb..33e09ac 100644
--- a/package/libftdi/libftdi.mk
+++ b/package/libftdi/libftdi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBFTDI_VERSION = 0.19
-LIBFTDI_SITE = http://www.intra2net.com/en/developer/libftdi/download/
+LIBFTDI_SITE = http://www.intra2net.com/en/developer/libftdi/download
 LIBFTDI_DEPENDENCIES = libusb-compat libusb
 LIBFTDI_INSTALL_STAGING = YES
 LIBFTDI_CONFIG_SCRIPTS = libftdi-config
diff --git a/package/libgc/libgc.mk b/package/libgc/libgc.mk
index a8611f1..536988d 100644
--- a/package/libgc/libgc.mk
+++ b/package/libgc/libgc.mk
@@ -6,7 +6,7 @@
 
 LIBGC_VERSION = 7.4.0
 LIBGC_SOURCE = gc-$(LIBGC_VERSION).tar.gz
-LIBGC_SITE = http://www.hboehm.info/gc/gc_source/
+LIBGC_SITE = http://www.hboehm.info/gc/gc_source
 LIBGC_DEPENDENCIES = libatomic_ops host-pkgconf
 LIBGC_LICENSE = Permissive X11-style
 LIBGC_LICENSE_FILES = README.md
diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
index b29d4e5..55b586c 100644
--- a/package/libglade/libglade.mk
+++ b/package/libglade/libglade.mk
@@ -7,7 +7,7 @@
 LIBGLADE_VERSION_MAJOR = 2.6
 LIBGLADE_VERSION = $(LIBGLADE_VERSION_MAJOR).4
 LIBGLADE_SOURCE = libglade-$(LIBGLADE_VERSION).tar.bz2
-LIBGLADE_SITE = http://ftp.gnome.org/pub/GNOME/sources/libglade/$(LIBGLADE_VERSION_MAJOR)/
+LIBGLADE_SITE = http://ftp.gnome.org/pub/GNOME/sources/libglade/$(LIBGLADE_VERSION_MAJOR)
 LIBGLADE_INSTALL_STAGING = YES
 LIBGLADE_DEPENDENCIES = host-pkgconf libglib2 libgtk2 atk libxml2
 LIBGLADE_LICENSE = LGPLV2+
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 43d7484..ae9660f 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGPGME_VERSION = 1.5.0
-LIBGPGME_SITE = ftp://ftp.gnupg.org/gcrypt/gpgme/
+LIBGPGME_SITE = ftp://ftp.gnupg.org/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPLv2.1+
 LIBGPGME_LICENSE_FILES = COPYING.LESSER
diff --git a/package/libhid/libhid.mk b/package/libhid/libhid.mk
index 469a607..ea43482 100644
--- a/package/libhid/libhid.mk
+++ b/package/libhid/libhid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBHID_VERSION = 0.2.16
-LIBHID_SITE = http://sources.buildroot.net/
+LIBHID_SITE = http://sources.buildroot.net
 LIBHID_DEPENDENCIES = libusb-compat libusb
 LIBHID_INSTALL_STAGING = YES
 LIBHID_AUTORECONF = YES
diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index 33106fa..c4190c7 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBJPEG_VERSION = 9a
-LIBJPEG_SITE = http://www.ijg.org/files/
+LIBJPEG_SITE = http://www.ijg.org/files
 LIBJPEG_SOURCE = jpegsrc.v$(LIBJPEG_VERSION).tar.gz
 LIBJPEG_LICENSE = jpeg-license (BSD-3c-like)
 LIBJPEG_LICENSE_FILES = README
diff --git a/package/libllcp/libllcp.mk b/package/libllcp/libllcp.mk
index 30bbf69..29b5dd0 100644
--- a/package/libllcp/libllcp.mk
+++ b/package/libllcp/libllcp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBLLCP_VERSION = cf0c4b3c9df98851c6092c130192130c3f5a46bd
-LIBLLCP_SITE = https://libllcp.googlecode.com/git/
+LIBLLCP_SITE = https://libllcp.googlecode.com/git
 LIBLLCP_SITE_METHOD = git
 LIBLLCP_DEPENDENCIES = libnfc
 # There's no ./configure in the repository, so we need to autoreconf
diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
index ca7a848..809bce6 100644
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -6,7 +6,7 @@
 
 LIBLOCKFILE_VERSION = 1.08
 LIBLOCKFILE_SOURCE = liblockfile_$(LIBLOCKFILE_VERSION).orig.tar.gz
-LIBLOCKFILE_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libl/liblockfile/
+LIBLOCKFILE_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libl/liblockfile
 LIBLOCKFILE_PATCH = liblockfile_$(LIBLOCKFILE_VERSION)-4.debian.tar.bz2
 
 LIBLOCKFILE_LICENSE = LGPLv2+, dotlockfile GPLv2+
diff --git a/package/libmatroska/libmatroska.mk b/package/libmatroska/libmatroska.mk
index 2833ea7..868eff2 100644
--- a/package/libmatroska/libmatroska.mk
+++ b/package/libmatroska/libmatroska.mk
@@ -6,7 +6,7 @@
 
 LIBMATROSKA_VERSION = 1.3.0
 LIBMATROSKA_SOURCE = libmatroska-$(LIBMATROSKA_VERSION).tar.bz2
-LIBMATROSKA_SITE = http://dl.matroska.org/downloads/libmatroska/
+LIBMATROSKA_SITE = http://dl.matroska.org/downloads/libmatroska
 LIBMATROSKA_INSTALL_STAGING = YES
 LIBMATROSKA_LICENSE = LGPLv2.1+
 LIBMATROSKA_LICENSE_FILES = LICENSE.LGPL
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 3606d71..d3df3aa 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMBIM_VERSION = 1.8.0
-LIBMBIM_SITE    = http://www.freedesktop.org/software/libmbim/
+LIBMBIM_SITE    = http://www.freedesktop.org/software/libmbim
 LIBMBIM_SOURCE  = libmbim-$(LIBMBIM_VERSION).tar.xz
 LIBMBIM_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
 LIBMBIM_LICENSE_FILES = COPYING
diff --git a/package/libmbus/libmbus.mk b/package/libmbus/libmbus.mk
index 6298543..75aaa8d 100644
--- a/package/libmbus/libmbus.mk
+++ b/package/libmbus/libmbus.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMBUS_VERSION = 0.8.0
-LIBMBUS_SITE = http://www.rscada.se/public-dist/
+LIBMBUS_SITE = http://www.rscada.se/public-dist
 LIBMBUS_INSTALL_STAGING = YES
 LIBMBUS_LICENSE = BSD-3c
 LIBMBUS_LICENSE_FILES = COPYING
diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index 8aa3cd7..5073df6 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMODBUS_VERSION = 3.0.5
-LIBMODBUS_SITE = http://libmodbus.org/site_media/build/
+LIBMODBUS_SITE = http://libmodbus.org/site_media/build
 LIBMODBUS_LICENSE = LGPLv2.1+
 LIBMODBUS_LICENSE_FILES = COPYING.LESSER
 LIBMODBUS_INSTALL_STAGING = YES
diff --git a/package/libnfc/libnfc.mk b/package/libnfc/libnfc.mk
index a0ea877..faa3c91 100644
--- a/package/libnfc/libnfc.mk
+++ b/package/libnfc/libnfc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBNFC_VERSION = 7b7f5061427b5456835dd48923a8cc0563cfd1e9
-LIBNFC_SITE = http://libnfc.googlecode.com/git/
+LIBNFC_SITE = http://libnfc.googlecode.com/git
 LIBNFC_SITE_METHOD = git
 LIBNFC_LICENSE = LGPLv3+
 LIBNFC_LICENSE_FILES = COPYING
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 7eedbbe..0e21d33 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -6,7 +6,7 @@
 
 LIBNSPR_VERSION = 4.10.6
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
-LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src/
+LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
 LIBNSPR_INSTALL_STAGING = YES
 LIBNSPR_CONFIG_SCRIPTS = nspr-config
diff --git a/package/libplayer/libplayer.mk b/package/libplayer/libplayer.mk
index b4ff500..9ce6317 100644
--- a/package/libplayer/libplayer.mk
+++ b/package/libplayer/libplayer.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBPLAYER_VERSION = 2.0.1
-LIBPLAYER_SITE = http://libplayer.geexbox.org/releases/
+LIBPLAYER_SITE = http://libplayer.geexbox.org/releases
 LIBPLAYER_SOURCE = libplayer-$(LIBPLAYER_VERSION).tar.bz2
 LIBPLAYER_LICENSE = LGPLv2.1+
 LIBPLAYER_LICENSE_FILES = COPYING
diff --git a/package/libpthread-stubs/libpthread-stubs.mk b/package/libpthread-stubs/libpthread-stubs.mk
index b72e5a6..2ee3f1e 100644
--- a/package/libpthread-stubs/libpthread-stubs.mk
+++ b/package/libpthread-stubs/libpthread-stubs.mk
@@ -6,7 +6,7 @@
 
 LIBPTHREAD_STUBS_VERSION = 0.3
 LIBPTHREAD_STUBS_SOURCE = libpthread-stubs-$(LIBPTHREAD_STUBS_VERSION).tar.bz2
-LIBPTHREAD_STUBS_SITE = http://xcb.freedesktop.org/dist/
+LIBPTHREAD_STUBS_SITE = http://xcb.freedesktop.org/dist
 LIBPTHREAD_STUBS_LICENSE = MIT
 LIBPTHREAD_STUBS_LICENSE_FILES = COPYING
 
diff --git a/package/libpthsem/libpthsem.mk b/package/libpthsem/libpthsem.mk
index 040229e..ab9dcda 100644
--- a/package/libpthsem/libpthsem.mk
+++ b/package/libpthsem/libpthsem.mk
@@ -6,7 +6,7 @@
 
 LIBPTHSEM_VERSION = 2.0.8
 LIBPTHSEM_SOURCE = pthsem_$(LIBPTHSEM_VERSION).tar.gz
-LIBPTHSEM_SITE = http://www.auto.tuwien.ac.at/~mkoegler/pth/
+LIBPTHSEM_SITE = http://www.auto.tuwien.ac.at/~mkoegler/pth
 LIBPTHSEM_LICENSE = LGPLv2.1+
 LIBPTHSEM_LICENSE_FILES = COPYING
 LIBPTHSEM_AUTORECONF = YES
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index f63fd49..d9084f7 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBQMI_VERSION = 1.10.0
-LIBQMI_SITE    = http://www.freedesktop.org/software/libqmi/
+LIBQMI_SITE    = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE  = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
 LIBQMI_LICENSE_FILES = COPYING
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index b9712cd..824bdcf 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -6,7 +6,7 @@
 
 LIBRAW_VERSION = 0.13.4
 LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
-LIBRAW_SITE = http://www.libraw.org/data/
+LIBRAW_SITE = http://www.libraw.org/data
 LIBRAW_INSTALL_STAGING = YES
 LIBRAW_CONF_OPT += --disable-examples --disable-lcms \
 			--disable-openmp --disable-demosaic-pack-gpl2 \
diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
index f1b2486..9a6c97a 100644
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBROXML_VERSION = 2.3.0
-LIBROXML_SITE = http://download.libroxml.net/pool/v2.x/
+LIBROXML_SITE = http://download.libroxml.net/pool/v2.x
 LIBROXML_INSTALL_STAGING = YES
 LIBROXML_LICENSE = LGPLv2.1+ with static link exception
 LIBROXML_LICENSE_FILES = License.txt
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 86dce41..e4714d2 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -6,7 +6,7 @@
 
 LIBRSVG_VERSION_MAJOR = 2.26
 LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).3
-LIBRSVG_SITE = http://ftp.gnome.org/pub/GNOME/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)/
+LIBRSVG_SITE = http://ftp.gnome.org/pub/GNOME/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
 LIBRSVG_INSTALL_STAGING = YES
 LIBRSVG_CONF_OPT = --disable-tools
 LIBRSVG_DEPENDENCIES = libxml2 cairo pango libglib2 gdk-pixbuf
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index 19b193c..7999c4a 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSEPOL_VERSION = 2.1.9
-LIBSEPOL_SITE = http://userspace.selinuxproject.org/releases/20130423/
+LIBSEPOL_SITE = http://userspace.selinuxproject.org/releases/20130423
 LIBSEPOL_LICENSE = LGPLv2.1+
 LIBSEPOL_LICENSE_FILES = COPYING
 
diff --git a/package/libsexy/libsexy.mk b/package/libsexy/libsexy.mk
index 3cfb536..c291d7d 100644
--- a/package/libsexy/libsexy.mk
+++ b/package/libsexy/libsexy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSEXY_VERSION = 0.1.11
-LIBSEXY_SITE = http://releases.chipx86.com/libsexy/libsexy/
+LIBSEXY_SITE = http://releases.chipx86.com/libsexy/libsexy
 LIBSEXY_DEPENDENCIES = libgtk2 libxml2
 LIBSEXY_INSTALL_STAGING = YES
 LIBSEXY_LICENSE = LGPLv2.1+
diff --git a/package/libsocketcan/libsocketcan.mk b/package/libsocketcan/libsocketcan.mk
index bde8d31..65f3cb5 100644
--- a/package/libsocketcan/libsocketcan.mk
+++ b/package/libsocketcan/libsocketcan.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSOCKETCAN_VERSION = 0.0.10
-LIBSOCKETCAN_SITE = http://www.pengutronix.de/software/libsocketcan/download/
+LIBSOCKETCAN_SITE = http://www.pengutronix.de/software/libsocketcan/download
 LIBSOCKETCAN_SOURCE = libsocketcan-$(LIBSOCKETCAN_VERSION).tar.bz2
 LIBSOCKETCAN_INSTALL_STAGING = YES
 LIBSOCKETCAN_LICENSE = LGPLv2.1+
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 19df9af..50bd265 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSSH2_VERSION = 1.4.3
-LIBSSH2_SITE = http://www.libssh2.org/download/
+LIBSSH2_SITE = http://www.libssh2.org/download
 LIBSSH2_LICENSE = BSD
 LIBSSH2_LICENSE_FILES = COPYING
 LIBSSH2_INSTALL_STAGING = YES
diff --git a/package/libsvg-cairo/libsvg-cairo.mk b/package/libsvg-cairo/libsvg-cairo.mk
index a168180..93b8f76 100644
--- a/package/libsvg-cairo/libsvg-cairo.mk
+++ b/package/libsvg-cairo/libsvg-cairo.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSVG_CAIRO_VERSION         = 0.1.6
-LIBSVG_CAIRO_SITE            = http://cairographics.org/snapshots/
+LIBSVG_CAIRO_SITE            = http://cairographics.org/snapshots
 LIBSVG_CAIRO_DEPENDENCIES    = cairo libsvg
 LIBSVG_CAIRO_INSTALL_STAGING = YES
 LIBSVG_CAIRO_LICENSE         = LGPLv2.1+
diff --git a/package/libsvg/libsvg.mk b/package/libsvg/libsvg.mk
index 7069647..320d4f0 100644
--- a/package/libsvg/libsvg.mk
+++ b/package/libsvg/libsvg.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSVG_VERSION         = 0.1.4
-LIBSVG_SITE            = http://cairographics.org/snapshots/
+LIBSVG_SITE            = http://cairographics.org/snapshots
 LIBSVG_DEPENDENCIES    = host-pkgconf libpng libjpeg
 LIBSVG_INSTALL_STAGING = YES
 LIBSVG_LICENSE         = LGPLv2+
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index aec45a8..953393c 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBURCU_VERSION = 0.8.4
-LIBURCU_SITE    = http://lttng.org/files/urcu/
+LIBURCU_SITE    = http://lttng.org/files/urcu
 LIBURCU_SOURCE  = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 LIBURCU_LICENSE = LGPLv2.1+ for the library; MIT-like license for few source files listed in LICENSE; GPLv2+ for test; GPLv3 for few *.m4 files
 LIBURCU_LICENSE_FILES = lgpl-2.1.txt lgpl-relicensing.txt gpl-2.0.txt LICENSE
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 78d3717..872b156 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -6,7 +6,7 @@
 
 LIBV4L_VERSION = 1.0.1
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
-LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils/
+LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
 LIBV4L_DEPENDENCIES = host-pkgconf
 
diff --git a/package/libvorbis/libvorbis.mk b/package/libvorbis/libvorbis.mk
index d5e290f..83b6605 100644
--- a/package/libvorbis/libvorbis.mk
+++ b/package/libvorbis/libvorbis.mk
@@ -6,7 +6,7 @@
 
 LIBVORBIS_VERSION = 1.3.4
 LIBVORBIS_SOURCE = libvorbis-$(LIBVORBIS_VERSION).tar.xz
-LIBVORBIS_SITE = http://downloads.xiph.org/releases/vorbis/
+LIBVORBIS_SITE = http://downloads.xiph.org/releases/vorbis
 LIBVORBIS_INSTALL_STAGING = YES
 LIBVORBIS_CONF_OPT = --disable-oggtest
 LIBVORBIS_DEPENDENCIES = host-pkgconf libogg
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 27c73ae..3bfe764 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXKBCOMMON_VERSION = 0.3.0
-LIBXKBCOMMON_SITE = http://xkbcommon.org/download/
+LIBXKBCOMMON_SITE = http://xkbcommon.org/download
 LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
 LIBXKBCOMMON_LICENSE = MIT/X11
 LIBXKBCOMMON_LICENSE_FILES = COPYING
diff --git a/package/libyaml/libyaml.mk b/package/libyaml/libyaml.mk
index 0a42742..52d4750 100644
--- a/package/libyaml/libyaml.mk
+++ b/package/libyaml/libyaml.mk
@@ -6,7 +6,7 @@
 
 LIBYAML_VERSION = 0.1.6
 LIBYAML_SOURCE = yaml-$(LIBYAML_VERSION).tar.gz
-LIBYAML_SITE = http://pyyaml.org/download/libyaml/
+LIBYAML_SITE = http://pyyaml.org/download/libyaml
 LIBYAML_INSTALL_STAGING = YES
 LIBYAML_LICENSE = MIT
 LIBYAML_LICENSE_FILES = LICENSE
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 8302d56..d770927 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -9,9 +9,9 @@
 
 LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
 ifeq ($(findstring x2.6.,x$(LINUX_HEADERS_VERSION)),x2.6.)
-LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
+LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
 else
-LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x/
+LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x
 endif
 LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
 
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 6aa83e1..2eae3bb 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -6,7 +6,7 @@
 
 LINUX_PAM_VERSION = 1.1.8
 LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.bz2
-LINUX_PAM_SITE = http://linux-pam.org/library/
+LINUX_PAM_SITE = http://linux-pam.org/library
 LINUX_PAM_INSTALL_STAGING = YES
 LINUX_PAM_CONF_OPT = \
 	--disable-prelude \
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 8b2ac10..72b1264 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -6,7 +6,7 @@
 
 LIVE555_VERSION = 2014.05.27
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
-LIVE555_SITE = http://www.live555.com/liveMedia/public/
+LIVE555_SITE = http://www.live555.com/liveMedia/public
 LIVE555_LICENSE = LGPLv2.1+
 LIVE555_LICENSE_FILES = COPYING
 LIVE555_INSTALL_STAGING = YES
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index c3a6c09..f2c7aab 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -6,7 +6,7 @@
 
 LMBENCH_VERSION = 3.0-a9
 LMBENCH_SOURCE = lmbench-$(LMBENCH_VERSION).tgz
-LMBENCH_SITE = http://downloads.sourceforge.net/project/lmbench/development/lmbench-$(LMBENCH_VERSION)/
+LMBENCH_SITE = http://downloads.sourceforge.net/project/lmbench/development/lmbench-$(LMBENCH_VERSION)
 LMBENCH_LICENSE =  lmbench license (based on GPLv2)
 LMBENCH_LICENSE_FILES = COPYING COPYING-2
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index cc38559..17ffd14 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -6,7 +6,7 @@
 
 LOCALEDEF_VERSION = 2.14.1-r17443-ptx1
 LOCALEDEF_SOURCE  = localedef-eglibc-$(LOCALEDEF_VERSION).tar.bz2
-LOCALEDEF_SITE    = http://www.pengutronix.de/software/ptxdist/temporary-src/
+LOCALEDEF_SITE    = http://www.pengutronix.de/software/ptxdist/temporary-src
 
 HOST_LOCALEDEF_CONF_OPT += \
 	--prefix=/usr \
diff --git a/package/lockdev/lockdev.mk b/package/lockdev/lockdev.mk
index 0c10341..d90009a 100644
--- a/package/lockdev/lockdev.mk
+++ b/package/lockdev/lockdev.mk
@@ -6,7 +6,7 @@
 
 LOCKDEV_VERSION = 1.0.3
 LOCKDEV_SOURCE = lockdev_$(LOCKDEV_VERSION).orig.tar.gz
-LOCKDEV_SITE = http://snapshot.debian.org/archive/debian/20130508T154517Z/pool/main/l/lockdev/
+LOCKDEV_SITE = http://snapshot.debian.org/archive/debian/20130508T154517Z/pool/main/l/lockdev
 LOCKDEV_LICENSE = LGPLv2.1
 LOCKDEV_LICENSE_FILES = LICENSE
 LOCKDEV_INSTALL_STAGING = YES
diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index a88f1be..fbe1080 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -6,7 +6,7 @@
 
 LOCKFILE_PROGS_VERSION = 0.1.17
 LOCKFILE_PROGS_SOURCE = lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz
-LOCKFILE_PROGS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lockfile-progs/
+LOCKFILE_PROGS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lockfile-progs
 LOCKFILE_PROGS_DEPENDENCIES = liblockfile
 LOCKFILE_PROGS_LICENSE = GPLv2
 LOCKFILE_PROGS_LICENSE_FILES = COPYING
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index a41e074..2e49feb 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LOGROTATE_VERSION = 3.8.7
-LOGROTATE_SITE = https://www.fedorahosted.org/releases/l/o/logrotate/
+LOGROTATE_SITE = https://www.fedorahosted.org/releases/l/o/logrotate
 LOGROTATE_LICENSE = GPLv2+
 LOGROTATE_LICENSE_FILES = COPYING
 
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 285bd47..7131c2c 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -6,7 +6,7 @@
 
 LSOF_VERSION = 4.87
 LSOF_SOURCE = lsof_$(LSOF_VERSION).tar.bz2
-LSOF_SITE = ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
+LSOF_SITE = ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof
 LSOF_LICENSE = lsof license
 # License is repeated in each file, this is a relatively small one.
 # It is also defined in 00README, but that contains a lot of other cruft.
diff --git a/package/ltris/ltris.mk b/package/ltris/ltris.mk
index cc8a831..75b6ad0 100644
--- a/package/ltris/ltris.mk
+++ b/package/ltris/ltris.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTRIS_SITE = http://downloads.sourceforge.net/lgames/ltris/
+LTRIS_SITE = http://downloads.sourceforge.net/lgames/ltris
 LTRIS_VERSION = 1.0.19
 LTRIS_LICENSE = GPLv2+
 LTRIS_LICENSE_FILES = COPYING
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 84b1f60..032a4c2 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_BABELTRACE_SITE    = http://lttng.org/files/babeltrace/
+LTTNG_BABELTRACE_SITE    = http://lttng.org/files/babeltrace
 LTTNG_BABELTRACE_VERSION = 1.2.1
 LTTNG_BABELTRACE_SOURCE  = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 LTTNG_BABELTRACE_LICENSE = MIT; LGPL2.1 for include/babeltrace/list.h; GPLv2+ for test code
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 3494537..0322780 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_LIBUST_SITE    = http://lttng.org/files/lttng-ust/
+LTTNG_LIBUST_SITE    = http://lttng.org/files/lttng-ust
 LTTNG_LIBUST_VERSION = 2.4.1
 LTTNG_LIBUST_SOURCE  = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPLv2.1; MIT for system headers; GPLv2 for liblttng-ust-ctl/ustctl.c (used by lttng-sessiond)
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index 44cf651..346214a 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_MODULES_VERSION = 2.4.1
-LTTNG_MODULES_SITE    = http://lttng.org/files/lttng-modules/
+LTTNG_MODULES_SITE    = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE  = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 for kernel modules; MIT for lib/bitfield.h and lib/prio_heap/*
 LTTNG_MODULES_LICENSE_FILES = lgpl-2.1.txt gpl-2.0.txt mit-license.txt LICENSE
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index a510adf..8d44600 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_TOOLS_VERSION = 2.4.1
-LTTNG_TOOLS_SITE    = http://lttng.org/files/lttng-tools/
+LTTNG_TOOLS_SITE    = http://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE  = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_LICENSE = GPLv2+; LGPLv2.1+ for include/lttng/* and src/lib/lttng-ctl/*
 LTTNG_TOOLS_LICENSE_FILES = gpl-2.0.txt lgpl-2.1.txt LICENSE
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index f4c06d6..6edf5cf 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LUAROCKS_VERSION = 2.2.0beta1
-LUAROCKS_SITE = http://luarocks.org/releases/
+LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
 
diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index 0aa7051..7b1fdf4 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LZIP_VERSION = 1.15
-LZIP_SITE = http://download.savannah.gnu.org/releases/lzip/
+LZIP_SITE = http://download.savannah.gnu.org/releases/lzip
 LZIP_LICENSE = GPLv3+
 LZIP_LICENSE_FILES = COPYING
 
diff --git a/package/lzma/lzma.mk b/package/lzma/lzma.mk
index e7129dd..a7f9c3f 100644
--- a/package/lzma/lzma.mk
+++ b/package/lzma/lzma.mk
@@ -6,7 +6,7 @@
 
 LZMA_VERSION = 4.32.7
 LZMA_SOURCE = lzma-$(LZMA_VERSION).tar.xz
-LZMA_SITE = http://tukaani.org/lzma/
+LZMA_SITE = http://tukaani.org/lzma
 LZMA_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
 
 $(eval $(host-autotools-package))
diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
index 9709f7b..1b6a7e1 100644
--- a/package/lzop/lzop.mk
+++ b/package/lzop/lzop.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LZOP_VERSION = 1.03
-LZOP_SITE = http://www.lzop.org/download/
+LZOP_SITE = http://www.lzop.org/download
 LZOP_LICENSE = GPLv2+
 LZOP_LICENSE_FILES = COPYING
 LZOP_DEPENDENCIES = lzo
diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index 0807e76..900c10d 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MEMTESTER_VERSION = 4.3.0
-MEMTESTER_SITE = http://pyropus.ca/software/memtester/old-versions/
+MEMTESTER_SITE = http://pyropus.ca/software/memtester/old-versions
 MEMTESTER_LICENSE = GPLv2
 MEMTESTER_LICENSE_FILES = COPYING
 
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index d55f5f1..39bf1a7 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -7,7 +7,7 @@
 MIDORI_VERSION_MAJOR = 0.4
 MIDORI_VERSION = $(MIDORI_VERSION_MAJOR).6
 MIDORI_SOURCE = midori-$(MIDORI_VERSION).tar.bz2
-MIDORI_SITE = http://archive.xfce.org/src/apps/midori/$(MIDORI_VERSION_MAJOR)/
+MIDORI_SITE = http://archive.xfce.org/src/apps/midori/$(MIDORI_VERSION_MAJOR)
 MIDORI_LICENSE = LGPLv2.1+
 MIDORI_LICENSE_FILES = COPYING
 MIDORI_DEPENDENCIES = \
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index d72a40d..dd05741 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MINICOM_VERSION = 2.7
-MINICOM_SITE = http://sources.buildroot.net/
+MINICOM_SITE = http://sources.buildroot.net
 MINICOM_LICENSE = GPLv2+
 MINICOM_LICENSE_FILES = COPYING
 
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 352f69a..cc495f7 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -6,7 +6,7 @@
 
 MODEM_MANAGER_VERSION = 1.2.0
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
-MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager/
+MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPLv2+ (programs, plugins), LGPLv2+ (libmm-glib)
 MODEM_MANAGER_LICENSE_FILES = COPYING
 MODEM_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib host-intltool
diff --git a/package/mongrel2/mongrel2.mk b/package/mongrel2/mongrel2.mk
index 1614bcc..14e3a80 100644
--- a/package/mongrel2/mongrel2.mk
+++ b/package/mongrel2/mongrel2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MONGREL2_VERSION = v1.9.1
-MONGREL2_SITE = https://github.com/zedshaw/mongrel2/releases/download/$(MONGREL2_VERSION)/
+MONGREL2_SITE = https://github.com/zedshaw/mongrel2/releases/download/$(MONGREL2_VERSION)
 MONGREL2_LICENSE = BSD-3c
 MONGREL2_LICENSE_FILES = LICENSE
 MONGREL2_DEPENDENCIES = sqlite zeromq
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index 3fdc17e..25bb5a2 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MONIT_VERSION = 5.7
-MONIT_SITE = http://mmonit.com/monit/dist/
+MONIT_SITE = http://mmonit.com/monit/dist
 MONIT_LICENSE = AGPLv3 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
 
diff --git a/package/mpdecimal/mpdecimal.mk b/package/mpdecimal/mpdecimal.mk
index cb028a5..f8e5dc3 100644
--- a/package/mpdecimal/mpdecimal.mk
+++ b/package/mpdecimal/mpdecimal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPDECIMAL_SITE = http://www.bytereef.org/software/mpdecimal/releases/
+MPDECIMAL_SITE = http://www.bytereef.org/software/mpdecimal/releases
 MPDECIMAL_VERSION = 2.4.0
 MPDECIMAL_INSTALL_STAGING = YES
 MPDECIMAL_LICENSE = BSD-2c
diff --git a/package/msgpack/msgpack.mk b/package/msgpack/msgpack.mk
index c77729f..9e23948 100644
--- a/package/msgpack/msgpack.mk
+++ b/package/msgpack/msgpack.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MSGPACK_VERSION = 0.5.4
-MSGPACK_SITE = http://downloads.sourceforge.net/project/msgpack/msgpack/cpp/
+MSGPACK_SITE = http://downloads.sourceforge.net/project/msgpack/msgpack/cpp
 MSGPACK_LICENSE = Apache-2.0
 MSGPACK_LICENSE_FILES = COPYING
 
diff --git a/package/mtdev/mtdev.mk b/package/mtdev/mtdev.mk
index 3ae2a10..fc6ee4c 100644
--- a/package/mtdev/mtdev.mk
+++ b/package/mtdev/mtdev.mk
@@ -6,7 +6,7 @@
 
 MTDEV_VERSION = 1.1.4
 MTDEV_SOURCE = mtdev-$(MTDEV_VERSION).tar.bz2
-MTDEV_SITE = http://bitmath.org/code/mtdev/
+MTDEV_SITE = http://bitmath.org/code/mtdev
 
 MTDEV_LICENSE = MIT
 MTDEV_LICENSE_FILES = COPYING
diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index 9dc72f3..6bb1d7f 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -6,7 +6,7 @@
 
 MTOOLS_VERSION = 4.0.18
 MTOOLS_SOURCE = mtools-$(MTOOLS_VERSION).tar.bz2
-MTOOLS_SITE = $(BR2_GNU_MIRROR)/mtools/
+MTOOLS_SITE = $(BR2_GNU_MIRROR)/mtools
 MTOOLS_LICENSE = GPLv3+
 MTOOLS_LICENSE_FILES = COPYING
 MTOOLS_CONF_ENV = ac_cv_func_setpgrp_void=yes
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index f15e797..53c97d5 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MUSL_VERSION = 1.1.3
-MUSL_SITE = http://www.musl-libc.org/releases/
+MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
 
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
index a104285..0351970 100644
--- a/package/ncdu/ncdu.mk
+++ b/package/ncdu/ncdu.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NCDU_VERSION = 1.9
-NCDU_SITE = http://dev.yorhel.nl/download/
+NCDU_SITE = http://dev.yorhel.nl/download
 
 NCDU_DEPENDENCIES = ncurses
 
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index 257289d..24b081f 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -6,7 +6,7 @@
 
 NDISC6_VERSION = 1.0.2
 NDISC6_SOURCE = ndisc6-$(NDISC6_VERSION).tar.bz2
-NDISC6_SITE = http://www.remlab.net/files/ndisc6/
+NDISC6_SITE = http://www.remlab.net/files/ndisc6
 NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=gnu99"
 NDISC6_CONF_OPT = --localstatedir=/var --disable-rpath --disable-suid-install
 NDISC6_LICENSE = GPLv2 or GPLv3
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 177ae6a..c8c862b 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NEON_VERSION = 0.30.0
-NEON_SITE = http://www.webdav.org/neon/
+NEON_SITE = http://www.webdav.org/neon
 NEON_LICENSE = LGPLv2+ (library), GPLv2+ (manual and tests)
 NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README
 NEON_INSTALL_STAGING = YES
diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index 85e75f4..e32ac37 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NEWT_VERSION = 0.52.17
-NEWT_SITE = https://fedorahosted.org/releases/n/e/newt/
+NEWT_SITE = https://fedorahosted.org/releases/n/e/newt
 NEWT_INSTALL_STAGING = YES
 NEWT_DEPENDENCIES = popt slang \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index 2eb89af..927474c 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -6,7 +6,7 @@
 
 NGIRCD_VERSION = 20.3
 NGIRCD_SOURCE = ngircd-$(NGIRCD_VERSION).tar.xz
-NGIRCD_SITE = http://arthur.barton.de/pub/ngircd/
+NGIRCD_SITE = http://arthur.barton.de/pub/ngircd
 NGIRCD_DEPENDENCIES = zlib
 NGIRCD_LICENSE = GPLv2+
 NGIRCD_LICENSE_FILES = COPYING
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index c82ba4e..f36a1b3 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NUMACTL_VERSION = 2.0.9
-NUMACTL_SITE = ftp://oss.sgi.com/www/projects/libnuma/download/
+NUMACTL_SITE = ftp://oss.sgi.com/www/projects/libnuma/download
 NUMACTL_LICENSE = LGPLv2.1 (libnuma), GPLv2 (programs)
 NUMACTL_LICENSE_FILES = README
 
diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index 6249eec..d3ed7d6 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -6,7 +6,7 @@
 
 NUT_VERSION_MAJOR = 2.7
 NUT_VERSION = $(NUT_VERSION_MAJOR).2
-NUT_SITE = http://www.networkupstools.org/source/$(NUT_VERSION_MAJOR)/
+NUT_SITE = http://www.networkupstools.org/source/$(NUT_VERSION_MAJOR)
 NUT_LICENSE = GPLv2+, GPLv3+ (python scripts), GPL/Artistic (perl client)
 NUT_LICENSE_FILES = COPYING LICENSE-GPL2 LICENSE-GPL3
 NUT_DEPENDENCIES = host-pkgconf
diff --git a/package/nuttcp/nuttcp.mk b/package/nuttcp/nuttcp.mk
index 5f4c5bc..3953baa 100644
--- a/package/nuttcp/nuttcp.mk
+++ b/package/nuttcp/nuttcp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NUTTCP_VERSION = 6.1.2
-NUTTCP_SITE = http://www.lcp.nrl.navy.mil/nuttcp/
+NUTTCP_SITE = http://www.lcp.nrl.navy.mil/nuttcp
 NUTTCP_SOURCE = nuttcp-$(NUTTCP_VERSION).tar.bz2
 NUTTCP_LICENSE = GPLv2
 NUTTCP_LICENSE_FILES = LICENSE
diff --git a/package/on2-8170-libs/on2-8170-libs.mk b/package/on2-8170-libs/on2-8170-libs.mk
index 7cdb991..db68f02 100644
--- a/package/on2-8170-libs/on2-8170-libs.mk
+++ b/package/on2-8170-libs/on2-8170-libs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ON2_8170_LIBS_VERSION = 1.0
-ON2_8170_LIBS_SITE = ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec/
+ON2_8170_LIBS_SITE = ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec
 
 ON2_8170_LICENSE = PROPRIETARY
 # No license file is included in the archive
diff --git a/package/open2300/open2300.mk b/package/open2300/open2300.mk
index 307fffe..5ea0a70 100644
--- a/package/open2300/open2300.mk
+++ b/package/open2300/open2300.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN2300_SITE = http://www.lavrsen.dk/svn/open2300/trunk/
+OPEN2300_SITE = http://www.lavrsen.dk/svn/open2300/trunk
 OPEN2300_SITE_METHOD = svn
 OPEN2300_VERSION = 12
 OPEN2300_LICENSE = GPLv2
diff --git a/package/openpgm/openpgm.mk b/package/openpgm/openpgm.mk
index 951effb..f8a8506 100644
--- a/package/openpgm/openpgm.mk
+++ b/package/openpgm/openpgm.mk
@@ -6,7 +6,7 @@
 
 OPENPGM_VERSION = 5.1.118~dfsg
 OPENPGM_SOURCE = libpgm-$(OPENPGM_VERSION).tar.gz
-OPENPGM_SITE = http://openpgm.googlecode.com/files/
+OPENPGM_SITE = http://openpgm.googlecode.com/files
 OPENPGM_LICENSE = LGPLv2.1+
 OPENPGM_LICENSE_FILES = openpgm/pgm/LICENSE
 OPENPGM_INSTALL_STAGING = YES
diff --git a/package/opentyrian-data/opentyrian-data.mk b/package/opentyrian-data/opentyrian-data.mk
index 30b9002..aa3bd69 100644
--- a/package/opentyrian-data/opentyrian-data.mk
+++ b/package/opentyrian-data/opentyrian-data.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 OPENTYRIAN_DATA_VERSION = 2.1
-OPENTYRIAN_DATA_SITE = http://www.camanis.net/opentyrian/
+OPENTYRIAN_DATA_SITE = http://www.camanis.net/opentyrian
 OPENTYRIAN_DATA_SOURCE = tyrian21.zip
 OPENTYRIAN_DATA_LICENSE = Freeware
 
diff --git a/package/opentyrian/opentyrian.mk b/package/opentyrian/opentyrian.mk
index 0bdb79b..64959ca 100644
--- a/package/opentyrian/opentyrian.mk
+++ b/package/opentyrian/opentyrian.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 OPENTYRIAN_VERSION = 2.1.20130907
-OPENTYRIAN_SITE = http://www.camanis.net/opentyrian/releases/
+OPENTYRIAN_SITE = http://www.camanis.net/opentyrian/releases
 OPENTYRIAN_SOURCE = opentyrian-$(OPENTYRIAN_VERSION)-src.tar.gz
 OPENTYRIAN_LICENSE = GPLv2+
 OPENTYRIAN_LICENSE_FILES = COPYING
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index b23584c..1bc3828 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -6,7 +6,7 @@
 
 ORC_VERSION = 0.4.21
 ORC_SOURCE = orc-$(ORC_VERSION).tar.xz
-ORC_SITE = http://gstreamer.freedesktop.org/data/src/orc/
+ORC_SITE = http://gstreamer.freedesktop.org/data/src/orc
 ORC_LICENSE = BSD-2c, BSD-3c
 ORC_LICENSE_FILES = COPYING
 ORC_INSTALL_STAGING = YES
diff --git a/package/perl-datetime-tiny/perl-datetime-tiny.mk b/package/perl-datetime-tiny/perl-datetime-tiny.mk
index 8e691a8..6e9c626 100644
--- a/package/perl-datetime-tiny/perl-datetime-tiny.mk
+++ b/package/perl-datetime-tiny/perl-datetime-tiny.mk
@@ -6,7 +6,7 @@
 
 PERL_DATETIME_TINY_VERSION = 1.04
 PERL_DATETIME_TINY_SOURCE = DateTime-Tiny-$(PERL_DATETIME_TINY_VERSION).tar.gz
-PERL_DATETIME_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AD/ADAMK/
+PERL_DATETIME_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AD/ADAMK
 PERL_DATETIME_TINY_DEPENDENCIES = perl
 PERL_DATETIME_TINY_LICENSE = Artistic or GPLv1+
 PERL_DATETIME_TINY_LICENSE_FILES = LICENSE
diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index 8bb6778..5f00b5b 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -6,7 +6,7 @@
 
 PERL_GD_VERSION = 2.53
 PERL_GD_SOURCE = GD-$(PERL_GD_VERSION).tar.gz
-PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LD/LDS/
+PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LD/LDS
 PERL_GD_DEPENDENCIES = perl zlib libpng freetype gd
 PERL_GD_LICENSE = Artistic-2.0 or GPLv1+
 PERL_GD_LICENSE_FILES = LICENSE
diff --git a/package/perl-gdgraph/perl-gdgraph.mk b/package/perl-gdgraph/perl-gdgraph.mk
index 856c91c..421fe99 100644
--- a/package/perl-gdgraph/perl-gdgraph.mk
+++ b/package/perl-gdgraph/perl-gdgraph.mk
@@ -6,7 +6,7 @@
 
 PERL_GDGRAPH_VERSION = 1.48
 PERL_GDGRAPH_SOURCE = GDGraph-$(PERL_GDGRAPH_VERSION).tar.gz
-PERL_GDGRAPH_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RUZ/
+PERL_GDGRAPH_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RUZ
 PERL_GDGRAPH_DEPENDENCIES = perl perl-gd perl-gdtextutil
 PERL_GDGRAPH_LICENSE = Artistic or GPLv1+
 PERL_GDGRAPH_LICENSE_FILES = Dustismo.LICENSE
diff --git a/package/perl-gdtextutil/perl-gdtextutil.mk b/package/perl-gdtextutil/perl-gdtextutil.mk
index ad18118..381bd59 100644
--- a/package/perl-gdtextutil/perl-gdtextutil.mk
+++ b/package/perl-gdtextutil/perl-gdtextutil.mk
@@ -6,7 +6,7 @@
 
 PERL_GDTEXTUTIL_VERSION = 0.86
 PERL_GDTEXTUTIL_SOURCE = GDTextUtil-$(PERL_GDTEXTUTIL_VERSION).tar.gz
-PERL_GDTEXTUTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MV/MVERB/
+PERL_GDTEXTUTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MV/MVERB
 PERL_GDTEXTUTIL_DEPENDENCIES = perl
 PERL_GDTEXTUTIL_LICENSE_FILES = Dustismo.LICENSE
 
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
index 103a160..53bcfa1 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -6,7 +6,7 @@
 
 PERL_IO_SOCKET_SSL_VERSION = 1.997
 PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
-PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR/
+PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR
 PERL_IO_SOCKET_SSL_DEPENDENCIES = perl perl-net-ssleay
 PERL_IO_SOCKET_SSL_LICENSE = Artistic or GPLv1+
 
diff --git a/package/perl-json-tiny/perl-json-tiny.mk b/package/perl-json-tiny/perl-json-tiny.mk
index fd99ee7..3adcb49 100644
--- a/package/perl-json-tiny/perl-json-tiny.mk
+++ b/package/perl-json-tiny/perl-json-tiny.mk
@@ -6,7 +6,7 @@
 
 PERL_JSON_TINY_VERSION = 0.49
 PERL_JSON_TINY_SOURCE = JSON-Tiny-$(PERL_JSON_TINY_VERSION).tar.gz
-PERL_JSON_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAVIDO/
+PERL_JSON_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAVIDO
 PERL_JSON_TINY_DEPENDENCIES = perl
 PERL_JSON_TINY_LICENSE = Artistic-2.0
 PERL_JSON_TINY_LICENSE_FILES = LICENSE
diff --git a/package/perl-module-build/perl-module-build.mk b/package/perl-module-build/perl-module-build.mk
index b147eb8..1eabe61 100644
--- a/package/perl-module-build/perl-module-build.mk
+++ b/package/perl-module-build/perl-module-build.mk
@@ -6,7 +6,7 @@
 
 PERL_MODULE_BUILD_VERSION = 0.4206
 PERL_MODULE_BUILD_SOURCE = Module-Build-$(PERL_MODULE_BUILD_VERSION).tar.gz
-PERL_MODULE_BUILD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT/
+PERL_MODULE_BUILD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 PERL_MODULE_BUILD_LICENSE = Artistic or GPLv1+
 
 $(eval $(host-perl-package))
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 2aaee07..5dc1135 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -6,7 +6,7 @@
 
 PERL_MOJOLICIOUS_VERSION = 5.21
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
-PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI/
+PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_DEPENDENCIES = perl
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
 PERL_MOJOLICIOUS_LICENSE_FILES = LICENSE
diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
index de8e369..9e9b8a7 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.mk
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -6,7 +6,7 @@
 
 PERL_NET_SSLEAY_VERSION = 1.65
 PERL_NET_SSLEAY_SOURCE = Net-SSLeay-$(PERL_NET_SSLEAY_VERSION).tar.gz
-PERL_NET_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKEM/
+PERL_NET_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKEM
 PERL_NET_SSLEAY_DEPENDENCIES = perl openssl
 PERL_NET_SSLEAY_LICENSE = OpenSSL
 PERL_NET_SSLEAY_LICENSE_FILES = LICENSE
diff --git a/package/perl-path-tiny/perl-path-tiny.mk b/package/perl-path-tiny/perl-path-tiny.mk
index 9c20e74..d8ed899 100644
--- a/package/perl-path-tiny/perl-path-tiny.mk
+++ b/package/perl-path-tiny/perl-path-tiny.mk
@@ -6,7 +6,7 @@
 
 PERL_PATH_TINY_VERSION = 0.055
 PERL_PATH_TINY_SOURCE = Path-Tiny-$(PERL_PATH_TINY_VERSION).tar.gz
-PERL_PATH_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN/
+PERL_PATH_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
 PERL_PATH_TINY_DEPENDENCIES = perl
 PERL_PATH_TINY_LICENSE = Apache-2.0
 PERL_PATH_TINY_LICENSE_FILES = LICENSE
diff --git a/package/perl-try-tiny/perl-try-tiny.mk b/package/perl-try-tiny/perl-try-tiny.mk
index 0bb3d00..ba2b008 100644
--- a/package/perl-try-tiny/perl-try-tiny.mk
+++ b/package/perl-try-tiny/perl-try-tiny.mk
@@ -6,7 +6,7 @@
 
 PERL_TRY_TINY_VERSION = 0.22
 PERL_TRY_TINY_SOURCE = Try-Tiny-$(PERL_TRY_TINY_VERSION).tar.gz
-PERL_TRY_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DO/DOY/
+PERL_TRY_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DO/DOY
 PERL_TRY_TINY_DEPENDENCIES = perl
 PERL_TRY_TINY_LICENSE = MIT
 PERL_TRY_TINY_LICENSE_FILES = LICENSE
diff --git a/package/perl-xml-libxml/perl-xml-libxml.mk b/package/perl-xml-libxml/perl-xml-libxml.mk
index 31ff06e..1c01dab 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.mk
+++ b/package/perl-xml-libxml/perl-xml-libxml.mk
@@ -6,7 +6,7 @@
 
 PERL_XML_LIBXML_VERSION = 2.0116
 PERL_XML_LIBXML_SOURCE = XML-LibXML-$(PERL_XML_LIBXML_VERSION).tar.gz
-PERL_XML_LIBXML_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SH/SHLOMIF/
+PERL_XML_LIBXML_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SH/SHLOMIF
 PERL_XML_LIBXML_DEPENDENCIES = perl zlib libxml2 perl-xml-sax perl-xml-namespacesupport
 PERL_XML_LIBXML_LICENSE = Artistic or GPLv1+
 PERL_XML_LIBXML_LICENSE_FILES = LICENSE
diff --git a/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk b/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
index 8b87a2f..812258e 100644
--- a/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
+++ b/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
@@ -6,7 +6,7 @@
 
 PERL_XML_NAMESPACESUPPORT_VERSION = 1.11
 PERL_XML_NAMESPACESUPPORT_SOURCE = XML-NamespaceSupport-$(PERL_XML_NAMESPACESUPPORT_VERSION).tar.gz
-PERL_XML_NAMESPACESUPPORT_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PE/PERIGRIN/
+PERL_XML_NAMESPACESUPPORT_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PE/PERIGRIN
 PERL_XML_NAMESPACESUPPORT_DEPENDENCIES = perl
 PERL_XML_NAMESPACESUPPORT_LICENSE = Artistic or GPLv1+
 
diff --git a/package/perl-xml-parser/perl-xml-parser.mk b/package/perl-xml-parser/perl-xml-parser.mk
index f46f1f5..16dc6fb 100644
--- a/package/perl-xml-parser/perl-xml-parser.mk
+++ b/package/perl-xml-parser/perl-xml-parser.mk
@@ -6,7 +6,7 @@
 
 PERL_XML_PARSER_VERSION = 2.41
 PERL_XML_PARSER_SOURCE = XML-Parser-$(PERL_XML_PARSER_VERSION).tar.gz
-PERL_XML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR/
+PERL_XML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
 PERL_XML_PARSER_DEPENDENCIES = expat
 PERL_XML_PARSER_LICENSE = Artistic or GPLv1+
 
diff --git a/package/perl-xml-sax-base/perl-xml-sax-base.mk b/package/perl-xml-sax-base/perl-xml-sax-base.mk
index 0e8c67b..528e976 100644
--- a/package/perl-xml-sax-base/perl-xml-sax-base.mk
+++ b/package/perl-xml-sax-base/perl-xml-sax-base.mk
@@ -6,7 +6,7 @@
 
 PERL_XML_SAX_BASE_VERSION = 1.08
 PERL_XML_SAX_BASE_SOURCE = XML-SAX-Base-$(PERL_XML_SAX_BASE_VERSION).tar.gz
-PERL_XML_SAX_BASE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GR/GRANTM/
+PERL_XML_SAX_BASE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GR/GRANTM
 PERL_XML_SAX_BASE_DEPENDENCIES = perl
 PERL_XML_SAX_BASE_LICENSE = Artistic or GPLv1+
 
diff --git a/package/perl-xml-sax/perl-xml-sax.mk b/package/perl-xml-sax/perl-xml-sax.mk
index 83730c2..04d8e54 100644
--- a/package/perl-xml-sax/perl-xml-sax.mk
+++ b/package/perl-xml-sax/perl-xml-sax.mk
@@ -6,7 +6,7 @@
 
 PERL_XML_SAX_VERSION = 0.99
 PERL_XML_SAX_SOURCE = XML-SAX-$(PERL_XML_SAX_VERSION).tar.gz
-PERL_XML_SAX_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GR/GRANTM/
+PERL_XML_SAX_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GR/GRANTM
 PERL_XML_SAX_DEPENDENCIES = perl perl-xml-namespacesupport perl-xml-sax-base
 PERL_XML_SAX_LICENSE = Artistic or GPLv1+
 PERL_XML_SAX_LICENSE_FILES = LICENSE
diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index b5ce8a0..bfb3906 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PICOCOM_VERSION = 1.7
-PICOCOM_SITE    = http://picocom.googlecode.com/files/
+PICOCOM_SITE    = http://picocom.googlecode.com/files
 PICOCOM_LICENSE = GPLv2+
 PICOCOM_LICENSE_FILES = LICENSE.txt
 
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index 9641371..c961536 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PKGCONF_VERSION = 0.8.9
-PKGCONF_SITE = http://rabbit.dereferenced.org/~nenolod/distfiles/
+PKGCONF_SITE = http://rabbit.dereferenced.org/~nenolod/distfiles
 PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.bz2
 PKGCONF_LICENSE = pkgconf license
 PKGCONF_LICENSE_FILES = COPYING
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 5ff530b..5638c39 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 POLKIT_VERSION = 0.103
-POLKIT_SITE = http://www.freedesktop.org/software/polkit/releases/
+POLKIT_SITE = http://www.freedesktop.org/software/polkit/releases
 POLKIT_LICENSE = GPLv2
 POLKIT_LICENSE_FILES = COPYING
 
diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index 54e7c88..48708dc 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -6,7 +6,7 @@
 
 POPT_VERSION = 1.16
 # rpm5.org down
-POPT_SITE = http://anduin.linuxfromscratch.org/sources/BLFS/svn/p/
+POPT_SITE = http://anduin.linuxfromscratch.org/sources/BLFS/svn/p
 POPT_INSTALL_STAGING = YES
 POPT_LICENSE = MIT
 POPT_LICENSE_FILES = COPYING
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 45c19c3..68bb0a5 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -6,7 +6,7 @@
 
 PROFTPD_VERSION = 1.3.4d
 PROFTPD_SOURCE = proftpd-$(PROFTPD_VERSION).tar.gz
-PROFTPD_SITE = ftp://ftp.proftpd.org/distrib/source/
+PROFTPD_SITE = ftp://ftp.proftpd.org/distrib/source
 PROFTPD_LICENSE = GPLv2+
 PROFTPD_LICENSE_FILES = COPYING
 
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index ceb64df..f5e11df 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PROTOBUF_VERSION = 2.5.0
-PROTOBUF_SITE = http://protobuf.googlecode.com/files/
+PROTOBUF_SITE = http://protobuf.googlecode.com/files
 PROTOBUF_LICENSE = BSD-3c
 PROTOBUF_LICENSE_FILES = COPYING.txt
 
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 94df387..17dce64 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -6,7 +6,7 @@
 
 PULSEAUDIO_VERSION = 5.0
 PULSEAUDIO_SOURCE = pulseaudio-$(PULSEAUDIO_VERSION).tar.xz
-PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases/
+PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases
 PULSEAUDIO_INSTALL_STAGING = YES
 PULSEAUDIO_LICENSE = LGPLv2.1+ (specific license for modules, see LICENSE file)
 PULSEAUDIO_LICENSE_FILES = LICENSE GPL LGPL
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index 8499a7b..3d5c86f 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CFFI_VERSION = 0.8.2
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
-PYTHON_CFFI_SITE = https://pypi.python.org/packages/source/c/cffi/
+PYTHON_CFFI_SITE = https://pypi.python.org/packages/source/c/cffi
 PYTHON_CFFI_SETUP_TYPE = setuptools
 PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
 PYTHON_CFFI_LICENSE = MIT
diff --git a/package/python-crc16/python-crc16.mk b/package/python-crc16/python-crc16.mk
index 9dd09ae..5b9b13b 100644
--- a/package/python-crc16/python-crc16.mk
+++ b/package/python-crc16/python-crc16.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CRC16_VERSION = 0.1.1
 PYTHON_CRC16_SOURCE = crc16-$(PYTHON_CRC16_VERSION).tar.gz
-PYTHON_CRC16_SITE = http://pycrc16.googlecode.com/files/
+PYTHON_CRC16_SITE = http://pycrc16.googlecode.com/files
 PYTHON_CRC16_LICENSE = LGPLv3+
 PYTHON_CRC16_LICENSE_FILES = COPYING.txt
 PYTHON_CRC16_SETUP_TYPE = distutils
diff --git a/package/python-daemon/python-daemon.mk b/package/python-daemon/python-daemon.mk
index d66842c..b8b80ba 100644
--- a/package/python-daemon/python-daemon.mk
+++ b/package/python-daemon/python-daemon.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_DAEMON_VERSION = 1.5.5
-PYTHON_DAEMON_SITE = https://pypi.python.org/packages/source/p/python-daemon/
+PYTHON_DAEMON_SITE = https://pypi.python.org/packages/source/p/python-daemon
 PYTHON_DAEMON_LICENSE = Python-2.0 (library), GPLv2+ (test)
 PYTHON_DAEMON_LICENSE_FILES = LICENSE.PSF-2 LICENSE.GPL-2
 PYTHON_DAEMON_SETUP_TYPE = setuptools
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index d1daa7f..236462a 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -6,7 +6,7 @@
 
 PYTHON_IPYTHON_VERSION = 2.1.0
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://pypi.python.org/packages/source/i/ipython/
+PYTHON_IPYTHON_SITE = https://pypi.python.org/packages/source/i/ipython
 PYTHON_IPYTHON_LICENSE = BSD-3c
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst
 PYTHON_IPYTHON_SETUP_TYPE = distutils
diff --git a/package/python-json-schema-validator/python-json-schema-validator.mk b/package/python-json-schema-validator/python-json-schema-validator.mk
index 472b1c0..0ff5554 100644
--- a/package/python-json-schema-validator/python-json-schema-validator.mk
+++ b/package/python-json-schema-validator/python-json-schema-validator.mk
@@ -6,7 +6,7 @@
 
 PYTHON_JSON_SCHEMA_VALIDATOR_VERSION = 2.3
 PYTHON_JSON_SCHEMA_VALIDATOR_SOURCE = json-schema-validator-$(PYTHON_JSON_SCHEMA_VALIDATOR_VERSION).tar.gz
-PYTHON_JSON_SCHEMA_VALIDATOR_SITE = http://pypi.python.org/packages/source/j/json-schema-validator/
+PYTHON_JSON_SCHEMA_VALIDATOR_SITE = http://pypi.python.org/packages/source/j/json-schema-validator
 PYTHON_JSON_SCHEMA_VALIDATOR_LICENSE = LGPLv3
 PYTHON_JSON_SCHEMA_VALIDATOR_SETUP_TYPE = setuptools
 PYTHON_JSON_SCHEMA_VALIDATOR_DEPENDENCIES = python-versiontools
diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
index 3f27f20..a2e0af8 100644
--- a/package/python-keyring/python-keyring.mk
+++ b/package/python-keyring/python-keyring.mk
@@ -6,7 +6,7 @@
 
 PYTHON_KEYRING_VERSION = 3.0.5
 PYTHON_KEYRING_SOURCE = keyring-$(PYTHON_KEYRING_VERSION).zip
-PYTHON_KEYRING_SITE = http://pypi.python.org/packages/source/k/keyring/
+PYTHON_KEYRING_SITE = http://pypi.python.org/packages/source/k/keyring
 PYTHON_KEYRING_SETUP_TYPE = setuptools
 PYTHON_KEYRING_LICENSE = python software foundation license
 
diff --git a/package/python-mad/python-mad.mk b/package/python-mad/python-mad.mk
index a476fe1..3395071 100644
--- a/package/python-mad/python-mad.mk
+++ b/package/python-mad/python-mad.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MAD_VERSION = 0.6
 PYTHON_MAD_SOURCE = pymad-$(PYTHON_MAD_VERSION).tar.gz
-PYTHON_MAD_SITE = http://spacepants.org/src/pymad/download/
+PYTHON_MAD_SITE = http://spacepants.org/src/pymad/download
 PYTHON_MAD_SETUP_TYPE = distutils
 PYTHON_MAD_LICENSE = GPLv2+
 PYTHON_MAD_LICENSE_FILES = COPYING
diff --git a/package/python-meld3/python-meld3.mk b/package/python-meld3/python-meld3.mk
index cb8dec0..3c8acbc 100644
--- a/package/python-meld3/python-meld3.mk
+++ b/package/python-meld3/python-meld3.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MELD3_VERSION = 0.6.8
 PYTHON_MELD3_SOURCE = meld3-$(PYTHON_MELD3_VERSION).tar.gz
-PYTHON_MELD3_SITE = http://pypi.python.org/packages/source/m/meld3/
+PYTHON_MELD3_SITE = http://pypi.python.org/packages/source/m/meld3
 PYTHON_MELD3_LICENSE = ZPLv2.1
 PYTHON_MELD3_LICENSE_FILES = COPYRIGHT.txt LICENSE.txt
 PYTHON_MELD3_SETUP_TYPE = distutils
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index 725a29d..adf78b2 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MSGPACK_VERSION = 0.4.0
 PYTHON_MSGPACK_SOURCE = msgpack-python-$(PYTHON_MSGPACK_VERSION).tar.gz
-PYTHON_MSGPACK_SITE = https://pypi.python.org/packages/source/m/msgpack-python/
+PYTHON_MSGPACK_SITE = https://pypi.python.org/packages/source/m/msgpack-python
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
diff --git a/package/python-posix-ipc/python-posix-ipc.mk b/package/python-posix-ipc/python-posix-ipc.mk
index 3e81bbf..5fa7471 100644
--- a/package/python-posix-ipc/python-posix-ipc.mk
+++ b/package/python-posix-ipc/python-posix-ipc.mk
@@ -6,7 +6,7 @@
 
 PYTHON_POSIX_IPC_VERSION = 0.9.6
 PYTHON_POSIX_IPC_SOURCE = posix_ipc-$(PYTHON_POSIX_IPC_VERSION).tar.gz
-PYTHON_POSIX_IPC_SITE = http://semanchuk.com/philip/posix_ipc/
+PYTHON_POSIX_IPC_SITE = http://semanchuk.com/philip/posix_ipc
 PYTHON_POSIX_IPC_LICENSE = BSD-3c
 PYTHON_POSIX_IPC_LICENSE_FILES = LICENSE
 PYTHON_POSIX_IPC_SETUP_TYPE = distutils
diff --git a/package/python-pyasn/python-pyasn.mk b/package/python-pyasn/python-pyasn.mk
index b44a56a..fbae090 100644
--- a/package/python-pyasn/python-pyasn.mk
+++ b/package/python-pyasn/python-pyasn.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYASN_VERSION = 0.1.7
 PYTHON_PYASN_SOURCE = pyasn1-$(PYTHON_PYASN_VERSION).tar.gz
-PYTHON_PYASN_SITE = https://pypi.python.org/packages/source/p/pyasn1/
+PYTHON_PYASN_SITE = https://pypi.python.org/packages/source/p/pyasn1
 PYTHON_PYASN_LICENSE = BSD-2c
 PYTHON_PYASN_LICENSE_FILES = LICENSE
 PYTHON_PYASN_SETUP_TYPE = distutils
diff --git a/package/python-pyrex/python-pyrex.mk b/package/python-pyrex/python-pyrex.mk
index 7f424ad..6ddb2dc 100644
--- a/package/python-pyrex/python-pyrex.mk
+++ b/package/python-pyrex/python-pyrex.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYREX_VERSION = 0.9.9
 PYTHON_PYREX_SOURCE = Pyrex-$(PYTHON_PYREX_VERSION).tar.gz
-PYTHON_PYREX_SITE = http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex/
+PYTHON_PYREX_SITE = http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex
 PYTHON_PYREX_LICENSE = Apache-v2
 PYTHON_PYREX_LICENSE_FILES = LICENSE.txt
 PYTHON_PYREX_SETUP_TYPE = distutils
diff --git a/package/python-pyro/python-pyro.mk b/package/python-pyro/python-pyro.mk
index 6f118ba..5e636e1 100644
--- a/package/python-pyro/python-pyro.mk
+++ b/package/python-pyro/python-pyro.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYRO_VERSION = 3.14
 PYTHON_PYRO_SOURCE  = Pyro-$(PYTHON_PYRO_VERSION).tar.gz
-PYTHON_PYRO_SITE    = https://pypi.python.org/packages/source/P/Pyro/
+PYTHON_PYRO_SITE    = https://pypi.python.org/packages/source/P/Pyro
 PYTHON_PYRO_LICENSE = MIT
 PYTHON_PYRO_LICENSE_FILES = LICENSE
 PYTHON_PYRO_SETUP_TYPE = distutils
diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index 2889241..82bf3d0 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYZMQ_VERSION = 14.3.1
 PYTHON_PYZMQ_SOURCE = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
-PYTHON_PYZMQ_SITE = http://pypi.python.org/packages/source/p/pyzmq/
+PYTHON_PYZMQ_SITE = http://pypi.python.org/packages/source/p/pyzmq
 PYTHON_PYZMQ_LICENSE = LGPLv3+ BSD-3c Apache-2.0
 # Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
 PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
diff --git a/package/python-simplejson/python-simplejson.mk b/package/python-simplejson/python-simplejson.mk
index 3045b4e..61283b7 100644
--- a/package/python-simplejson/python-simplejson.mk
+++ b/package/python-simplejson/python-simplejson.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SIMPLEJSON_VERSION = 3.5.3
 PYTHON_SIMPLEJSON_SOURCE = simplejson-$(PYTHON_SIMPLEJSON_VERSION).tar.gz
-PYTHON_SIMPLEJSON_SITE = http://pypi.python.org/packages/source/s/simplejson/
+PYTHON_SIMPLEJSON_SITE = http://pypi.python.org/packages/source/s/simplejson
 PYTHON_SIMPLEJSON_LICENSE = MIT
 PYTHON_SIMPLEJSON_LICENSE_FILES = LICENSE.txt
 PYTHON_SIMPLEJSON_SETUP_TYPE = distutils
diff --git a/package/python-versiontools/python-versiontools.mk b/package/python-versiontools/python-versiontools.mk
index 7d745b9..4f763db 100644
--- a/package/python-versiontools/python-versiontools.mk
+++ b/package/python-versiontools/python-versiontools.mk
@@ -6,7 +6,7 @@
 
 PYTHON_VERSIONTOOLS_VERSION = 1.9.1
 PYTHON_VERSIONTOOLS_SOURCE = versiontools-$(PYTHON_VERSIONTOOLS_VERSION).tar.gz
-PYTHON_VERSIONTOOLS_SITE = http://pypi.python.org/packages/source/v/versiontools/
+PYTHON_VERSIONTOOLS_SITE = http://pypi.python.org/packages/source/v/versiontools
 PYTHON_VERSIONTOOLS_SETUP_TYPE = setuptools
 PYTHON_VERSIONTOOLS_LICENSE = LGPLv3
 
diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index b888435..888370a 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QEXTSERIALPORT_VERSION     = 6c47244de4ce6db43c2f05caee957666c951dae1
-QEXTSERIALPORT_SITE        = https://qextserialport.googlecode.com/git/
+QEXTSERIALPORT_SITE        = https://qextserialport.googlecode.com/git
 QEXTSERIALPORT_SITE_METHOD = git
 
 QEXTSERIALPORT_LICENSE = MIT
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index a88b593..8dbb355 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,6 +1,6 @@
 QT5_VERSION_MAJOR = 5.3
 QT5_VERSION = $(QT5_VERSION_MAJOR).1
-QT5_SITE = http://download.qt-project.org/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules/
+QT5_SITE = http://download.qt-project.org/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 include $(sort $(wildcard package/qt5/*/*.mk))
 
 define QT5_LA_PRL_FILES_FIXUP
diff --git a/package/read-edid/read-edid.mk b/package/read-edid/read-edid.mk
index 0cc576d..54064d3 100644
--- a/package/read-edid/read-edid.mk
+++ b/package/read-edid/read-edid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 READ_EDID_VERSION = 1.4.2
-READ_EDID_SITE = http://www.polypux.org/projects/read-edid/
+READ_EDID_SITE = http://www.polypux.org/projects/read-edid
 READ_EDID_LICENSE = GPLv2
 READ_EDID_LICENSE_FILES = COPYING
 
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index f86ed00..13d8e2c 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -6,7 +6,7 @@
 
 RPM_VERSION_MAJOR = 5.2
 RPM_VERSION = $(RPM_VERSION_MAJOR).0
-RPM_SITE = http://rpm5.org/files/rpm/rpm-$(RPM_VERSION_MAJOR)/
+RPM_SITE = http://rpm5.org/files/rpm/rpm-$(RPM_VERSION_MAJOR)
 RPM_DEPENDENCIES = zlib beecrypt neon popt
 RPM_LICENSE = LGPLv2.1
 RPM_LICENSE_FILES = COPYING.LIB
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 240f04e..67b80ad 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RSYSLOG_VERSION = 7.6.0
-RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog/
+RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 RSYSLOG_LICENSE = GPLv3 LGPLv3 Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
 RSYSLOG_DEPENDENCIES = zlib libestr liblogging json-c util-linux host-pkgconf
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index bee4782..caa7959 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RT_TESTS_SITE = http://snapshot.debian.org/archive/debian/20111202T222101Z/pool/main/r/rt-tests/
+RT_TESTS_SITE = http://snapshot.debian.org/archive/debian/20111202T222101Z/pool/main/r/rt-tests
 RT_TESTS_VERSION = 0.83
 RT_TESTS_SOURCE = rt-tests_$(RT_TESTS_VERSION).orig.tar.gz
 RT_TESTS_LICENSE = GPLv2+
diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
index 72327b0..90a2455 100644
--- a/package/rtai/rtai.mk
+++ b/package/rtai/rtai.mk
@@ -6,7 +6,7 @@
 
 RTAI_VERSION = 3.8.1
 RTAI_SOURCE  = rtai-$(RTAI_VERSION).tar.bz2
-RTAI_SITE    = https://www.rtai.org/userfiles/downloads/RTAI/
+RTAI_SITE    = https://www.rtai.org/userfiles/downloads/RTAI
 RTAI_INSTALL_STAGING = YES
 
 # The <pkg>_CONFIG_SCRIPTS cannot apply here to the specificities of rtai-config
diff --git a/package/rtptools/rtptools.mk b/package/rtptools/rtptools.mk
index 2f67bf3..d93a911 100644
--- a/package/rtptools/rtptools.mk
+++ b/package/rtptools/rtptools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RTPTOOLS_VERSION = 1.20
-RTPTOOLS_SITE = http://www.cs.columbia.edu/irt/software/rtptools/download/
+RTPTOOLS_SITE = http://www.cs.columbia.edu/irt/software/rtptools/download
 RTPTOOLS_LICENSE = MIT-like (research and education only)
 RTPTOOLS_LICENSE_FILES = COPYRIGHT
 
diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 4dc0568..7e05fdc 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAM_BA_SITE    = http://www.atmel.com/dyn/resources/prod_documents/
+SAM_BA_SITE    = http://www.atmel.com/dyn/resources/prod_documents
 SAM_BA_VERSION = 2.12
 SAM_BA_SOURCE  = sam-ba_$(SAM_BA_VERSION).zip
 SAM_BA_PATCH = sam-ba_$(SAM_BA_VERSION)_patch5.gz
diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index 6a6fa0b..ebd988b 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SANE_BACKENDS_VERSION = 1.0.22
-SANE_BACKENDS_SITE = http://sources.buildroot.net/
+SANE_BACKENDS_SITE = http://sources.buildroot.net
 SANE_BACKENDS_CONFIG_SCRIPTS = sane-config
 SANE_BACKENDS_LICENSE = GPLv2+
 SANE_BACKENDS_LICENSE_FILES = COPYING
diff --git a/package/sdl_gfx/sdl_gfx.mk b/package/sdl_gfx/sdl_gfx.mk
index 3d65db4..0188a3a 100644
--- a/package/sdl_gfx/sdl_gfx.mk
+++ b/package/sdl_gfx/sdl_gfx.mk
@@ -7,7 +7,7 @@
 SDL_GFX_VERSION_MAJOR = 2.0
 SDL_GFX_VERSION = $(SDL_GFX_VERSION_MAJOR).23
 SDL_GFX_SOURCE = SDL_gfx-$(SDL_GFX_VERSION).tar.gz
-SDL_GFX_SITE = http://www.ferzkopp.net/Software/SDL_gfx-$(SDL_GFX_VERSION_MAJOR)/
+SDL_GFX_SITE = http://www.ferzkopp.net/Software/SDL_gfx-$(SDL_GFX_VERSION_MAJOR)
 SDL_GFX_LICENSE = zlib
 SDL_GFX_LICENSE_FILES = COPYING LICENSE
 SDL_GFX_INSTALL_STAGING = YES
diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index 51b1476..6eccd86 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -6,7 +6,7 @@
 
 SDL_MIXER_VERSION = 1.2.12
 SDL_MIXER_SOURCE = SDL_mixer-$(SDL_MIXER_VERSION).tar.gz
-SDL_MIXER_SITE = http://www.libsdl.org/projects/SDL_mixer/release/
+SDL_MIXER_SITE = http://www.libsdl.org/projects/SDL_mixer/release
 SDL_MIXER_LICENSE = zlib
 SDL_MIXER_LICENSE_FILES = COPYING
 
diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index 4ecf727..98e4aec 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -6,7 +6,7 @@
 
 SDL_SOUND_VERSION = 1.0.3
 SDL_SOUND_SOURCE = SDL_sound-$(SDL_SOUND_VERSION).tar.gz
-SDL_SOUND_SITE = http://icculus.org/SDL_sound/downloads/
+SDL_SOUND_SITE = http://icculus.org/SDL_sound/downloads
 SDL_SOUND_LICENSE = LGPLv2.1+
 SDL_SOUND_LICENSE_FILES = COPYING
 SDL_SOUND_INSTALL_STAGING = YES
diff --git a/package/sdl_ttf/sdl_ttf.mk b/package/sdl_ttf/sdl_ttf.mk
index 23fb335..c3e8d29 100644
--- a/package/sdl_ttf/sdl_ttf.mk
+++ b/package/sdl_ttf/sdl_ttf.mk
@@ -6,7 +6,7 @@
 
 SDL_TTF_VERSION = 2.0.11
 SDL_TTF_SOURCE = SDL_ttf-$(SDL_TTF_VERSION).tar.gz
-SDL_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release/
+SDL_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
 SDL_TTF_LICENSE = zlib
 SDL_TTF_LICENSE_FILES = COPYING
 
diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index 9f28216..d4c0396 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -7,7 +7,7 @@
 SETSERIAL_VERSION = 2.17
 SETSERIAL_PATCH = setserial_2.17-45.3.diff.gz
 SETSERIAL_SOURCE = setserial_$(SETSERIAL_VERSION).orig.tar.gz
-SETSERIAL_SITE = http://snapshot.debian.org/archive/debian/20131001T214925Z/pool/main/s/setserial/
+SETSERIAL_SITE = http://snapshot.debian.org/archive/debian/20131001T214925Z/pool/main/s/setserial
 SETSERIAL_LICENSE = GPLv2
 SETSERIAL_LICENSE_FILES = debian/copyright
 
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index 5c56b6f..c3b7272 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -6,7 +6,7 @@
 
 SG3_UTILS_VERSION = 1.39
 SG3_UTILS_SOURCE = sg3_utils-$(SG3_UTILS_VERSION).tar.xz
-SG3_UTILS_SITE  = http://sg.danny.cz/sg/p/
+SG3_UTILS_SITE  = http://sg.danny.cz/sg/p
 SG3_UTILS_LICENSE = BSD-3c
 # utils progs are GPLv2+ licenced
 ifeq ($(BR2_PACKAGE_SG3_UTILS_PROGS),y)
diff --git a/package/simicsfs/simicsfs.mk b/package/simicsfs/simicsfs.mk
index 425f000..3acd265 100644
--- a/package/simicsfs/simicsfs.mk
+++ b/package/simicsfs/simicsfs.mk
@@ -5,7 +5,7 @@
 ###############################################################################
 
 SIMICSFS_VERSION = 1.17
-SIMICSFS_SITE = http://download.simics.net/pub/
+SIMICSFS_SITE = http://download.simics.net/pub
 SIMICSFS_LICENSE = GPLv2+
 SIMICSFS_LICENSE_FILES = hostfs.h
 SIMICSFS_DEPENDENCIES = linux
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index ad1155d..529f4e5 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -7,7 +7,7 @@
 SLANG_VERSION_MAJOR = 2.2
 SLANG_VERSION = $(SLANG_VERSION_MAJOR).4
 SLANG_SOURCE = slang-$(SLANG_VERSION).tar.bz2
-SLANG_SITE = ftp://ftp.fu-berlin.de/pub/unix/misc/slang/v$(SLANG_VERSION_MAJOR)/
+SLANG_SITE = ftp://ftp.fu-berlin.de/pub/unix/misc/slang/v$(SLANG_VERSION_MAJOR)
 SLANG_LICENSE = GPLv2+
 SLANG_LICENSE_FILES = COPYING
 SLANG_INSTALL_STAGING = YES
diff --git a/package/smstools3/smstools3.mk b/package/smstools3/smstools3.mk
index 0b38c25..a1684de 100644
--- a/package/smstools3/smstools3.mk
+++ b/package/smstools3/smstools3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SMSTOOLS3_VERSION = 3.1.15
-SMSTOOLS3_SITE = http://smstools3.kekekasvi.com/packages/
+SMSTOOLS3_SITE = http://smstools3.kekekasvi.com/packages
 SMSTOOLS3_LICENSE = GPLv2+
 SMSTOOLS3_LICENSE_FILES = doc/license.html LICENSE
 
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 7172ea0..67a691b 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -6,7 +6,7 @@
 
 SOCAT_VERSION = 2.0.0-b7
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
-SOCAT_SITE = http://www.dest-unreach.org/socat/download/
+SOCAT_SITE = http://www.dest-unreach.org/socat/download
 SOCAT_LICENSE = GPLv2
 SOCAT_LICENSE_FILES = COPYING
 SOCAT_CONF_ENV = sc_cv_termios_ispeed=no \
diff --git a/package/spice-protocol/spice-protocol.mk b/package/spice-protocol/spice-protocol.mk
index fda87b6..2b7c937 100644
--- a/package/spice-protocol/spice-protocol.mk
+++ b/package/spice-protocol/spice-protocol.mk
@@ -6,7 +6,7 @@
 
 SPICE_PROTOCOL_VERSION         = 0.12.6
 SPICE_PROTOCOL_SOURCE          = spice-protocol-$(SPICE_PROTOCOL_VERSION).tar.bz2
-SPICE_PROTOCOL_SITE            = http://www.spice-space.org/download/releases/
+SPICE_PROTOCOL_SITE            = http://www.spice-space.org/download/releases
 SPICE_PROTOCOL_LICENSE         = BSD-3c
 SPICE_PROTOCOL_LICENSE_FILES   = COPYING
 SPICE_PROTOCOL_INSTALL_STAGING = YES
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index c23b67e..c20d42d 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -6,7 +6,7 @@
 
 SPICE_VERSION         = 0.12.4
 SPICE_SOURCE          = spice-$(SPICE_VERSION).tar.bz2
-SPICE_SITE            = http://www.spice-space.org/download/releases/
+SPICE_SITE            = http://www.spice-space.org/download/releases
 SPICE_LICENSE         = LGPLv2.1+
 SPICE_LICENSE_FILES   = COPYING
 SPICE_INSTALL_STAGING = YES
diff --git a/package/statserial/statserial.mk b/package/statserial/statserial.mk
index e59267a..f0e15bc 100644
--- a/package/statserial/statserial.mk
+++ b/package/statserial/statserial.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STATSERIAL_VERSION = 1.1
-STATSERIAL_SITE = http://www.ibiblio.org/pub/Linux/system/serial/
+STATSERIAL_SITE = http://www.ibiblio.org/pub/Linux/system/serial
 STATSERIAL_DEPENDENCIES = ncurses
 STATSERIAL_LICENSE = GPLv2+
 STATSERIAL_LICENSE_FILES = COPYING
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index aef67b9..2da0e95 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION = 5.02
-STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel/archive/5.x/
+STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel/archive/5.x
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPT = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork
 STUNNEL_LICENSE = GPLv2+
diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
index d2d58e2..6bd64a9 100644
--- a/package/supervisor/supervisor.mk
+++ b/package/supervisor/supervisor.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SUPERVISOR_VERSION = 3.0a12
-SUPERVISOR_SITE = http://pypi.python.org/packages/source/s/supervisor/
+SUPERVISOR_SITE = http://pypi.python.org/packages/source/s/supervisor
 SUPERVISOR_LICENSE_FILES = LICENSES.txt
 SUPERVISOR_SETUP_TYPE = setuptools
 
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 125b2fd..9729276 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SYSTEMD_VERSION = 215
-SYSTEMD_SITE = http://www.freedesktop.org/software/systemd/
+SYSTEMD_SITE = http://www.freedesktop.org/software/systemd
 SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
 SYSTEMD_LICENSE = LGPLv2.1+; GPLv2+ for udev; MIT-like license for few source files listed in README
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 LICENSE.MIT
diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index 7be264a..a621ad9 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -7,7 +7,7 @@
 THTTPD_VERSION = 2.25b
 THTTPD_SOURCE = thttpd_$(THTTPD_VERSION).orig.tar.gz
 THTTPD_PATCH = thttpd_$(THTTPD_VERSION)-11.diff.gz
-THTTPD_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/t/thttpd/
+THTTPD_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/t/thttpd
 THTTPD_LICENSE = BSD-2c
 THTTPD_LICENSE_FILES = thttpd.c
 
diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
index 4e83f1e..c831dae 100644
--- a/package/ti-gfx/ti-gfx.mk
+++ b/package/ti-gfx/ti-gfx.mk
@@ -15,7 +15,7 @@ TI_GFX_SOURCE = Graphics_SDK_setuplinux_softfp_$(TI_GFX_VERSION).bin
 endif
 
 TI_GFX_SO_VERSION = 1.10.2359475
-TI_GFX_SITE = http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/$(TI_GFX_VERSION)/exports/
+TI_GFX_SITE = http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/$(TI_GFX_VERSION)/exports
 TI_GFX_LICENSE = Technology / Software Publicly Available
 TI_GFX_LICENSE_FILES = TSPA.txt
 TI_GFX_INSTALL_STAGING = YES
diff --git a/package/tidsp-binaries/tidsp-binaries.mk b/package/tidsp-binaries/tidsp-binaries.mk
index 12e7160..bc542cd 100644
--- a/package/tidsp-binaries/tidsp-binaries.mk
+++ b/package/tidsp-binaries/tidsp-binaries.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TIDSP_BINARIES_VERSION = 23.i3.8
-TIDSP_BINARIES_SITE = http://gst-dsp.googlecode.com/files/
+TIDSP_BINARIES_SITE = http://gst-dsp.googlecode.com/files
 TIDSP_BINARIES_LICENSE = TI Proprietary License
 TIDSP_BINARIES_LICENSE_FILES = LICENSE
 
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 10a11d4..6c53d27 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TRANSMISSION_VERSION = 2.84
-TRANSMISSION_SITE = http://download.transmissionbt.com/files/
+TRANSMISSION_SITE = http://download.transmissionbt.com/files
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_DEPENDENCIES = \
 	host-pkgconf \
diff --git a/package/tree/tree.mk b/package/tree/tree.mk
index 656bf65..922deb8 100644
--- a/package/tree/tree.mk
+++ b/package/tree/tree.mk
@@ -6,7 +6,7 @@
 
 TREE_VERSION = 1.6.0
 TREE_SOURCE = tree-$(TREE_VERSION).tgz
-TREE_SITE = http://mama.indstate.edu/users/ice/tree/src/
+TREE_SITE = http://mama.indstate.edu/users/ice/tree/src
 TREE_LICENSE = GPLv2+
 TREE_LICENSE_FILES = LICENSE
 
diff --git a/package/tremor/tremor.mk b/package/tremor/tremor.mk
index b1515c1..590a18c 100644
--- a/package/tremor/tremor.mk
+++ b/package/tremor/tremor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TREMOR_SITE = http://svn.xiph.org/trunk/Tremor/
+TREMOR_SITE = http://svn.xiph.org/trunk/Tremor
 TREMOR_SITE_METHOD = svn
 TREMOR_VERSION = 18153
 TREMOR_LICENSE = BSD-3c
diff --git a/package/tstools/tstools.mk b/package/tstools/tstools.mk
index c9ac9f9..8271dcd 100644
--- a/package/tstools/tstools.mk
+++ b/package/tstools/tstools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TSTOOLS_VERSION = 1_11
-TSTOOLS_SITE    = https://tstools.googlecode.com/files/
+TSTOOLS_SITE    = https://tstools.googlecode.com/files
 TSTOOLS_SOURCE  = tstools-$(TSTOOLS_VERSION).tgz
 TSTOOLS_LICENSE = MPL v1.1
 
diff --git a/package/ucl/ucl.mk b/package/ucl/ucl.mk
index 225ad7c..2654a5a 100644
--- a/package/ucl/ucl.mk
+++ b/package/ucl/ucl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 UCL_VERSION = 1.03
-UCL_SITE = http://www.oberhumer.com/opensource/ucl/download/
+UCL_SITE = http://www.oberhumer.com/opensource/ucl/download
 UCL_LICENSE = GPLv2+
 UCL_LICENSE_FILES = COPYING
 
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index e8edae0..3aaf952 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 UDISKS_VERSION = 1.0.4
-UDISKS_SITE    = http://hal.freedesktop.org/releases/
+UDISKS_SITE    = http://hal.freedesktop.org/releases
 UDISKS_LICENSE = GPLv2+
 UDISKS_LICENSE_FILES = COPYING
 
diff --git a/package/uemacs/uemacs.mk b/package/uemacs/uemacs.mk
index 434eb8d..eeb4f26 100644
--- a/package/uemacs/uemacs.mk
+++ b/package/uemacs/uemacs.mk
@@ -6,7 +6,7 @@
 
 UEMACS_VERSION = 4.0.15-lt
 UEMACS_SOURCE = em-$(UEMACS_VERSION).tar.gz
-UEMACS_SITE = $(BR2_KERNEL_MIRROR)/software/editors/uemacs/
+UEMACS_SITE = $(BR2_KERNEL_MIRROR)/software/editors/uemacs
 UEMACS_DEPENDENCIES = ncurses
 
 define UEMACS_BUILD_CMDS
diff --git a/package/upx/upx.mk b/package/upx/upx.mk
index a039376..878d145 100644
--- a/package/upx/upx.mk
+++ b/package/upx/upx.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 UPX_VERSION = 3.91
-UPX_SITE = http://upx.sourceforge.net/download/
+UPX_SITE = http://upx.sourceforge.net/download
 UPX_SOURCE = upx-$(UPX_VERSION)-src.tar.bz2
 UPX_LICENSE = GPLv2+
 UPX_LICENSE_FILES = COPYING
diff --git a/package/urg/urg.mk b/package/urg/urg.mk
index 075a0b3..078cd70 100644
--- a/package/urg/urg.mk
+++ b/package/urg/urg.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 URG_VERSION = 0.8.18
-URG_SITE = http://www.hokuyo-aut.jp/02sensor/07scanner/download/urg_programs_en/
+URG_SITE = http://www.hokuyo-aut.jp/02sensor/07scanner/download/urg_programs_en
 URG_SOURCE = urg-$(URG_VERSION).zip
 URG_LICENSE = LGPLv3
 URG_LICENSE_FILES = COPYING
diff --git a/package/ux500-firmware/ux500-firmware.mk b/package/ux500-firmware/ux500-firmware.mk
index 14b4a8e..7e947f3 100644
--- a/package/ux500-firmware/ux500-firmware.mk
+++ b/package/ux500-firmware/ux500-firmware.mk
@@ -6,7 +6,7 @@
 
 UX500_FIRMWARE_VERSION = 1.1.3-6
 UX500_FIRMWARE_SOURCE = ux500-firmware_$(UX500_FIRMWARE_VERSION)linaro1.tar.gz
-UX500_FIRMWARE_SITE = https://launchpad.net/~igloocommunity-maintainers/+archive/snowball/+files/
+UX500_FIRMWARE_SITE = https://launchpad.net/~igloocommunity-maintainers/+archive/snowball/+files
 UX500_FIRMWARE_LICENSE = Snowball click-wrap license
 UX500_FIRMWARE_LICENSE_FILES = license.txt 
 UX500_FIRMWARE_REDISTRIBUTE = NO
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 029acf2..aee7c9d 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 VALGRIND_VERSION = 3.9.0
-VALGRIND_SITE    = http://valgrind.org/downloads/
+VALGRIND_SITE    = http://valgrind.org/downloads
 VALGRIND_SOURCE  = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPLv2 GFDLv1.2
 VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index cfa770d..2ab38d9 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 WAYLAND_VERSION = 1.5.0
-WAYLAND_SITE = http://wayland.freedesktop.org/releases/
+WAYLAND_SITE = http://wayland.freedesktop.org/releases
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
 WAYLAND_LICENSE_FILES = COPYING
diff --git a/package/webrtc-audio-processing/webrtc-audio-processing.mk b/package/webrtc-audio-processing/webrtc-audio-processing.mk
index 69f7f01..c86c51e 100644
--- a/package/webrtc-audio-processing/webrtc-audio-processing.mk
+++ b/package/webrtc-audio-processing/webrtc-audio-processing.mk
@@ -6,7 +6,7 @@
 
 WEBRTC_AUDIO_PROCESSING_VERSION = 0.1
 WEBRTC_AUDIO_PROCESSING_SOURCE = webrtc-audio-processing-$(WEBRTC_AUDIO_PROCESSING_VERSION).tar.xz
-WEBRTC_AUDIO_PROCESSING_SITE = http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/
+WEBRTC_AUDIO_PROCESSING_SITE = http://freedesktop.org/software/pulseaudio/webrtc-audio-processing
 WEBRTC_AUDIO_PROCESSING_INSTALL_STAGING = YES
 WEBRTC_AUDIO_PROCESSING_LICENSE = BSD-3c
 WEBRTC_AUDIO_PROCESSING_LICENSE_FILES = COPYING
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index ed0707b..7bb35b9 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 WESTON_VERSION = 1.5.0
-WESTON_SITE = http://wayland.freedesktop.org/releases/
+WESTON_SITE = http://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
diff --git a/package/whetstone/whetstone.mk b/package/whetstone/whetstone.mk
index b95b436..d9b4563 100644
--- a/package/whetstone/whetstone.mk
+++ b/package/whetstone/whetstone.mk
@@ -6,7 +6,7 @@
 
 WHETSTONE_VERSION = 1.2
 WHETSTONE_SOURCE = whetstone.c
-WHETSTONE_SITE = http://www.netlib.org/benchmark/
+WHETSTONE_SITE = http://www.netlib.org/benchmark
 
 define WHETSTONE_EXTRACT_CMDS
 	cp $(DL_DIR)/$($(PKG)_SOURCE) $(@D)/
diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index 9cd8bf9..e955248 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -6,7 +6,7 @@
 
 LIBXCB_VERSION = 1.10
 LIBXCB_SOURCE = libxcb-$(LIBXCB_VERSION).tar.bz2
-LIBXCB_SITE = http://xcb.freedesktop.org/dist/
+LIBXCB_SITE = http://xcb.freedesktop.org/dist
 LIBXCB_LICENSE = MIT
 LIBXCB_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index 1bf6366..d08f74a 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -6,7 +6,7 @@
 
 XCB_PROTO_VERSION = 1.10
 XCB_PROTO_SOURCE = xcb-proto-$(XCB_PROTO_VERSION).tar.bz2
-XCB_PROTO_SITE = http://xcb.freedesktop.org/dist/
+XCB_PROTO_SITE = http://xcb.freedesktop.org/dist
 XCB_PROTO_LICENSE = MIT
 XCB_PROTO_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xcb-util-image/xcb-util-image.mk b/package/x11r7/xcb-util-image/xcb-util-image.mk
index 7933b74..6978236 100644
--- a/package/x11r7/xcb-util-image/xcb-util-image.mk
+++ b/package/x11r7/xcb-util-image/xcb-util-image.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 XCB_UTIL_IMAGE_VERSION = 0.3.9
-XCB_UTIL_IMAGE_SITE = http://xcb.freedesktop.org/dist/
+XCB_UTIL_IMAGE_SITE = http://xcb.freedesktop.org/dist
 XCB_UTIL_IMAGE_SOURCE = xcb-util-image-$(XCB_UTIL_IMAGE_VERSION).tar.bz2
 XCB_UTIL_IMAGE_INSTALL_STAGING = YES
 XCB_UTIL_IMAGE_LICENSE = MIT
diff --git a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
index 8598b20..0f653c3 100644
--- a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
+++ b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
@@ -6,7 +6,7 @@
 
 XCB_UTIL_KEYSYMS_VERSION = 0.3.9
 XCB_UTIL_KEYSYMS_SOURCE = xcb-util-keysyms-$(XCB_UTIL_KEYSYMS_VERSION).tar.bz2
-XCB_UTIL_KEYSYMS_SITE = http://xcb.freedesktop.org/dist/
+XCB_UTIL_KEYSYMS_SITE = http://xcb.freedesktop.org/dist
 
 # unfortunately, no license file
 XCB_UTIL_KEYSYMS_LICENSE = MIT
diff --git a/package/x11r7/xcb-util-wm/xcb-util-wm.mk b/package/x11r7/xcb-util-wm/xcb-util-wm.mk
index b255710..95aeb22 100644
--- a/package/x11r7/xcb-util-wm/xcb-util-wm.mk
+++ b/package/x11r7/xcb-util-wm/xcb-util-wm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 XCB_UTIL_WM_VERSION = 0.4.1
-XCB_UTIL_WM_SITE = http://xcb.freedesktop.org/dist/
+XCB_UTIL_WM_SITE = http://xcb.freedesktop.org/dist
 XCB_UTIL_WM_SOURCE = xcb-util-wm-$(XCB_UTIL_WM_VERSION).tar.bz2
 XCB_UTIL_WM_INSTALL_STAGING = YES
 XCB_UTIL_WM_LICENSE = MIT
diff --git a/package/x11r7/xcb-util/xcb-util.mk b/package/x11r7/xcb-util/xcb-util.mk
index a3531d0..4416d80 100644
--- a/package/x11r7/xcb-util/xcb-util.mk
+++ b/package/x11r7/xcb-util/xcb-util.mk
@@ -6,7 +6,7 @@
 
 XCB_UTIL_VERSION = 0.3.9
 XCB_UTIL_SOURCE = xcb-util-$(XCB_UTIL_VERSION).tar.bz2
-XCB_UTIL_SITE = http://xcb.freedesktop.org/dist/
+XCB_UTIL_SITE = http://xcb.freedesktop.org/dist
 
 # unfortunately, no license file
 XCB_UTIL_LICENSE = MIT
diff --git a/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
index f2bccb0..a52f8d0 100644
--- a/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
+++ b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 XCURSOR_TRANSPARENT_THEME_VERSION = 0.1.1
-XCURSOR_TRANSPARENT_THEME_SITE = http://downloads.yoctoproject.org/releases/matchbox/utils/
+XCURSOR_TRANSPARENT_THEME_SITE = http://downloads.yoctoproject.org/releases/matchbox/utils
 XCURSOR_TRANSPARENT_THEME_DEPENDENCIES = xlib_libXcursor host-xapp_xcursorgen
 XCURSOR_TRANSPARENT_THEME_LICENSE = GPLv2
 XCURSOR_TRANSPARENT_THEME_LICENSE_FILES = COPYING
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 674d15d..2040b35 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -6,7 +6,7 @@
 
 XKEYBOARD_CONFIG_VERSION = 2.10.1
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
-XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config/
+XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config
 XKEYBOARD_CONFIG_LICENSE = MIT
 XKEYBOARD_CONFIG_LICENSE_FILES = COPYING
 
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 4e9025d..1fd3135 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -9,7 +9,7 @@ ifeq ($(XENOMAI_VERSION),)
 XENOMAI_VERSION = 2.6.3
 endif
 
-XENOMAI_SITE = http://download.gna.org/xenomai/stable/
+XENOMAI_SITE = http://download.gna.org/xenomai/stable
 XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
 XENOMAI_LICENSE = headers: GPLv2+ with exception, libraries: LGPLv2.1+, kernel: GPLv2+, docs: GFDLv1.2+, ipipe patch and can driver: GPLv2
 # GFDL is not included but refers to gnu.org
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 9402abe..9340499 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -6,7 +6,7 @@
 
 XERCES_VERSION = 3.1.1
 XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.gz
-XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources/
+XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources
 XERCES_LICENSE = Apache-2.0
 XERCES_LICENSE_FILES = LICENSE
 XERCES_MAKE = $(MAKE1)
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 0ecd049..fbcd276 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -6,7 +6,7 @@
 
 XZ_VERSION = 5.0.5
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
-XZ_SITE = http://tukaani.org/xz/
+XZ_SITE = http://tukaani.org/xz
 XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 XZ_LICENSE = GPLv2+ GPLv3+ LGPLv2.1+
diff --git a/package/yaffs2utils/yaffs2utils.mk b/package/yaffs2utils/yaffs2utils.mk
index 2f75cb9..fdd5f67 100644
--- a/package/yaffs2utils/yaffs2utils.mk
+++ b/package/yaffs2utils/yaffs2utils.mk
@@ -6,7 +6,7 @@
 
 YAFFS2UTILS_VERSION = 0.2.9
 YAFFS2UTILS_SOURCE = $(YAFFS2UTILS_VERSION).tar.gz
-YAFFS2UTILS_SITE = https://yaffs2utils.googlecode.com/files/
+YAFFS2UTILS_SITE = https://yaffs2utils.googlecode.com/files
 YAFFS2UTILS_LICENSE = GPLv2
 YAFFS2UTILS_LICENSE_FILES = COPYING
 
diff --git a/package/yasm/yasm.mk b/package/yasm/yasm.mk
index 20063ba..0bbd22d 100644
--- a/package/yasm/yasm.mk
+++ b/package/yasm/yasm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 YASM_VERSION = 1.2.0
-YASM_SITE = http://www.tortall.net/projects/yasm/releases/
+YASM_SITE = http://www.tortall.net/projects/yasm/releases
 
 define YASM_PRE_CONFIGURE_FIXUP
 # This sed prevents it compiling 2 programs (vsyasm and ytasm) 
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index c1eee3e..2ab2f5d 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ZEROMQ_VERSION = 4.0.4
-ZEROMQ_SITE = http://download.zeromq.org/
+ZEROMQ_SITE = http://download.zeromq.org
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
 ZEROMQ_LICENSE = LGPLv3+ with exceptions
-- 
1.7.9.5
