From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 11 Oct 2020 21:43:57 +0200
Subject: [Buildroot] [PATCH 2/2] package/zlib-ng: disable tests
In-Reply-To: <20201011194357.1923003-1-fontaine.fabrice@gmail.com>
References: <20201011194357.1923003-1-fontaine.fabrice@gmail.com>
Message-ID: <20201011194357.1923003-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tests are enabled by default and can be disabled since
https://github.com/zlib-ng/zlib-ng/commit/b0730d030a9ce5c53faa88bd8259c9afccce6881

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.28.0
