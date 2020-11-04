From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Nov 2020 23:27:17 +0100
Subject: [Buildroot] [git commit] CHANGES: Update for 2020.11-rc1
Message-ID: <20201104221752.A74A4814CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a40358a1127168541a3cfb228931b3bcdbcf65f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 82 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/CHANGES b/CHANGES
index 31542fd972..4f7864c0e0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,85 @@
+2020.11-rc1, released November 4th, 2020
+
+	Fixes all over the tree and new features.
+
+	Architectures: Support for IBM s390x
+
+	Toolchain: use Secure-PLT rather than BSS-PLT for PowerPC
+	32. Binutils 2.35.1 added, now defaulting to 2.34. ARC
+	2020.09-release toolchain. GCC 7.x dropped. RISC-V support for
+	uclibc-ng. Support for Bootlin external toolchains.
+
+	SELinux support improvements: File security contexts are now
+	set when the file systems are created, so there is no need to
+	run restorecon on first boot / read only rootfs is supported.
+	An optimized / stripped refpolicy SELinux policy is now
+	used. Packages can enable additional refpolicy modules using
+	<pkg>_SELINUX_MODULES.
+
+	support/scripts/cve-checker: Utility script to check for known
+	CVEs in just the packages enabled in a Buildroot configuration
+	rather than all packages, by passing the output of 'make
+	show-info' to it.
+
+	Go: Modules handling. The module name must be specified using
+	<pkg>_GOMOD.
+
+	BR2_EXTERNAL: Support for defining skeleton and init system
+	packages in external trees.
+
+	meson: Correct SDK cross-compilation.conf file when
+	per-package builds were used to build SDK.
+
+	systemd: Use /run rather than /var/run for PID files in units.
+
+	Fakeroot scripts (BR2_ROOTFS_POST_FAKEROOT_SCRIPT) are now run
+	after all finalization hooks (including pre-rootfs) to ensure
+	they can override any late configuration done by packages.
+
+	support/script/pycompile: Rework logic to ensure .pyc files
+	contain absolute target paths, fixing code inspection at
+	runtime when executed with cwd != '/'.
+
+	support/scripts/setlocalversion: Correct Mercurial output to
+	match behaviour with Git.
+
+	support/scripts/apply-patches.sh: Use patch
+	--no-backup-if-mismatch, so we no longer blindly have to
+	remove *.orig files after patching, fixing issues with
+	packages containing such files.
+
+	New defconfigs: Acer chromebook elm, Friendlyarm nanopc-t4 and
+	nanopi-m4, Hardkernel odroid-c2, Kontron SMARC-sAL28, NXP
+	imx8mqevk, Orangepi RK3399 and zero+, PCengines APU2, Pine64
+	rockpro64, QEMU s390x, Raxda rockpi-n8,
+
+	New packages: altera-stapl, asn1c, babeltrace2, cukinia,
+	easyframes, environment-setup, frr, graphicsmagick, htpdate,
+	ipcalc, libbacktrace, libblockdev, libbytesize, librelp,
+	libuev, makedumpfile, meson-tools, mg, mrp, multipath-tools,
+	netcalc, odroidc2-firmware, php-xdebug, python-aiofiles,
+	python-ansicolors, python-boto3, python-botocore,
+	python-bsdiff4, python-crayons, python-iniconfig,
+	python-intelhex, python-ipdb, python-jmespath,
+	python-m2crypto, python-opcua-asyncio, python-packaging,
+	python-piexif, python-pluggy, python-pytest,
+	python-s3transfer, python-xmodem, qprint, qt5lottie,
+	qt5remoteobjects, re2, redir, s390-tools, sentry-cli,
+	sentry-native, timescaledb, tinyhttpd, uhd, uredir, watchdog,
+	wayland-utils, weston-imx
+
+	Removed packages: amd-catalyst, bellagio, gqview, libcroco,
+	nvidia-tegra23, opencv
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11811: lsblk (util-linux) should depend on libudev if available
+	#11931: Bugs in support/scripts/apply-patches.sh
+	#12301: systemd-journal-gatewayd: config options broken
+	#12911: usb_modeswitch installation race condition
+	#13236: Can't compile linux 5.4.8 (with gcc 10 on host)
+	#13286: The system hangs in vmware workstation on the line..
+
 2020.08.1, released October 12th, 2020
 
 	Important / security related fixes.
