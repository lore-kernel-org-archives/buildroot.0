From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 21:53:14 +0200
Subject: [Buildroot] [git commit] package/grpc: bump version to 1.32.0
Message-ID: <20200919194420.79743826D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31fca9592d298e6e406a94035fe3a65591675358
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- order dependencies alphabetically
- update hash
- alter patch offsets

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/grpc/0001-target-build-using-host-plugin.patch         |  4 ++--
 ...-Properly-detect-the-availability-of-pthread_setname_.patch |  4 ++--
 package/grpc/grpc.hash                                         |  2 +-
 package/grpc/grpc.mk                                           | 10 +++++-----
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/grpc/0001-target-build-using-host-plugin.patch b/package/grpc/0001-target-build-using-host-plugin.patch
index 5b3c6a6fae..c6de0c1831 100644
--- a/package/grpc/0001-target-build-using-host-plugin.patch
+++ b/package/grpc/0001-target-build-using-host-plugin.patch
@@ -20,7 +20,7 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index be695c2..45c2fcb 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -11043,6 +11043,18 @@ target_link_libraries(grpc_cli
+@@ -11199,6 +11199,18 @@ target_link_libraries(grpc_cli
  endif()
  if(gRPC_BUILD_CODEGEN AND gRPC_BUILD_GRPC_CPP_PLUGIN)
  
@@ -39,7 +39,7 @@ index be695c2..45c2fcb 100644
  add_executable(grpc_cpp_plugin
    src/compiler/cpp_plugin.cc
  )
-@@ -11077,6 +11089,7 @@ if(gRPC_INSTALL)
+@@ -11233,6 +11245,7 @@ if(gRPC_INSTALL)
      ARCHIVE DESTINATION ${gRPC_INSTALL_LIBDIR}
    )
  endif()
diff --git a/package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch b/package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch
index c8b1dc8e73..32493ac1a0 100644
--- a/package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch
+++ b/package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch
@@ -20,7 +20,7 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index 45c2fcb..0b2be4f 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -180,6 +180,12 @@ if (NOT DEFINED CMAKE_POSITION_INDEPENDENT_CODE)
+@@ -208,6 +208,12 @@ if (NOT DEFINED CMAKE_POSITION_INDEPENDENT_CODE)
  endif()
  list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules")
  
@@ -37,7 +37,7 @@ diff --git a/include/grpc/impl/codegen/port_platform.h b/include/grpc/impl/codeg
 index 4f213ff..55ecd9d 100644
 --- a/include/grpc/impl/codegen/port_platform.h
 +++ b/include/grpc/impl/codegen/port_platform.h
-@@ -163,7 +163,9 @@
+@@ -168,7 +168,9 @@
  #endif /* _LP64 */
  #ifdef __GLIBC__
  #define GPR_POSIX_CRASH_HANDLER 1
diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 20368068d9..3a2dbe2d8a 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1236514199d3deb111a6dd7f6092f67617cd2b147f7eda7adbafccea95de7381  grpc-1.31.0.tar.gz
+sha256  f880ebeb2ccf0e47721526c10dd97469200e40b5f101a0d9774eb69efa0bd07a  grpc-1.32.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 613f45dacc..a6c1490fac 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.31.0
+GRPC_VERSION = 1.32.0
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0
 GRPC_LICENSE_FILES = LICENSE
@@ -12,7 +12,7 @@ GRPC_LICENSE_FILES = LICENSE
 GRPC_INSTALL_STAGING = YES
 
 # Need to use host grpc_cpp_plugin during cross compilation.
-GRPC_DEPENDENCIES = c-ares host-grpc openssl protobuf re2 zlib libabseil-cpp
+GRPC_DEPENDENCIES = c-ares host-grpc libabseil-cpp openssl protobuf re2 zlib
 HOST_GRPC_DEPENDENCIES = host-c-ares host-libabseil-cpp host-openssl host-protobuf \
 	host-re2 host-zlib
 
@@ -21,13 +21,13 @@ HOST_GRPC_DEPENDENCIES = host-c-ares host-libabseil-cpp host-openssl host-protob
 # which doesn't do this.  These CARES settings trick the gRPC cmake code into
 # not looking for c-ares at all and yet still linking with the library.
 GRPC_CONF_OPTS = \
+	-DgRPC_ABSL_PROVIDER=package \
 	-D_gRPC_CARES_LIBRARIES=cares \
 	-DgRPC_CARES_PROVIDER=none \
 	-DgRPC_PROTOBUF_PROVIDER=package \
 	-DgRPC_RE2_PROVIDER=package \
 	-DgRPC_SSL_PROVIDER=package \
 	-DgRPC_ZLIB_PROVIDER=package \
-	-DgRPC_ABSL_PROVIDER=package \
 	-DgRPC_NATIVE_CPP_PLUGIN=$(HOST_DIR)/bin/grpc_cpp_plugin
 
 # grpc can use __atomic builtins, so we need to link with
@@ -64,13 +64,13 @@ GRPC_CONF_OPTS += \
 	-DCMAKE_CXX_FLAGS="$(GRPC_CXXFLAGS)"
 
 HOST_GRPC_CONF_OPTS = \
+	-DgRPC_ABSL_PROVIDER=package \
 	-D_gRPC_CARES_LIBRARIES=cares \
 	-DgRPC_CARES_PROVIDER=none \
 	-DgRPC_PROTOBUF_PROVIDER=package \
 	-DgRPC_RE2_PROVIDER=package \
 	-DgRPC_SSL_PROVIDER=package \
-	-DgRPC_ZLIB_PROVIDER=package \
-	-DgRPC_ABSL_PROVIDER=package
+	-DgRPC_ZLIB_PROVIDER=package
 
 # With gcc 4.8 (at least on ubuntu) there is a bug in LTO which breaks
 # the linkage of the grpc_cpp_plugin with libprotobuf and pthread. This
