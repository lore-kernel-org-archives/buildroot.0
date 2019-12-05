From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu,  5 Dec 2019 14:15:13 -0800
Subject: [Buildroot] [PATCH 2/4] package/python-twisted: add config for TLS
 support
In-Reply-To: <20191205221515.3121562-1-aduskett@gmail.com>
References: <20191205221515.3121562-1-aduskett@gmail.com>
Message-ID: <20191205221515.3121562-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Add an option that selects all of the necessary python packages to ensure that
twisted has TLS support.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/python-twisted/Config.in | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index b72952f979..f3d94c544e 100644
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
+	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl, python-cryptography
+	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
+	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
+	select BR2_PACKAGE_PYTHON_IDNA # runtime
+
+comment "TLS support needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+endif
-- 
2.23.0
