From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jul 2018 23:46:07 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] gdb: ARC version is based
 on GDB 8.0, needs C++11 support
Message-ID: <20180718214415.8C80088D3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e950431cdb89d476dd07e55d4f2ada8222882fcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

The special gdb version used for ARC is based on GDB 8.0, so it needs
C++11 support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cec133e873e991e26b7fa8bbeb7162c4433cadcf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 7490810d21..1769c271fc 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -79,6 +79,7 @@ endif
 config BR2_PACKAGE_GDB_NEEDS_CXX11
 	bool
 	default y if BR2_GDB_VERSION_8_0
+	default y if BR2_arc
 
 # If cross-gdb is not enabled, the latest working version is chosen.
 config BR2_GDB_VERSION
