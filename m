From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Sep 2019 20:04:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/openvmtools: remove procps option
Message-ID: <20190929180408.17745-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

procps support has been removed since version 10.2.5 and
https://github.com/vmware/open-vm-tools/commit/ed2e2348dd6af823f9458c5959c89acf2f13a952

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openvmtools/Config.in      | 10 ----------
 package/openvmtools/openvmtools.mk |  7 -------
 2 files changed, 17 deletions(-)

diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index 2bd5c272a9..1a077a2a47 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -22,16 +22,6 @@ config BR2_PACKAGE_OPENVMTOOLS
 
 if BR2_PACKAGE_OPENVMTOOLS
 
-config BR2_PACKAGE_OPENVMTOOLS_PROCPS
-	bool "procps support"
-	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-	select BR2_PACKAGE_PROCPS_NG
-	help
-	  Enable support for procps / meminfo
-
-comment "procps support needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
-	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-
 config BR2_PACKAGE_OPENVMTOOLS_PAM
 	bool "PAM support"
 	# linux-pam needs locale and wchar, but we already have this
diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index e97eaf224e..fc56bb5ee0 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -37,13 +37,6 @@ else
 OPENVMTOOLS_CONF_OPTS += --without-ssl
 endif
 
-ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PROCPS),y)
-OPENVMTOOLS_CONF_OPTS += --with-procps
-OPENVMTOOLS_DEPENDENCIES += procps-ng
-else
-OPENVMTOOLS_CONF_OPTS += --without-procps
-endif
-
 ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PAM),y)
 OPENVMTOOLS_CONF_OPTS += --with-pam
 OPENVMTOOLS_DEPENDENCIES += linux-pam
-- 
2.23.0
