From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:46:48 -0500
Subject: [Buildroot] [PATCH 05/67] avahi: minor cleanup
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-6-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/avahi/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

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
-- 
1.8.1.2
