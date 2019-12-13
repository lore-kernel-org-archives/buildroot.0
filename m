From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Dec 2019 16:02:55 +0100
Subject: [Buildroot] [git commit] package/python-pyasn-modules: select
 correct option
Message-ID: <20191213145642.3D30F8A444@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31d4248554e9dd9a97fc0d83f8a216ddaa6fa64e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_PYASN does not exist, it is BR2_PACKAGE_PYTHON_PYASN that
should be selected.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
