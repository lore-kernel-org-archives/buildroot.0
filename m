From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 23 Feb 2016 21:43:58 +0100
Subject: [Buildroot] [PATCH v1 2/2] libdrm: add vc4 ((Raspberry Pi) option
In-Reply-To: <1456260238-31607-1-git-send-email-ps.report@gmx.net>
References: <1456260238-31607-1-git-send-email-ps.report@gmx.net>
Message-ID: <1456260238-31607-2-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libdrm/Config.in | 6 ++++++
 package/libdrm/libdrm.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 445a85b..343a2ed 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -69,6 +69,12 @@ config BR2_PACKAGE_LIBDRM_TEGRA
 	help
 	  Install NVIDIA Tegra driver using an experimental API.
 
+config BR2_PACKAGE_LIBDRM_VC4
+	bool "vc4"
+	depends on BR2_arm
+	help
+	  Install vc4 (Raspberry Pi) driver.
+
 endmenu
 
 endif
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 99a78d2..4082a19 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -76,6 +76,12 @@ else
 LIBDRM_CONF_OPTS += --disable-tegra-experimental-api
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDRM_VC4),y)
+LIBDRM_CONF_OPTS += --enable-vc4
+else
+LIBDRM_CONF_OPTS += --disable-vc4
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LIBDRM_CONF_OPTS += --enable-udev
 LIBDRM_DEPENDENCIES += udev
-- 
2.1.4
