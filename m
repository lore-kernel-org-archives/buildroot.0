From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jun 2017 23:07:02 +0200
Subject: [Buildroot] [git commit] package/python-ipython: Add dependecy list
Message-ID: <20170615210645.6F9F2818AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3bf0d87f5e40aa3213a1451e74c6d1f2a9b6dd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

List minimal set of packages needed to be installed alongside to be able
to run IPython 5.2.2 with Python 2/3.

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
[Thomas: use alphabetic ordering.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-ipython/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/python-ipython/Config.in b/package/python-ipython/Config.in
index b87f2bc..d8164af 100644
--- a/package/python-ipython/Config.in
+++ b/package/python-ipython/Config.in
@@ -1,5 +1,14 @@
 config BR2_PACKAGE_PYTHON_IPYTHON
 	bool "python-ipython"
+	select BR2_PACKAGE_PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE if BR2_PACKAGE_PYTHON  # runtime
+	select BR2_PACKAGE_PYTHON_DECORATOR # runtime
+	select BR2_PACKAGE_PYTHON_PATHLIB2 if BR2_PACKAGE_PYTHON  # runtime
+	select BR2_PACKAGE_PYTHON_PICKLESHARE # runtime
+	select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT # runtime
+	select BR2_PACKAGE_PYTHON_PYGMENTS  # runtime
+	select BR2_PACKAGE_PYTHON_PEXPECT # runtime
+	select BR2_PACKAGE_PYTHON_SIMPLEGENERIC  # runtime
+	select BR2_PACKAGE_PYTHON_TRAITLETS  # runtime
 	help
 	  IPython is a command shell for interactive computing in
 	  multiple programming languages, originally developed for the
