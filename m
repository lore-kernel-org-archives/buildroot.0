From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Oct 2013 09:22:37 -0300
Subject: [Buildroot] [PATCH 3/3] mediastreamer: requires toolchain with ipv6
	support
In-Reply-To: <1381321357-16419-1-git-send-email-gustavo@zacarias.com.ar>
References: <1381321357-16419-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1381321357-16419-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/b16/b164b87fefac67074d45a6413386f53a8ee47843/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linphone/Config.in      | 6 ++++--
 package/mediastreamer/Config.in | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/linphone/Config.in b/package/linphone/Config.in
index bd51412..1bced0e 100644
--- a/package/linphone/Config.in
+++ b/package/linphone/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LINPHONE
 	depends on BR2_INSTALL_LIBSTDCPP # mediastreamer
 	depends on BR2_TOOLCHAIN_HAS_THREADS # ortp
 	depends on BR2_USE_MMU # libeXosip2
+	depends on BR2_INET_IPV6 # mediastreamer
 	help
 	  Linphone is an internet phone or Voice Over IP phone (VoIP).
 
@@ -25,5 +26,6 @@ config BR2_PACKAGE_LINPHONE
 
 	  http://www.linphone.org/
 
-comment "linphone requires a toolchain with threads and C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "linphone requires a toolchain with threads, C++ and IPv6 support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INET_IPV6
diff --git a/package/mediastreamer/Config.in b/package/mediastreamer/Config.in
index 477d4fa..9b20307 100644
--- a/package/mediastreamer/Config.in
+++ b/package/mediastreamer/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_MEDIASTREAMER
 	select BR2_PACKAGE_ORTP
 	depends on BR2_INSTALL_LIBSTDCPP # until fixed
 	depends on BR2_TOOLCHAIN_HAS_THREADS # ortp
+	depends on BR2_INET_IPV6
 	help
 	  Mediastreamer is a powerful and lightweighted streaming
 	  engine specialized for voice/video telephony applications.
@@ -13,5 +14,6 @@ config BR2_PACKAGE_MEDIASTREAMER
 
 	  http://www.linphone.org/eng/documentation/dev/mediastreamer2.html
 
-comment "mediastreamer requires a toolchain with threads and C++ support"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "mediastreamer requires a toolchain with threads, C++ and IPv6 support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INET_IPV6
-- 
1.8.1.5
