From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 18 Feb 2017 00:38:52 -0500
Subject: [Buildroot] [PATCH] packages: improve license type lists
Message-ID: <1487396332-20370-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make license type lists more uniform:

* put content license applies to in parenthesis; ex: "GPLv2+ (programs)"
* use commas to separate types listed without conjuction; ex: "GPLv2, LGPLv2"

No attempt was made to validate the claimed licenses.  This is just a tweak
to increase uniformity of the _LICENSE variables.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/cups/cups.mk                                    | 2 +-
 package/duma/duma.mk                                    | 2 +-
 package/e2fsprogs/e2fsprogs.mk                          | 2 +-
 package/file/file.mk                                    | 2 +-
 package/git/git.mk                                      | 2 +-
 package/glmark2/glmark2.mk                              | 2 +-
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 2 +-
 package/hplip/hplip.mk                                  | 2 +-
 package/liblockfile/liblockfile.mk                      | 2 +-
 package/liburcu/liburcu.mk                              | 2 +-
 package/lm-sensors/lm-sensors.mk                        | 2 +-
 package/openssh/openssh.mk                              | 2 +-
 package/procps-ng/procps-ng.mk                          | 2 +-
 package/slirp/slirp.mk                                  | 2 +-
 package/sudo/sudo.mk                                    | 2 +-
 package/valgrind/valgrind.mk                            | 2 +-
 package/vlc/vlc.mk                                      | 2 +-
 package/xenomai/xenomai.mk                              | 2 +-
 package/xscreensaver/xscreensaver.mk                    | 2 +-
 19 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 7ef2f36..ae3b9ca 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -7,7 +7,7 @@
 CUPS_VERSION = 2.2.2
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/apple/cups/releases/download/v$(CUPS_VERSION)
-CUPS_LICENSE = GPLv2 LGPLv2
+CUPS_LICENSE = GPLv2, LGPLv2
 CUPS_LICENSE_FILES = LICENSE.txt
 CUPS_INSTALL_STAGING = YES
 CUPS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) DSTROOT=$(STAGING_DIR) install
diff --git a/package/duma/duma.mk b/package/duma/duma.mk
index a8348b9..cd7f33e 100644
--- a/package/duma/duma.mk
+++ b/package/duma/duma.mk
@@ -7,7 +7,7 @@
 DUMA_VERSION = 2.5.15
 DUMA_SOURCE = duma_$(subst .,_,$(DUMA_VERSION)).tar.gz
 DUMA_SITE = http://downloads.sourceforge.net/project/duma/duma/$(DUMA_VERSION)
-DUMA_LICENSE = GPLv2+ LGPLv2.1+
+DUMA_LICENSE = GPLv2+, LGPLv2.1+
 DUMA_LICENSE_FILES = COPYING-GPL COPYING-LGPL
 
 DUMA_INSTALL_STAGING = YES
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 0253510..3829053 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -7,7 +7,7 @@
 E2FSPROGS_VERSION = 1.43.3
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
-E2FSPROGS_LICENSE = GPLv2, libuuid BSD-3c, libss and libet MIT-like with advertising clause
+E2FSPROGS_LICENSE = GPLv2, BSD-3c (libuuid), MIT-like with advertising clause (libss and libet)
 E2FSPROGS_LICENSE_FILES = NOTICE lib/uuid/COPYING lib/ss/mit-sipb-copyright.h lib/et/internal.h
 E2FSPROGS_INSTALL_STAGING = YES
 E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
diff --git a/package/file/file.mk b/package/file/file.mk
index 3309c95..39d1781 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -10,7 +10,7 @@ FILE_DEPENDENCIES = host-file zlib
 HOST_FILE_DEPENDENCIES = host-zlib
 FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 FILE_INSTALL_STAGING = YES
-FILE_LICENSE = BSD-2c, one file BSD-4c, one file BSD-3c
+FILE_LICENSE = BSD-2c, BSD-4c (one file), BSD-3c (one file)
 FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
 
 $(eval $(autotools-package))
diff --git a/package/git/git.mk b/package/git/git.mk
index 29e430d..1c15740 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -7,7 +7,7 @@
 GIT_VERSION = 2.11.1
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
-GIT_LICENSE = GPLv2 LGPLv2.1+
+GIT_LICENSE = GPLv2, LGPLv2.1+
 GIT_LICENSE_FILES = COPYING LGPL-2.1
 GIT_DEPENDENCIES = zlib host-gettext
 
diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
index f9631a0..c7cefeb 100644
--- a/package/glmark2/glmark2.mk
+++ b/package/glmark2/glmark2.mk
@@ -6,7 +6,7 @@
 
 GLMARK2_VERSION = 7215c0f337dae0b232535549c37fca441747a891
 GLMARK2_SITE = $(call github,glmark2,glmark2,$(GLMARK2_VERSION))
-GLMARK2_LICENSE = GPLv3+ SGIv1
+GLMARK2_LICENSE = GPLv3+, SGIv1
 GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
 GLMARK2_DEPENDENCIES = host-pkgconf jpeg libpng \
 	$(if $(BR2_PACKAGE_HAS_LIBEGL),libegl) \
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 0628494..b96bfe9 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -11,7 +11,7 @@ GST1_PLUGINS_BAD_INSTALL_STAGING = YES
 GST1_PLUGINS_BAD_LICENSE_FILES = COPYING COPYING.LIB
 # Unknown and GPL licensed plugins will append to GST1_PLUGINS_BAD_LICENSE if
 # enabled.
-GST1_PLUGINS_BAD_LICENSE = LGPLv2+ LGPLv2.1+
+GST1_PLUGINS_BAD_LICENSE = LGPLv2+, LGPLv2.1+
 
 GST1_PLUGINS_BAD_CONF_OPTS = \
 	--disable-examples \
diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
index 9a2c9db..cd1be04 100644
--- a/package/hplip/hplip.mk
+++ b/package/hplip/hplip.mk
@@ -8,7 +8,7 @@ HPLIP_VERSION = 3.16.11
 HPLIP_SITE = http://downloads.sourceforge.net/hplip/hplip
 HPLIP_AUTORECONF = YES
 HPLIP_DEPENDENCIES = cups libusb jpeg host-pkgconf
-HPLIP_LICENSE = GPLv2 BSD-3c MIT
+HPLIP_LICENSE = GPLv2, BSD-3c, MIT
 HPLIP_LICENSE_FILES = COPYING
 
 HPLIP_CONF_OPTS = \
diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
index e42b830..59fced6 100644
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -9,7 +9,7 @@ LIBLOCKFILE_SOURCE = liblockfile_$(LIBLOCKFILE_VERSION).orig.tar.gz
 LIBLOCKFILE_SITE = http://snapshot.debian.org/archive/debian/20151026T153523Z/pool/main/libl/liblockfile
 LIBLOCKFILE_PATCH = liblockfile_$(LIBLOCKFILE_VERSION)-6.debian.tar.bz2
 
-LIBLOCKFILE_LICENSE = LGPLv2+, dotlockfile GPLv2+
+LIBLOCKFILE_LICENSE = LGPLv2+, GPLv2+ (dotlockfile)
 LIBLOCKFILE_LICENSE_FILES = COPYRIGHT
 
 LIBLOCKFILE_INSTALL_STAGING = YES
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index 33a301d..205be6f 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -7,7 +7,7 @@
 LIBURCU_VERSION = 0.9.2
 LIBURCU_SITE = http://lttng.org/files/urcu
 LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
-LIBURCU_LICENSE = LGPLv2.1+ for the library; MIT-like license for few source files listed in LICENSE; GPLv2+ for test; GPLv3 for few *.m4 files
+LIBURCU_LICENSE = LGPLv2.1+ (library), MIT-like (few source files listed in LICENSE); GPLv2+ (test); GPLv3 (few *.m4 files)
 LIBURCU_LICENSE_FILES = lgpl-2.1.txt lgpl-relicensing.txt gpl-2.0.txt LICENSE
 
 LIBURCU_INSTALL_STAGING = YES
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index a72bba2..c198817 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -9,7 +9,7 @@ LM_SENSORS_SOURCE = lm-sensors_$(LM_SENSORS_VERSION).orig.tar.bz2
 LM_SENSORS_SITE = http://snapshot.debian.org/archive/debian/20170208T211941Z/pool/main/l/lm-sensors
 LM_SENSORS_INSTALL_STAGING = YES
 LM_SENSORS_DEPENDENCIES = host-bison host-flex
-LM_SENSORS_LICENSE = libsensors LGPLv2.1+, programs GPLv2+
+LM_SENSORS_LICENSE = LGPLv2.1+ (libsensors), GPLv2+ (programs)
 LM_SENSORS_LICENSE_FILES = COPYING.LGPL COPYING
 
 LM_SENSORS_BINS_ = bin/sensors-conf-convert
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index dd8350b..ce37ee7 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -6,7 +6,7 @@
 
 OPENSSH_VERSION = 7.4p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
