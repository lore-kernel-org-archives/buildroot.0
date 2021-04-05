From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Apr 2021 12:13:08 +0200
Subject: [Buildroot] [git commit] Update for 2020.11.4
Message-ID: <20210405095133.B80498D23F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20cc2c13d711f9f27dc233a7a73a1d0b6f1cc639
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f748088fa65b6862f943ed28e669db4b0f52c679)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/CHANGES b/CHANGES
index f7b69af806..f110bc384a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -121,6 +121,48 @@
 	#13471: package/mpd/mpd.conf make use of path not created
 	#13506: BR2_PACKAGE_DHCPCD missing directory creation
 
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
