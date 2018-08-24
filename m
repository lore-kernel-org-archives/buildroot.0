From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 24 Aug 2018 22:31:19 +0200
Subject: [Buildroot] [PATCH/next 1/1] python-libconfig: fix python-3.7
 support
Message-ID: <20180824203119.16807-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/32f/32f7e38895e7c491916bd69ed91bbe016e8b3ff6/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...termine-boost_python-name-depending-on-current-Pyt.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/python-libconfig/0001-Determine-boost_python-name-depending-on-current-Pyt.patch b/package/python-libconfig/0001-Determine-boost_python-name-depending-on-current-Pyt.patch
index 478bac76f6..ec7aec4072 100644
--- a/package/python-libconfig/0001-Determine-boost_python-name-depending-on-current-Pyt.patch
+++ b/package/python-libconfig/0001-Determine-boost_python-name-depending-on-current-Pyt.patch
@@ -4,11 +4,13 @@ Date: Thu, 27 Jul 2017 09:46:07 +0200
 Subject: [PATCH] Determine boost_python name depending on current Python
  version
 
-Python2 requires boost_python27 and Python3 requires boost_python36
+Python2 requires boost_python27 and Python3 requires boost_python37
 (since boost 1.67).
 
 Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Bernd: adapted for python-3.7]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  setup.py | 6 +++++-
  1 file changed, 5 insertions(+), 1 deletion(-)
@@ -21,7 +23,7 @@ index fdf5c27..4b38569 100644
  from setuptools import setup, find_packages, Extension
  import sys, os
  
-+boostlib = "boost_python36"
++boostlib = "boost_python37"
 +if sys.version_info < (3, 0):
 +    boostlib = "boost_python27"
 +
-- 
2.18.0
