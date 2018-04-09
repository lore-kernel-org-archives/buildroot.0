From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Apr 2018 23:51:05 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] Update for 2018.02.1
Message-ID: <20180409215129.C930F8830E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9565a37e0d2aa3c5fb9a4148760c490f2e5226d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 63 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 65 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index c7925bdedc..09cf7c3f85 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,66 @@
+2018.02.1, Released April 9th, 2018
+
+	Important / security related fixes.
+
+	Removed unmaintained defconfigs: Creator Ci40, Firefly rk3288,
+	Freescale mpc8315erdb / p1010rdb_pa, Riotboard, Teliv EVK
+	Pro3.
+
+	Infrastructure: Speed up instrumentation for package size by
+	comparing timestamps instead of md5 checksums, as doing
+	checksums could lead to up to 25% longer build time for big
+	configurations.
+
+	Rename the internal <pkg>_BASE_NAME variable to <pkg>_NASENAME
+	to avoid name clashes with packages ending on '-base'.
+
+	Add a better fix for build issues for autotools based packages
+	checking for C++ support on toolchains without C++ support.
+
+	Build host-tar if tar is older than 1.27 on the build machine
+	to work around reproducibility issues with git archives
+	containing long paths.
+
+	check-unique-files: Fix for filenames not representable in the
+	users' locale.
+
+	Check-bin-arch: Add support for per-package ignore paths
+	(<pkg>_BIN_ARCH_EXCLUDE).
+
+	Toolchain: Fix SSP support detection for external toolchains.
+
+	linux: Add _NEEDS_HOST_OPENSSL / LIBELF options to ensure
+	these dependencies are available for Linux configurations
+	needed these dependencies, similar to how it is done for
+	U-Boot.
+
+	Support custom (not in tree) device tree files in addition to
+	in-tree ones.
+
+	U-Boot / uboot-tools: Fix header conflict with libfdt-devel
+	installed on host.
+
+	Updated/fixed packages: apache, busybox, c-ares, cmake,
+	docker-engine, enlightenment, eudev, fbgrab, freescale-imx,
+	gtest, imagemagick, intel-microcode, irssi, jimtcl, kmod,
+	kodi, ktap, libcoap, libcurl, libfcgi, libhttpparser,
+	libminiupnpc, libopenssl, libpjsip, libss7, libssh2, libupnp
+	libupnpp, libuv, libvorbis, memcached, motion, musl, nodejs,
+	ntp, openblas, opencv3, openocd, opus-tools, patch, php,
+	pkgconf, postgresql, powerpc-utils, python-jsonschema,
+	python-webpy, qemu, qt5bsae, qt5script, qt5webkit, rapidjson,
+	rauc, sam-ba, samba4, sngrep, systemd, tremor, uboot-tools,
+	uclibc-ng-test, upmpdcli, wireshark, xerces, xterm, zstd
+
+	New packages: docker-proxy, python-functools32
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#10766: upmpdcli: Segmentation fault
+	#10776: ktap fails to build
+	#10846: error in compiling gnutls
+	#10856: openblas on qemu_x86_64_defconfig fails with "sgemm_..
+
 2018.02, Released March 4th, 2018
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 957ba6634a..8004cc2925 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.02
+export BR2_VERSION := 2018.02.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1520198000
+BR2_VERSION_EPOCH = 1523310000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
