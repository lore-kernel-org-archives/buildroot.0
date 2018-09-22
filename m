From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Sep 2018 18:45:04 +0200
Subject: [Buildroot] [git commit] blktrace: drop NPTL dependency
Message-ID: <20180922164512.2D7DB8880D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=007b94d064493822edc1078bfed90827d05c2c47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The latest uClibc-ng version (1.0.30) provides clock_nanosleep() even
for non NPTL configurations.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/blktrace/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/blktrace/Config.in b/package/blktrace/Config.in
index d40c968243..951caed531 100644
--- a/package/blktrace/Config.in
+++ b/package/blktrace/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_BLKTRACE
 	bool "blktrace"
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # system()
 	select BR2_PACKAGE_LIBAIO
 	help
@@ -10,6 +10,6 @@ config BR2_PACKAGE_BLKTRACE
 
 	  http://git.kernel.dk/?p=blktrace.git;a=summary
 
-comment "blktrace needs a toolchain w/ NPTL"
+comment "blktrace needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
