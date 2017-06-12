From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 12 Jun 2017 16:42:15 -0700
Subject: [Buildroot] [PATCH v4 6/7] package/python-ipython: Add dependecy
	list
In-Reply-To: <20170612234216.902-1-andrew.smirnov@gmail.com>
References: <20170612234216.902-1-andrew.smirnov@gmail.com>
Message-ID: <20170612234216.902-7-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

List minimal set of packages needed to be installed alongside to be able
to run IPython 5.2.2 with Python 2/3.

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/python-ipython/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/python-ipython/Config.in b/package/python-ipython/Config.in
index b87f2bc..da196be 100644
--- a/package/python-ipython/Config.in
+++ b/package/python-ipython/Config.in
@@ -1,5 +1,14 @@
 config BR2_PACKAGE_PYTHON_IPYTHON
 	bool "python-ipython"
+	select BR2_PACKAGE_PYTHON_PEXPECT # runtime
+	select BR2_PACKAGE_PYTHON_PATHLIB2 if BR2_PACKAGE_PYTHON  # runtime
+	select BR2_PACKAGE_PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE if BR2_PACKAGE_PYTHON  # runtime
+	select BR2_PACKAGE_PYTHON_TRAITLETS  # runtime
+	select BR2_PACKAGE_PYTHON_SIMPLEGENERIC  # runtime
+	select BR2_PACKAGE_PYTHON_PYGMENTS  # runtime
+	select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT # runtime
+	select BR2_PACKAGE_PYTHON_PICKLESHARE # runtime
+	select BR2_PACKAGE_PYTHON_DECORATOR # runtime
 	help
 	  IPython is a command shell for interactive computing in
 	  multiple programming languages, originally developed for the
-- 
2.9.4
