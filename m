From: Patrick Gerber <kpa_info@yahoo.fr>
Date: Tue, 12 Feb 2013 13:24:07 +0100
Subject: [Buildroot] [PATCH 3/5] Define a new variable called
	PYTHON_GENERIC_DEPENDENCIES either to "python" or "python3"
	depending of the selected Python version. This is needed to
	easily set dependencies for packages that could be used
	either with Python 2 or Python 3.
In-Reply-To: <1360671849-7621-1-git-send-email-kpa_info@yahoo.fr>
References: <1360671849-7621-1-git-send-email-kpa_info@yahoo.fr>
Message-ID: <1360671849-7621-4-git-send-email-kpa_info@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>
---
 package/python-generic/python-generic.mk |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 package/python-generic/python-generic.mk

diff --git a/package/python-generic/python-generic.mk b/package/python-generic/python-generic.mk
new file mode 100644
index 0000000..0cf0e9d
--- /dev/null
+++ b/package/python-generic/python-generic.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# python-generic
+#
+#############################################################
+# PYTHON_GENERIC_DEPENDENCIES is defined to the selected python 
+# version. 
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+	PYTHON_GENERIC_DEPENDENCIES = python
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+	PYTHON_GENERIC_DEPENDENCIES = python3
+endif
+
-- 
1.7.10.4
