From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 27 Feb 2019 23:01:00 +0100
Subject: [Buildroot] [PATCH v1] zbar: needs c99 mode
Message-ID: <20190227220100.13536-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:

  bar/sqcode.c: In function 'sq_scan_shape':
  zbar/sqcode.c:171:5: error: 'for' loop initial declarations are only allowed in C99 or C11 mode
       for (int x = x0 - 1; x < x0 + width + 1; x++) {
       ^
  zbar/sqcode.c:171:5: note: use option -std=c99, -std=gnu99, -std=c11 or -std=gnu11 to compile your code

[1] http://autobuild.buildroot.net/results/7d544275756f655f9d42c05562aca653923155b1

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/zbar/zbar.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
index 6df069e001..c3f0797c55 100644
--- a/package/zbar/zbar.mk
+++ b/package/zbar/zbar.mk
@@ -13,6 +13,8 @@ ZBAR_AUTORECONF = YES
 ZBAR_DEPENDENCIES = libv4l jpeg
 # add host-gettext for AM_ICONV macro
 ZBAR_DEPENDENCIES += host-gettext
+# uses C99 features
+ZBAR_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 ZBAR_CONF_OPTS = \
 	--disable-doc \
 	--without-imagemagick \
-- 
2.20.1
