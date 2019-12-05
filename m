From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu,  5 Dec 2019 14:15:15 -0800
Subject: [Buildroot] [PATCH 4/4] package/python-daphne: bump to version 2.4.0
In-Reply-To: <20191205221515.3121562-1-aduskett@gmail.com>
References: <20191205221515.3121562-1-aduskett@gmail.com>
Message-ID: <20191205221515.3121562-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Other changes:
  - Update hash for PKG-INFO due to a version bump in the file.
  - select BR2_PACKAGE_PYTHON_TWISTED_TLS as a runtime dependency.
  - Update 0001-remove-pytest-runner-requirement.patch to work with the new
    version.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 .../0001-remove-pytest-runner-requirement.patch             | 2 +-
 package/python-daphne/Config.in                             | 1 +
 package/python-daphne/python-daphne.hash                    | 6 +++---
 package/python-daphne/python-daphne.mk                      | 4 ++--
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-daphne/0001-remove-pytest-runner-requirement.patch b/package/python-daphne/0001-remove-pytest-runner-requirement.patch
index c471d60e8c..30acf201d6 100644
--- a/package/python-daphne/0001-remove-pytest-runner-requirement.patch
+++ b/package/python-daphne/0001-remove-pytest-runner-requirement.patch
@@ -17,7 +17,7 @@ index 64e94f1..4e3abb0 100755
 @@ -23,7 +23,6 @@ setup(
      packages=find_packages() + ["twisted.plugins"],
      include_package_data=True,
-     install_requires=["twisted>=18.7", "autobahn>=0.18", "asgiref~=3.0"],
+     install_requires=["twisted[tls]>=18.7", "autobahn>=0.18", "asgiref~=3.2"],
 -    setup_requires=["pytest-runner"],
      extras_require={
          "tests": ["hypothesis~=3.88", "pytest~=3.10", "pytest-asyncio~=0.8"]
diff --git a/package/python-daphne/Config.in b/package/python-daphne/Config.in
index 896bcfe421..601b2e1db8 100644
--- a/package/python-daphne/Config.in
+++ b/package/python-daphne/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_DAPHNE
 	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
 	select BR2_PACKAGE_PYTHON_AUTOBAHN # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
+	select BR2_PACKAGE_PYTHON_TWISTED_TLS # runtime
 	help
 	  Daphne is a HTTP, HTTP2 and WebSocket protocol server for
 	  ASGI and ASGI-HTTP, developed to power Django Channels.
diff --git a/package/python-daphne/python-daphne.hash b/package/python-daphne/python-daphne.hash
index 71439a77e1..17c13e12c1 100644
--- a/package/python-daphne/python-daphne.hash
+++ b/package/python-daphne/python-daphne.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/daphne/json
-md5	cac7352d0ebdde4f0cc245ae0b0682f8  daphne-2.3.0.tar.gz
-sha256	2329b7a74b5559f7ea012879c10ba945c3a53df7d8d2b5932a904e3b4c9abcc2  daphne-2.3.0.tar.gz
+md5	1e8c391395ade46abe8cca84e3a9746a  daphne-2.4.0.tar.gz
+sha256	5af4d83c8ecf11a4d8ed65ced02d8336d52d90d213dfcd184d07222d36da433c  daphne-2.4.0.tar.gz
 # Locally computed sha256
-sha256 55d7d6117493d69de1c7c211b947b910a715030366f1b636d28cf6891dfc1f3d PKG-INFO
+sha256 d0916b2b91afac6090fc01501e895a3cea81141d4b10c702db9e0a057ca5a563 PKG-INFO
diff --git a/package/python-daphne/python-daphne.mk b/package/python-daphne/python-daphne.mk
index 278bfec29f..3d625c85ec 100644
--- a/package/python-daphne/python-daphne.mk
+++ b/package/python-daphne/python-daphne.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DAPHNE_VERSION = 2.3.0
+PYTHON_DAPHNE_VERSION = 2.4.0
 PYTHON_DAPHNE_SOURCE = daphne-$(PYTHON_DAPHNE_VERSION).tar.gz
-PYTHON_DAPHNE_SITE = https://files.pythonhosted.org/packages/7b/f1/994f55248e27059e160f9d07bf5d325a9891b99daf1eb775a14110e91e5b
+PYTHON_DAPHNE_SITE = https://files.pythonhosted.org/packages/c6/66/05ace288000d323831a9fab1e68a5625b117b7c8aca408404d33330f3906
 PYTHON_DAPHNE_SETUP_TYPE = setuptools
 # https://github.com/django/daphne/blob/master/LICENSE
 PYTHON_DAPHNE_LICENSE = BSD-3-Clause
-- 
2.23.0
