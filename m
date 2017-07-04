From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 18:50:41 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] Update for 2017.02.4
Message-ID: <20170704164759.E7EEB81999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ea1487c0afbbb44eca7b2f9e8759305195ab2a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 28 ++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index d8b369f..90d409f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,31 @@
+2017.02.4, Released July 4th, 2017
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
+	Updated/fixed packages: apache, automake, bind, botan, c-ares,
+	dhcp, expat, fcgiwrap, gcc, gdb, gesftpserver, glibc, gnutls,
+	gst1-plugins-bad, imagemagick, imx-uuc, intltool, iperf,
+	ipsec-tools, irssi, libgcrypt, libmad, libnl, mosquitto,
+	mpg123, ncurses, nodejs, ntp, openssh, openvpn, qt5base,
+	qt5multimedia, rtl8821au, socat, spice, systemd, tor, tslib,
+	vlc, x264, xserver_xorg-server
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#9976: License file for package 'rtl8821au' incorrect
+
 2017.02.3, Released June 2nd, 2017
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index f74d59b..321b307 100644
--- a/Makefile
+++ b/Makefile
@@ -86,9 +86,9 @@ else # umask / $(CURDIR) / $(O)
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2017.02.3
+export BR2_VERSION := 2017.02.4
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1496390000
+BR2_VERSION_EPOCH = 1499186000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
