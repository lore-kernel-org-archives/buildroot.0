From: Lothar Felten <lothar.felten@gmail.com>
Date: Fri, 20 Oct 2017 22:34:34 +0200
Subject: [Buildroot] [PATCH 1/1] python-xlrd: add as host package
Message-ID: <1508531674-6145-1-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds the xlrd module for the host.
Currently there is no buildroot package that depends on this module.

I use it to process excel files, other might find it usefull too.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 package/python-xlrd/Config.in.host | 7 +++++++
 package/python-xlrd/python-xlrd.mk | 1 +
 2 files changed, 8 insertions(+)
 create mode 100644 package/python-xlrd/Config.in.host

diff --git a/package/python-xlrd/Config.in.host b/package/python-xlrd/Config.in.host
new file mode 100644
index 0000000..4935925
--- /dev/null
+++ b/package/python-xlrd/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_PYTHON_XLRD
+	bool "host python-xlrd"
+	help
+	  Library for developers to extract data from Microsoft Excel (tm)
+	  spreadsheet files.
+
+	  http://www.python-excel.org/
diff --git a/package/python-xlrd/python-xlrd.mk b/package/python-xlrd/python-xlrd.mk
index e3f078c..5d13638 100644
--- a/package/python-xlrd/python-xlrd.mk
+++ b/package/python-xlrd/python-xlrd.mk
@@ -12,3 +12,4 @@ PYTHON_XLRD_LICENSE = BSD-3-Clause
 PYTHON_XLRD_LICENSE_FILES = xlrd/licences.py
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
1.9.1
