From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 10 Mar 2021 10:14:48 +0100
Subject: [Buildroot] [PATCH v2 1/6] package/libtheora: disable package if
 binutils is affected from bug 21464
In-Reply-To: <20210310091453.23611-1-giulio.benetti@benettiengineering.com>
References: <20210310091453.23611-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210310091453.23611-2-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is affected from binutils bug 21464, since there is no
workaround, let's disable it.

Fixes:
http://autobuild.buildroot.net/results/6c8/6c87be004adf03955c832be72c0c59749f311f71/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libtheora/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libtheora/Config.in b/package/libtheora/Config.in
index eee9e9b1db..18a450ce99 100644
--- a/package/libtheora/Config.in
+++ b/package/libtheora/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBTHEORA
 	bool "libtheora"
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_LIBVORBIS
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
 	help
 	  A library for the free and open video compression format
 	  "Theora" from the Xiph.org Foundation.
-- 
2.25.1
