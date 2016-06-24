From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 23 Jun 2016 22:43:20 -0400
Subject: [Buildroot] [PATCH 5/6] libselinux: bump to version 2.5
In-Reply-To: <1466736201-17310-1-git-send-email-Aduskett@gmail.com>
References: <1466736201-17310-1-git-send-email-Aduskett@gmail.com>
Message-ID: <1466736201-17310-5-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libselinux/Config.in       | 9 +++++++--
 package/libselinux/libselinux.hash | 2 +-
 package/libselinux/libselinux.mk   | 4 ++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
index bc8298d..af4d759 100644
--- a/package/libselinux/Config.in
+++ b/package/libselinux/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_LIBSELINUX
 	depends on !BR2_STATIC_LIBS
 	# Toolchain issue: "fixup not contained within frag"
 	depends on !BR2_arc
+   # Newer versions of libselinux won't compile against glibc 2.22.
+	depends on !BR2_GLIBC_VERSION_2_22
 	help
 	  libselinux is the runtime SELinux library that provides
 	  interfaces (e.g. library functions for the SELinux kernel
@@ -17,6 +19,9 @@ config BR2_PACKAGE_LIBSELINUX
 
 	  http://selinuxproject.org/page/Main_Page
 
-comment "libselinux needs a toolchain w/ threads, dynamic library"
+comment "libselinux needs a toolchain w/ threads, dynamic library, glibc version != 2.22"
 	depends on !BR2_arc
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || BR2_GLIBC_VERSION_2_22
+
+
+
diff --git a/package/libselinux/libselinux.hash b/package/libselinux/libselinux.hash
index 861c327..a4c3440 100644
--- a/package/libselinux/libselinux.hash
+++ b/package/libselinux/libselinux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 57aad47c06b7ec18a76e8d9870539277a84cb40109cfdcf70ed3260bdb04447a libselinux-2.1.13.tar.gz
+sha256 94c9e97706280bedcc288f784f67f2b9d3d6136c192b2c9f812115edba58514f libselinux-2.5.tar.gz
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index d4b96c4..8383831 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSELINUX_VERSION = 2.1.13
-LIBSELINUX_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
+LIBSELINUX_VERSION = 2.5
+LIBSELINUX_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20160223
 LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE
 
-- 
2.7.4
