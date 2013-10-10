From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Oct 2013 22:41:27 +0200
Subject: [Buildroot] [git commit] protobuf: needs thread support
Message-ID: <20131010204222.ADDA99B98A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=020775b33f87fbda4e805e3f8740d312c9fc9bf5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix:
http://autobuild.buildroot.net/results/086/08661b6bd6796c9126bcbad3245323160b182ac8/

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/protobuf-c/Config.in |    5 +++--
 package/protobuf/Config.in   |    5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/protobuf-c/Config.in b/package/protobuf-c/Config.in
index 9aff6e2..17cc8f1 100644
--- a/package/protobuf-c/Config.in
+++ b/package/protobuf-c/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PROTOBUF_C
 	bool "protobuf-c"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
 	select BR2_PACKAGE_PROTOBUF
 	help
 	  Code generator and runtime libraries to use Protocol Buffers
@@ -8,5 +9,5 @@ config BR2_PACKAGE_PROTOBUF_C
 
 	  http://code.google.com/p/protobuf-c/
 
-comment "protobuf-c requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "protobuf-c requires a toolchain with C++ and thread support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index b044ef0..92e85ba 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -1,11 +1,12 @@
 config BR2_PACKAGE_PROTOBUF
 	bool "protobuf"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Protocol buffers are Google's language-neutral, platform-neutral,
 	  extensible mechanism for serializing structured data.
 
 	  http://code.google.com/p/protobuf/
 
-comment "protobuf requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "protobuf requires a toolchain with C++ and thread support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
