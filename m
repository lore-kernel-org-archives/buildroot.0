From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 12 Feb 2020 21:45:52 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-crossbar: bump to version
 20.1.2
Message-ID: <20200213044552.71728-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rebased avoid intentional syntax error patch.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../0001-Avoid-intentional-syntax-error.patch        | 12 ++++++------
 package/python-crossbar/python-crossbar.hash         |  6 +++---
 package/python-crossbar/python-crossbar.mk           |  6 +++---
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/python-crossbar/0001-Avoid-intentional-syntax-error.patch b/package/python-crossbar/0001-Avoid-intentional-syntax-error.patch
index fb8e4a2763..0ff7cae21a 100644
--- a/package/python-crossbar/0001-Avoid-intentional-syntax-error.patch
+++ b/package/python-crossbar/0001-Avoid-intentional-syntax-error.patch
@@ -1,4 +1,4 @@
-From 9ab2b96c2ee679c6dcb387174be211db5d70fa97 Mon Sep 17 00:00:00 2001
+From 423a1b081f6b7198f6a921ca83043270ebbace1a Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sun, 1 May 2016 15:35:32 +0200
 Subject: [PATCH] Avoid intentional syntax error
@@ -15,15 +15,15 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/crossbar/worker/test/examples/syntaxerror.py b/crossbar/worker/test/examples/syntaxerror.py
-index a5947cc..585c995 100644
+index 7b88e088..cd7de901 100644
 --- a/crossbar/worker/test/examples/syntaxerror.py
 +++ b/crossbar/worker/test/examples/syntaxerror.py
-@@ -29,5 +29,3 @@
+@@ -27,5 +27,3 @@
+ #  with this program. If not, see <http://www.gnu.org/licenses/agpl-3.0.en.html>.
+ #
  #####################################################################################
- 
- from __future__ import absolute_import, division
 -
 -class # noqa
 -- 
-2.7.4
+2.20.1
 
diff --git a/package/python-crossbar/python-crossbar.hash b/package/python-crossbar/python-crossbar.hash
index f956dc27e1..903d11d330 100644
--- a/package/python-crossbar/python-crossbar.hash
+++ b/package/python-crossbar/python-crossbar.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/crossbar/json
-md5	462a204da3c776cbb770b98f9047e8e7  crossbar-19.1.2.tar.gz
-sha256	269d534a65c136a5c952a6accccf256f457569f731ee65e201e5a14e69db471a  crossbar-19.1.2.tar.gz
+md5	f19fb0995f42e2970fb1b1b077b01d61  crossbar-20.1.2.tar.gz
+sha256	3f4ee0bc73d7e6d25af74b163495eb8892bfe2f0ccbc3153dc4cf807af6163fa  crossbar-20.1.2.tar.gz
 # Locally computed
-sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  LICENSE
+sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  crossbar/LICENSE
diff --git a/package/python-crossbar/python-crossbar.mk b/package/python-crossbar/python-crossbar.mk
index 064d2d92b6..df4d7cc4d5 100644
--- a/package/python-crossbar/python-crossbar.mk
+++ b/package/python-crossbar/python-crossbar.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_CROSSBAR_VERSION = 19.1.2
+PYTHON_CROSSBAR_VERSION = 20.1.2
 PYTHON_CROSSBAR_SOURCE = crossbar-$(PYTHON_CROSSBAR_VERSION).tar.gz
-PYTHON_CROSSBAR_SITE = https://files.pythonhosted.org/packages/86/19/54c7bd9da1ac70643b9ae7d3d4592a73391f62fcb376fcd30f8328c1c5ce
+PYTHON_CROSSBAR_SITE = https://files.pythonhosted.org/packages/2a/cd/e8be30a9ba4db52dc04e530f19a24d225d743aa36f5074ec0b3ef316637a
 PYTHON_CROSSBAR_LICENSE = AGPL-3.0
-PYTHON_CROSSBAR_LICENSE_FILES = LICENSE
+PYTHON_CROSSBAR_LICENSE_FILES = crossbar/LICENSE
 PYTHON_CROSSBAR_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.20.1
