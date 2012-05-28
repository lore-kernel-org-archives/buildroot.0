From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 May 2012 22:41:00 +0200
Subject: [Buildroot] [git commit] Add mobile-broadband-provider-info package.
Message-ID: <20120531113301.51B3596E2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1fa5612194a8639247bd294fbaa1204c7defa932
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: minor whitespace fixes]
Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/mobile-broadband-provider-info/Config.in   |    6 ++++++
 .../mobile_broadband_provider_info.mk              |   13 +++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 85a26d5..9087a41 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -479,6 +479,7 @@ endmenu
 menu "Miscellaneous"
 source "package/collectd/Config.in"
 source "package/empty/Config.in"
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
index 0000000..759d0b8
--- /dev/null
+++ b/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
@@ -0,0 +1,13 @@
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
+MOBILE_BROADBAND_PROVIDER_INFO_AUTORECONF = YES
+
+$(eval $(call AUTOTARGETS))
