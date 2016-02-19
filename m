From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Feb 2016 21:56:42 +0100
Subject: [Buildroot] [git commit] python-pycparser: python runtime added
Message-ID: <20160302202753.077FC7FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f699fab4ee178111b7f2870af1461e7dc9e29c04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                            | 1 +
 package/python-pycparser/Config.in           | 6 ++++++
 package/python-pycparser/python-pycparser.mk | 1 +
 3 files changed, 8 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index edf06f1..9199aea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -680,6 +680,7 @@ menu "External python modules"
 	source "package/python-psutil/Config.in"
 	source "package/python-pyasn/Config.in"
 	source "package/python-pycli/Config.in"
+	source "package/python-pycparser/Config.in"
 	source "package/python-pycrypto/Config.in"
 	source "package/python-pydal/Config.in"
 	source "package/python-pyftpdlib/Config.in"
diff --git a/package/python-pycparser/Config.in b/package/python-pycparser/Config.in
new file mode 100644
index 0000000..49190c3
--- /dev/null
+++ b/package/python-pycparser/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYCPARSER
+	bool "python-pycparser"
+	help
+	  C parser in Python
+
+	  https://github.com/eliben/pycparser
diff --git a/package/python-pycparser/python-pycparser.mk b/package/python-pycparser/python-pycparser.mk
index 328bc8a..a32f1aa 100644
--- a/package/python-pycparser/python-pycparser.mk
+++ b/package/python-pycparser/python-pycparser.mk
@@ -11,4 +11,5 @@ PYTHON_PYCPARSER_SETUP_TYPE = setuptools
 PYTHON_PYCPARSER_LICENSE = BSD-3c
 PYTHON_PYCPARSER_LICENSE_FILES = LICENSE
 
+$(eval $(python-package))
 $(eval $(host-python-package))
