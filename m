From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 21 Jul 2017 10:12:30 +0200
Subject: [Buildroot] [PATCH 7/7] python-requests: bump to version 2.18.1
In-Reply-To: <20170721081230.5584-1-yegorslists@googlemail.com>
References: <20170721081230.5584-1-yegorslists@googlemail.com>
Message-ID: <20170721081230.5584-7-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add new runtime dependencies and select Python SSL support.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-requests/Config.in            | 6 ++++++
 package/python-requests/python-requests.hash | 4 ++--
 package/python-requests/python-requests.mk   | 4 ++--
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/python-requests/Config.in b/package/python-requests/Config.in
index 23ab3092d..d2726fb26 100644
--- a/package/python-requests/Config.in
+++ b/package/python-requests/Config.in
@@ -1,5 +1,11 @@
 config BR2_PACKAGE_PYTHON_REQUESTS
 	bool "python-requests"
+	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
+	select BR2_PACKAGE_PYTHON_CHARDET # runtime
+	select BR2_PACKAGE_PYTHON_IDNA # runtime
+	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
+	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
 	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
 	help
diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
index 8faa9d0e8..2f182ea3b 100644
--- a/package/python-requests/python-requests.hash
+++ b/package/python-requests/python-requests.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/requests/json, sha256 locally computed
-md5 921ec6b48f2ddafc8bb6160957baf444 requests-2.13.0.tar.gz
-sha256 5722cd09762faa01276230270ff16af7acf7c5c45d623868d9ba116f15791ce8 requests-2.13.0.tar.gz
+md5	40f723ed01dddeaf990d0609d073f021  requests-2.18.1.tar.gz
+sha256	c6f3bdf4a4323ac7b45d01e04a6f6c20e32a052cd04de81e05103abc049ad9b9  requests-2.18.1.tar.gz
diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index 13bbdfb5a..504eb8d0a 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_VERSION = 2.13.0
+PYTHON_REQUESTS_VERSION = 2.18.1
 PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
-PYTHON_REQUESTS_SITE = https://pypi.python.org/packages/16/09/37b69de7c924d318e51ece1c4ceb679bf93be9d05973bb30c35babd596e2
+PYTHON_REQUESTS_SITE = https://pypi.python.org/packages/2c/b5/2b6e8ef8dd18203b6399e9f28c7d54f6de7b7549853fe36d575bd31e29a7
 PYTHON_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_LICENSE = Apache-2.0
 PYTHON_REQUESTS_LICENSE_FILES = LICENSE
-- 
2.11.0
