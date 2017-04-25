From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 25 Apr 2017 12:14:23 -0700
Subject: [Buildroot] [PATCH 9/9] package/python-ipython: Add dependecy list
In-Reply-To: <20170425191423.13294-1-andrew.smirnov@gmail.com>
References: <20170425191423.13294-1-andrew.smirnov@gmail.com>
Message-ID: <20170425191423.13294-10-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

List minimal set of packages needed to be installed alongside to be able
to run IPython with Python 3 (not tested on Python 2)

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/python-ipython/Config.in         | 10 ++++++++++
 package/python-ipython/python-ipython.mk | 14 ++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/package/python-ipython/Config.in b/package/python-ipython/Config.in
index 1d92873..a1dfd48 100644
--- a/package/python-ipython/Config.in
+++ b/package/python-ipython/Config.in
@@ -1,4 +1,14 @@
 config BR2_PACKAGE_PYTHON_IPYTHON
+	select BR2_PACKAGE_PYTHON_SIX
+	select BR2_PACKAGE_PYTHON_TRAITLETS
+	select BR2_PACKAGE_PYTHON_IPYTHON_GENUTILS
+	select BR2_PACKAGE_PYTHON_PYGMENTS
+	select BR2_PACKAGE_PYTHON_PEXPECT
+	select BR2_PACKAGE_PYTHON_PTYPROCESS
+	select BR2_PACKAGE_PYTHON_PICKLESHARE
+	select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT
+	select BR2_PACKAGE_PYTHON_SIMPLEGENERIC
+	select BR2_PACKAGE_PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE if BR2_PACKAGE_PYTHON
 	bool "python-ipython"
 	help
 	  IPython is a command shell for interactive computing in multiple
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index e57d69d..f627846 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -10,5 +10,19 @@ PYTHON_IPYTHON_SITE = https://pypi.python.org/packages/6e/cf/c2a3ca5942e2d808457
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst
 PYTHON_IPYTHON_SETUP_TYPE = distutils
+PYTHON_IPYTHON_DEPENDS = 	\
+	python-traitlets 	\
+	python-six 		\
+	python-ipython-genutils \
+	python-pygments		\
+	python-pexpect		\
+	python-ptyprocess	\
+	python-pickleshare	\
+	python-prompt-toolkit	\
+	python-simplegeneric
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+PYTHON_IPYTHON_DEPENDS += python-backports-shutil-get-terminal-size
+endif
 
 $(eval $(python-package))
-- 
2.9.3
