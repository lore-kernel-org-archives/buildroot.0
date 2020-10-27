From: buildroot at heine.tech <buildroot@heine.tech>
Date: Tue, 27 Oct 2020 18:40:45 +0100
Subject: [Buildroot] [PATCH 2/3] package/libabseil-cpp: depend on gcc >= 4.9
In-Reply-To: <20201027174046.17157-1-buildroot@heine.tech>
References: <20201027174046.17157-1-buildroot@heine.tech>
Message-ID: <20201027174046.17157-3-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michael Nosthoff <buildroot@heine.tech>

abseil depends on gcc >= 4.9

https://abseil.io/docs/cpp/platforms/platforms#linux

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/libabseil-cpp/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
index 8018e7b264..222e3a092a 100644
--- a/package/libabseil-cpp/Config.in
+++ b/package/libabseil-cpp/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 config BR2_PACKAGE_LIBABSEIL_CPP
 	bool "libabseil-cpp"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # uses dlfcn.h
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
@@ -26,7 +27,7 @@ config BR2_PACKAGE_LIBABSEIL_CPP
 
 	  https://github.com/abseil/abseil-cpp
 
-comment "libabseil-cpp needs a toolchain w/ C++, threads, dynamic library"
+comment "libabseil-cpp needs a toolchain w/ gcc >= 4.9, C++, threads, dynamic library"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.25.1
