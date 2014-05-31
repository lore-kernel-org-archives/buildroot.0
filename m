From: Simon Dawson <spdawson@gmail.com>
Date: Sat, 31 May 2014 08:55:35 +0100
Subject: [Buildroot] [PATCH] replace references to Busybox with BusyBox
Message-ID: <1401522935-4460-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The correct capitalised form appears to be "BusyBox" rather than "Busybox";
fix all references to the latter form. (Most such references occur in the
manual and in commentary in package makefiles.)

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 Makefile                                                 |  2 +-
 docs/manual/common-usage.txt                             |  4 ++--
 docs/manual/configure.txt                                | 16 ++++++++--------
 docs/manual/customize-busybox-config.txt                 |  4 ++--
 docs/manual/customize-store.txt                          |  4 ++--
 docs/manual/using-buildroot-development.txt              |  4 ++--
 docs/manual/using.txt                                    |  2 +-
 .../0001-libbb-use-poll.h-instead-of-sys-poll.h.patch    |  2 +-
 package/busybox/busybox.mk                               |  2 +-
 package/coreutils/Config.in                              |  2 +-
 package/openvpn/openvpn.mk                               |  2 +-
 package/pkg-utils.mk                                     |  2 +-
 package/rsyslog/rsyslog.mk                               |  2 +-
 package/sysklogd/sysklogd.mk                             |  2 +-
 package/sysvinit/inittab                                 |  2 +-
 package/sysvinit/sysvinit.mk                             |  4 ++--
 package/xbmc/br-xbmc                                     |  4 ++--
 system/Config.in                                         |  2 +-
 18 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/Makefile b/Makefile
index 8ccfbd8..bc7d0bc 100644
--- a/Makefile
+++ b/Makefile
@@ -89,7 +89,7 @@ CONFIG_DIR := $(TOPDIR)
 NEED_WRAPPER =
 else
 # other packages might also support Linux-style out of tree builds
-# with the O=<dir> syntax (E.G. Busybox does). As make automatically
+# with the O=<dir> syntax (E.G. BusyBox does). As make automatically
 # forwards command line variable definitions those packages get very
 # confused. Fix this by telling make to not do so
 MAKEOVERRIDES =
diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 772982a..16a1351 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -76,9 +76,9 @@ to +make+ or set in the environment:
   is the recommended way of setting it.
   +
 * +BUSYBOX_CONFIG_FILE=<path/to/.config>+, path to
-  the Busybox configuration file.
+  the BusyBox configuration file.
   +
-  Note that the Busybox configuration file can also be set from the
+  Note that the BusyBox configuration file can also be set from the
   configuration interface, so through the Buildroot +.config+ file; this
   is the recommended way of setting it.
   +
diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index da4bdb0..990923e 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -272,7 +272,7 @@ different solutions to handle the +/dev+ directory :
    requirement to have +CONFIG_DEVTMPFS+ and +CONFIG_DEVTMPFS_MOUNT+
    enabled in the kernel configuration still apply), but adds the
    +mdev+ userspace utility on top of it. +mdev+ is a program part of
-   Busybox that the kernel will call every time a device is added or
+   BusyBox that the kernel will call every time a device is added or
    removed. Thanks to the +/etc/mdev.conf+ configuration file, +mdev+
    can be configured to for example, set specific permissions or
    ownership on a device file, call a script or application whenever a
@@ -314,16 +314,16 @@ graphical applications, other network servers, etc.).
 Buildroot allows to use three different types of init systems, which
 can be chosen from +System configuration+, +Init system+:
 
- * The first solution is *Busybox*. Amongst many programs, Busybox has
+ * The first solution is *BusyBox*. Amongst many programs, BusyBox has
    an implementation of a basic +init+ program, which is sufficient
    for most embedded systems. Enabling the +BR2_INIT_BUSYBOX+ will
-   ensure Busybox will build and install its +init+ program. This is
-   the default solution in Buildroot. The Busybox +init+ program will
+   ensure BusyBox will build and install its +init+ program. This is
+   the default solution in Buildroot. The BusyBox +init+ program will
    read the +/etc/inittab+ file at boot to know what to do. The syntax
    of this file can be found in
    http://git.busybox.net/busybox/tree/examples/inittab (note that
-   Busybox +inittab+ syntax is special: do not use a random +inittab+
-   documentation from the Internet to learn about Busybox
+   BusyBox +inittab+ syntax is special: do not use a random +inittab+
+   documentation from the Internet to learn about BusyBox
    +inittab+). The default +inittab+ in Buildroot is stored in
    +system/skeleton/etc/inittab+. Apart from mounting a few important
    filesystems, the main job the default inittab does is to start the
@@ -336,7 +336,7 @@ can be chosen from +System configuration+, +Init system+:
    Linux distributions, until they switched to more recent
    alternatives such as Upstart or Systemd. +sysvinit+ also works with
    an +inittab+ file (which has a slightly different syntax than the
-   one from Busybox). The default +inittab+ installed with this init
+   one from BusyBox). The default +inittab+ installed with this init
    solution is located in +package/sysvinit/inittab+.
 
  * The third solution is *systemd*. +systemd+ is the new generation
