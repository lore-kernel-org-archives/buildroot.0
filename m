From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 21:52:12 +0100
Subject: [Buildroot] [git commit] shairport-sync: needs toolchain with NPTL
Message-ID: <20141030205218.D94BEB5764@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b42878a04746c8f17037922367f0cac47e3ee606
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also remove the comment attributing threads dependency to alsa-lib, since
shairport-sync itself uses pthreads.

Fixes:
http://autobuild.buildroot.net/results/58e/58eafd2499919a45bfb5a2becc233d3678deedde/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/shairport-sync/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
index ce31061..c1d81a7 100644
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
