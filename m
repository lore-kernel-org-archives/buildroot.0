From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Apr 2021 12:36:40 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] Update for 2020.02.12
Message-ID: <20210405105540.BDD3D8D39F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a6bd98fa87996f50f42a27857a9e9f029cc83e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 36 ++++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 379534fc05..ed15f191fc 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,39 @@
+2020.02.12, released April 5, 2021
+
+	Important / security related fixes.
+
+	Dependencies: Explicitly detect and bail out if PATH contains
+	spaces or tabs. A number of packages fail to build in such
+	setups, so explicitly inform about this.
+
+	utils/scanpypi: Explicitly use python3 for compatibility with
+	packages using python3 syntax in setup.py
+
+	support/download: Fix tarball generation (from git/svn repos)
+	including symlinks pointing to ./<something>
+
+	Meson: Use correct C++ host compiler (rather than C compiler)
+
+	Updated/fixed packages: asterisk, batman-adv, bind,
+	ca-certificates, docker-containerd, dovecot,
+	dovecot-pigeonhole, diffutils, efivar, git, gnuchess, gnutls,
+	grub2, fakeroot, haserl, imagemagick, irqbalance, jasper,
+	kodi, libebml, libglib2, libjpeg, libopenssl, mariadb,
+	mbedtls, mosquitto, nodejs, nettle, openldap, openssh,
+	opkg-utils, perl, php, privoxy, prosody, protobuf,
+	python-aiohttp, python-django, python-lxml, python-pyyaml,
+	python-rpi-ws281x, python3, redis, sconeserver, screen, sox,
+	sqlcipher, squid, sysvinit, tor, transmission, tzdata, uboot,
+	util-linux, wireshark, wolfssl, wpa_supplicant, zstd
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13516: utils/scanpypi: Failure when parsing diffoscope
+	#13541: 2021.02.rc2: irqbalance: Daemon couldn't be bound to..
+	#13576: Issues compiling buildroot for 5x86
+	#13581: jpegsrc.v9d.tar.gz has changed hash
+	#13616: tar file from git repository generation issue
+
 2020.02.11, released February 17, 2021
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 2feaf20ac8..b5e1270992 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.02.11
+export BR2_VERSION := 2020.02.12
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1613590000
+BR2_VERSION_EPOCH = 1617619000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index a3c5adcca5..eb1dddd7ad 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2020.02.11'
+RELEASE='2020.02.12'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
