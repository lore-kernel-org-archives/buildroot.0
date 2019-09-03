From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Sep 2019 12:37:46 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] Update for 2019.05.2
Message-ID: <20190903103355.C8F608A44B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9e671a558f106d57ed3c7f0cd0b89359c6b1567
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 39 +++++++++++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index de59635227..47e1cf98e2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,42 @@
+2019.05.2, Released September 3rd, 2019
+
+	Important / security related fixes.
+
+	Filesystems: Pass extra pax options to tar for binary
+	reproducibility.
+
+	Updated/fixed packages: apache, arm-trusted-firmware,
+	asterisk, atk, autofs, batctl, batman-adv, berkeleydb,
+	busybox, bzip2, clamav, cloop, cmake, collectd, connman-gtk,
+	dahdi-linux, dahdi-tools, daq, dehydrated, dhcp, dovecot,
+	dovecot-pigeonhole,, elfutils, evtest, exim, expect, giflib,
+	git, glib-networking, glibc, gnupg2, gnutls, go,
+	gst1-rtsp-server, gtkperf, gupnp-tools, gvfs, imagemagick,
+	imx-uuc, intel-microcode, json-glib, lftp, libbsd, libcurl,
+	libgit2, libgtk2, libgtk3, libmodplug, libnss, libpri,
+	libshout, libss7, libssh2, libvips, libxcb, linux-headers,
+	mdadm, mesa3d, metacity, mpg123, mosquitto, musl, nginx,
+	oniguruma, openblas, opencv3, openjdk, openjdk-bin, openldap,
+	openvmtools, pcmanfm, php, pigpio, postgresql, prboom,
+	proftpd, proj, python, python-django, python-idna,
+	python-numpy, python-urllib3, python3, qemu, qt5, qt5base,
+	qt5enginio, quagga, rygel, squid, subversion, tcpreplay,
+	unzip, vlc, vte, webkitgtk, wireless-regdb, xen,
+	xfont_font-util, xlib_libICE, xlib_libXfont, xlib_libXfont2,
+	yad, zeromq
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11741: pigpio does not build host-pigpio
+	#11876: automount using host mount/umount
+	#11881: Build breaks with lftp package enabled and libexpat1-dev inst..
+	#11921: dahdi fails to build
+	#11961: libpri build failure
+	#12086: (dhcpd-missing-libs) - dhcp shared libraries not installed to..
+	#12096: tcpreplay: build fails if libdumbnet-dev is installed in the..
+	#12106: daq: build fails if libdumbnet-dev is installed in the host
+	#12126: vc4 has neon as hard dependency
+
 2019.05.1, Released July 7th, 2019
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 41047a4002..2cadd45b4d 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.05.1
+export BR2_VERSION := 2019.05.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1562530000
+BR2_VERSION_EPOCH = 1567507000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
