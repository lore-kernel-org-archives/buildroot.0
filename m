From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 May 2017 11:37:03 +0200
Subject: [Buildroot] [git commit] package/j*/Config.in: fix ordering of
	statements
Message-ID: <20170501093829.353DB82753@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b206a2733bb3759337e41acd24778460e7ab42df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files for packages starting with
the letter j in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/janus-gateway/Config.in | 8 ++++----
 package/joe/Config.in           | 2 +-
 package/jsoncpp/Config.in       | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 5c7b633..e07b4ad 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -1,14 +1,14 @@
 menuconfig BR2_PACKAGE_JANUS_GATEWAY
 	bool "janus-gateway"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_WCHAR # libnice -> libglib2
+	depends on BR2_USE_MMU # libnice
+	depends on !BR2_STATIC_LIBS # dlopen
 	select BR2_PACKAGE_JANSSON
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBNICE
 	select BR2_PACKAGE_LIBSRTP
 	select BR2_PACKAGE_OPENSSL
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	depends on BR2_USE_WCHAR # libnice -> libglib2
-	depends on BR2_USE_MMU # libnice
-	depends on !BR2_STATIC_LIBS # dlopen
 	help
 	  Janus is an open source, general purpose, WebRTC gateway
 	  designed and developed by Meetecho.
diff --git a/package/joe/Config.in b/package/joe/Config.in
index eabfae7..f335e05 100644
--- a/package/joe/Config.in
+++ b/package/joe/Config.in
@@ -13,8 +13,8 @@ config BR2_PACKAGE_JOE
 
 config BR2_PACKAGE_JOE_FULL
 	bool "full install of rc and syntax highlighting files"
-	depends on BR2_PACKAGE_JOE
 	default y
+	depends on BR2_PACKAGE_JOE
 	help
 	  Install all rc and syntax highlighting files. Without this option
 	  only the joe binary is installed, which contains a default
diff --git a/package/jsoncpp/Config.in b/package/jsoncpp/Config.in
index 83118c4..a6c6b91 100644
--- a/package/jsoncpp/Config.in
+++ b/package/jsoncpp/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_JSONCPP
+	bool "jsoncpp"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	depends on BR2_INSTALL_LIBSTDCPP
-	bool "jsoncpp"
 	help
 	  JsonCpp is a C++ library that allows manipulating JSON
 	  values, including serialization and deserialization to and
