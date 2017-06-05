From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  5 Jun 2017 18:15:34 +0200
Subject: [Buildroot] [PATCH] package/lcdproc: add libpng optional dependency
Message-ID: <20170605161534.20677-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/b68/b68f54404a7d412d639ebb6d052412eea6ee3bf1

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/lcdproc/lcdproc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
index d86eb33..51bc7b9 100644
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -18,4 +18,11 @@ endif
 
 LCDPROC_DEPENDENCIES = freetype ncurses zlib
 
+ifeq($(BR2_PACKAGE_LIBPNG),y)
+LCDPROC_DEPENDENCIES += libpng
+LCDPROC_CONF_OPTS += --enable-libpng
+else
+LCDPROC_CONF_OPTS += --disable-libpng
+endif
+
 $(eval $(autotools-package))
-- 
2.9.4
