From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Dec 2019 23:13:42 +0100
Subject: [Buildroot] [git commit] package/python-twisted: add config for TLS
 support
Message-ID: <20191206220543.68B1088476@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f5960952f6659416ea4d5e58356fb2ef327db51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an option that selects all of the necessary python packages to
ensure that twisted has TLS support.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-twisted/Config.in | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index b72952f979..805f1bc5d6 100644
--- a/package/python-twisted/Config.in
+++ b/package/python-twisted/Config.in
@@ -12,3 +12,17 @@ config BR2_PACKAGE_PYTHON_TWISTED
 	  Python.
 
 	  https://twistedmatrix.com/trac/
+
+if BR2_PACKAGE_PYTHON_TWISTED
+
+config BR2_PACKAGE_PYTHON_TWISTED_TLS
+	bool "TLS support"
+	depends on BR2_INSTALL_LIBSTDCPP # python-{pyopenssl,service-identity}
+	select BR2_PACKAGE_PYTHON_IDNA # runtime
+	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
+	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
+
+comment "TLS support needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+endif
