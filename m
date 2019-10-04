From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Oct 2019 09:27:30 +0200
Subject: [Buildroot] [git commit] Update for 2019.02.6
Message-ID: <20191004073806.A74898856E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9fb5b2d10b305d2aaee1417a23a08972a0c2b16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4564d8f3977a6ed448edf9567f4eb6a6b8c127c8)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/CHANGES b/CHANGES
index ed010edec5..5436f1111f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -410,6 +410,41 @@
 	#11761: Building custom kernel 5.1-rc3 or later breaks on objtool
 	#11816: Only selected coreutils binaries are installed
 
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
