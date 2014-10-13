From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Oct 2014 08:36:25 +0300
Subject: [Buildroot] [PATCH] hostapd: needs MMU
Message-ID: <9e40988de91b109be1cf18bdb8999b15cf10020c.1413178585.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hostapd calls fork() since last version bump.

Fixes:
http://autobuild.buildroot.net/results/945/94543b865db2ff5da34434fdcdf15ea7db73f392/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/hostapd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 8783e66132d3..6ca396ee3904 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOSTAPD
 	bool "hostapd"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBNL
 	help
 	  User space daemon for wireless access points.
@@ -31,3 +32,4 @@ endif
 
 comment "hostapd needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
-- 
2.1.1
