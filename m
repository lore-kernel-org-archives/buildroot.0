From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 19:59:27 +0200
Subject: [Buildroot] [git commit] jack2: needs C++ support
Message-ID: <20140420180001.DEB339C910@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5035af0cbb6a1dcb1e9b443fbf601be4fad737f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/ede/ede17f2fdb9b5cd4b974ef820d95b0eba863c420/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jack2/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/jack2/Config.in b/package/jack2/Config.in
index 4d451d0..a1669ee 100644
--- a/package/jack2/Config.in
+++ b/package/jack2/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_JACK2
 	bool "jack2"
 	depends on BR2_LARGEFILE # libsndfile
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBSAMPLERATE
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_ALSA_LIB
@@ -18,5 +19,6 @@ config BR2_PACKAGE_JACK2
 
 	  http://jackaudio.org/
 
-comment "jack2 needs a toolchain w/ largefile and threads"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+comment "jack2 needs a toolchain w/ largefile, threads, C++"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP
