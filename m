From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 May 2020 14:14:42 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] Update for 2020.02.2
Message-ID: <20200522072301.92FF48D5DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f7183d13133f2ded97fee273bd0cbed10226e4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 42 ++++++++++++++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5b54eb0e35..7dda1c47ec 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,45 @@
+2020.02.2, released May 12th, 2020
+
+	Important / security related fixes.
+
+	Musl: Disallow on PPC64 cores without AltiVec support
+	(E.G. e5500).
+
+	fs/cpio: Correctly handle booting with 'console='
+
+	release: Ensure temporary .br2-external.* files are not
+	included in the release tarball
+
+	Defconfigs: Fix various mistyped config options, or config
+	options where the dependencies were no longer met.
+
+	Updated/fixed packages: apache, azure-iot-sdk-c, binutils,
+	boinc, c-ares, cvs, docker-cli, docker-containerd,
+	docker-engine, domoticz, e2fsprogs, efl, evtest, exim, ffmpeg,
+	freerdp, gcc, gflags, glibc, gnuconfig, haproxy, imx-gpu-2d,
+	irrlicht, jpeg kodi-pvr-vuplus, libarchive, libcoap,
+	libfpm-extra, libglib2, libhtp, libid3tag, libinput, libmad,
+	libopenssl, libsepol, libssh, libv4l, libvncserver, libwpe,
+	localedef, mariadb, matchbox, mbedtls, mc, mesa3d-headers,
+	meson, midori, msgpack, netsnmp, nginx, ogre, openjdk,
+	openldap, openvpn, p7zip, paho-mqtt-c, php, polkit, python,
+	python-attrs, python-crossbar, python-dpkt, python-flask,
+	python-future, python-iptables, python-jedi, python-markdown2,
+	python3, qemu, qpdf, qt5, samba4, squashfs, squid, strongswan,
+	suricata, tzdata, util-linux, vlc, wget, webkitgtk,
+	wireguard-linux-compat, wireshark, wpebackend-fdo, wpewebkit,
+	zic
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11866: initramfs file system fails to boot using Grub on EFI x86_64
+	#12271: python-iptables runtime dependencies
+	#12726: systemctl preset-all failed for ctrl-alt-del.target
+	#12751: OpenJdk package installation issues on target
+	#12796: Update OpenSSL to Version 1.1.1g to patch CVE-2020-1967
+	#12811: bootstrap stuck and no login prompt
+	#12841: util-linux/sfdisk 2.35.1 fails on sector-size header
+
 2020.02.1, released April 10th, 2020
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index a72ce19865..cd6d66908f 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.02.1
+export BR2_VERSION := 2020.02.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1586551000
+BR2_VERSION_EPOCH = 1589285000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
