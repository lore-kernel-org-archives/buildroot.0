From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 17:52:11 +0100
Subject: [Buildroot] [git commit] micropython: needs dynamic library
Message-ID: <20151004165241.4A33280DAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd4c691bd91ad05e6af5a79cb732e62bba342b2f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

   http://autobuild.buildroot.org/results/06f/06fc79dad3d4c0c5f997f4c2e4b52014727764ac/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/micropython/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/micropython/Config.in b/package/micropython/Config.in
index dae41b7..ed65d6a 100644
--- a/package/micropython/Config.in
+++ b/package/micropython/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_MICROPYTHON
 	bool "micropython"
 	select BR2_PACKAGE_LIBFFI
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
 	# libffi doesn't provide the closure implementation on Blackfin
 	depends on !BR2_bfin
 	help
@@ -10,6 +11,6 @@ config BR2_PACKAGE_MICROPYTHON
 
 	  http://micropython.org
 
-comment "micropython needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "micropython needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 	depends on !BR2_bfin
