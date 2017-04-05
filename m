From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Apr 2017 17:18:54 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] Update for 2017.02.1
Message-ID: <20170405152214.2F14682256@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=476067a78d4fd1ddb141a8cccc63cf3e75cbe7a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 39 +++++++++++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5fedca1..75163c3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,42 @@
+2017.02.1, Released April 4th, 2017
+
+	Important / security related fixes.
+
+	Fix a variable clashing issue in the mkusers script with
+	internal bash variables.
+
+	Improve external toolchain version detection.
+
+	Correct permissions for /dev/pts/ptmx when systemd is used
+	with recent glibc versions.
+
+	Fix python module name clash for graph-depends.
+
+	Fakeroot now links against libacl to fix issues on
+	distributions using acls.
+
+	Ensure that the git download infrastructure creates GNU format
+	tar files.
+
+	br2-external: Improve error reporting.
+
+	Updated/fixed packages: acl, apr, audiofile, busybox, cairo,
+	dbus-cpp, dbus-glib, dbus-triggerd, domoticz, elfutils,
+	fakeroot, filemq, fmc, gdb, git, gnutls, gst-ffmpeg,
+	gst1-plygins-bad, harfbuzz, htop, imagemagick, jasper, libcec,
+	libiio, libplatform, librsvg, libselinux, libsidplay2, libsoc,
+	libwebsockets, libxkbcommon, linux-firmware, logrotate,
+	lpt-testsuite, lttng-libust, mariadb, mbedtls, memcached,
+	mesa3d, mpd, mplayer, nbd, ncftp, ntp, openssh, opentyrian,
+	pcre, perl-gd, python, qt5base, rpi-userland, rpm, samba4,
+	skalibs, slang, sngrep, squashfs, syslog-ng, taglib,
+	tcpreplay, tor, upmpdcli, wget, wireshark,
+	xdriver_xf86-video-vmware, xlib_libXv, zmqpp
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#9456: mkusers script bash errors
+
 2017.02, Released February 28th, 2017
 
 	Minor fixes, mainly fixing autobuilder issues.
diff --git a/Makefile b/Makefile
index 0308f9b..30e76fa 100644
--- a/Makefile
+++ b/Makefile
@@ -86,9 +86,9 @@ else # umask / $(CURDIR) / $(O)
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2017.02
+export BR2_VERSION := 2017.02.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1488315000
+BR2_VERSION_EPOCH = 1491392000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
