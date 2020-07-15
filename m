From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Wed, 15 Jul 2020 17:38:45 +0200
Subject: [Buildroot] [PATCH] package/python-networkx: bump to 2.4
Message-ID: <20200715153845.1915659-1-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python-networkx wasn't upgraded for a while due to incompatibilities
with setools not supporting versions above 1.11. With the recent version
bump of setools this is no longer true and we can bump python-networkx
to 2.4.

The license checksum had to be updated while bumping the package, but
only the year of the copyright has changed.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 package/python-networkx/python-networkx.hash | 8 ++++----
 package/python-networkx/python-networkx.mk   | 5 ++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/python-networkx/python-networkx.hash b/package/python-networkx/python-networkx.hash
index 92383e75c4fd..6c4b793e0dc0 100644
--- a/package/python-networkx/python-networkx.hash
+++ b/package/python-networkx/python-networkx.hash
@@ -1,4 +1,4 @@
-# md5 from https://pypi.python.org/pypi/networks/json, sha256 locally computed
-md5 6ef584a879e9163013e9a762e1cf7cd1 networkx-1.11.tar.gz
-sha256 0d0e70e10dfb47601cbb3425a00e03e2a2e97477be6f80638fef91d54dd1e4b8 networkx-1.11.tar.gz
-sha256 f4c13bf0e83bef45116ebda6c360066df6fd99610efaea9790b998c5441b0c0d LICENSE.txt
+# From: https://pypi.org/project/networkx/
+sha256 f8f4ff0b6f96e4f9b16af6b84622597b5334bf9cae8cf9b2e42e7985d5c95c64 networkx-2.4.tar.gz
+# Locally computed
+sha256 f421f7c5d30022aa268174976e43e488b856ad953f32cdd13f0675630996d8c0 LICENSE.txt
diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
index 4dfdbd5a1c03..bcb3f22f8e5e 100644
--- a/package/python-networkx/python-networkx.mk
+++ b/package/python-networkx/python-networkx.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-# The current version of setools (v4.1.1) does not work with python-networkx past v1.11
-PYTHON_NETWORKX_VERSION = 1.11
+PYTHON_NETWORKX_VERSION = 2.4
 PYTHON_NETWORKX_SOURCE = networkx-$(PYTHON_NETWORKX_VERSION).tar.gz
-PYTHON_NETWORKX_SITE = https://pypi.python.org/packages/c2/93/dbb41b03cf7c878a7409c8e92226531f840a423c9309ea534873a83c9192
+PYTHON_NETWORKX_SITE = https://pypi.python.org/packages/bf/63/7b579dd3b1c49ce6b7fd8f6f864038f255201410905dd183cf7f4a3845cf
 PYTHON_NETWORKX_LICENSE = BSD-3-Clause
 PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
 PYTHON_NETWORKX_SETUP_TYPE = setuptools
-- 
2.26.2
