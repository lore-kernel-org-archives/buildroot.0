From: Grzegorz Blach <grzegorz@blach.pl>
Date: Thu, 11 Oct 2018 14:36:41 +0200
Subject: [Buildroot] [PATCH 1/1] pigpio: depends on BR2_TOOLCHAIN_HAS_THREADS
Message-ID: <20181011123641.10103-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

piogpio needs pthreads

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
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
-- 
2.17.2
