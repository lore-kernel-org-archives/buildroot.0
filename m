From: Pierre-Luc Simard <pierreluc.simard@admetric.ca>
Date: Fri, 17 Sep 2010 10:59:46 -0700
Subject: [Buildroot] [PATCH 01/17] Basic frame to support TI's packages for
	OMAP and Davinci processors
In-Reply-To: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
References: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
Message-ID: <1284746402-19186-2-git-send-email-pierreluc.simard@admetric.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in    |    3 +++
 package/ti/Config.in |   45 +++++++++++++++++++++++++++++++++++++++++++++
 package/ti/ti.mk     |    1 +
 3 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 package/ti/Config.in
 create mode 100644 package/ti/ti.mk

diff --git a/package/Config.in b/package/Config.in
index 2209b55..40492b8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -345,6 +345,9 @@ source "package/ng-spice-rework/Config.in"
 source "package/shared-mime-info/Config.in"
 endmenu
 
+#TI's Packages
+source "package/ti/Config.in"
+
 menu "Networking applications"
 source "package/argus/Config.in"
 source "package/avahi/Config.in"
diff --git a/package/ti/Config.in b/package/ti/Config.in
new file mode 100644
index 0000000..14b0225
--- /dev/null
+++ b/package/ti/Config.in
@@ -0,0 +1,45 @@
+menuconfig BR2_PACKAGE_TI_OMAP_DAVINCI
+	bool "TI OMAP and Davinci support"
+	depends on BR2_arm
+	help
+    OMAP3 Support for the builtin DSP
+    
+if BR2_PACKAGE_TI_OMAP_DAVINCI
+
+choice
+  prompt "Processor/DSP Platform"
+  default BR2_PACKAGE_TI_PLATFORM_omap3
+  
+  config BR2_PACKAGE_TI_PLATFORM_omap3
+    bool "OMAP 3530"
+  
+  config BR2_PACKAGE_TI_PLATFORM_dm365
+    bool "DM365"
+
+  # TODO: Implement other platforms
+  # config BR2_PACKAGE_TI_PLATFORM_l137
+  #   bool "OMAP L1XX (L137)"
+  # 
+  # config BR2_PACKAGE_TI_PLATFORM_l138
+  #   bool "OMAP L138"
+  # 
+  # config BR2_PACKAGE_TI_PLATFORM_dm6446
+  #   bool "DM6446"
+  #   
+  # config BR2_PACKAGE_TI_PLATFORM_dm6467
+  #   bool "DM6467"
+  #
+  # config BR2_PACKAGE_TI_PLATFORM_dm368
+  #   bool "DM368"
+  #
+  # config BR2_PACKAGE_TI_PLATFORM_dm355
+  #   bool "DM355"
+
+endchoice
+
+comment "Target components"
+
+comment "Staging tools"
+
+
+endif
diff --git a/package/ti/ti.mk b/package/ti/ti.mk
new file mode 100644
index 0000000..e899289
--- /dev/null
+++ b/package/ti/ti.mk
@@ -0,0 +1 @@
+include package/ti/*/*.mk
-- 
1.7.0.4
