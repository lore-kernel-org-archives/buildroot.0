From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Apr 2020 09:08:43 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/python-flask: fix
 runtime python modules dependencies
Message-ID: <20200425065640.2D87E8FC46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0395e882e301445fcf3c04a6b0a6de70a2da2282
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

- add python setuptools runtime dependency, fixes:
  ModuleNotFoundError: No module named 'pkg_resources'

- add python libxml2 runtime dependency, fixes:
  ModuleNotFoundError: No module named 'xml'

- add python ssl runtime dependency, fixes:
  AttributeError: 'NoneType' object has no attribute 'SSLContext'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6576d26024f40647a15633b52a2a27c5779801e5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
