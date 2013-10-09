From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Oct 2013 17:25:42 -0300
Subject: [Buildroot] [PATCH 1/7] udpcast: needs mmu
Message-ID: <1381350348-25751-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/udpcast/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/udpcast/Config.in b/package/udpcast/Config.in
index cb817a9..cae27bd 100644
--- a/package/udpcast/Config.in
+++ b/package/udpcast/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_UDPCAST
 	bool "udpcast"
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	help
 	  A multicast protocol implementation which happens to
 	  be very handy for imaging drives over the network.
-- 
1.8.1.5
