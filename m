From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 22:15:58 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] Update for 2019.02.5
Message-ID: <20190902201203.19AF18A444@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1408d04a383eacadf1518886d216325304569ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 37 +++++++++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9bd32d6d3a..d6e7a3677f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,40 @@
+2019.02.5, Released September 2nd, 2019
+
+	Important / security related fixes.
+
+	Filesystems: Pass extra pax options to tar for binary
+	reproducibility.
+
+	Updated/fixed packages: apache, arm-trusted-firmware,
+	asterisk, atk, autofs, batctl, batman-adv, berkeleydb, brotli,
+	busybox, bzip2, clamav, cloop, cmake, collectd, connman-gtk,
+	cryptopp, dahdi-linux, dahdi-tools, daq, dehydrated, dovecot,
+	dovecot-pigeonhole,, elfutils, evtest, exim, expect, giflib,
+	git, glib-networking, glibc, gnupg2, gnutls, go,
+	gst1-rtsp-server, gtkperf, gupnp-tools, gvfs, imagemagick,
+	imx-uuc, intel-microcode, json-glib, lftp, libbsd, libcurl,
+	libgit2, libgtk3, libmodplug, libnss, libpri, libshout,
+	libss7, libssh2, libvips, libxcb, linux-headers, mdadm,
+	mesa3d, metacity, mpg123, mosquitto, musl, nginx, openblas,
+	opencv3, openldap, openvmtools, pcmanfm, php, pigpio,
+	postgresql, prboom, proftpd, proj, python, python-django,
+	python-idna, python-numpy, python-urllib3, python3, qemu, qt5,
+	qt5base, qt5enginio, quagga, rygel, squid, subversion,
+	tcpreplay, unzip, vlc, vte, webkitgtk, weston, wireless-regdb,
+	xen, xfont_font-util, xlib_libICE, xlib_libXfont,
+	xlib_libXfont2, yad, zeromq
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11741: pigpio does not build host-pigpio
+	#11876: automount using host mount/umount
+	#11881: Build breaks with lftp package enabled and libexpat1-dev inst..
+	#11921: dahdi fails to build
+	#11961: libpri build failure
+	#12096: tcpreplay: build fails if libdumbnet-dev is installed in the..
+	#12106: daq: build fails if libdumbnet-dev is installed in the host
+	#12126: vc4 has neon as hard dependency
+
 2019.02.4, Released July 10th, 2019
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index a54544f87c..4961c26fc7 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.02.4
+export BR2_VERSION := 2019.02.5
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1562745000
+BR2_VERSION_EPOCH = 1567455000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
