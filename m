From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Fri, 20 Nov 2015 16:29:27 +0100
Subject: [Buildroot] [PATCH 1/2] libnet: disable for musl toolchains
Message-ID: <1448033368-8081-1-git-send-email-joris.lijssens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
---
 package/libnet/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libnet/Config.in b/package/libnet/Config.in
index 7186972..8a88128 100644
--- a/package/libnet/Config.in
+++ b/package/libnet/Config.in
@@ -1,7 +1,12 @@
 config BR2_PACKAGE_LIBNET
 	bool "libnet"
+	# Build with musl fails due to header issues
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
 	  libnet provides a portable framework for low-level network
 	  packet construction.
 
 	  http://sourceforge.net/projects/libnet-dev
+
+comment "libnet needs a (e)glibc or uClibc toolchain"
+	depends on BR2_TOOLCHAIN_USES_MUSL
-- 
1.8.3.1
