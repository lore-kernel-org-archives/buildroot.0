From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 21:55:01 +0100
Subject: [Buildroot] [git commit branch/next] package/python-flatbuffers:
 new package
Message-ID: <20200226204301.8BF84812B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=642f63a0dbcd8400659b160a5641a11582638070
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-flatbuffers/Config.in               |  6 ++++++
 package/python-flatbuffers/python-flatbuffers.hash |  3 +++
 package/python-flatbuffers/python-flatbuffers.mk   | 13 +++++++++++++
 5 files changed, 24 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 24b68ebe11..8f6a52b4fb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1167,6 +1167,7 @@ F:	package/python-async-lru/
 F:	package/python-async-timeout/
 F:	package/python-brotli/
 F:	package/python-cchardet/
+F:	package/python-flatbuffers/
 F:	package/python-frozenlist/
 F:	package/python-janus/
 F:	package/python-logstash/
diff --git a/package/Config.in b/package/Config.in
index 2edcee01a5..9d83d3948d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -942,6 +942,7 @@ menu "External python modules"
 	source "package/python-flask-jsonrpc/Config.in"
 	source "package/python-flask-login/Config.in"
 	source "package/python-flask-sqlalchemy/Config.in"
+	source "package/python-flatbuffers/Config.in"
 	source "package/python-flup/Config.in"
 	source "package/python-frozenlist/Config.in"
 	source "package/python-functools32/Config.in"
diff --git a/package/python-flatbuffers/Config.in b/package/python-flatbuffers/Config.in
new file mode 100644
index 0000000000..b24b5aaf64
--- /dev/null
+++ b/package/python-flatbuffers/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_FLATBUFFERS
+	bool "python-flatbuffers"
+	help
+	  The FlatBuffers serialization format for Python.
+
+	  https://github.com/google/flatbuffers
diff --git a/package/python-flatbuffers/python-flatbuffers.hash b/package/python-flatbuffers/python-flatbuffers.hash
new file mode 100644
index 0000000000..0cb5437906
--- /dev/null
+++ b/package/python-flatbuffers/python-flatbuffers.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/flatbuffers/json
+md5  b5f6c2246f45636dd49d9ff8a00d7f1c  flatbuffers-1.11.tar.gz
+sha256  f24185db54193540e3d684dc98aa7c2d89882341641548ceb36fd2589fef6c4e  flatbuffers-1.11.tar.gz
diff --git a/package/python-flatbuffers/python-flatbuffers.mk b/package/python-flatbuffers/python-flatbuffers.mk
new file mode 100644
index 0000000000..d0374c4787
--- /dev/null
+++ b/package/python-flatbuffers/python-flatbuffers.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-flatbuffers
+#
+################################################################################
+
+PYTHON_FLATBUFFERS_VERSION = 1.11
+PYTHON_FLATBUFFERS_SOURCE = flatbuffers-$(PYTHON_FLATBUFFERS_VERSION).tar.gz
+PYTHON_FLATBUFFERS_SITE = https://files.pythonhosted.org/packages/c6/b6/21478b76aa7ccab58da3beb85746b6844dee2112c0cc25b51ec64b46bdbb
+PYTHON_FLATBUFFERS_LICENSE = Apache-2.0
+PYTHON_FLATBUFFERS_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
