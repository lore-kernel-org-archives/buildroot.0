From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 29 Aug 2019 00:36:45 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_91591
Message-ID: <20190828223646.61333-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GCC fails building the dawgdic package for the Arc architecture:

http://autobuild.buildroot.org/results/64706f96db793777de9d3ec63b0a47d776cf33fd/

The gcc bug was originally reported:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91591

This gcc bug no longer appears with gcc 9.x

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 toolchain/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index bd2c547ff1..d2c104c576 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -159,6 +159,12 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_90620
 	bool
 	default y if BR2_microblaze
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91591
+config BR2_TOOLCHAIN_HAS_GCC_BUG_91591
+	bool
+	default y if BR2_arc
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
-- 
2.17.1
