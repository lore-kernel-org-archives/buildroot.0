From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Aug 2014 10:57:20 +0200
Subject: [Buildroot] [git commit] package/jack2: use the new
	ARCH_HAS_ATOMICS as dependency
Message-ID: <20140818090640.06AA49D4A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f346af286821070214d94a9cf17f8f846ce7f276
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jack2/Config.in |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/jack2/Config.in b/package/jack2/Config.in
index 82143c7..afc723c 100644
--- a/package/jack2/Config.in
+++ b/package/jack2/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_JACK2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
+	depends on BR2_ARCH_HAS_ATOMICS
 	select BR2_PACKAGE_LIBSAMPLERATE
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_ALSA_LIB
@@ -21,7 +21,8 @@ config BR2_PACKAGE_JACK2
 
 	  http://jackaudio.org/
 
-comment "jack2 needs a toolchain w/ largefile, threads, C++, atomic intrinsics"
+comment "jack2 needs a toolchain w/ largefile, threads, C++"
 	depends on BR2_USE_MMU
+	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
+		!BR2_INSTALL_LIBSTDCPP
