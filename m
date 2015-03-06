From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  6 Mar 2015 10:39:24 -0300
Subject: [Buildroot] [PATCH] cups: deprecate package due to security issues
Message-ID: <1425649164-31813-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also mark packages that depend on cups as deprecated as well for easier
tracking.

It would probably be better to mark it as a legacy option so users get a
warning when migrating configuration files, but it would require a
direct removal for that.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cups/Config.in             | 2 ++
 package/foomatic-filters/Config.in | 2 ++
 package/gutenprint/Config.in       | 2 ++
 package/hplip/Config.in            | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/package/cups/Config.in b/package/cups/Config.in
index ea1f003..8e60221 100644
--- a/package/cups/Config.in
+++ b/package/cups/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_CUPS
 	bool "cups"
+	# serious security issues, needs upgrading
+	depends on BR2_DEPRECATED_SINCE_2015_05
 	# needs fork()
 	depends on BR2_USE_MMU
 	help
diff --git a/package/foomatic-filters/Config.in b/package/foomatic-filters/Config.in
index 377566e..158bf44 100644
--- a/package/foomatic-filters/Config.in
+++ b/package/foomatic-filters/Config.in
@@ -1,4 +1,6 @@
 comment "foomatic-filters needs a toolchain w/ threads"
+	# because of cups security issues
+	depends on BR2_DEPRECATED_SINCE_2015_05
 	depends on BR2_PACKAGE_CUPS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
diff --git a/package/gutenprint/Config.in b/package/gutenprint/Config.in
index f93717c..686dbce 100644
--- a/package/gutenprint/Config.in
+++ b/package/gutenprint/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_GUTENPRINT
 	bool "gutenprint"
+	# because of cups security issues
+	depends on BR2_DEPRECATED_SINCE_2015_05
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_CUPS
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
diff --git a/package/hplip/Config.in b/package/hplip/Config.in
index 7565671..a8a5f69 100644
--- a/package/hplip/Config.in
+++ b/package/hplip/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_HPLIP
 	bool "hplip"
+	# because of cups security issues
+	depends on BR2_DEPRECATED_SINCE_2015_05
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_CUPS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
-- 
2.0.5
