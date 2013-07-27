From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 16:48:29 +0200
Subject: [Buildroot] [git commit] avahi: minor cleanup
Message-ID: <20130727213153.D84679AD30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3fed58bd509b8dbb1ea5fe088fe92eb8cd86a410
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/avahi/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/avahi/Config.in b/package/avahi/Config.in
index 60fd50f..c6af67e 100644
--- a/package/avahi/Config.in
+++ b/package/avahi/Config.in
@@ -10,10 +10,11 @@ config BR2_PACKAGE_AVAHI
 
 	  http://www.avahi.org/
 
+if BR2_PACKAGE_AVAHI
+
 config BR2_PACKAGE_AVAHI_AUTOIPD
 	bool "IPv4LL network address configuration daemon"
 	default y
-	depends on BR2_PACKAGE_AVAHI
 	select BR2_PACKAGE_LIBDAEMON
 	help
 	  Avahi-autoipd implements IPv4LL, "Dynamic Configuration of
@@ -25,7 +26,6 @@ config BR2_PACKAGE_AVAHI_AUTOIPD
 
 config BR2_PACKAGE_AVAHI_DAEMON
 	bool "mDNS/DNS-SD daemon"
-	depends on BR2_PACKAGE_AVAHI
 	select BR2_PACKAGE_LIBDAEMON
 	select BR2_PACKAGE_EXPAT
 	help
@@ -34,5 +34,7 @@ config BR2_PACKAGE_AVAHI_DAEMON
 	  The daemon registers local IP addresses and services using
 	  mDNS/DNS-SD.
 
+endif
+
 comment "avahi requires a toolchain with thread support"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
