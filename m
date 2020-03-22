From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 22 Mar 2020 22:10:02 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/python-flask: fix runtime python
 modules dependencies
In-Reply-To: <20200322211002.30765-1-ps.report@gmx.net>
References: <20200322211002.30765-1-ps.report@gmx.net>
Message-ID: <20200322211002.30765-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add python setuptools runtime dependency, fixes:
  ModuleNotFoundError: No module named 'pkg_resources'

- add python libxml2 runtime dependency, fixes:
  ModuleNotFoundError: No module named 'xml'

- add python ssl runtime dependency, fixes:
  AttributeError: 'NoneType' object has no attribute 'SSLContext'
---
 package/python-flask/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-flask/Config.in b/package/python-flask/Config.in
index 6f77913ed1..72fcb61999 100644
--- a/package/python-flask/Config.in
+++ b/package/python-flask/Config.in
@@ -2,8 +2,12 @@ config BR2_PACKAGE_PYTHON_FLASK
 	bool "python-flask"
 	select BR2_PACKAGE_PYTHON_CLICK # runtime
 	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
+	select BR2_PACKAGE_PYTHON_LXML # runtime
 	select BR2_PACKAGE_PYTHON_WERKZEUG # runtime
 	select BR2_PACKAGE_PYTHON_ITSDANGEROUS # runtime
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
 	help
-- 
2.25.1
