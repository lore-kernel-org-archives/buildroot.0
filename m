From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 27 Apr 2019 16:41:33 +0200
Subject: [Buildroot] [PATCH 1/4] package/python-psutil: add host variant
Message-ID: <20190427144136.9072-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-python-psutil for host-python3 is needed for mongodb >= 4.1.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-psutil/python-psutil.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 3a6e7961bc..f1c48e48ae 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -11,4 +11,8 @@ PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
 
+# Needed to build mongodb
+HOST_PYTHON_PSUTIL_NEEDS_HOST_PYTHON = python3
+
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.20.1
