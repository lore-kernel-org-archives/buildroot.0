From: Tobias Klauser <tklauser@distanz.ch>
Date: Mon, 14 Nov 2016 12:29:48 +0100
Subject: [Buildroot] [PATCH 2/2] package/netsniff-ng: allow to build with
	musl
In-Reply-To: <20161114112948.13292-1-tklauser@distanz.ch>
References: <20161114112948.13292-1-tklauser@distanz.ch>
Message-ID: <20161114112948.13292-3-tklauser@distanz.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

netsniff-ng allows build with musl since version 0.5.8. With libnet now
being able to build with musl, let's enable musl for netsniff-ng as
well.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 package/netsniff-ng/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
index e52bb25f0acd..dca016469736 100644
--- a/package/netsniff-ng/Config.in
+++ b/package/netsniff-ng/Config.in
@@ -7,8 +7,7 @@ config BR2_PACKAGE_NETSNIFF_NG
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_LIBNET
 	# Build with uClibc fails due to missing ceill()
-	# Build with musl fails due to various header issues
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-- 
2.11.0.rc0.7.gbe5a750
