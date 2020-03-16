From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Mar 2020 22:20:02 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] Update for 2019.02.10
Message-ID: <20200316210755.8E3DD81F58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f526ccb76de20c5969e9499737635fab1cf43a0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 39 +++++++++++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index a4d732bd2a..a620a69955 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,42 @@
+2019.02.10, released March 16th, 2020
+
+	Important / security related fixes.
+
+	Core: Ensure package-file-lists data is correct after
+	incremental builds as well.
+
+	Fix a race condition related to creating the output/staging
+	symlink on systems with coreutils < 8.27.
+
+	Br2-external: Fix compatibility with make 4.3+
+
+	Util-linux: Ensure that hwclock is built without GPLv3
+	code. Notice that builds with hwclock has contained
+	GPLv3-licensed code since util-linux 2.30 (Buildroot 2017.08+)
+
+	Updated/fixed packages: armadillo, at, binutils, blktrace,
+	bootstrap, busybox, cairo, cups, czmq, dnsmasq,
+	docker-containerd, dovecot, dovecot-pigeonhole, e2fsprogs,
+	eudev, exim, exiv2, fbgrab, grep, gst1-validate, guile,
+	imagemagick, jhead, kvm-unit-tests, lapack, libcgroup,
+	libftdi1, libjpeg, libsigrok, libsndfile, libssh2, libsvgtiny,
+	libvncserver, libvorbis, libxml2, libxslt, linux, lz4,
+	mariadb, mbedtls, meson, mfgtools, mongoose, ncurses, ntfs-3g,
+	opencv3, openjpeg, openswan, openvmtools, patch, php,
+	postgresql, pppd, proftpd, pure-ftpd, python-django,
+	python-pyqt5, python3, qemu, qt5base, qt5webengine, qwt,
+	rdesktop, ruby, runc, samba4, shellinabox, smartmontools,
+	sqlcipher, squid, swupdate, sysklogd, taglib, thrift,
+	ti-cgt-pru, uboot, util-linux, vorbis-tools, webkitgtk,
+	wireshark, xen, xserver_xorg-server, zeromq, zsh
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11996: opencv3 SIGILL on Cortex-A5 with VFPv4-D16
+	#12331: meson issue
+	#12461: libglib2 build files with deep directory structure
+	#12606: fbgrab location has changed
+
 2019.02.9, released January 12th, 2020
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 31960c8ffc..337ac016d7 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.02.9
+export BR2_VERSION := 2019.02.10
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1578842000
+BR2_VERSION_EPOCH = 1584393000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
