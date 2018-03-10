From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Mar 2018 22:45:34 +0100
Subject: [Buildroot] [PATCH v4,1/1] libmpdclient: fix install
Message-ID: <20180310214534.13121-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, meson adds the build machine architecture for installation,
see: https://github.com/mesonbuild/meson/issues/2535
Use --libdir to override this default behavior

Fixes:
 - http://autobuild.buildroot.net/results/aec/aec9f3de545a832b66cd00c217fbaa99246e1715
 - http://autobuild.buildroot.net/results/07a/07adcba71106a2dca963e4071f4673791b41a603
 - http://autobuild.buildroot.net/results/a27/a272a8e521863374901a5e3c0fb9da0b8daa4076

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v3 -> v4 (after review of Peter Korsgaard):
 - Use libdir instead of the ugly hack
Changes v2 -> v3:
 - Add autobuilder links
Changes v1 -> v2:
 - Fix install of libmpdclient.pc

 package/libmpdclient/libmpdclient.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
index 3148fd2873..3ab8e9884c 100644
--- a/package/libmpdclient/libmpdclient.mk
+++ b/package/libmpdclient/libmpdclient.mk
@@ -15,6 +15,7 @@ LIBMPDCLIENT_DEPENDENCIES = host-meson
 
 LIBMPDCLIENT_CONF_OPTS += \
 	--prefix=/usr \
+	--libdir=/usr/lib \
 	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
 	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf
 
-- 
2.14.1