@@ -353,5 +353,5 @@ can be chosen from +System configuration+, +Init system+:
    http://www.freedesktop.org/wiki/Software/systemd.
 
 The solution recommended by Buildroot developers is to use the
-*Busybox init* as it is sufficient for most embedded
+*BusyBox init* as it is sufficient for most embedded
 systems. *systemd* can be used for more complex situations.
diff --git a/docs/manual/customize-busybox-config.txt b/docs/manual/customize-busybox-config.txt
index ca1613d..a4a85fa 100644
--- a/docs/manual/customize-busybox-config.txt
+++ b/docs/manual/customize-busybox-config.txt
@@ -2,9 +2,9 @@
 // vim: set syntax=asciidoc:
 
 [[busybox-custom]]
-=== Customizing the Busybox configuration
+=== Customizing the BusyBox configuration
 
-http://www.busybox.net/[Busybox] is very configurable, and you may
+http://www.busybox.net/[BusyBox] is very configurable, and you may
 want to customize it. You can follow these simple steps to do so. This
 method isn't optimal, but it's simple, and it works:
 
diff --git a/docs/manual/customize-store.txt b/docs/manual/customize-store.txt
index 6db8ec7..e51edb2 100644
--- a/docs/manual/customize-store.txt
+++ b/docs/manual/customize-store.txt
@@ -80,9 +80,9 @@ work.
 
 To do so, you need to create a normal Buildroot configuration that
 builds a basic system for the hardware: toolchain, kernel, bootloader,
-filesystem and a simple Busybox-only userspace. No specific package
+filesystem and a simple BusyBox-only userspace. No specific package
 should be selected: the configuration should be as minimal as
-possible, and should only build a working basic Busybox system for the
+possible, and should only build a working basic BusyBox system for the
 target platform. You can of course use more complicated configurations
 for your internal projects, but the Buildroot project will only
 integrate basic board configurations. This is because package
diff --git a/docs/manual/using-buildroot-development.txt b/docs/manual/using-buildroot-development.txt
index e51e1a6..9eb8f53 100644
--- a/docs/manual/using-buildroot-development.txt
+++ b/docs/manual/using-buildroot-development.txt
@@ -72,7 +72,7 @@ make linux-rebuild all
 -----------------------
 
 and in a matter of seconds gets the updated Linux kernel image in
-+output/images+. Similarly, a change can be made to the Busybox source
++output/images+. Similarly, a change can be made to the BusyBox source
 code in +/home/bob/busybox+, and after:
 
 -----------------------
@@ -80,4 +80,4 @@ make busybox-rebuild all
 -----------------------
 
 the root filesystem image in +output/images+ contains the updated
-Busybox.
+BusyBox.
diff --git a/docs/manual/using.txt b/docs/manual/using.txt
index 3cd1499..292349d 100644
--- a/docs/manual/using.txt
+++ b/docs/manual/using.txt
@@ -5,7 +5,7 @@
 
 Buildroot has a nice configuration tool similar to the one you can
 find in the http://www.kernel.org/[Linux kernel] or in
-http://www.busybox.net/[Busybox]. Note that you can *and should build
+http://www.busybox.net/[BusyBox]. Note that you can *and should build
 everything as a normal user*. There is no need to be root to configure
 and use Buildroot. The first step is to run the configuration
 assistant:
diff --git a/package/busybox/1.21.1/0001-libbb-use-poll.h-instead-of-sys-poll.h.patch b/package/busybox/1.21.1/0001-libbb-use-poll.h-instead-of-sys-poll.h.patch
index 089d858..0a39d56 100644
--- a/package/busybox/1.21.1/0001-libbb-use-poll.h-instead-of-sys-poll.h.patch
+++ b/package/busybox/1.21.1/0001-libbb-use-poll.h-instead-of-sys-poll.h.patch
@@ -5,7 +5,7 @@ Subject: [PATCH 1/3] libbb: use <poll.h> instead of <sys/poll.h>
 
 As the pol() manpage recommends, include the <poll.h> header instead
 of <sys/poll.h>. This allows to get rid of gazillions of warnings when
-building Busybox against the musl C library, which prints a warning
+building BusyBox against the musl C library, which prints a warning
 when the internal header <sys/poll.h> is included directly instead of
 the <poll.h> header.
 
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 150100b..af1d13f 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,7 +22,7 @@ BUSYBOX_LDFLAGS = \
 	$(TARGET_LDFLAGS)
 
 # Link against libtirpc if available so that we can leverage its RPC
-# support for NFS mounting with Busybox
+# support for NFS mounting with BusyBox
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 BUSYBOX_DEPENDENCIES += libtirpc
 BUSYBOX_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
