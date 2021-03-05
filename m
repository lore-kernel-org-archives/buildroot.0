From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri,  5 Mar 2021 17:12:11 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/zeromq: disable package if
 binutils is affected from bug 21464
In-Reply-To: <20210305161211.4396-1-giulio.benetti@benettiengineering.com>
References: <20210305161211.4396-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210305161211.4396-4-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is affected from binutils bug 21464, since there is no
workaround, let's disable it.

Fixes:
http://autobuild.buildroot.net/results/ce351e0e97c2cacc17d4718d39941548c7558559

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/zeromq/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index cf5c644c39..f99adf7acc 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -1,10 +1,12 @@
 comment "zeromq needs a toolchain w/ C++, threads"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
 
 config BR2_PACKAGE_ZEROMQ
 	bool "zeromq"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
-- 
2.25.1
