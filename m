From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  6 Mar 2013 21:22:53 +0100
Subject: [Buildroot] [PATCH 11/34] qt5: base infrastructure
In-Reply-To: <1362601396-32250-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362601396-32250-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362601396-32250-12-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in |   18 ++++++++++++++++++
 package/qt5/qt5.mk    |    1 +
 2 files changed, 19 insertions(+)
 create mode 100644 package/qt5/Config.in
 create mode 100644 package/qt5/qt5.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
new file mode 100644
index 0000000..0acb89e
--- /dev/null
+++ b/package/qt5/Config.in
@@ -0,0 +1,18 @@
+comment "Qt5 needs a toolchain with WCHAR, IPv6, thread and C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
+
+menuconfig BR2_PACKAGE_QT5
+	bool "Qt5"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  This option enables the Qt5 framework. Sub-options allow to
+	  select which modules should be built.
+
+	  http://qt-project.org
+
+if BR2_PACKAGE_QT5
+
+endif
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
new file mode 100644
index 0000000..8b1a7ed
--- /dev/null
+++ b/package/qt5/qt5.mk
@@ -0,0 +1 @@
+include package/qt5/*/*.mk
-- 
1.7.9.5
