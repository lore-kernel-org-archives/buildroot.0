From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Jul 2020 10:42:51 +0200
Subject: [Buildroot] [git commit] Update for 2020.02.4
Message-ID: <20200726084047.DF65D888D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39d71a8c32b6ff496a3c849727ce7cd79fd26f52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dee53013da87dfa4bcb3433bdef79ec43b5a5c24)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 59 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/CHANGES b/CHANGES
index 2d1e8e0d16..528a51cf15 100644
--- a/CHANGES
+++ b/CHANGES
@@ -229,6 +229,65 @@
 	#12796: Update OpenSSL to Version 1.1.1g to patch  CVE-2020-1967
 	#12811: bootstrap stuck and no login prompt
 
+2020.02.4, released July 26th, 2020
+
+	Important / security related fixes.
+
+	Toolchain:
+	- Make external toolchain version check also work for
+	  toolchains configured with --with-gcc-major-version-only
+
+	- Do not handle SOURCE_DATE_EPOCH in toolchain wrapper if the
+	  compiler supports it, fixing an issue with precompiled
+	  headers
+
+	- Ensure debug libs from external toolchains are not installed
+          into target if debugging is disabled
+
+	Download:
+	- Correct reproducibility issue in handling of git submodules
+	  for older git versions.
+
+	- Fix file locking over NFS
+
+	fs: Ensure cpio archive element order is reproducible
+
+	Br2-external: Fix error reporting for invalid br2-external trees
+
+	Per-package:
+	- Fix an issue with python3 sysconfig data not getting
+	correctly expanded
+
+	- Fix per-package building for packages using the qmake
+          infrastructure
+
+	Updated/fixed packages: a10disp, asterisk, bind, cdrkit,
+	checkpolicy, clamav, dbus, docker-cli, docker-engine,
+	dvb-apps, e2fsprogs, exim, exiv2, freerdp, gnutls, go, grub2,
+	gssdp, gst1-plugins-good, gst1-plugins-ugly, gupnp,
+	intel-microcode, iproute2, irrlicht, iwd, jq, kodi, libcamera,
+	libconfuse, libcurl, libglib2, libhttpserver, libmicrohttpd,
+	libopenssl, libvncserver, libxml2, libxmlrpc, lxc, mbedtls,
+	mesa3d, meson, mongodb, mtools, mutt, nghttp2, ngircd, nodejs,
+	ntp, open-plc-utils, open2300, openjdk-bin, openssh,
+	oracle-mysql, paho-mqtt-c, pcre, php, poco, prosody, putty,
+	python-twisted, python-urllib3, python-validators, python3,
+	qt5xmlpatterns, redis, rpi-firmware, rtl8821au, samba4, sdl2,
+	sqlite, squid, syslog-ng, systemd, tcpreplay, tinydtls,
+	upmpdcli, upx, vlc, webkitgtk, wireguard-linux-compat,
+	wireshark, wpebackend-fdo, wpewebkit, zstd
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#12941: Python GObject fails to build when using BR2_PER_PACKAGE_..
+	#12946: Grub: Decompressor is too big.
+	#12986: Mtools: Error converting to codepage 850
+	#13001: openjdk-bin replaces libfreetype.so from host-freetype
+	#13011: Incorrect selection of gcc version
+	#13026: rpi-firmware: must not rename start files
+	#13031: nodejs: RangeError at new ArrayBuffer()
+	#13046: Optimize for fast -Ofast is not compliant
+
 2020.02.3, released June 3rd, 2020
 
 	Important / security related fixes.
