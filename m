From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Nov 2019 21:11:46 +0100
Subject: [Buildroot] [git commit] package/openvmtools: remove procps option
Message-ID: <20191110200435.B6B808ECA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2be4232d987178daf3c9d38a4d123b6a53ed0b7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

procps support has been removed since version 10.2.5 and
https://github.com/vmware/open-vm-tools/commit/ed2e2348dd6af823f9458c5959c89acf2f13a952

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
