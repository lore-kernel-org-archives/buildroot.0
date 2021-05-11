From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 May 2021 11:33:56 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20210511090612.39BA9814F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04e9e884cf99328020f68b4cb50e689ead88d95a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 76 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/CHANGES b/CHANGES
index c74ad45f48..52450adeb3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,79 @@
+2021.05-rc1, not yet released
+
+	Fixes all over the tree and new features.
+
+	FORTIFY_SOURCE, PIC/PIE, RELRO and SSP security hardening
+	options are now enabled by default.
+
+	Dependencies: Explicitly detect and bail out if PATH contains
+	spaces or tabs. A number of packages fail to build in such
+	setups, so explicitly inform about this.
+
+	Infrastructure: Expose CONFIG_DIR to post-build/post-image
+	scripts, so they can call the Buildroot Makefile in the
+	correct directory for both in-tree / out-of-tree builds.
+
+	CMake infrastructure: Use CMAKE_EXE_LINKERFLAGS rather than
+	CMAKE_CXX_FLAGS to link with libatomic to fix an compatibility
+	issue with poppler. Bump minimal host cmake version to 3.16
+	(from 3.15) to fix a compatibility issue with domoticz.
+
+	Meson: Use correct C++ host compiler (rather than C compiler)
+
+	utils/scanpypi: Explicitly use python3 for compatibility with
+	packages using python3 syntax in setup.py
+
+	support/download: Fix tarball generation (from git/svn repos)
+	including symlinks pointing to ./<something>. Fix svn download
+	for <1.9 clients or repos using CVS-style keywords.
+
+	support/scripts/cve.py: Use the (significantly) faster yajl2
+	ijson backend for older (< 2.5) ijson versions rather than the
+	slow python default, speeding up pkg-stats by ~2x.
+
+	Toolchain: Add logic to work around binutils bug 21464
+	(affecting OpenRISC), bug 27597 (affecting Nios II) and drop
+	the now longer applicable bug 19615 / 20006 handling.
+
+	Python{,3}: Fix byte compiling python files with short (single
+	character before .py) file names.
+
+	CPE meta data has been added for a large number of packages
+
+	New defconfigs: Acme Systems Acqua A5 (256/512MB), Beagleboard
+	BeagleV, Boundary devices Nitrogen8M Plus SOM, NXP i.MX 8M
+	Plus EVK, QEMU PPC e500mc
+
+	New packages: beaglev-ddrinit, beaglev-secondboot, janet,
+	kodi-inputstream-ffmpegdirect, kodi-vfs-libarchive,
+	kodi-visualisation-matrix, libxcrypt, libqrtr-glib, log4qt,
+	mawk, perl-parse-yapp, postgis, protozero, python-flask-wtf,
+	python-iwlib, python-semantic-version, python-setuptools-rust,
+	python-toml, riscv64-elf-toolchain, siproxyd, uftrace, zfs
+
+	Removed packages: iostat, kodi-platform,
+	kodi-screensaver-crystalmorph, monkey
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13271: systemd-resolved: /etc/resolv.conf link broken on per-pa..
+	#13516: utils/scanpypi: Failure when parsing diffoscope
+	#13551: 2021.02.rc2: Unicode not work on qt 5.15.2
+	#13576: Issues compiling buildroot for 5x86
+	#13601: Gen image :Iappropriate ioctl error
+	#13616: tar file from git repository generation issue
+	#13631: Commit 54d3d94b6e breaks packages with git download method
+	#13641: glibc on raspberrypi
+	#13646: Gen image version 14 error : no sub -section title/..
+	#13651: pkg-golang cannot build when main.go is in the root
+	#13661: host-python2 build fails on aarch64
+	#13671: openSSH server closes connection before authentication..
+	#13721: c-stack.c:55:26: error: missing binary operator before ..
+	#13731: Readline Patch is missing Author Information
+	#13741: genext2fs does not allow to set perms of root node
+	#13751: libopenssl (static): huge drop in performance in newer ..
+	#13771: package htop has undeclared dependency on host python
+
 2021.02.1, released April 7, 2021
 
 	Important / security related fixes.
