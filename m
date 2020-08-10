From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 10 Aug 2020 10:59:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-gunicorn: select
 python-setuptools
Message-ID: <20200810085920.447530-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=13111

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-gunicorn/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-gunicorn/Config.in b/package/python-gunicorn/Config.in
index 518157bf93..b3d11cf199 100644
--- a/package/python-gunicorn/Config.in
+++ b/package/python-gunicorn/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_GUNICORN
 	bool "python-gunicorn"
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
 	help
-- 
2.27.0
