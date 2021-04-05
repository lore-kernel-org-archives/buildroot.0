From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Apr 2021 14:01:20 +0200
Subject: [Buildroot] [git commit] Update for 2020.02.12
Message-ID: <20210405113934.A8D2386264@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d81ac2e40f6f632a7b48a6eda75a135cedfb647f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1a6bd98fa87996f50f42a27857a9e9f029cc83e0)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/CHANGES b/CHANGES
index f110bc384a..c1ee6c4316 100644
--- a/CHANGES
+++ b/CHANGES
@@ -964,6 +964,43 @@
 	#12796: Update OpenSSL to Version 1.1.1g to patch  CVE-2020-1967
 	#12811: bootstrap stuck and no login prompt
 
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
+	kodi, libcurl, libebml, libglib2, libjpeg, libopenssl,
+	libupnp, libvips, lldpd, mariadb, mbedtls, mosquitto, nodejs,
+	netsnmp, nettle, openldap, openmpi, openssh, opkg-utils, perl,
+	php, privoxy, prosody, protobuf, python-aiohttp,
+	python-django, python-lxml, python-pyyaml, python-rpi-ws281x,
+	python3, redis, rpm, sconeserver, screen, sox, sqlcipher,
+	squid, sysvinit, tor, transmission, tzdata, uboot, upx,
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
