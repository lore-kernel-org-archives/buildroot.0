From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 24 Mar 2020 22:00:40 +0100
Subject: [Buildroot] [PATCH 1/2] package/libmicrohttpd: fix pthread detection
Message-ID: <20200324210041.628200-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/ceb802eea0fee5812efd717ae4cdbd9673d9507e/

Quoted from config.log:
conftest.c:32:26: error: #error "_REENTRANT must be defined"

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libmicrohttpd/libmicrohttpd.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index f47d7ec214..2f5c28cd58 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -22,4 +22,7 @@ LIBMICROHTTPD_LICENSE = LGPL-2.1+ or eCos
 LIBMICROHTTPD_CONF_OPTS += --disable-https
 endif
 
+# fixes pthreads detection
+LIBMICROHTTPD_CFLAGS += -D_REENTRANT
+
 $(eval $(autotools-package))
-- 
2.25.0
