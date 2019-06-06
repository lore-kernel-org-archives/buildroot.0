From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 23:57:49 +0200
Subject: [Buildroot] [git commit] package/gdb: switch to 8.2 as the default
 version
Message-ID: <20190606220726.AB50F810D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f776f4bf915c6fc15687baaa34310ce2a0f98574
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

8.3 is around, 8.2 has already seen a point release, so it's time to
make 8.2 the default version for gdb.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[Peter: also update BR2_GDB_VERSION logic]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index f9a67d18dd..214c79f293 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -46,7 +46,7 @@ config BR2_PACKAGE_HOST_GDB_SIM
 
 choice
 	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_8_1
+	default BR2_GDB_VERSION_8_2
 	depends on !BR2_arc
 	depends on !BR2_csky
 	help
@@ -105,7 +105,7 @@ config BR2_GDB_VERSION
 	default "4ecb98fbc2f94dbe01b69384afbc515107de73df" if BR2_csky
 	default "7.12.1"   if BR2_GDB_VERSION_7_12
 	default "8.0.1"    if BR2_GDB_VERSION_8_0
-	default "8.1.1"    if BR2_GDB_VERSION_8_1 || !BR2_PACKAGE_HOST_GDB
-	default "8.2.1"    if BR2_GDB_VERSION_8_2
+	default "8.1.1"    if BR2_GDB_VERSION_8_1
+	default "8.2.1"    if BR2_GDB_VERSION_8_2 || !BR2_PACKAGE_HOST_GDB
 	default "8.3"	   if BR2_GDB_VERSION_8_3
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
