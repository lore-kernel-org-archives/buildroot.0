From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 02 Feb 2014 13:11:19 +0100
Subject: [Buildroot] [PATCH 4 of 9] python modules: add missing depends on
 Config.in comments
In-Reply-To: <patchbomb.1391343075@argentina>
References: <patchbomb.1391343075@argentina>
Message-ID: <33a930e91058f811de4f.1391343079@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Config.in comments about toolchain dependencies should only be visible when
the option they refer to would be visible (had the dependencies been met).
While python modules are currently already only visible when python is
enabled, thanks to a 'depends on BR2_PACKAGE_PYTHON' in package/Config.in,
we explicitly keep the 'depends on' statement for the packages themselves,
in anticipation of the introduction of Python 3 support.
Hence, the python dependency should be replicated on the comments, just as
for other packages.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/python-posix-ipc/Config.in   |  1 +
 package/python-pyasn/Config.in       |  1 +
 package/python-pysnmp-apps/Config.in |  1 +
 package/python-pysnmp-mibs/Config.in |  1 +
 package/python-pysnmp/Config.in      |  1 +
 5 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/python-posix-ipc/Config.in b/package/python-posix-ipc/Config.in
--- a/package/python-posix-ipc/Config.in
+++ b/package/python-posix-ipc/Config.in
@@ -11,4 +11,5 @@ config BR2_PACKAGE_PYTHON_POSIX_IPC
 	  http://semanchuk.com/philip/posix_ipc/
 
 comment "python-posix-ipc needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_PYTHON
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/python-pyasn/Config.in b/package/python-pyasn/Config.in
--- a/package/python-pyasn/Config.in
+++ b/package/python-pyasn/Config.in
@@ -10,4 +10,5 @@ config BR2_PACKAGE_PYTHON_PYASN
 	  https://code.google.com/p/pyasn/
 
 comment "python-pyasn needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-pysnmp-apps/Config.in b/package/python-pysnmp-apps/Config.in
--- a/package/python-pysnmp-apps/Config.in
+++ b/package/python-pysnmp-apps/Config.in
@@ -10,4 +10,5 @@ config BR2_PACKAGE_PYTHON_PYSNMP_APPS
 	  http://pysnmp.sf.net
 
 comment "python-pysnmp-apps needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-pysnmp-mibs/Config.in b/package/python-pysnmp-mibs/Config.in
--- a/package/python-pysnmp-mibs/Config.in
+++ b/package/python-pysnmp-mibs/Config.in
@@ -10,4 +10,5 @@ config BR2_PACKAGE_PYTHON_PYSNMP_MIBS
 	  http://pysnmp.sf.net
 
 comment "python-pysnmp-libs needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-pysnmp/Config.in b/package/python-pysnmp/Config.in
--- a/package/python-pysnmp/Config.in
+++ b/package/python-pysnmp/Config.in
@@ -11,4 +11,5 @@ config BR2_PACKAGE_PYTHON_PYSNMP
 	  http://pysnmp.sf.net
 
 comment "python-pysnmp needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON
 	depends on !BR2_INSTALL_LIBSTDCPP
