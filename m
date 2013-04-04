From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  4 Apr 2013 07:39:16 -0300
Subject: [Buildroot] [PATCH] avahi: needs threads
Message-ID: <1365071956-1474-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/bc64cd3499d7c3c674e8e79b749ff96a756852ea/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/avahi/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/avahi/Config.in b/package/avahi/Config.in
index e2f8c53..60fd50f 100644
--- a/package/avahi/Config.in
+++ b/package/avahi/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_AVAHI
 	bool "avahi"
 	# libdaemon uses fork()
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Avahi is a system which facilitates service
@@ -32,3 +33,6 @@ config BR2_PACKAGE_AVAHI_DAEMON
 	  architecture (also known as "Rendezvous" or "Bonjour").
 	  The daemon registers local IP addresses and services using
 	  mDNS/DNS-SD.
+
+comment "avahi requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.5
