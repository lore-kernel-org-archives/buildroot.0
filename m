From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Apr 2013 22:48:40 +0200
Subject: [Buildroot] [git commit] avahi: needs threads
Message-ID: <20130404205334.C68C49B4BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c830a1a510c32d3f0d9db045762950e24a8d9b0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/bc64cd3499d7c3c674e8e79b749ff96a756852ea/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/avahi/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
