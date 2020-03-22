From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 22 Mar 2020 22:10:01 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/python-jinja2: fix runtime
 python modules dependencies
Message-ID: <20200322211002.30765-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add python unicodedata runtime dependency, fixes:
  File "usr/lib/python3.8/site-packages/jinja2/lexer.py", line 46, in <module>
  ModuleNotFoundError: No module named 'unicodedata'
---
 package/python-jinja2/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-jinja2/Config.in b/package/python-jinja2/Config.in
index a1900e94d5..5b99df75b8 100644
--- a/package/python-jinja2/Config.in
+++ b/package/python-jinja2/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PYTHON_JINJA2
 	bool "python-jinja2"
 	select BR2_PACKAGE_PYTHON_MARKUPSAFE # runtime
+	select BR2_PACKAGE_PYTHON_UNICODEDATA if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_UNICODEDATA if BR2_PACKAGE_PYTHON3
 	help
 	  Jinja2 is a template engine written in pure Python. It
 	  provides a Django inspired non-XML syntax but supports
-- 
2.25.1
