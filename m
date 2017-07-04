From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 23:13:06 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] Update for 2017.05.1
Message-ID: <20170704211015.90B5481E68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3d8beeb369412a69adc75bf78391fb8a07d49b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 31 +++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 1b764a2..4b870a9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,34 @@
+2017.05.1, Released July 4th, 2017
+
+	Important / security related fixes.
+
+	Update support/scripts/scancpan to use METACPAN v1 API as v0
+	has been shutdown.
+
+	Update support/scripts/mkusers to handle setups where
+	/etc/shadow is a symlink.
+
+	External toolchain: Don't create musl dynamic loader symlink
+	for static builds.
+
+	Setlocalversion: Correct detection of mercurial revisions for
+	non-tagged versions.
+
+	Defconfigs: at91sam9x5ek_mmc: workaround boot rom issue.
+
+	Updated/fixed packages: apache, automake, bind, botan, c-ares,
+	dhcp, expat, fcgiwrap, gcc, gdb, gesftpserver, glibc, glmark2,
+	gnutls, gst1-plugins-bad, imagemagick, imx-uuc, intltool,
+	iperf, ipsec-tools, irssi, kmod, libcurl, libgcrypt, libmad,
+	libnl, lugaro, mosquitto, mpg123, ncurses, nodejs, ntp,
+	openssh, openvpn, pngquant, python-simplegeneric, qt5base,
+	qt5multimedia, rtl8821au, socat, spice, systemd, tor, trinity,
+	tslib, vlc, x264, xen, xlib_libxshmfenc, xserver_xorg-server
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#9976: License file for package 'rtl8821au' incorrect
+
 2017.05, Released May 31st, 2017
 
 	Minor fixes.
diff --git a/Makefile b/Makefile
index f4d41ce..61e5c85 100644
--- a/Makefile
+++ b/Makefile
@@ -86,9 +86,9 @@ else # umask / $(CURDIR) / $(O)
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2017.05
+export BR2_VERSION := 2017.05.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1496267000
+BR2_VERSION_EPOCH = 1499203000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
