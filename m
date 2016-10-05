From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 09:58:56 +0200
Subject: [Buildroot] [git commit] libdrm: add etnaviv (i.MX6/Vivante GCxxx)
	option
Message-ID: <20161005075926.06CDB8216D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efe223f4ade1516c64325439b566ad33b38b4e78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