-OPENSSH_LICENSE = BSD-3c BSD-2c Public Domain
+OPENSSH_LICENSE = BSD-3c, BSD-2c, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
 OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
 OPENSSH_CONF_OPTS = \
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 48b4720..0f8b20c 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -7,7 +7,7 @@
 PROCPS_NG_VERSION = 3.3.12
 PROCPS_NG_SOURCE = procps-ng-$(PROCPS_NG_VERSION).tar.xz
 PROCPS_NG_SITE = http://downloads.sourceforge.net/project/procps-ng/Production
-PROCPS_NG_LICENSE = GPLv2+, libproc and libps LGPLv2+
+PROCPS_NG_LICENSE = GPLv2+, LGPLv2+ (libproc and libps)
 PROCPS_NG_LICENSE_FILES = COPYING COPYING.LIB
 PROCPS_NG_INSTALL_STAGING = YES
 PROCPS_NG_DEPENDENCIES = ncurses host-pkgconf
diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
index 7a5f515..be3e72d 100644
--- a/package/slirp/slirp.mk
+++ b/package/slirp/slirp.mk
@@ -9,7 +9,7 @@
 # of today)
 SLIRP_VERSION = 8c2da74c1385242f20799fec8c04f8378edc6550
 SLIRP_SITE = git://anongit.freedesktop.org/spice/slirp
-SLIRP_LICENSE = BSD-4c BSD-2c
+SLIRP_LICENSE = BSD-4c, BSD-2c
 # Note: The license file 'COPYRIGHT' is missing from the sources,
 # although some files refer to it.
 SLIRP_INSTALL_STAGING = YES
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index b1a6dd3..bb0a2b5 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -6,7 +6,7 @@
 
 SUDO_VERSION = 1.8.19p2
 SUDO_SITE = http://www.sudo.ws/sudo/dist
-SUDO_LICENSE = ISC BSD-3c
+SUDO_LICENSE = ISC, BSD-3c
 SUDO_LICENSE_FILES = doc/LICENSE
 # This is to avoid sudo's make install from chown()ing files which fails
 SUDO_INSTALL_TARGET_OPTS = INSTALL_OWNER="" DESTDIR="$(TARGET_DIR)" install
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 652432f..ccc6cc3 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -7,7 +7,7 @@
 VALGRIND_VERSION = 3.12.0
 VALGRIND_SITE = http://valgrind.org/downloads
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
-VALGRIND_LICENSE = GPLv2 GFDLv1.2
+VALGRIND_LICENSE = GPLv2, GFDLv1.2
 VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
 VALGRIND_CONF_OPTS = \
 	--disable-ubsan \
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index cf0b557..666b8d4 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -7,7 +7,7 @@
 VLC_VERSION = 2.2.4
 VLC_SITE = http://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
-VLC_LICENSE = GPLv2+ LGPLv2.1+
+VLC_LICENSE = GPLv2+, LGPLv2.1+
 VLC_LICENSE_FILES = COPYING COPYING.LIB
 VLC_DEPENDENCIES = host-pkgconf
 VLC_AUTORECONF = YES
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 11ebf72..6e0e441 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -13,7 +13,7 @@ endif
 
 XENOMAI_SITE = https://xenomai.org/downloads/xenomai/stable
 XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
-XENOMAI_LICENSE = headers: GPLv2+ with exception, libraries: LGPLv2.1+, kernel: GPLv2+, docs: GFDLv1.2+, ipipe patch and can driver: GPLv2
+XENOMAI_LICENSE = GPLv2+ with exception (headers), LGPLv2.1+ (libraries), GPLv2+ (kernel), GFDLv1.2+ (docs), GPLv2 (ipipe patch, can driver)
 # GFDL is not included but refers to gnu.org
 XENOMAI_LICENSE_FILES = debian/copyright include/COPYING src/skins/native/COPYING ksrc/nucleus/COPYING
 
diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index ec714fe..831349b 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -8,7 +8,7 @@ XSCREENSAVER_VERSION = 5.32
 XSCREENSAVER_SITE = http://www.jwz.org/xscreensaver
 
 # N.B. GPLv2+ code (in the hacks/glx subdirectory) is not currently built.
-XSCREENSAVER_LICENSE = MIT-like GPLv2+
+XSCREENSAVER_LICENSE = MIT-like, GPLv2+
 XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h hacks/glx/chessmodels.h
 
 XSCREENSAVER_DEPENDENCIES = jpeg libglade libgtk2 xlib_libX11 xlib_libXt \
-- 
2.7.4
