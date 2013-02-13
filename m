From: Patrick Gerber <kpa_info@yahoo.fr>
Date: Wed, 13 Feb 2013 10:20:35 +0100
Subject: [Buildroot] [PATCH v3 3/5] Add common declaration to ease the
	support of both version
In-Reply-To: <1360747237-30048-1-git-send-email-kpa_info@yahoo.fr>
References: <1360747237-30048-1-git-send-email-kpa_info@yahoo.fr>
Message-ID: <1360747237-30048-4-git-send-email-kpa_info@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Define a new variable called PYTHON that contains either "python" or
"python3" depending of the selected Python version. This is needed
to easily set dependencies and to call the right version of python
for packages that support both version of python.

Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>
---
 package/python-common/python-common.mk |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 package/python-common/python-common.mk

diff --git a/package/python-common/python-common.mk b/package/python-common/python-common.mk
new file mode 100644
index 0000000..712b895
--- /dev/null
+++ b/package/python-common/python-common.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# python-common
+#
+#############################################################
+# Define some symbol usefull to make python package that works 
+# with python2 and python3. 
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+	PYTHON = python
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+	PYTHON = python3
+endif
+
-- 
1.7.9.5
