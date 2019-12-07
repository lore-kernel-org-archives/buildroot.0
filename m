From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Dec 2019 18:38:36 +0100
Subject: [Buildroot] [git commit] Update for 2019.08.3
Message-ID: <20191207185558.E460088559@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f75fbbec1edb90d23e1b3d09ee3a434bf898144
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 21e50b5598625bda1f6f98566113cce1dba976ae)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/CHANGES b/CHANGES
index f2b34b9a98..b87c36f0b3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -168,6 +168,47 @@
 	#12276: make clean/distclean does not remove BR2_DL_DIR and BR2_HOST_DIR
 	#12281: Custom configuration fails to build (based on raspberrypi3_..
 
+2019.08.3, released December 7th, 2019
+
+	Important / security related fixes.
+
+	Infrastructure: Make HOST_<pkg>_DL_OPTS inherit from
+	<pkg>_DL_OPTS by default, just like it is done for a number of
+	other package variables
+
+	Add <pkg>_KEEP_PY_FILES to exclude specific python .py files
+	from the removal done by BR2_PACKAGE_PYTHON{,3}_PYC_ONLY for
+	the (rare) case where the .py files are needed at runtime
+	rather than .pyc.
+
+	Fix <pkg>-reconfigure handling for packages using the kconfig
+	infrastructure.
+
+	Toolchain: ensure external toolchain kernel headers version
+	check correctly stop the build on mismatch
+
+	Deconfigs: beaglebone: fix boot issue
+
+	Updated/fixed packages: am33x-cm3, asterisk, bind, chrony,
+	clamav, cmocka, collectd, connman, dhcp, dropwatch, faifa,
+	gettext-tiny, gob2, haproxy, intel-microcode, ipsec-tools,
+	jailhouse, jasper, jpeg-turbo, kodi, kvm-unit-tests, libftdi,
+	libftdi1, libnss, libressl, libstrophe, libsvgtiny, lvm2,
+	lzma, mariadb, minicom, mosquitto, neardal, ninja, nodejs,
+	oniguruma, openvmtools, oracle-mysql, perl-gdgraph,
+	perl-gdtextutil, php, postgresql, prosody, python-cchardet,
+	python-django, qt5wayland, rabbitmq, rauc, redis, rpcbind,
+	socat, spice, spice-protocol, tftpd, tiff, webkitgtk
+
+	New packages: libmspack
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#12166: Compiling nodejs for SAMA5D3 always crash with illegal inst..
+	#12171: Python-opencv needs config.py and config-3.7.py to run..
+	#12211: host-nodejs 10.15.3 package fail to build
+	#12316: tzdata fails to install with empty "default local time"
+
 2019.08.2, released November 9th, 2019
 
 	Important / security related fixes.
