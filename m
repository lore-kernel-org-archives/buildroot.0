From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Jul 2019 22:09:08 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] Update for 2019.05.1
Message-ID: <20190707200809.59616814C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b4e32cae812225fa909d755d7e09588ce0b92da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 25 +++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 35a094b70f..de59635227 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,28 @@
+2019.05.1, Released July 7th, 2019
+
+	Important / security related fixes.
+
+	arch: x86: Fix typo breaking 'core-avx2' variant
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
+	Defconfigs: QEMU: use 'rootwait' kernel option to ensure root
+	partition is available before mounting.
+
+	Updated/fixed packages: barebox, busybox, bzip2, davfs2,
+	dialog, docker-cli, docker-engine, exim, expat, faad2,
+	haveged, irssi, libcamera, libcdaudio, libcurl, libglib2,
+	libressl, libsecret, lmbench, meson, monit, php, postgresql,
+	psplash, python-django, qt5base, tvheadend, webkitgtk,
+	xserver_xorg-server, znc
+
 2019.05, released June 2nd, 2019
 
 	Various fixes.
diff --git a/Makefile b/Makefile
index 7ff40496d3..c5d398a5a9 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.05
+export BR2_VERSION := 2019.05.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1559462000
+BR2_VERSION_EPOCH = 1562530000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
