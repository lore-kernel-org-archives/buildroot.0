From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 28 Feb 2020 18:58:14 +0100
Subject: [Buildroot] [PATCH 2/2] package/protobuf: disable package if
 binutils is affected from bug 21464
In-Reply-To: <20200228175814.128730-1-giulio.benetti@benettiengineering.com>
References: <20200228175814.128730-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200228175814.128730-2-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is affected from binutils bug 21464, since there is no
workaround, let's disable it.

Fixes:
http://autobuild.buildroot.net/results/908/9084cd777aefe0fa8235514c33767d8640ad7a5b/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/protobuf/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index 46c820b9cf..30050950aa 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -24,6 +24,7 @@ config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	default y if BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
 
 config BR2_PACKAGE_PROTOBUF
 	bool "protobuf"
-- 
2.20.1
