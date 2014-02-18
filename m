From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 21:40:13 +0100
Subject: [Buildroot] [PATCH v2 20/20] python-pysnmp{, -apps,
	-mibs}: allow to build with Python 3
In-Reply-To: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392756013-27757-21-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pysnmp-apps/Config.in | 2 +-
 package/python-pysnmp-mibs/Config.in | 2 +-
 package/python-pysnmp/Config.in      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pysnmp-apps/Config.in b/package/python-pysnmp-apps/Config.in
index 304e812..8edd04c 100644
--- a/package/python-pysnmp-apps/Config.in
+++ b/package/python-pysnmp-apps/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYSNMP_APPS
 	bool "python-pysnmp-apps"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_PYSNMP
 	depends on BR2_INSTALL_LIBSTDCPP # pysnmp -> pyasn
 	help
diff --git a/package/python-pysnmp-mibs/Config.in b/package/python-pysnmp-mibs/Config.in
index 90ec933..cc03676 100644
--- a/package/python-pysnmp-mibs/Config.in
+++ b/package/python-pysnmp-mibs/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYSNMP_MIBS
 	bool "python-pysnmp-mibs"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_PYSNMP
 	depends on BR2_INSTALL_LIBSTDCPP # pysnmp -> pyasn
 	help
diff --git a/package/python-pysnmp/Config.in b/package/python-pysnmp/Config.in
index d5f90ed..6cf18ee 100644
--- a/package/python-pysnmp/Config.in
+++ b/package/python-pysnmp/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYSNMP
 	bool "python-pysnmp"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	depends on BR2_INSTALL_LIBSTDCPP # pyasn
 	select BR2_PACKAGE_PYTHON_PYASN
 	select BR2_PACKAGE_PYTHON_PYCRYPTO
-- 
1.8.3.2
