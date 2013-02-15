From: Patrick Gerber <kpa_info@yahoo.fr>
Date: Fri, 15 Feb 2013 11:00:10 +0100
Subject: [Buildroot] [PATCH v4 3/5] Add PYTHON variable to ease the support
	of both version
In-Reply-To: <1360922412-32559-1-git-send-email-kpa_info@yahoo.fr>
References: <1360922412-32559-1-git-send-email-kpa_info@yahoo.fr>
Message-ID: <1360922412-32559-4-git-send-email-kpa_info@yahoo.fr>
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
 package/python/python.mk   |    6 ++++++
 package/python3/python3.mk |    6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/python/python.mk b/package/python/python.mk
index 71591b7..6a7de43 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -53,6 +53,12 @@ HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
 
 PYTHON_INSTALL_STAGING = YES
 
+# The PYTHON variable could be used by external python package to
+# works with both python's version (python and python3)
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+	PYTHON = python
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON_READLINE),y)
 PYTHON_DEPENDENCIES += readline
 endif
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 74af9b4..44136fc 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -55,6 +55,12 @@ HOST_PYTHON3_DEPENDENCIES = host-expat host-zlib
 
 PYTHON3_INSTALL_STAGING = YES
 
+# The PYTHON variable could be used by external python package to
+# works with both python's version (python and python3)
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+	PYTHON = python3
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON3_READLINE),y)
 PYTHON3_DEPENDENCIES += readline
 endif
-- 
1.7.9.5
