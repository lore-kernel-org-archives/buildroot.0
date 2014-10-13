From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Oct 2014 08:08:42 +0200
Subject: [Buildroot] [git commit] hostapd: needs MMU
Message-ID: <20141013060905.23F91B2C4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21870ba6c033b71273fa88e2e0ff1fe7a8ee57d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

hostapd calls fork() since last version bump.

Fixes:
http://autobuild.buildroot.net/results/945/94543b865db2ff5da34434fdcdf15ea7db73f392/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hostapd/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 8783e66..6ca396e 100644
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
