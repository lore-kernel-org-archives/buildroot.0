From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 24 Jun 2018 19:50:45 +0200
Subject: [Buildroot] [PATCH 1/1] python-libconfig: fix build with boost 1.67
Message-ID: <20180624175045.2444-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since boost 1.67, python3 boost library is boost_python36.so instead of
boost_python3.so so update first patch

Fixes:
 - http://autobuild.buildroot.net/results/6f973f2945727b302409405288ef0b9808c7317b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Determine-boost_python-name-depending-on-current-Pyt.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/python-libconfig/0001-Determine-boost_python-name-depending-on-current-Pyt.patch b/package/python-libconfig/0001-Determine-boost_python-name-depending-on-current-Pyt.patch
index b30efc124d..53000cd678 100644
--- a/package/python-libconfig/0001-Determine-boost_python-name-depending-on-current-Pyt.patch
+++ b/package/python-libconfig/0001-Determine-boost_python-name-depending-on-current-Pyt.patch
@@ -4,9 +4,11 @@ Date: Thu, 27 Jul 2017 09:46:07 +0200
 Subject: [PATCH] Determine boost_python name depending on current Python
  version
 
-Python2 requires boost_python and Python3 requires boost_python3.
+Python2 requires boost_python and Python3 requires boost_python36 (since
+boost 1.67).
 
 Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  setup.py | 6 +++++-
  1 file changed, 5 insertions(+), 1 deletion(-)
@@ -19,7 +21,7 @@ index fdf5c27..4b38569 100644
  from setuptools import setup, find_packages, Extension
  import sys, os
  
-+boostlib = "boost_python3"
++boostlib = "boost_python36"
 +if sys.version_info < (3, 0):
 +    boostlib = "boost_python"
 +
-- 
2.14.1
