From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jun 2018 21:54:43 +0200
Subject: [Buildroot] [git commit] gdb: ARC version is based on GDB 8.0,
 needs C++11 support
Message-ID: <20180625195229.C5ADA827F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cec133e873e991e26b7fa8bbeb7162c4433cadcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The special gdb version used for ARC is based on GDB 8.0, so it needs
C++11 support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index ae855a3673..5f5e402a0e 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -82,6 +82,7 @@ config BR2_PACKAGE_GDB_NEEDS_CXX11
 	default y if !BR2_PACKAGE_HOST_GDB
 	default y if BR2_GDB_VERSION_8_0
 	default y if BR2_GDB_VERSION_8_1
+	default y if BR2_arc
 
 # If cross-gdb is not enabled, the latest working version is chosen.
 config BR2_GDB_VERSION
