From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jun 2018 20:03:59 +0200
Subject: [Buildroot] [git commit] Update for 2018.02.3
Message-ID: <20180618181746.32AA482585@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=afa6fe1c5089a8815b344f92b8b2e752302135df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f44524f61ad304e5db7cb933704bb4951ab031d3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/CHANGES b/CHANGES
index 475049f841..44484ee80e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -194,6 +194,60 @@
 	#10961: Grub2 fails to build for x86_64 when BR2_SSP_ALL is
 		enabled
 
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
