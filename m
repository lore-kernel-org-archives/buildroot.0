From: buildroot at heine.tech <buildroot@heine.tech>
Date: Tue, 27 Oct 2020 18:40:46 +0100
Subject: [Buildroot] [PATCH 3/3] package/grpc: raise (host) gcc dependency
 to 4.9
In-Reply-To: <20201027174046.17157-1-buildroot@heine.tech>
References: <20201027174046.17157-1-buildroot@heine.tech>
Message-ID: <20201027174046.17157-4-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michael Nosthoff <buildroot@heine.tech>

(host-)libabseil-cpp depends on gcc >= 4.9

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/grpc/Config.in | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/grpc/Config.in b/package/grpc/Config.in
index 0270b38c35..6151f4b3d1 100644
--- a/package/grpc/Config.in
+++ b/package/grpc/Config.in
@@ -3,7 +3,8 @@ config BR2_PACKAGE_GRPC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, re2
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf, re2
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # protobuf, re2, libabseil-cpp
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-libabseil-cpp
 	depends on !BR2_STATIC_LIBS # protobuf, libabseil-cpp
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
@@ -19,9 +20,10 @@ config BR2_PACKAGE_GRPC
 
 	  http://github.com/grpc/grpc
 
-comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
+comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.9"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
+		|| !BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-- 
2.25.1
