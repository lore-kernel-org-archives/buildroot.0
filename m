From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue,  8 Oct 2019 16:08:10 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-dpkt: bump to version 1.9.2
In-Reply-To: <20191008130810.27342-1-asafka7@gmail.com>
References: <20191008130810.27342-1-asafka7@gmail.com>
Message-ID: <20191008130810.27342-7-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Add hash for license file.
* Take tarball from PyPi (instead of Github).
* Update _SETUP_TYPE to setuptools.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-dpkt/python-dpkt.hash | 7 +++++--
 package/python-dpkt/python-dpkt.mk   | 7 ++++---
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/python-dpkt/python-dpkt.hash b/package/python-dpkt/python-dpkt.hash
index db46016d08..b8b53fd04b 100644
--- a/package/python-dpkt/python-dpkt.hash
+++ b/package/python-dpkt/python-dpkt.hash
@@ -1,2 +1,5 @@
-# locally computed
-sha256  33a98fd44eb0b6dfa6790c0fcef4d7e73a5cc12a664ea3c30f4d3c2b95f5efc4  python-dpkt-1.8.r98.tar.gz
+# md5, sha256 from https://pypi.org/pypi/dpkt/json
+md5	b204a5434fe29749de539150e00e762e  dpkt-1.9.2.tar.gz
+sha256	52a92ecd5ca04d5bd852bb11cb2eac4bbe38b42a7c472e0d950eeb9f82a81e54  dpkt-1.9.2.tar.gz
+# Locally computed sha256 checksums
+sha256	4c5ffde575425591cbd51410219a6b98bbbb717e0c5784187e356653da8e5095  LICENSE
diff --git a/package/python-dpkt/python-dpkt.mk b/package/python-dpkt/python-dpkt.mk
index 9694b9e62e..aade014f68 100644
--- a/package/python-dpkt/python-dpkt.mk
+++ b/package/python-dpkt/python-dpkt.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DPKT_VERSION = 1.8.r98
-PYTHON_DPKT_SITE = $(call github,kbandla,dpkt,$(PYTHON_DPKT_VERSION))
-PYTHON_DPKT_SETUP_TYPE = distutils
+PYTHON_DPKT_VERSION = 1.9.2
+PYTHON_DPKT_SOURCE = dpkt-$(PYTHON_DPKT_VERSION).tar.gz
+PYTHON_DPKT_SITE = https://files.pythonhosted.org/packages/1c/25/0aebea939ea70d31a7ff8884e5ca577eddb9cfeac626398fe782d4e2f6a2
+PYTHON_DPKT_SETUP_TYPE = setuptools
 PYTHON_DPKT_LICENSE = BSD-3-Clause
 PYTHON_DPKT_LICENSE_FILES = LICENSE
 
-- 
2.20.1
