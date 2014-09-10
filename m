From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Sep 2014 09:37:31 +0200
Subject: [Buildroot] [git commit] snowball-hdmiservice: wants to build a .so,
	needs !BR2_PREFER_STATIC_LIB
Message-ID: <20140910074206.D260D9D645@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=028e97f2133d41c87ced10391f318db55c71c3b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/47f/47f52078c52bd1270e9d7ca795a4b3b21737b39c/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snowball-hdmiservice/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/snowball-hdmiservice/Config.in b/package/snowball-hdmiservice/Config.in
index a22797f..f43685f 100644
--- a/package/snowball-hdmiservice/Config.in
+++ b/package/snowball-hdmiservice/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SNOWBALL_HDMISERVICE
 	bool "snowball-hdmiservice"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  HDMI userspace control daemon
 
@@ -8,3 +9,6 @@ config BR2_PACKAGE_SNOWBALL_HDMISERVICE
 	  snowball board
 
 	  http://www.igloocommunity.org
+
+comment "snowball-hdmiservice needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
