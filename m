From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Feb 2014 21:48:31 +0100
Subject: [Buildroot] [git commit] gdb: correct version selection on
	arc/microblaze if host version isn't enabled
Message-ID: <20140225205032.6AD719BA89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bd7b402fb195e22dc6b375f764ea5d2dd09d4e5e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/858/8580840f6e41f198d2cfc0609e14765dbc2e7322/

kconfig uses the first 'default ... if' line that matches, so ensure the
arch specific ones come before the generic 7.5.1 default, otherwise
arc/microblaze ends up with 7.5.1 instead of their custom version.
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in.host |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 8936dcb..7082d1c 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -51,7 +51,7 @@ config BR2_GDB_VERSION
 	                      (!BR2_PACKAGE_HOST_GDB && BR2_bfin)
 	default "6.7.1-avr32-2.1.5" if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 || \
                                    (!BR2_PACKAGE_HOST_GDB && BR2_avr32)
-	default "7.4.1"    if BR2_GDB_VERSION_7_4
-	default "7.5.1"    if BR2_GDB_VERSION_7_5 || !BR2_PACKAGE_HOST_GDB
 	default "f25a1952afd054205f9471e449c1f7ca5b271b7c" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
+	default "7.4.1"    if BR2_GDB_VERSION_7_4
+	default "7.5.1"    if BR2_GDB_VERSION_7_5 || !BR2_PACKAGE_HOST_GDB
