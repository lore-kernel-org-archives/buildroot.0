From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 25 Oct 2019 21:54:43 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-docutils: add upstream patch
 to build without setuptools
Message-ID: <20191025185448.32633-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

An upstream patch to enable building without setuptools is added.
The original commit is adjusted slightly to fit the current version.

Fixes:
 - http://autobuild.buildroot.net/results/8f3c01f0e286c6b15c8c973f91dd69ee816a58b9

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 .../0001-Update-setup.py.patch                | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 package/python-docutils/0001-Update-setup.py.patch

diff --git a/package/python-docutils/0001-Update-setup.py.patch b/package/python-docutils/0001-Update-setup.py.patch
new file mode 100644
index 0000000000..3fb34a9763
--- /dev/null
+++ b/package/python-docutils/0001-Update-setup.py.patch
@@ -0,0 +1,64 @@
+From 583e59ccf72a02c2a6f0399f29f622c7f2f4a932 Mon Sep 17 00:00:00 2001
+From: milde <milde@929543f6-e4f2-0310-98a6-ba3bd3dd1d04>
+Date: Sun, 1 Sep 2019 19:39:36 +0000
+Subject: [PATCH] Update setup.py
+
+Python 3.4 no longer supported,
+more languages supported (and Lithuanian accepted by PyPi).
+
+git-svn-id: http://svn.code.sf.net/p/docutils/code/trunk at 8383 929543f6-e4f2-0310-98a6-ba3bd3dd1d04
+
+[Asaf: adjust upstream patch to 0.15.2]
+Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
+---
+ setup.py | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index f801ea2..5c1ebfd 100755
+--- a/setup.py
++++ b/setup.py
+@@ -7,6 +7,10 @@ import os
+ import glob
+ try:
+     import setuptools
++except ImportError:
++    print('Warning: Could not load package `setuptools`.')
++    print('Actions requiring `setuptools` instead of `distutils` will fail')
++try:
+     from distutils.core import setup, Command
+     from distutils.command.build import build
+     from distutils.command.build_py import build_py
+@@ -123,7 +127,7 @@ what-you-see-is-what-you-get plaintext markup syntax.""", # wrap at col 60
+     'maintainer_email': 'docutils-develop at lists.sourceforge.net',
+     'license': 'public domain, Python, 2-Clause BSD, GPL 3 (see COPYING.txt)',
+     'platforms': 'OS-independent',
+-    'python_requires': '>=2.6, !=3.0.*, !=3.1.*, !=3.2.*',
++    'python_requires': '>=2.7, !=3.0.*, !=3.1.*, !=3.2.*, !=3.3.*, !=3.4.*',
+     'package_dir': {'docutils': 'docutils',
+                     'docutils.tools': 'tools'},
+     'packages': ['docutils',
+@@ -213,14 +219,20 @@ classifiers = [
+     'Natural Language :: Chinese (Simplified)',
+     'Natural Language :: Chinese (Traditional)',
+     'Natural Language :: Czech',
++    'Natural Language :: Danish',
+     'Natural Language :: Dutch',
+     'Natural Language :: Esperanto',
+     'Natural Language :: Finnish',
+     'Natural Language :: French',
+     'Natural Language :: Galician',
+     'Natural Language :: German',
++    'Natural Language :: Hebrew',
+     'Natural Language :: Italian',
+     'Natural Language :: Japanese',
++    'Natural Language :: Korean',
++    'Natural Language :: Latvian',
++    'Natural Language :: Lithuanian',
++    'Natural Language :: Persian',
+     'Natural Language :: Polish',
+     'Natural Language :: Portuguese (Brazilian)',
+     'Natural Language :: Russian',
+-- 
+2.20.1
+k
-- 
2.20.1
