From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Feb 2020 23:21:37 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20200218221040.598678CA22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3eacee53ec400128630fa5b291ec230c2a7b3c43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 90 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/CHANGES b/CHANGES
index 5150272a55..06c9201960 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,93 @@
+2020.02-rc1, not yet released
+
+	Fixes all over the tree and new features.
+
+	Add experimental support for building with a per-package
+	target and host directory. This still has some rough edges,
+	but brings a number of advantages:
+
+	- Packages will only be able to access the explicitly listed
+          dependencies and not any other packages that happen to be
+          built before, ensuring correct dependency information in
+          Buildroot.
+
+	- Possibility for top-level parallel builds, speeding up
+          builds on multicore machines.
+
+	Core: Ensure package-file-lists data is correct after
+	incremental builds as well.
+
+	Architecture: Add support for ARC-HS38 with 64bit multiplier
+	variant, allow building glibc for big endian ARC, handle 16KB
+	MMU page size for ARC in toolchain wrapper.
+
+	Toolchain: Add binutils 2.33.1, GCC 7.5.0, Arm 9.2-2019.12
+	toolchains, ARC 2019.09 toolchain. Allow using custom kernel
+	headers newer than what is known by Buildroot.
+
+	pkg-stats: Support for CVE vulnerability reporting by
+	comparing to NVD database.
+
+	Reproducible builds: The go -trimpath option is now used to
+	get rid of absolute build paths, __FILE__ and __BASE_FILE__
+	defines are now handled in the toolchain wrapper.
+
+	Systemd: Build host variant and use systemctl to automatically
+	enable unit files rather than manually managing symlinks.
+
+	Util-linux: Ensure that hwclock is built without GPLv3
+	code. Notice that builds with hwclock has contained
+	GPLv3-licensed code since util-linux 2.30 (Buildroot 2017.08+)
+
+	New defconfigs: Beelink GS1, Raspberrypi4 64bit
+
+	New packages: alura, avro-c, bubblewrap, cctz, cereal,
+	cpuburn-arm, elixir, erlang-base64url, erlang-idna,
+	erlang-jose, erlang-p1-acme, erlang-p1-mqtree,
+	erlang-p1-yconf, fluid-soundfont, fluidsynth, gcnano-binaries,
+	gensio, glslsandbox-player, libargon2, libmodsecurity,
+	libpam-nfc, libtelnet, lua-codegen, lua-livr, lua-livr-extra,
+	lua-rotas, lua-silva, mfoc, network-manager-openvpn,
+	nginx-modsecurity, perl-crypt-openssl-aes,
+	perl-math-prime-util, pipewire, ptm2human, python-aenum,
+	python-aiohttp-debugtoolbar, python-aiohttp-mako,
+	python-aiologstash, python-aiosignal, python-aiozipkin,
+	python-async-lru, python-avro, python-bunch, python-crontab,
+	python-dnspython, python-entrypoints, python-esptool,
+	python-frozenlist, python-future, python-gitdb, python-janus,
+	python-lockfile, python-logstash, python-nested-dict,
+	python-pbr, python-pyaes, python-pydantic, python-smmap2,
+	python-sockjs, python-zc-lockfile, raspi-gpio, rocksdb,
+	sdbusplus, spidermonkey, thermald, ti-sgx-libgbm, tinyssh,
+	tio, umtprd, weston-imx, wireguard-linux-compat,
+	wireguard-tools, xdg-dbus-proxy
+
+	Removed packages: bluez_utils, celt051, erlang-p1-iconv, fis,
+	gadgetfs-test, libplayer, gstreamer, gst-ffmpeg,
+	gst-fsl-plugins, gst-omapfb, gst-plugins-bad,
+	gst-plugins-base, gst-plugins-good, gst-plugins-ugly,
+	perl-digest-md5, perl-mime-base64, perl-net-ping,
+	python-scapy3k, wireguard
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11906: the new version of mesa3d cannot support etnaviv when..
+	#11996: opencv3 SIGILL on Cortex-A5 with VFPv4-D16
+	#12121: PyQt5.QtSerialPort and other modules not being built
+	#12256: package tar is outdated (1.29 is 3 years old
+	#12286: Can't import gobject in python 3.8
+	#12376: python-scapy3k is deprecated
+	#12386: carriage return issue when "make menuconfig"
+	#12441: qt5webengine build error: asm/errno.h: No such file or..
+	#12446: Buildroot fails to finish installing packages
+	#12456: qtvirtualkeyboard: No such file or directory
+	#12461: libglib2 build files with deep directory structure
+	#12481: minicom fails when output directory path contains "m4"
+	#12501: libnss-3.49.1: ld error: multiple definition of `gcm_..
+	#12526: host-nodejs 12.14.1: configure fail: AttributeError: ..
+	#12536: Linux-Headers extracting failure
+	#12546: Ninja 1.10 build Error
+
 2019.11.1, released January 12th, 2020
 
 	Important / security related fixes.
