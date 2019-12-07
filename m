From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Dec 2019 14:31:25 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] Update for 2019.08.3
Message-ID: <20191207132317.1CD328805A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21e50b5598625bda1f6f98566113cce1dba976ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 41 +++++++++++++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index ae1730d1e6..b0d9697dad 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,44 @@
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
diff --git a/Makefile b/Makefile
index 9b0291372f..98f5b1ac3e 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.08.2
+export BR2_VERSION := 2019.08.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1573328000
+BR2_VERSION_EPOCH = 1575725000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
