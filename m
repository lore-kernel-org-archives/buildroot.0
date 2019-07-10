From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Jul 2019 10:02:18 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] Update for 2019.02.4
Message-ID: <20190710080206.CEC7281684@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26bae8483231b23159c6b6c39e204c0eca76f0d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 31 +++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index e3d7ad3bf8..7c8cad7e57 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,34 @@
+2019.02.4, Released July 10th, 2019
+
+	Important / security related fixes.
+
+	arch: x86: Fix typo breaking 'core-avx2' variant, add Westmere
+	variant.
+
+	linux: Workaround -Werror related build failure on powerpc,
+	by forcing CONFIG_PPC_DISABLE_WERROR on.
+
+	support/testing: Emulate a machine with 256MB RAM to fix
+	issues with certain tests running out of memory.
+
+	test-pkg: Correct long option handling and clean output dir
+	after a successful build to save disk space.
+
+	Ensure custom <pkg>_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS are
+	passed before the standard exclusions so they are not ignored
+	by rsync when using override-srcdir.
+
+	Defconfigs: QEMU: use 'rootwait' kernel option to ensure root
+	partition is available before mounting.
+
+	Updated/fixed packages: barebox, bzip2, davfs2, dbus, dialog,
+	docker-cli, docker-engine, expat, faad2, ffmpeg, freeswitch,
+	gerbera, haveged, irssi, libcdadio, libgit2, libglib2,
+	libsecret, libvncserver, lmbench, logrotate, mariadb, meson,
+	mongoose, monit, mpd, openblas, php, postgresql, psplash,
+	python, python-django, python3, qt5base, samba4, taglib,
+	tvheadend, vlc, webkitgtk, xserver_xorg-server, znc
+
 2019.02.3, Released June 7th, 2019
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 2c8146e87a..e0cf1ecc65 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.02.3
+export BR2_VERSION := 2019.02.4
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1559893000
+BR2_VERSION_EPOCH = 1562745000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
