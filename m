From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 16:33:59 +0200
Subject: [Buildroot] [git commit] pigpio: needs thread support
Message-ID: <20181011143308.736C782A4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43693328b6409fe9cf06c5db5f7a44bcb6a2c9aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/2f64c993db402decf92a5f8010033acdbc6b884f/

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pigpio/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/pigpio/Config.in b/package/pigpio/Config.in
index fee496b2ef..2180ab0de6 100644
--- a/package/pigpio/Config.in
+++ b/package/pigpio/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PIGPIO
 	bool "pigpio"
 	depends on BR2_aarch64 || BR2_arm
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	help
 	  Pigpio is a library for the Raspberry Pi which allows
@@ -8,6 +9,6 @@ config BR2_PACKAGE_PIGPIO
 
 	  http://abyz.me.uk/rpi/pigpio/
 
-comment "pigpio needs a toolchain w/ dynamic library"
+comment "pigpio needs a toolchain w/ threads, dynamic library"
 	depends on BR2_aarch64 || BR2_arm
-	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
