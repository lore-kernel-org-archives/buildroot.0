From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 16:24:17 +0200
Subject: [Buildroot] [git commit] can-utils: drop NPTL dependency
Message-ID: <20180923142403.72750888DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5956476adc14790cade7263e585a0ebc9b23182c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The latest uClibc-ng version (1.0.30) provides clock_nanosleep() even
for non NPTL configurations.

Don't keep a dependency on threads as can-utils doesn't need it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/can-utils/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/can-utils/Config.in b/package/can-utils/Config.in
index 1800eca042..da56378866 100644
--- a/package/can-utils/Config.in
+++ b/package/can-utils/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_CAN_UTILS
 	bool "can-utils"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
 	depends on !BR2_TOOLCHAIN_USES_MUSL # error()
 	help
 	  SocketCAN is a set of open source CAN drivers and a
@@ -10,6 +9,6 @@ config BR2_PACKAGE_CAN_UTILS
 
 	  https://github.com/linux-can/can-utils
 
-comment "can-utils needs a glibc or uClibc toolchain w/ NPTL"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_TOOLCHAIN_USES_MUSL
+comment "can-utils needs a glibc or uClibc toolchain"
+	depends on BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_MMU
