From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Dec 2019 15:27:13 +0100
Subject: [Buildroot] [PATCH] package/python-pyasn-modules: select correct
 option
Message-ID: <20191213142713.1358458-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_PACKAGE_PYASN does not exist, it is BR2_PACKAGE_PYTHON_PYASN that
should be selected.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyasn-modules/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyasn-modules/Config.in b/package/python-pyasn-modules/Config.in
index 387020d9d6..cedd68b34e 100644
--- a/package/python-pyasn-modules/Config.in
+++ b/package/python-pyasn-modules/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYASN_MODULES
 	bool "python-pyasn-modules"
 	depends on BR2_INSTALL_LIBSTDCPP
-	select BR2_PACKAGE_PYASN # runtime
+	select BR2_PACKAGE_PYTHON_PYASN # runtime
 	help
 	  A collection of ASN.1-based protocols modules.
 
-- 
2.23.0
