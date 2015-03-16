From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 22:26:30 +0100
Subject: [Buildroot] [git commit] cups: deprecate package due to security
	issues
Message-ID: <20150316212645.E510F8015F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d05afa42792193fa392c9f5417e8effc73d1e38
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also mark packages that depend on cups as deprecated as well for easier
tracking.

It would probably be better to mark it as a legacy option so users get a
warning when migrating configuration files, but it would require a
direct removal for that.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cups/Config.in             |    2 ++
 package/foomatic-filters/Config.in |    4 ++++
 package/gutenprint/Config.in       |    2 ++
 package/hplip/Config.in            |    2 ++
 4 files changed, 10 insertions(+), 0 deletions(-)

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
index 377566e..0571eb9 100644
--- a/package/foomatic-filters/Config.in
+++ b/package/foomatic-filters/Config.in
@@ -1,10 +1,14 @@
 comment "foomatic-filters needs a toolchain w/ threads"
+	# because of cups security issues
+	depends on BR2_DEPRECATED_SINCE_2015_05
 	depends on BR2_PACKAGE_CUPS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_FOOMATIC_FILTERS
 	bool "foomatic_filters"
 	depends on BR2_PACKAGE_CUPS
+	# because of cups security issues
+	depends on BR2_DEPRECATED_SINCE_2015_05
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_ENSCRIPT
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
