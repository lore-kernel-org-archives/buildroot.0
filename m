From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Feb 2016 23:07:03 +0100
Subject: [Buildroot] [git commit] python-setuptools: enable Python 3.x
	support
Message-ID: <20160205220712.B66358026D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f42ef5c5a2b392960f9f8d182cc080843bf3df4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add missing XML dependency.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-setuptools/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/python-setuptools/Config.in b/package/python-setuptools/Config.in
index 63c2b01..c72c59f 100644
--- a/package/python-setuptools/Config.in
+++ b/package/python-setuptools/Config.in
@@ -1,7 +1,9 @@
 config BR2_PACKAGE_PYTHON_SETUPTOOLS
 	bool "python-setuptools"
-	depends on BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON_ZLIB
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
 	help
 	  Download, build, install, upgrade, and uninstall Python packages.
 
