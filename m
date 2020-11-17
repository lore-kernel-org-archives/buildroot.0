From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 17 Nov 2020 21:17:02 +0100
Subject: [Buildroot] [PATCH/next 5/6] package/mediastreamer: bump to version
 4.4.8
In-Reply-To: <20201117201703.137790-1-fontaine.fabrice@gmail.com>
References: <20201117201703.137790-1-fontaine.fabrice@gmail.com>
Message-ID: <20201117201703.137790-5-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

C++14 is required since version 4.4.0 and
https://github.com/BelledonneCommunications/mediastreamer2/commit/c177f06a802a8ff062a31f8ad0aa012668367eae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linphone/Config.in               | 6 ++++--
 package/mediastreamer/Config.in          | 6 ++++--
 package/mediastreamer/mediastreamer.hash | 2 +-
 package/mediastreamer/mediastreamer.mk   | 2 +-
 4 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/linphone/Config.in b/package/linphone/Config.in
index c7683b829e..3fe25c1659 100644
--- a/package/linphone/Config.in
+++ b/package/linphone/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LINPHONE
 	# belr, belle-sip, mediastreamer
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 	depends on BR2_USE_WCHAR # belle-sip
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # mediastreamer
 	select BR2_PACKAGE_BELLE_SIP
 	select BR2_PACKAGE_BELR
 	select BR2_PACKAGE_LIBXML2
@@ -30,10 +31,11 @@ config BR2_PACKAGE_LINPHONE
 
 	  http://www.linphone.org/
 
-comment "linphone needs a toolchain w/ threads, C++, dynamic library, wchar"
+comment "linphone needs a toolchain w/ threads, C++, dynamic library, wchar, gcc >= 5"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 comment "linphone needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/mediastreamer/Config.in b/package/mediastreamer/Config.in
index b12535e82c..471d8ad91a 100644
--- a/package/mediastreamer/Config.in
+++ b/package/mediastreamer/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_MEDIASTREAMER
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # ortp
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # ortp
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	select BR2_PACKAGE_MBEDTLS
 	select BR2_PACKAGE_ORTP
 	help
@@ -16,9 +17,10 @@ config BR2_PACKAGE_MEDIASTREAMER
 
 	  http://www.linphone.org/technical-corner/mediastreamer2
 
-comment "mediastreamer needs a toolchain w/ threads, C++, dynamic library"
+comment "mediastreamer needs a toolchain w/ threads, C++, dynamic library, gcc >= 5"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 comment "mediastreamer needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/mediastreamer/mediastreamer.hash b/package/mediastreamer/mediastreamer.hash
index 5b72426781..dfa469d8dd 100644
--- a/package/mediastreamer/mediastreamer.hash
+++ b/package/mediastreamer/mediastreamer.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b7251495c0bf2c71508b7cdf29999326af0bd215ec4c647b3ebb60796ee72503  mediastreamer-4.3.1.tar.gz
+sha256  64bdfe9dd6bfa64b492b21a45ad4bb36d67626a7f3b3ab2084a708864f129e84  mediastreamer-4.4.8.tar.gz
 sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index 982eadf099..5d66a09880 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEDIASTREAMER_VERSION = 4.3.1
+MEDIASTREAMER_VERSION = 4.4.8
 MEDIASTREAMER_SITE = \
 	https://gitlab.linphone.org/BC/public/mediastreamer2/-/archive/$(MEDIASTREAMER_VERSION)
 MEDIASTREAMER_LICENSE = GPL-3.0+
-- 
2.29.2
