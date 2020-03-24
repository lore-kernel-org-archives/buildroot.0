From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 22:16:44 +0100
Subject: [Buildroot] [git commit] package/python-flask: fix runtime python
 modules dependencies
Message-ID: <20200324210405.7BAF58817D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6576d26024f40647a15633b52a2a27c5779801e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- add python setuptools runtime dependency, fixes:
  ModuleNotFoundError: No module named 'pkg_resources'

- add python libxml2 runtime dependency, fixes:
  ModuleNotFoundError: No module named 'xml'

- add python ssl runtime dependency, fixes:
  AttributeError: 'NoneType' object has no attribute 'SSLContext'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
