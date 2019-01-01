From: Adam Heinrich <adam@adamh.cz>
Date: Tue,  1 Jan 2019 18:33:42 +0100
Subject: [Buildroot] [PATCH 2/2] jack2: Add version info,
 display comment when jack1+2 are enabled
In-Reply-To: <20190101173342.3565-1-adam@adamh.cz>
References: <20190101173342.3565-1-adam@adamh.cz>
Message-ID: <20190101173342.3565-2-adam@adamh.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch changes the help text to emphasize the version of the jack
implementation. It also displays the same comment as the jack1 package
does when both versions are enabled together.

Signed-off-by: Adam Heinrich <adam@adamh.cz>
---
 package/jack2/Config.in | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/jack2/Config.in b/package/jack2/Config.in
index f9de7be041..6a940ed76d 100644
--- a/package/jack2/Config.in
+++ b/package/jack2/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_JACK2
 	# Ensure we get at least one:
 	select BR2_PACKAGE_JACK2_LEGACY if !BR2_PACKAGE_JACK2_DBUS
 	help
-	  JACK Audio Connection Kit (server and example clients).
+	  JACK Audio Connection Kit (JACK 2 implementation).
 
 	  JACK is a low-latency sound server, allowing multiple
 	  applications to connect to one audio device, and to share
@@ -23,6 +23,11 @@ config BR2_PACKAGE_JACK2
 
 	  http://jackaudio.org/
 
+	  Another implementation (BR2_PACKAGE_JACK1) is also available,
+	  please consult the documentation to choose the right one:
+
+	  https://github.com/jackaudio/jackaudio.github.com/wiki/Q_difference_jack1_jack2
+
 if BR2_PACKAGE_JACK2
 
 config BR2_PACKAGE_JACK2_LEGACY
@@ -52,3 +57,7 @@ comment "jack2 needs a toolchain w/ threads, C++, dynamic library"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
 		BR2_STATIC_LIBS
+
+comment "do not enable jack1 and jack2 together"
+	depends on BR2_PACKAGE_JACK1
+	depends on BR2_PACKAGE_JACK2
-- 
2.17.1
