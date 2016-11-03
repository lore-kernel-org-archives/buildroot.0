From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 21:31:14 +0100
Subject: [Buildroot] [git commit] CHANGES: prepare for 2016.11-rc1
Message-ID: <20161103203202.B313981945@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=052554bfbe179fcf83b079648a7c5e2fbd6466d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES | 93 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 88 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index fd5abcb..c041ec8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,10 +1,93 @@
-2016.11-rc1,
+2016.11-rc1, Released November 3rd, 2016
 
-	CMake support:
+	Fixes all over the tree and new features.
+
+	Architecture: support for sh64 removed, improved support for
+	MIPS core selection,
+
+	Toolchain: support for musl powerpc64le, mips64 and mipsr6
+	toolchains, ARC toolchain components updates, gcc 6.x series
+	bumped to 6.2.0, default binutils version switched to 2.26,
+	default gcc version switched to gcc 5.x, Linaro toolchains
+	updated, uclibc-ng bumped to 1.0.19.
+
+	Core infrastructure: support for multiple BR2_EXTERNAL
+	directories.
+
+	Package infrastructure: new variable $(PKG)_DL_OPTS, addition
+	of <pkg>-show-rdepends to list reverse dependencies, and
+	<pkg>-graph-rdepends to graph reverse dependencies.
+
+	CMake support: the toolchainfile.cmake file now provides a
+	definition of the CMAKE_BUILD_TYPE variable. The
+	toolchainfile.cmake also no longer passes the compiler/linker
+	flags defined by Buildroot.
+
+	New defconfigs: warp7, Solidrun's MX6 Cubox/Hummingboard,
+	TS-4900, Grinn's liteBoard, Udoo MX6Q/DL, Qemu ARM noMMU,
+	BeagleBone Qt5 demo, Digilent Zybo.
+
+	New packages: arm-trusted-firmware, amd-catalyst, atop, aufs,
+	aufs-util, fwts, gst1-rtsp-server, libglob, libite, mfgtools,
+	mksh, motion, paho-mqtt-c, php-amqp, python-couchdb,
+	python-crcmod, python-cssutils, python-docutils,
+	python-futures, python-mwclient, python-mwscrape,
+	python-mwscrape2slob, python-pyelftools, python-pyicu,
+	python-pylru, python-pyqt5, python-requests-toolbelt,
+	python-simpleaudio, python-slob, rabbitmq-server, shapelib,
+	vdr, vdr-plugin-vnsiserver, vexpress-firmware, xvisor, iio and
+	gpio linux tools.
+
+	Removed packages: binutils 2.24, gcc 4.7, ipkg,
+	kodi-addon-xvdr, libgail, sstrip, torsmo, webkit, webkitgtk24,
+	wvdial, wvstreams,
+
+	Documentation: the list of packages that was present in the
+	Buildroot manual has been removed.
+
+	Other: addition of a DEVELOPERS file listing developers taking
+	care of packages or architectures.
+
+	Issues resolved (http://bugs.buildroot.org):
 
-	The toolchainfile.cmake file now provides a definition of the
-	CMAKE_BUILD_TYPE variable. The toolchainfile.cmake also no
-	longer passes the compiler/linker flags defined by Buildroot.
+	#7802: host-python build hangs compiling getbuildinfo.o
+	#8206: mplayer uses host xorg development files
+	#8536: Building sudo with PAM results in unusable sudo
+	#8646: check-host-rpath script returns false positives when rpath
+	       contains symlink
+	#8696: xdriver_xf86-input-mouse install header files in target
+	       directory
+	#8811: rp-pppoe - generated scripts commands use HOST pathnames,
+	       not necessarily TARGET
+	#8846: Orphaned/missing toolchain borks eclipse plugin
+	#8856: python tornado runtime wasn't met on buildroot 2016.02
+	#8901: gcc failes to build if fortran is enabled
+	#8916: LDFLAGS pass to openssh
+	#8941: "ls" of an NFSv4 share only works when pumped through strace
+	#8946: Valgrind fails to build with stack protection turned on
+	#9021: Kodi - Broken: Illegal instruction (core dumped)
+	#9096: rootfs.ubi not created
+	#9176: minnowboard : USB not mounted
+	#9196: raspberry pi 3 default build seem broken
+	#9201: Permission denied make: *** [core-dependencies] Error 126 in
+	       Buildroot-2015.08.1
+	#9216: log4cpp package build fails to build within install
+	#9221: Kodi needs "Python .py and .pyc support" otherwise it crashes when
+	       pressing buttons.
+	#9229: Firefly boot fails with: "failed to find part:boot"
+	#9256: [Config file] New device: Odroid-U2/U3
+	#9296: Buildroot Fails on applying patches
+	#9301: U-boot fails to build with default zynq_zed_defconfig configuration
+	#9316: U-boot fails to build if libssl-dev is not installed
+	#9321: Vanilla libcrypt++ v5.6.3 doesn't allow to work Nvidia Tegra's
+	       flash utility (tegrarcm)
+	#9326: Odroid-C2 build results in non-bootable image
+	#9336: Improve iconv support for external toolchain based builds
+	#9356: gdb package
+	#9366: no link rootfs.ext4 -> rootfs.ext2
+	#9371: openssl: download failes with "Only allow downloads from primary
+	       download site" + local server
+	#9381: check-host-rpath issues
 
 2016.08, Released September 1st, 2016
 
