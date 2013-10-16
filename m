From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 16 Oct 2013 14:50:47 +0800
Subject: [Buildroot] [PATCH] zmqpp: Remove duplicated thread dependency for
	zmqpp client
Message-ID: <1381906247.31664.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_PACKAGE_ZMQPP_CLIENT depends on BR2_PACKAGE_ZMQPP which depends on
BR2_TOOLCHAIN_HAS_THREADS.
BR2_PACKAGE_ZMQPP_CLIENT is visible only when BR2_TOOLCHAIN_HAS_THREADS is
enabled, thus remove the duplicated dependency and comment for zmqpp client.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/zmqpp/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
index bbc4f95..bfbdf4b 100644
--- a/package/zmqpp/Config.in
+++ b/package/zmqpp/Config.in
@@ -22,12 +22,8 @@ comment "zmqpp needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
 config BR2_PACKAGE_ZMQPP_CLIENT
 	bool "zmqpp client"
 	depends on BR2_PACKAGE_ZMQPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	help
 	  Build and install the zmqpp client, a command line tool that can be
 	  used to listen or send to zeromq sockets.
-
-comment "zmqpp client needs a toolchain w/ threads"
-	depends on BR2_PACKAGE_ZMQPP && !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
