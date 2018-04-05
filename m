From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  5 Apr 2018 21:50:35 +0200
Subject: [Buildroot] [PATCH 21/23] p7zip: remove Blackfin patch
In-Reply-To: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
References: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180405195037.32641-22-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/p7zip/0001-bfin.patch | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 package/p7zip/0001-bfin.patch

diff --git a/package/p7zip/0001-bfin.patch b/package/p7zip/0001-bfin.patch
deleted file mode 100644
index 76addb652f..0000000000
--- a/package/p7zip/0001-bfin.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Add support for blackfin arch.
-
-Fixes compilation error:
-../../../../CPP/myWindows/mySplitCommandLine.cpp:99:8: error: #error ENDIANNESS
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-(Patch sent upstream: https://sourceforge.net/p/p7zip/patches/33/
-
-diff -uNr p7zip_15.14.1.org/C/CpuArch.h p7zip_15.14.1/C/CpuArch.h
---- p7zip_15.14.1.org/C/CpuArch.h	2016-02-17 07:27:16.000000000 +0100
-+++ p7zip_15.14.1/C/CpuArch.h	2016-06-08 19:47:49.000000000 +0200
-@@ -66,6 +66,7 @@
-     || defined(__MIPSEL__) \
-     || defined(__MIPSEL) \
-     || defined(_MIPSEL) \
-+    || defined(__BFIN__) \
-     || (defined(__BYTE_ORDER__) && (__BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__))
-   #define MY_CPU_LE
- #endif
-- 
2.14.3