diff --git a/package/coreutils/Config.in b/package/coreutils/Config.in
index 152ad14..eee041d 100644
--- a/package/coreutils/Config.in
+++ b/package/coreutils/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_COREUTILS
 	help
 	  All of the basic file/text/shell utilities.  These are the
 	  core utilities which are expected to exist on every system.
-	  Busybox implements many of the most common.
+	  BusyBox implements many of the most common.
 
 	  Things like:
 	  - chmod, cp, dd, dir, ls, etc...
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 0355678..3cb78a5 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -20,7 +20,7 @@ OPENVPN_CONF_OPT += --enable-small --disable-plugins \
 	--disable-debug --disable-eurephia
 endif
 
-# Busybox 1.21+ places the ip applet in the "correct" place
+# BusyBox 1.21+ places the ip applet in the "correct" place
 # but previous versions didn't.
 ifeq ($(BR2_PACKAGE_IPROUTE2),y)
 OPENVPN_CONF_ENV += IPROUTE=/sbin/ip
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index c627a64..163ef8a 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -29,7 +29,7 @@ $(eval $(call caseconvert-helper,LOWERCASE,$(join $(addsuffix :,$([TO])),$([FROM
 
 #
 # Manipulation of .config files based on the Kconfig
-# infrastructure. Used by the Busybox package, the Linux kernel
+# infrastructure. Used by the BusyBox package, the Linux kernel
 # package, and more.
 #
 
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 88747b7..240f04e 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -14,7 +14,7 @@ RSYSLOG_AUTORECONF = YES
 RSYSLOG_CONF_OPT = --disable-testbench \
 		   --enable-cached-man-pages
 
-# Build after Busybox
+# Build after BusyBox
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 	RSYSLOG_DEPENDENCIES += busybox
 endif
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index c0aaf34..886e471 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -9,7 +9,7 @@ SYSKLOGD_SOURCE  = sysklogd_$(SYSKLOGD_VERSION).orig.tar.gz
 SYSKLOGD_PATCH   = sysklogd_$(SYSKLOGD_VERSION)-6.diff.gz
 SYSKLOGD_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sysklogd
 
-# Override Busybox implementations if Busybox is enabled.
+# Override BusyBox implementations if BusyBox is enabled.
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 SYSKLOGD_DEPENDENCIES = busybox
 endif
diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
index c85e75a..8812cca 100644
--- a/package/sysvinit/inittab
+++ b/package/sysvinit/inittab
@@ -1,7 +1,7 @@
 # /etc/inittab
 #
 # This inittab is a basic inittab sample for sysvinit, which mimics
-# Buildroot's default inittab for Busybox.
+# Buildroot's default inittab for BusyBox.
 id:1:initdefault:
 
 proc::sysinit:/bin/mount -t proc proc /proc
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 5d4f4bc..3716243 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -11,7 +11,7 @@ SYSVINIT_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sysvinit
 SYSVINIT_LICENSE = GPLv2+
 SYSVINIT_LICENSE_FILES = COPYING
 
-# Override Busybox implementations if Busybox is enabled.
+# Override BusyBox implementations if BusyBox is enabled.
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 SYSVINIT_DEPENDENCIES = busybox
 endif
@@ -34,7 +34,7 @@ define SYSVINIT_INSTALL_TARGET_CMDS
 	for x in halt init shutdown killall5; do \
 		install -D -m 0755 $(@D)/src/$$x $(TARGET_DIR)/sbin/$$x || exit 1; \
 	done
-	# Override Busybox's inittab with an inittab compatible with
+	# Override BusyBox's inittab with an inittab compatible with
 	# sysvinit
 	install -D -m 0644 package/sysvinit/inittab $(TARGET_DIR)/etc/inittab
 	ln -sf /sbin/halt $(TARGET_DIR)/sbin/reboot
diff --git a/package/xbmc/br-xbmc b/package/xbmc/br-xbmc
index 2a62b31..922b511 100755
--- a/package/xbmc/br-xbmc
+++ b/package/xbmc/br-xbmc
@@ -15,10 +15,10 @@ trap trap_kill INT QUIT TERM
 
 LOOP=1
 while [ ${LOOP} -eq 1 ]; do
-    # Hack: Busybox ash does not catch signals while a non-builtin
+    # Hack: BusyBox ash does not catch signals while a non-builtin
     # is running, and only catches the signal when the non-builtin
     # command ends. So, we just background the XBMC binary, and wait
-    # for it. But Busybox' ash's wait builtin does not return the
+    # for it. But BusyBox' ash's wait builtin does not return the
     # exit code even if there was only one job (which is correct
     # for POSIX). So we explicitly wait for the XBMC job
     "${XBMC}" "${@}" &
diff --git a/system/Config.in b/system/Config.in
index a3d80bf..53bca53 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -77,7 +77,7 @@ choice
 	default BR2_INIT_BUSYBOX
 
 config BR2_INIT_BUSYBOX
-	bool "Busybox"
+	bool "BusyBox"
 	select BR2_PACKAGE_BUSYBOX
 
 config BR2_INIT_SYSV
-- 
1.9.1
