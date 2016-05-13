From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 22:34:22 +0200
Subject: [Buildroot] [git commit branch/next] python-flask-jsonrpc: new
	package
Message-ID: <20160513203503.7546981DC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7823ae38ec652ef240c6af9ecfd53cea77db89c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas:
 - make python-flask a runtime dependency only, as noticed by Yegor
   Yefremov.
 - use setup.py as the license file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                      |  1 +
 package/python-flask-jsonrpc/Config.in                 |  8 ++++++++
 package/python-flask-jsonrpc/python-flask-jsonrpc.hash |  3 +++
 package/python-flask-jsonrpc/python-flask-jsonrpc.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 9d668bf..804df8b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -658,6 +658,7 @@ menu "External python modules"
 	source "package/python-enum/Config.in"
 	source "package/python-enum34/Config.in"
 	source "package/python-flask/Config.in"
+	source "package/python-flask-jsonrpc/Config.in"
 	source "package/python-flup/Config.in"
 	source "package/python-gobject/Config.in"
 	source "package/python-html5lib/Config.in"
diff --git a/package/python-flask-jsonrpc/Config.in b/package/python-flask-jsonrpc/Config.in
new file mode 100644
index 0000000..c8ecd85
--- /dev/null
+++ b/package/python-flask-jsonrpc/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_FLASK_JSONRPC
+	bool "python-flask-jsonrpc"
+	# runtime dependency
+	select BR2_PACKAGE_PYTHON_FLASK
+	help
+	  A basic JSON-RPC implementation for your Flask-powered sites.
+
+	  https://github.com/cenobites/flask-jsonrpc
diff --git a/package/python-flask-jsonrpc/python-flask-jsonrpc.hash b/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
new file mode 100644
index 0000000..8b91af7
--- /dev/null
+++ b/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/Flask-JSONRPC/0.3, sha256 locally computed:
+md5    a5beca4c3a882315f9b81acb57e83c68                                 Flask-JSONRPC-0.3.tar.gz
+sha256 5baf70bf9cf955e95c02316982026a122b89a5f4c78c5b26f9f476abdb3e13bc Flask-JSONRPC-0.3.tar.gz
diff --git a/package/python-flask-jsonrpc/python-flask-jsonrpc.mk b/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
new file mode 100644
index 0000000..624322e
--- /dev/null
+++ b/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-flask-jsonrpc
+#
+################################################################################
+
+PYTHON_FLASK_JSONRPC_VERSION = 0.3
+PYTHON_FLASK_JSONRPC_SOURCE = Flask-JSONRPC-$(PYTHON_FLASK_JSONRPC_VERSION).tar.gz
+PYTHON_FLASK_JSONRPC_SITE = http://pypi.python.org/packages/source/F/Flask-JSONRPC
+PYTHON_FLASK_JSONRPC_LICENSE = BSD-3c
+PYTHON_FLASK_JSONRPC_LICENSE_FILES = setup.py
+PYTHON_FLASK_JSONRPC_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
