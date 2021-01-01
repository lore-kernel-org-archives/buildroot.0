From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  1 Jan 2021 20:25:46 +0100
Subject: [Buildroot] [PATCH 2/3] package/python-mwscrape: bump version for
 python3 support
In-Reply-To: <20210101192547.6934-1-bernd.kuhls@t-online.de>
References: <20210101192547.6934-1-bernd.kuhls@t-online.de>
Message-ID: <20210101192547.6934-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream ported the package to support python >= 3.6:
https://github.com/itkach/mwscrape/commit/568ccbe6e12dd6391277df02adf724ba0e5f9197

Remove dependency to python-futures package because it was only needed
for python2.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-mwscrape/Config.in            | 3 +--
 package/python-mwscrape/python-mwscrape.hash | 2 +-
 package/python-mwscrape/python-mwscrape.mk   | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/python-mwscrape/Config.in b/package/python-mwscrape/Config.in
index 273ce9a4a8..cb1e30506f 100644
--- a/package/python-mwscrape/Config.in
+++ b/package/python-mwscrape/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_PYTHON_MWSCRAPE
 	bool "python-mwscrape"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_COUCHDB # runtime
-	select BR2_PACKAGE_PYTHON_FUTURES # runtime
 	select BR2_PACKAGE_PYTHON_MWCLIENT # runtime
 	select BR2_PACKAGE_PYTHON_PYLRU # runtime
 	help
diff --git a/package/python-mwscrape/python-mwscrape.hash b/package/python-mwscrape/python-mwscrape.hash
index e6bdf396c8..0f64a9e19c 100644
--- a/package/python-mwscrape/python-mwscrape.hash
+++ b/package/python-mwscrape/python-mwscrape.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8de8a5ef257851f6e1e41247f64710f48859a5e3f91ebc7200bb60769f02f296  python-mwscrape-6a58d7801eb1e884fd0516f1adbedbd4481c10e6.tar.gz
+sha256  2d0e6c747f6a866dedbc759f78830b3f496e8d03401a3c727d0b48735341c5b6  python-mwscrape-568ccbe6e12dd6391277df02adf724ba0e5f9197.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE.txt
diff --git a/package/python-mwscrape/python-mwscrape.mk b/package/python-mwscrape/python-mwscrape.mk
index 47b943f45f..3ffe9d6880 100644
--- a/package/python-mwscrape/python-mwscrape.mk
+++ b/package/python-mwscrape/python-mwscrape.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_MWSCRAPE_VERSION = 6a58d7801eb1e884fd0516f1adbedbd4481c10e6
+PYTHON_MWSCRAPE_VERSION = 568ccbe6e12dd6391277df02adf724ba0e5f9197
 PYTHON_MWSCRAPE_SITE = $(call github,itkach,mwscrape,$(PYTHON_MWSCRAPE_VERSION))
 PYTHON_MWSCRAPE_LICENSE = MPL-2.0
 PYTHON_MWSCRAPE_LICENSE_FILES = LICENSE.txt
-- 
2.29.2
