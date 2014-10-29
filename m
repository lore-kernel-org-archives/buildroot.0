From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 29 Oct 2014 15:33:40 +0200
Subject: [Buildroot] [PATCH] shairport-sync: needs toolchain with NPTL
Message-ID: <4f23aeb270143c08f76b81f8ff30c76ea8407a4b.1414589620.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove the comment attributing threads dependency to alsa-lib, since
shairport-sync itself uses pthreads.

Fixes:
http://autobuild.buildroot.net/results/58e/58eafd2499919a45bfb5a2becc233d3678deedde/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/shairport-sync/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
index ce3106186fb3..c1d81a7e2a54 100644
--- a/package/shairport-sync/Config.in
+++ b/package/shairport-sync/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SHAIRPORT_SYNC
 	bool "shairport-sync"
 	depends on BR2_USE_MMU # libdaemon
-	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa_lib
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_MIXER
 	select BR2_PACKAGE_LIBDAEMON
@@ -33,6 +33,6 @@ config BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR
 
 endif
 
-comment "shairport-sync needs a toolchain w/ threads"
+comment "shairport-sync needs a toolchain w/ NPTL"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
-- 
2.1.1
