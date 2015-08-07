From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Aug 2015 11:47:02 +0200
Subject: [Buildroot] [git commit] lirc-tools: needs dlopen(),
	not available for static only builds
Message-ID: <20150807094730.1316F81EDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6289cb1db9a75dfe317b4d84fb246e4cfa8d4b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/87c/87cf6312bef189e4f3a49983bfc662d69afa05b4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lirc-tools/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/lirc-tools/Config.in b/package/lirc-tools/Config.in
index 8ce83a0..a0fbbb8 100644
--- a/package/lirc-tools/Config.in
+++ b/package/lirc-tools/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_LIRC_TOOLS
 	bool "lirc-tools"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# dlopen()
+	depends on !BR2_STATIC_LIBS
 	help
 	  LIRC is a package that supports receiving and sending IR
 	  signals of the most common IR remote controls. It contains a
@@ -15,6 +17,6 @@ config BR2_PACKAGE_LIRC_TOOLS
 
 	  http://www.lirc.org/
 
-comment "lirc-tools needs a toolchain w/ threads"
+comment "lirc-tools needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
