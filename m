From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jun 2018 19:43:04 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] Update for 2018.02.3
Message-ID: <20180618174056.081DC88560@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f44524f61ad304e5db7cb933704bb4951ab031d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index c11118efd3..f98790154f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,57 @@
+2018.02.3, Released June 18th, 2018
+
+	Important / security related fixes.
+
+	Various fixes for building on modern distributions (GCC 8.x,
+	no rpcgen utility).
+
+	ARM: Default to binutils 2.28 and warn about newer binutils
+	versions, which are known to cause boot failures for Linux
+	kernels built in thumb mode.
+
+	Busybox/mdev: Fix module autoloading.
+
+	Busybox/sysvinit: inittab: Add /dev/{stdin,stdout,stderr}
+	symlinks, call swapon -a to activate any configured swap
+	devices.
+
+	Dependencies: Check that PATH does not contain current working
+	directory, which triggers a number of build failures.
+
+	Infrastructure: Error out for packages erroneously using the
+	'local' site method but not defining a _SITE.
+
+	Linux: Fix cuImage.<dtb> / simpleImage.<dtb> handling.  Ensure
+	kconfig uses ncurses from the host to fix a ncurses/ncursesw
+	mixup, causing menuconfig display corruption.
+
+	Toolchain: Workarounds for fix-rpath issues with binutils and
+	elf2flt.
+
+	Util-linux: Fix blocking on getrandom() issue with recent
+	kernels.
+
+	Remove broken freescale_imx31_3stack,
+	freescale_imx6sololiteevk and freescale_imx6ulevk defconfigs.
+
+	Updated/fixed packages: apr-util, asterisk, attr, audit,
+	autofs, binutils, busybox, cifs-utils, cups-filters, dash,
+	ebtables, exim, expect, f2fs-tools, faketime, file, gdb, git,
+	glibc, gnupg, gnupg2, gst1-plugins-bad, imagemagick, jamvm,
+	jpeg-turbo, libcap, libcoap, libcurl, libgcrypt, libjpeg,
+	libnss, libressl, libtirpc, libvncserver, libvorbis, libxslt,
+	log4cplus, lrzsz, ltrace, lynx, mariadb, mbedtls, mpg123,
+	nasm, netplug, network-manager, nfs-utils, nodejs,
+	openvmtools, patch, perl, php-amqp, poppler, procps-ng,
+	python, python-websockets, quota, redis, samba4, sysvinit,
+	transmission, triggerhappy, util-linux, wavpack, wget,
+	wireshark, xen, zmqpp
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#10986: Installing package attr when already supplied by busybox..
+	#11031: ld-elf2flt: host/bin/ld.real': execvp: No such file or..
+
 2018.02.2, Released May 4th, 2018
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 864a15ba0a..c725f329d4 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.02.2
+export BR2_VERSION := 2018.02.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1525450000
+BR2_VERSION_EPOCH = 1529344000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
