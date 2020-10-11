From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Oct 2020 22:31:03 +0200
Subject: [Buildroot] [git commit] package/zlib-ng: disable tests
Message-ID: <20201011202000.3D09681535@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=005a11344bd0000aac762c6f9f9295a6eb304df1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tests are enabled by default and can be disabled since
https://github.com/zlib-ng/zlib-ng/commit/b0730d030a9ce5c53faa88bd8259c9afccce6881

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zlib-ng/zlib-ng.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index 3b27574a79..1cb00d075b 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -12,7 +12,11 @@ ZLIB_NG_INSTALL_STAGING = YES
 ZLIB_NG_PROVIDES = zlib
 
 # Build with zlib compatible API, gzFile support and optimizations on
-ZLIB_NG_CONF_OPTS += -DZLIB_COMPAT=1 -DWITH_GZFILEOP=1 -DWITH_OPTIM=1
+ZLIB_NG_CONF_OPTS += \
+	-DWITH_GZFILEOP=1 \
+	-DWITH_OPTIM=1 \
+	-DZLIB_COMPAT=1 \
+	-DZLIB_ENABLE_TESTS=OFF
 
 # Enable NEON and ACLE on ARM
 ifeq ($(BR2_arm),y)
