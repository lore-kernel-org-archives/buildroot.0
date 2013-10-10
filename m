From: Axel Lin <axel.lin@ingics.com>
Date: Thu, 10 Oct 2013 15:23:18 +0800
Subject: [Buildroot] [PATCH 1/2] protobuf: needs thread support
Message-ID: <1381389798.8952.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix:
http://autobuild.buildroot.net/results/086/08661b6bd6796c9126bcbad3245323160b182ac8/

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/protobuf/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

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
-- 
1.8.1.2
