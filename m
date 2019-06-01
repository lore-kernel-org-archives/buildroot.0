From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 14:46:44 +0200
Subject: [Buildroot] [git commit] package/python-matplotlib: depends on
 BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
Message-ID: <20190602201238.2C301801CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22378717cc4ae8c3e2c5dc323b4674e0aa28143f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_PYTHON_MATPLOTLIB selects BR2_PACKAGE_PYTHON_NUMPY, so it
should inherit its dependencies, which includes
BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS.

Fixes:
 - http://autobuild.buildroot.org/results/038d50784ec80b35e3daff1966df07a1b52780b3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-matplotlib/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
index 7f775ea2fc..13a5c74ec4 100644
--- a/package/python-matplotlib/Config.in
+++ b/package/python-matplotlib/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB
 	bool "python-matplotlib"
 	depends on !BR2_PACKAGE_PYTHON
 	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	select BR2_PACKAGE_FREETYPE # runtime
 	select BR2_PACKAGE_LIBPNG # runtime
 	select BR2_PACKAGE_PYTHON_CYCLER
