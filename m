From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 11 Mar 2018 14:42:30 +0100
Subject: [Buildroot] [PATCH 1/1] libmpdclient: fix static linking
Message-ID: <20180311134230.6626-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/45208e51814b777a5a133b0e345e800ee51d8a53

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmpdclient/libmpdclient.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
index 3ab8e9884c..a399516fe3 100644
--- a/package/libmpdclient/libmpdclient.mk
+++ b/package/libmpdclient/libmpdclient.mk
@@ -16,6 +16,7 @@ LIBMPDCLIENT_DEPENDENCIES = host-meson
 LIBMPDCLIENT_CONF_OPTS += \
 	--prefix=/usr \
 	--libdir=/usr/lib \
+	--default-library $(if $(BR2_STATIC_LIBS),static,shared) \
 	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
 	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf
 
-- 
2.14.1
