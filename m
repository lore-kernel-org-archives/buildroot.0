From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Fri, 13 Nov 2015 19:06:04 +0900
Subject: [Buildroot] [PATCH] package/gauche: force to use intenal
	libatomic_ops
Message-ID: <201511131006.tADA64m9008638@ms-omx01.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Force to use internal libatomic_ops of gauche.

Fix:
http://autobuild.buildroot.org/results/a97/a979f6a58f0fbb1896830461d6c384f4a65c9429//

Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
---
diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
index b887c6a..95a448b 100644
--- a/package/gauche/gauche.mk
+++ b/package/gauche/gauche.mk
@@ -12,6 +12,7 @@ GAUCHE_LICENSE_FILES = COPYING
 GAUCHE_DEPENDENCIES = host-gauche
 
 HOST_GAUCHE_CONF_OPTS = --without-zlib
+GAUCHE_CONF_OPTS = --without-libatomic-ops
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 GAUCHE_CONF_OPTS += --with-zlib=$(STAGING_DIR)
============================================================
    Hiroshi Kawashima
