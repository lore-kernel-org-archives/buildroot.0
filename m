From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Feb 2019 19:57:58 +0100
Subject: [Buildroot] [git commit branch/next] CHANGES: add recent changes
Message-ID: <20190213214530.826F18A34D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb741b03a93880093be4a36b58ec93edd83057d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In preparation for 2019.02-rc1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 130 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/CHANGES b/CHANGES
index 188b88dfd8..0ef61f5882 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,133 @@
+2019.02-rc1, not yet released
+
+	Fixes all over the tree and new features.
+
+
+	Dependencies:
+
+	Require Python >= 2.7 as it is needed for E.G. building
+	libglib2.
+
+	Ensure GNU gzip is used for reproducible tarballs (instead of
+	pigz)
+
+
+	Infrastucture:
+
+	Ensure the PLATFORM and OS environment variables are not set,
+	as they cause build issues for some packages.
+
+	The package list infrastructure now correctly handles packages
+	installing files with old mtime.
+
+	Add a config option to force all optional host utilities to be
+	built, even if suitable versions are available on the build
+	machine.
+
+	graph-build-time: Also show time spent downloading
+
+	Download: fixes for SSH/SCP support
+
+	Ensure user provided permissions override permissions from
+	packages.
+
+	SDK: Fix handling of relative symlinks (targets starting with
+	'.' or '..')
+
+	BR2_SYSTEM_DEFAULT_PATH setting to customize the default path
+	for processes.
+
+	The custom skeleton logic will now populate the needed /bin,
+	/lib, /sbin directories/symlinks if not present. Merged /usr
+	can now be used with a custom skeleton.
+
+	Rootfs overlays can now override symbolic links from
+	packages. This was disabled to ensure the correct symbolic
+	links are present when merged /usr is used. Instead validate
+	that the rootfs overlays do not include invalid /bin, /sbin
+	and /lib entries.
+
+	The waf infrastructure now support the <pkg>_SUBDIR variable,
+	similar to the other package types.
+
+	cmake: Also set CMAKE_SYSTEM_VERSION in toolchainfile.cmake
+
+	Various improvements to the meson infrastructure.
+
+	Luarocks: A Buildroot addon has been added to automate
+	creating a Buildroot package from luarocks, similar to
+	scancpan and scanpypi.
+
+	check-package: fix Python 3 support
+
+	get-developers: Fix behaviour when called from elsewhere than
+	the toplevel directory.
+
+	pkg-stats: Show latest upstream version of each package, based
+	on data from release-monitoring.org
+
+	kconfig: Fix for make linux-menuconfig / uboot-menuconfig from
+	a clean tree when ccache is enabled.
+
+	Default to sha256 password encoding, drop md5 support.
+
+
+	Architecture:
+
+	Support for RISC-V 32bit architecture, ARM A55, 75 and Saphira
+	variants, MIPS support for mips32r3, mips64r3 and Marvell
+	Octeon II/III variants.
+
+
+	Toolchain:
+
+	ARC toolchain 2018.09, ARM 8.2-2018.11, Codescape IMG/MTI MIPS
+	2018.09-02, MUSL 1.1.21, GCC 6.5.0 / 7.4.0, GDB 8.2.1
+
+
+	Packages:
+
+	openssl: Bump to 1.1.1x series, bringing TLSv1.3 support and
+	long term support.
+
+	fftw: Split into fftw-{single,double,long-double,quad}
+	packages for the different data precision options.
+
+	libcurl: Now has explicit TLS backend selection options.
+
+	linux: Support building device tree blobs with the -@ option
+	for device tree overlays.
+
+	weston: The weston-imx i.MX variant is now used when
+	imx-gpu-viv is enabled
+
+	pkgconf: Update to 1.5.3, which brings support for
+	--define-prefix (used by GStreamer)
+
+	Add host-python3-setuptools package to handle host python
+	packages needing python3 with setuptools support.
+
+
+	New defconfigs: Aarch64 EFI, Orangepi one plus, Orangepi lite
+	2, QEMU RISC-V 32bit virt, Rock64
+
+
+	New packages: brcm-patchram-plus, clinfo, cunit, docker-cli,
+	erlang-p1-eimp, exempi, fail2ban, fftw-double,
+	fftw-double-long, fftw-quad, fftw-single, gerbera, grpc,
+	gst1-shark, intel-gmmlib, iwd, kf5-kcoreaddons, libeastl,
+	libpackagekite, libtorrent-rasterbar, lua-std-debug,
+	lua-std-normalize, mini-snmpd, netsurf, pamtester, pcm-tools,
+	python-aiodns, python-aiohttp, python-aiohttp-jinja2,
+	python-aiohttp-remotes, python-aiohttp-security,
+	python-aiohttp-session, python-aiohttpd-sse, python-aiojobs,
+	python-cchardet, python-pycares, python-sentry-sdk,
+	python-wtforms, python3-setuptools, rcw, rtc-tools, shim,
+	utp_com, vmtouch, websocketpp
+
+	Removed packages: fftw, lua 5.2.x, luacrypto, mongodb,
+	perl-time-hires, python-pyqt, qt, qtuio, tn5250
+
 2018.11.2, Released January 30th, 2019
 
 	Important / security related fixes.
