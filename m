From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Oct 2019 17:10:38 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] Update for 2019.02.6
Message-ID: <20191003150522.D4800884AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4564d8f3977a6ed448edf9567f4eb6a6b8c127c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 35 +++++++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index d6e7a3677f..5d2bc0064f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,38 @@
+2019.02.6, Released October 3rd, 2019
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
+	Updated/fixed packages: asterisk, augeas, bind, bwm-ng, cups,
+	cups-filters, docker-cli, docker-engine, docker-proxy,
+	dropbear, e2fsprogs, eudev, exim, expat, gcc, go, ifplugd,
+	haveged, iptables, joe, kf5-extra-cmake-modules,
+	kf5-modemmanager-qt, kf5-networkmanager-qt, libcurl,
+	libgcrypt, libgpg-error, libnftl, libnspr, libnss, libopenssl,
+	luksmeta, mariadb, mbedtls, mongodb, mosquitto, ncurses,
+	nfs-utils, nghttp2, nodejs, openvmtools, php, protobuf, putty,
+	qemu, qt5base, samba4, swupdate, systemd-bootchart, thttpd,
+	uclibc, unzip, util-linux, wireshark
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#10806: Allow nfs-utils to use ipv6
+	#11781: mariadb build error
+	#12031: Build of cups-filters fails while linking, apparently due..
+	#12141: eudev package is missing "render" and "kvm" groups
+	#12181: dropbear: norootlogin (-w) no longer works when PAM is enabled
+	#12241: Permission denied while running "make"
+
 2019.02.5, Released September 2nd, 2019
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 4961c26fc7..8bdf546097 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.02.5
+export BR2_VERSION := 2019.02.6
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1567455000
+BR2_VERSION_EPOCH = 1570115000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
