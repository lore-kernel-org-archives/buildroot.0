From: Alex Suykov <alex.suykov@gmail.com>
Date: Tue, 20 Oct 2015 16:20:07 +0300
Subject: [Buildroot] [PATCH] gdb: enable host-gdb on aarch64
Message-ID: <20151020132007.GA1289@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gdb has full support for aarch64 since version 7.6,
current minimum is 7.7.1.
Target build was re-enabled over a year ago, but host-gdb was not.

Related commits:
0e49733b306b353aad3a29a2c7a6faf25841ef0b gdb disabled for aarch64
4372449a4f8e16f763c7d5a0c125ca015a7cbef6 target-gdb re-enabled

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/gdb/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index b66e742..b65dd52 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -4,7 +4,7 @@ config BR2_PACKAGE_HOST_GDB
 	# allow to build a cross-gdb, as the one of the external
 	# toolchain should be used.
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
-	depends on !BR2_aarch64 && !BR2_nios2
+	depends on !BR2_nios2
 	help
 	  Build a cross gdb that runs on the host machine and debugs
 	  programs running on the target. It requires 'gdbserver'
-- 
2.0.3
