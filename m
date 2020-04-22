From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 22 Apr 2020 10:01:08 -0700
Subject: [Buildroot] [PATCH 1/1] package/openjdk: Remove sparc support
Message-ID: <20200422170108.3161301-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Sparc support is deprecated and may be removed in future releases. There are
two choices to fix this issue:

1) Set --enable-deprecated-ports=yes in the CONF_OPTS to supress the error.
2) Remove support for Sparc.

Because this port is deprecated, it's safer to remove support alltogether.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/openjdk/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 61294ec49f..df769bbb35 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -11,7 +11,6 @@ config BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
 	default y if BR2_m68k
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	default y if BR2_sh
-	default y if BR2_sparc || BR2_sparc64
 
 config BR2_PACKAGE_OPENJDK
 	bool "openjdk"
-- 
2.25.3
