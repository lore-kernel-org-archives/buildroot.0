From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sat, 26 Oct 2019 17:29:40 +0200
Subject: [Buildroot] [PATCH v2 1/4] package/python-psutil: add host variant
In-Reply-To: <20191026152943.122511-1-titouan.christophe@railnova.eu>
References: <20191026152943.122511-1-titouan.christophe@railnova.eu>
Message-ID: <20191026152943.122511-2-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabrice Fontaine <fontaine.fabrice@gmail.com>

host-python-psutil for host-python3 is needed for mongodb >= 4.1.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/python-psutil/python-psutil.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index bb4d58930f..9b8cc883bc 100644
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
2.21.0
