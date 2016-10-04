From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  4 Oct 2016 21:29:21 +0200
Subject: [Buildroot] [PATCH v1] libdrm: add etnaviv (i.MX6/Vivante GCxxx)
	option
Message-ID: <1475609361-9289-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libdrm/Config.in | 8 ++++++++
 package/libdrm/libdrm.mk | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 3f39e27..81fc5cc 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -62,6 +62,14 @@ config BR2_PACKAGE_LIBDRM_OMAP
 	help
 	  Install the TI OMAP driver using an experimental API.
 
+config BR2_PACKAGE_LIBDRM_ETNAVIV
+	bool "etnaviv (experimental)"
+	depends on BR2_arm
+	depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC
+	select BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
+	help
+	  Install the Etnaviv/Vivante driver using an experimental API.
+
 config BR2_PACKAGE_LIBDRM_EXYNOS
 	bool "exynos (experimental)"
 	depends on BR2_arm
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index d06f3ec..cce5023 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -65,6 +65,12 @@ else
 LIBDRM_CONF_OPTS += --disable-omap-experimental-api
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDRM_ETNAVIV),y)
+LIBDRM_CONF_OPTS += --enable-etnaviv-experimental-api
+else
+LIBDRM_CONF_OPTS += --disable-etnaviv-experimental-api
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDRM_EXYNOS),y)
 LIBDRM_CONF_OPTS += --enable-exynos-experimental-api
 else
-- 
2.8.1
