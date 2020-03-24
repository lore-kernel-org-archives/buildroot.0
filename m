From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 22:16:44 +0100
Subject: [Buildroot] [git commit] package/python-jinja2: fix runtime python
 modules dependencies
Message-ID: <20200324210405.730988817D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19d12c1df8d2aebc6206a79f852d93a69e7e45a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- add python unicodedata runtime dependency, fixes:
  File "usr/lib/python3.8/site-packages/jinja2/lexer.py", line 46, in <module>
  ModuleNotFoundError: No module named 'unicodedata'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
