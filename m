From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Sun,  1 Apr 2012 15:58:48 +0200
Subject: [Buildroot] [PATCH v3 2/3] Add mobile-broadband-provider-info
	package.
In-Reply-To: <1333288729-22138-1-git-send-email-marek.belisko@open-nandra.com>
References: <1333288729-22138-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <1333288729-22138-3-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 package/Config.in                                  |    1 +
 package/mobile-broadband-provider-info/Config.in   |    6 ++++++
 .../mobile_broadband_provider_info.mk              |   14 ++++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 package/mobile-broadband-provider-info/Config.in
 create mode 100644 package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk

diff --git a/package/Config.in b/package/Config.in
index 2dc7e1f..cd41eb9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -424,6 +424,7 @@ endmenu
 endmenu
 
 menu "Miscellaneous"
+source "package/mobile-broadband-provider-info/Config.in"
 source "package/shared-mime-info/Config.in"
 endmenu
 
diff --git a/package/mobile-broadband-provider-info/Config.in b/package/mobile-broadband-provider-info/Config.in
new file mode 100644
index 0000000..dda7105
--- /dev/null
+++ b/package/mobile-broadband-provider-info/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO
+	bool "mobile-broadband-provider-info"
+	help
+	  Mobile broadband provider database.
+
+	  http://live.gnome.org/NetworkManager/MobileBroadband/ServiceProviders
diff --git a/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk b/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
new file mode 100644
index 0000000..9df3853
--- /dev/null
+++ b/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# mobile broadband provider info
+#
+#############################################################
+MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20110511
+MOBILE_BROADBAND_PROVIDER_INFO_SITE = git://git.gnome.org/mobile-broadband-provider-info
+MOBILE_BROADBAND_PROVIDER_INFO_INSTALL_STAGING = YES
+MOBILE_BROADBAND_PROVIDER_INFO_DEPENDENCIES = host-pkg-config
+
+MOBILE_BROADBAND_PROVIDER_INFO_AUTORECONF=YES
+
+$(eval $(call AUTOTARGETS))
+
-- 
1.7.5.4
