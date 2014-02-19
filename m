From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2014 09:02:15 +0100
Subject: [Buildroot] [git commit] python-pysnmp{, -apps,
	-mibs}: allow to build with Python 3
Message-ID: <20140228133415.13E8A9BA7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ec13284175f3c3ce7e7de6c338c64770f1418bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pysnmp-apps/Config.in |    2 +-
 package/python-pysnmp-mibs/Config.in |    2 +-
 package/python-pysnmp/Config.in      |    2 +-
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
