From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Jun 2019 09:36:49 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] Update for 2019.02.3
Message-ID: <20190607073747.BA8218375A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e8b918b871f484b3ef57832aa41982e368d74c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 32 ++++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index e5021f7f90..e3d7ad3bf8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,35 @@
+2019.02.3, Released June 7th, 2019
+
+	Important / security related fixes.
+
+	Infra: pkg-config: Use a dedicated timestamp file rather than
+	.config as that gets touched by linux-4.19+, causing repeated
+	builds.
+
+	check-bin-arch: Also ignore /usr/lib/grub to support merged
+	/usr setups, similar to how /lib/grub is ignored.
+
+	gnuconfig/config.sub: Add C-SKY architecture support.
+
+	Updated/fixed packages: assimp, atftp, atop, botan, busybox,
+	ca-certificates, chocolate-doom, cjson, coreutils, cracklib,
+	ddrescue, dhcp, docker-cli, docker-containerd, docker-engine,
+	dosfstools, dovecot, dovecot-pigeonhole, dropbear, exim,
+	ffmpeg, flare-engine, gcc, gdb, gerbera, glibmm, go, gpsd,
+	gst-ffmpeg, gst1-plugins-bad, gst1-plugins-base, imagemagick,
+	intel-microcode, jasper, kf5-kcoreaddons, kismet, libcurl,
+	libglib2, libnss, libopenssl, libsigrok, libssh2, libupnp18,
+	linuxptp, luajit, lynx, matchbox-panel, mender,
+	netcat-openbsd, netsurf, nfs-utils, opus, orc, owfs,
+	pcsc-lite, php, popt, postgresql, python, python-cython,
+	python-django, python-ply, qt5enginio, rpm, runc, samba4,
+	sqlite, subversion, supertux, systemd, tslib, uclibc,
+	v4l2loopback, webkitgtk, woff2
+
+	#11816: Only selected coreutils binaries are installed
+	#11841: grub-efi.cfg not used when building EFI disk image
+	#11911: systemd v240 memory leak in systemd-journald
+
 2019.02.2, Released April 29th, 2019
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index c510b7cbaa..2c8146e87a 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.02.2
+export BR2_VERSION := 2019.02.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1556527000
+BR2_VERSION_EPOCH = 1559893000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
