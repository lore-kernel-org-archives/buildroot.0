From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 19:19:09 +0200
Subject: [Buildroot] [git commit branch/next] libnl: requires thread support
Message-ID: <20120802195302.5B4498E8F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=065bf8a4d606c60fe745147ede76a93471faf85b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes
http://autobuild.buildroot.net/results/813602e91ad4022957b3bc8d285ddb2b05d3b875/build-end.log

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hostapd/Config.in  |    4 ++++
 package/iw/Config.in       |    4 ++++
 package/libnl/Config.in    |    4 ++++
 package/ti-utils/Config.in |    4 ++++
 4 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 4a474c3..49e8400 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOSTAPD
 	bool "hostapd"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
 	select BR2_PACKAGE_LIBNL
 	help
 	  User space daemon for wireless access points.
@@ -23,3 +24,6 @@ config BR2_PACKAGE_HOSTAPD_WPS
 	  Enable support for Wi-Fi Protected Setup.
 
 endif
+
+comment "hostapd requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/iw/Config.in b/package/iw/Config.in
index 81584e7..69ef675 100644
--- a/package/iw/Config.in
+++ b/package/iw/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_IW
 	bool "iw"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
 	select BR2_PACKAGE_LIBNL
 	help
 	  Utility for wireless devices using the mac80211 kernel stack
 
 	  http://wireless.kernel.org/en/users/Documentation/iw
+
+comment "iw requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libnl/Config.in b/package/libnl/Config.in
index c7d4359..f4a1dc2 100644
--- a/package/libnl/Config.in
+++ b/package/libnl/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBNL
 	bool "libnl"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  A library for applications dealing with netlink socket.
 
@@ -10,3 +11,6 @@ config BR2_PACKAGE_LIBNL_TOOLS
 	depends on BR2_PACKAGE_LIBNL
 	help
 	  Install binary tools.
+
+comment "libnl requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ti-utils/Config.in b/package/ti-utils/Config.in
index 02ae336..94d6204 100644
--- a/package/ti-utils/Config.in
+++ b/package/ti-utils/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_TI_UTILS
 	bool "ti-utils"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
 	select BR2_PACKAGE_LIBNL
 	help
 	  The calibrator and other useful utilities for TI wireless solution,
 	  based on wl12xx driver.
 
 	  http://linuxwireless.org/en/users/Drivers/wl12xx/calibrator
+
+comment "ti-utils requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
