From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 09:04:29 +0100
Subject: [Buildroot] [git commit branch/2019.11.x]
 package/python-pyasn-modules: select correct option
Message-ID: <20191223075903.B024B8D7B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e590e4e4b438dd39310435d407e484964018f5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

BR2_PACKAGE_PYASN does not exist, it is BR2_PACKAGE_PYTHON_PYASN that
should be selected.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 31d4248554e9dd9a97fc0d83f8a216ddaa6fa64e)
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
 
