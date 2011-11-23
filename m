From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Nov 2011 23:32:00 +0100
Subject: [Buildroot] [git commit] gdb: fix version logic for bfin
Message-ID: <20111123224131.9E56E8F665@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9985f5d5fb10d3441479bc2b89dfec862fe1d85
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GDB should default to 6.6 on bfin, not on !bfin.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gdb/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index 8a02255..2a2844a 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -28,7 +28,7 @@ config BR2_PACKAGE_GDB_HOST
 
 choice
 	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_6_6 if !BR2_bfin
+	default BR2_GDB_VERSION_6_6 if BR2_bfin
 	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32
 	default BR2_GDB_VERSION_7_3
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_GDB_SERVER || BR2_PACKAGE_GDB_HOST
