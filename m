From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Apr 2021 11:13:57 +0200
Subject: [Buildroot] [git commit branch/2020.11.x] Update for 2020.11.4
Message-ID: <20210405084901.8820D812EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f748088fa65b6862f943ed28e669db4b0f52c679
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 42 ++++++++++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index c42e658cd6..0acd78bb43 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,45 @@
+2020.11.4, released April 5th, 2021
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
+	Updated/fixed packages: asterisk, at91bootstrap3, babeltrace2,
+	batman-adv, bind, ca-certificates, cegui, cog, diffutils,
+	docker-containerd, dovecot, dovecot-pigeonhole, efivar,
+	elfutils, fakeroot, git, gnuchess, gnuradio, gnutls, go,
+	grub2, haserl, i7z, imagemagick, intel-mediasdk, irqbalance,
+	jasper, kodi, libcurl, libebml, libeXosip2, libglib2, libhtp,
+	libjpeg, libopenssl, libqmi, libressl, libupnp, libuwsc,
+	libvips, lldpd, mariadb, mbedtls, mender, micropython,
+	mosquitto, netsnmp, nodejs, openblas, openldap, openmpi,
+	openssh, opkg-utils, optee-client, optee-test, perl, php,
+	privoxy, proftpd, prosody, protobuf, python-aiohttp,
+	python-django, python-lxml, python-pyyaml, python-rpi-ws281x,
+	python-typing-extensions, python3, quagga, qwt, redis, rpm,
+	sconeserver, screen, sox, sqlcipher, squid, suricata,
+	syslinux, sysvinit, tor, transmission, tzdata, uboot, unbound,
+	upx, util-linux, webkitgtk, wireshark, wolfssl,
+	wpebackend-fdo, wpewebkit, wpa_supplicant, zstd
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13516: utils/scanpypi: Failure when parsing diffoscope
+	#13541: 2021.02.rc2: irqbalance: Daemon couldn't be bound to..
+	#13576: Issues compiling buildroot for 5x86
+	#13581: jpegsrc.v9d.tar.gz has changed hash
+	#13616: tar file from git repository generation issue
+
 2020.11.3, released February 17th, 2021
 
 	meson: Fix ccache detection handling when per-package builds
diff --git a/Makefile b/Makefile
index c7e7ca4bc5..cf14abe43c 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.11.3
+export BR2_VERSION := 2020.11.4
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1613586000
+BR2_VERSION_EPOCH = 1617614000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 28a74b9929..937cada4b6 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2020.11.3'
+RELEASE='2020.11.4'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
