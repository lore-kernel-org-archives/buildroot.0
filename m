From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 1 Apr 2018 14:07:33 +0200
Subject: [Buildroot] [git commit] python-xlrd: add as host package
Message-ID: <20180401120741.AD9CC8296B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1fb409167f8ff04f1867159ae47fe5a9bc6a75ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Post-build/image scripts may need to extract information from Microsoft
Excel (tm) spreadsheet files.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
[Arnout: add package/Config.in.host entry]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in.host             | 1 +
 package/python-xlrd/Config.in.host | 7 +++++++
 package/python-xlrd/python-xlrd.mk | 1 +
 3 files changed, 9 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 199a8e9856..563a277795 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -44,6 +44,7 @@ menu "Host utilities"
 	source "package/pwgen/Config.in.host"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-six/Config.in.host"
+	source "package/python-xlrd/Config.in.host"
 	source "package/qemu/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
diff --git a/package/python-xlrd/Config.in.host b/package/python-xlrd/Config.in.host
new file mode 100644
index 0000000000..493592562c
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
index e3f078c355..5d1363886d 100644
--- a/package/python-xlrd/python-xlrd.mk
+++ b/package/python-xlrd/python-xlrd.mk
@@ -12,3 +12,4 @@ PYTHON_XLRD_LICENSE = BSD-3-Clause
 PYTHON_XLRD_LICENSE_FILES = xlrd/licences.py
 
 $(eval $(python-package))
+$(eval $(host-python-package))
