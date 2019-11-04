From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Nov 2019 23:52:52 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20191104224633.5F41681079@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc8d4e97ec80c0f80d0d68dd1b575fc17e5c1fce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 104 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/CHANGES b/CHANGES
index 5436f1111f..fa741be405 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,107 @@
+2019.11-rc1, not yet released
+
+	Fixes all over the tree and new features.
+
+	Dependencies: Gcc/g++ 4.8 or newer is now required on the
+	build host.
+	Ensure host has JSON::PP perl module installed if
+	webkitgtk/wpewebkit packages are enabled as it is needed
+	during their build process.
+
+	Toolchain: Add support for the D programming language (GCC
+	9.x, Glibc).
+	GCC 9.x updated to 9.2.0, Glibc updated to 2.30, Musl updated
+	to 1.1.24, uClibc-ng updated to 1.0.32, ARC toolchain updated
+	to arc-2019.09-eng002.
+	Musl: Add a patch to add support for
+	sched_{get,set}scheduler() and sched_{get,set}param() for
+	compatibility.
+	Generate check-headers program under BUILD_DIR rather than
+	/tmp to fix issues with distributions mounting /tmp noexec.
+	Also copy libssp.so for external toolchains if SSP
+	to handle toolchains providing SSP support in libssp rather
+	than in the C library
+
+	New defconfigs: Beaglebone AI, FriendlyARM Nanopi NEO Plus2,
+	Libre Computer "La Frite", QEMU Armv7-A with trustzone/OP-TEE,
+	STM32MP157 Discovery Kit
+
+	Arch: Default to a sensible floating point ABI based on the
+	selected ISA extensions rather than always defaulting to
+	ILP32/64
+
+	Graph-size: Package sizes are now shown in human readable form
+	(Kib/Mib/Gib) rather than always in Kib. Binary (KB/MB/GB)
+	format can be selected using the --binary option. The cut-off
+	limit for classifying packages as "other" is now configurable
+	using the --size-limit option.
+
+	Br2-external: Linux kernel extensions can now also be provided
+	in an external tree by adding packages under
+	linux/linux-ext-*.mk. See the manual for details.
+
+	Fakeroot now works correctly under Microsoft Windows 10
+	Services for Linux, which does not provide SYSV IPC support
+
+	The check-uniq-files logic which would complain if multiple
+	packages would touch the same files has been removed as it
+	causes issues in certain situations (when packages are
+	rebuilt) and the issue is no longer considered a problem for
+	toplevel parallel builds as those will use a per-package
+	staging/target directory.
+	With this removed, Python is no longer required for a basic
+	build (only for optional scripts).
+
+	support/scripts/genimage.sh will no longer make a copy of
+	TARGET_DIR, speeding up post-build/image scripts.
+
+	The runtime test logic now uses Python 3.x.
+
+	A 'v' prefix has been dropped from the <pkg>_SOURCE variable
+	for a number of packages to match the version numbers used by
+	https://release-monitoring.org
+
+	New packages: caps, collectl, dav1d, fstrcmp, ima-evm-utils,
+	jitterentropy-library, kodi-vfs-rar, kodi-vfs-sftp, libavl,
+	libhttpserver, libmspack, libnetconf2, libolm, libyang, lrzip,
+	mdevd, minimodem, musl-fts, netifrc, ogre, openlayers,
+	python-aioredis, python-asgiref,
+	python-backports-functools-lru-cache, python-bluezero,
+	python-brotli, python-channels, python-channels-redis,
+	python-colorlog, python-daphne, python-django-enumfields,
+	python-jaraco-functools, python-kiwisolver, python-msgfy,
+	python-rpi-ws281x, python-setuptools-scm-git-archive,
+	python-simplelogging, python-soupsieve, python-sqliteschema,
+	python-sqlparse, python-tqdm, python-webencodings, qt5webview,
+	restclient-cpp, ripgrep, snmpclitools, sunwait, sysrepo,
+	uacme, utf8proc, uvw, ytree
+
+	Removed packages: alljoyn, alljoyn-base, alljoyn-tcl-base,
+	devmem2, eventlog, kodi-audiodecoder-opus,
+	kodi-screensaver-planestate, kodi-visualisation-waveforhue,
+	python-pysnmp-apps, riscv-pk, ustr
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#9881:  systemd-resolved not setting resolv.conf link
+	#10171: devmem2 w (word) is 8 bytes in x86 64 systems
+	#10586: musl gcc has ifunc enabled when musl doesn't support it
+	#10806: Allow nfs-utils to use ipv6
+	#11366: [2018.08] SysV IPC not available for fakeroot on WSL
+	#11411: check-uniq-files target issue
+	#11766: Console (getty) issues with systemd
+	#11781: mariadb build error
+	#12031: Build of cups-filters fails while linking, apparently due..
+	#12116: console prompt does not appear after login
+	#12141: eudev package is missing "render" and "kvm" groups
+	#12181: dropbear: norootlogin (-w) no longer works when PAM is enabled
+	#12186: Raspberry Pi Zero-W build fails on newer kernel versions
+	#12191: cmake BUILDDIR
+	#12241: Permission denied while running "make"
+	#12261: sudo versions prior to 1.8.28 are affected.
+	#12276: make clean/distclean does not remove BR2_DL_DIR and BR2_HOST_DIR
+	#12281: Custom configuration fails to build (based on raspberrypi3_..
+
 2019.08.1, released October 3rd, 2019
 
 	Important / security related fixes.
