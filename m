From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 15:15:20 +0200
Subject: [Buildroot] [git commit] package/python-thrift: bump version to
	0.9.3
Message-ID: <20161007131552.0A4B8822F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a89b875ee8880610de77daa389d487fe19dd4e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PYTHON_THRIFT_SUBDIR is not needed anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-thrift/python-thrift.hash | 5 +++--
 package/python-thrift/python-thrift.mk   | 7 +++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-thrift/python-thrift.hash b/package/python-thrift/python-thrift.hash
index 811aa98..72269eb 100644
--- a/package/python-thrift/python-thrift.hash
+++ b/package/python-thrift/python-thrift.hash
@@ -1,2 +1,3 @@
-# From https://www.apache.org/dist/thrift/0.9.2/thrift-0.9.2.tar.gz.md5
-md5	89f63cc4d0100912f4a1f8a9dee63678	thrift-0.9.2.tar.gz
+# md5 from https://pypi.python.org/pypi/thrift/json, sha256 locally computed
+md5	b519551d7a086bb0b4f222a8f566b7e8  thrift-0.9.3.tar.gz
+sha256	dfbc3d3bd19d396718dab05abaf46d93ae8005e2df798ef02e32793cd963877e  thrift-0.9.3.tar.gz
diff --git a/package/python-thrift/python-thrift.mk b/package/python-thrift/python-thrift.mk
index 99641b8..d0e3a14 100644
--- a/package/python-thrift/python-thrift.mk
+++ b/package/python-thrift/python-thrift.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-PYTHON_THRIFT_VERSION = 0.9.2
+PYTHON_THRIFT_VERSION = 0.9.3
 PYTHON_THRIFT_SOURCE = thrift-$(PYTHON_THRIFT_VERSION).tar.gz
-PYTHON_THRIFT_SITE = http://www.us.apache.org/dist/thrift/$(PYTHON_THRIFT_VERSION)
+PYTHON_THRIFT_SITE = https://pypi.python.org/packages/ae/58/35e3f0cd290039ff862c2c9d8ae8a76896665d70343d833bdc2f748b8e55
 PYTHON_THRIFT_LICENSE = Apache-2.0
-PYTHON_THRIFT_LICENSE_FILES = LICENSE
+PYTHON_THRIFT_LICENSE_FILES = setup.py
 PYTHON_THRIFT_SETUP_TYPE = setuptools
-PYTHON_THRIFT_SUBDIR = lib/py
 
 $(eval $(python-package))
