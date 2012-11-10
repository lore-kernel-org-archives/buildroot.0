From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Nov 2012 22:42:47 +0100
Subject: [Buildroot] [PATCH 10/11] libnetfilter_queue: does not build
	without IPv6 support
In-Reply-To: <cover.1352583641.git.thomas.petazzoni@free-electrons.com>
References: <cover.1352583641.git.thomas.petazzoni@free-electrons.com>
Message-ID: <729e8d4f5d8ca2d7d1821b514e30a175e6331562.1352583641.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following build failure:

extra/checksum.c:16:25: fatal error: netinet/ip6.h: No such file or directory
compilation terminated.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnetfilter_queue/Config.in |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libnetfilter_queue/Config.in b/package/libnetfilter_queue/Config.in
index d06aa77..d04853d 100644
--- a/package/libnetfilter_queue/Config.in
+++ b/package/libnetfilter_queue/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBNETFILTER_QUEUE
 	bool "libnetfilter_queue"
 	depends on BR2_LARGEFILE
+	depends on BR2_INET_IPV6
 	select BR2_PACKAGE_LIBNFNETLINK
 	select BR2_PACKAGE_LIBMNL
 	help
@@ -10,5 +11,5 @@ config BR2_PACKAGE_LIBNETFILTER_QUEUE
 
 	  http://www.netfilter.org/projects/libnetfilter_queue/
 
-comment "libnetfilter_queue requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+comment "libnetfilter_queue requires a toolchain with LARGEFILE and IPv6 support"
+	depends on !BR2_LARGEFILE && !BR2_INET_IPV6
-- 
1.7.9.5
