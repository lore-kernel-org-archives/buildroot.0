From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 May 2013 21:00:40 +0200
Subject: [Buildroot] [git commit] udpcast: needs threads support in toolchain
Message-ID: <20130526194928.1BC139A58A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0170b420c4d72daf6dc08b49b856bdb3e88e4a2a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/udpcast/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/udpcast/Config.in b/package/udpcast/Config.in
index d7ccfb4..cb817a9 100644
--- a/package/udpcast/Config.in
+++ b/package/udpcast/Config.in
@@ -1,14 +1,15 @@
 config BR2_PACKAGE_UDPCAST
 	bool "udpcast"
 	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  A multicast protocol implementation which happens to
 	  be very handy for imaging drives over the network.
 
 	  http://www.udpcast.linux.lu/
 
-comment "udpcast requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+comment "udpcast requires a toolchain with LARGEFILE and threads support"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 
 menu "udpcast tools selection"
 depends on BR2_PACKAGE_UDPCAST
