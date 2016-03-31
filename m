From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 31 Mar 2016 07:54:11 -0300
Subject: [Buildroot] [PATCH] cannelloni: needs gcc >= 4.8
Message-ID: <1459421651-2869-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Uses C++11, fixes:
http://autobuild.buildroot.net/results/4a9/4a9999555c20e495d4981deafc2960940e67febe/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cannelloni/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/cannelloni/Config.in b/package/cannelloni/Config.in
index 0938159..cb51709 100644
--- a/package/cannelloni/Config.in
+++ b/package/cannelloni/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CANNELLONI
 	bool "cannelloni"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # lksctp-tools
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lksctp-tools
@@ -10,6 +11,7 @@ config BR2_PACKAGE_CANNELLONI
 
 	  https://github.com/mguentner/cannelloni
 
-comment "cannelloni needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "cannelloni needs a toolchain w/ C++, threads, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+	!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
-- 
2.7.3
