From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Oct 2019 09:12:47 +0200
Subject: [Buildroot] [git commit branch/2019.08.x] Update for 2019.08.1
Message-ID: <20191003070735.4C2F38847B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d77f6c1712400cc6a11ffeb80f9f6d8668834359
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 35 +++++++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index c8e13c3bab..8bb5dcb4f8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,38 @@
+2019.08.1, released October 3rd, 2019
+
+	Important / security related fixes.
+
+	Defconfigs: AArch64-efi: Fix grub configuration, Beaglebone:
+	Use default console settings
+
+	Dependencies: Ensure host has JSON::PP perl module installed
+	if webkitgtk/wpewebkit packages are enabled as it is needed
+	during their build process.
+
+	Toolchain: Generate check-headers program under BUILD_DIR
+	rather than /tmp to fix issues with distributions mounting
+	/tmp noexec.
+
+	Updated/fixed packages: asterisk, augeas, axel, bind, bwm-ng,
+	cups, cups-filters, docker-cli, docker-engine, docker-proxy,
+	e2fsprogs, eudev, exim, expat, gcc, go, haveged, ifplugd, joe,
+	kf5-extra-cmake-modules, kf5-modemmanager-qt,
+	kf5-networkmanager-qt, libcamera, libcurl, libgcrypt,
+	libglib2, libgpg-error, libnspr, libnss, libopenssl,
+	logrotate, luksmeta, mariadb, mbedtls, mongodb, mosquitto,
+	ncurses, nfs-utils, nghttp2, nodejs, openvmtools, php,
+	protobuf, putty, qemu, samba4, snort, swupdate,
+	systemd-bootchart, thttpd, uclibc, unzip, util-linux,
+	wireshark
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#10806: Allow nfs-utils to use ipv6
+	#11781: mariadb build error
+	#12031: Build of cups-filters fails while linking, apparently due..
+	#12141: eudev package is missing "render" and "kvm" groups
+	#12241: Permission denied while running "make"
+
 2019.08, released September 1st, 2019
 
 	Various fixes.
diff --git a/Makefile b/Makefile
index 24ebaa2874..39c01135f8 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.08
+export BR2_VERSION := 2019.08.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1567371000
+BR2_VERSION_EPOCH = 1570086600
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
