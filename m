From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 27 Apr 2017 14:33:40 -0700
Subject: [Buildroot] [PATCH v2 10/10] package/python-ipython: Add dependecy
	list
In-Reply-To: <20170427213340.26917-1-andrew.smirnov@gmail.com>
References: <20170427213340.26917-1-andrew.smirnov@gmail.com>
Message-ID: <20170427213340.26917-11-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

List minimal set of packages needed to be installed alongside to be able
to run IPython with Python 2/3.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/python-ipython/Config.in | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/python-ipython/Config.in b/package/python-ipython/Config.in
index b87f2bc..eda8227 100644
--- a/package/python-ipython/Config.in
+++ b/package/python-ipython/Config.in
@@ -1,5 +1,15 @@
 config BR2_PACKAGE_PYTHON_IPYTHON
 	bool "python-ipython"
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
 	help
 	  IPython is a command shell for interactive computing in
 	  multiple programming languages, originally developed for the
-- 
2.9.3
