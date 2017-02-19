From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Feb 2017 11:52:01 +0100
Subject: [Buildroot] [PATCHv2] package/mosquito: needs sync_4
Message-ID: <1487501521-14145-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.org/results/2bc/2bc84ba2d1167018e2d48e5183ead22b6425dcf5/
    http://autobuild.buildroot.org/results/445/445f377ae70397b5f675f541977900e8986b79a4/
    http://autobuild.buildroot.org/results/57e/57e6984427f8c5d906a93884cc461b8f93cf5ce0/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Baruch Siach <baruch@tkos.co.il>

---
Changes v1 -> v2:
  - propagate dependencies  (Baruch)
---
 package/collectd/Config.in  | 1 +
 package/domoticz/Config.in  | 2 ++
 package/mosquitto/Config.in | 1 +
 3 files changed, 4 insertions(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 683141b..47bfe95 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -526,6 +526,7 @@ config BR2_PACKAGE_COLLECTD_GRAPHITE
 
 config BR2_PACKAGE_COLLECTD_MQTT
 	bool "mqtt"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mosquitto
 	select BR2_PACKAGE_MOSQUITTO
 	help
 	  Sends metrics to and/or receives metrics from an MQTT broker.
diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index f128e6f..c6550d2 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DOMOTICZ
 	bool "domoticz"
 	depends on BR2_USE_MMU # mosquitto
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mosquitto
 	depends on !BR2_STATIC_LIBS # mosquitto
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -28,6 +29,7 @@ config BR2_PACKAGE_DOMOTICZ
 
 comment "domoticz needs lua >= 5.2 and a toolchain w/ C++, threads, wchar, dynamic library"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 50937d0..bc2ab35 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MOSQUITTO
 	bool "mosquitto"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_STATIC_LIBS # builds .so
 	help
 	  Mosquitto is an open source message broker that implements
-- 
2.7.4
