From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 21:13:27 +0200
Subject: [Buildroot] [git commit] python-fastentrypoints: new package
Message-ID: <20181020191151.EDEE488012@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8bdfb4f34f9a2250de3a4fbfba41241589c067fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-package that is able to shorten the load time of entry_points declared
in setup.py of python packages.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                                 |  1 +
 package/python-fastentrypoints/Config.in.host              |  6 ++++++
 package/python-fastentrypoints/python-fastentrypoints.hash |  4 ++++
 package/python-fastentrypoints/python-fastentrypoints.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 17db96aa62..61f3cac9e4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -205,6 +205,7 @@ F:	package/python-bcrypt/
 F:	package/python-bitstring/
 F:	package/python-constantly/
 F:	package/python-engineio/
+F:	package/python-fastentrypoints/
 F:	package/python-fire/
 F:	package/python-h2/
 F:	package/python-idna/
diff --git a/package/python-fastentrypoints/Config.in.host b/package/python-fastentrypoints/Config.in.host
new file mode 100644
index 0000000000..91605509ab
--- /dev/null
+++ b/package/python-fastentrypoints/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_PYTHON_FASTENTRYPOINTS
+	bool "host python-fastentrypoints"
+	help
+	  Makes entry_points specified in setup.py load more quickly.
+
+	  https://github.com/ninjaaron/fast-entry_points
diff --git a/package/python-fastentrypoints/python-fastentrypoints.hash b/package/python-fastentrypoints/python-fastentrypoints.hash
new file mode 100644
index 0000000000..84e9b78287
--- /dev/null
+++ b/package/python-fastentrypoints/python-fastentrypoints.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/fastentrypoints/json, sha256 locally computed
+md5	9bd2a34697eb8279d87e7b927f4f7e85  fastentrypoints-0.10.tar.gz
+sha256	ed418146ed87230694ec2d8890b9b3e2967e95d857e5ce933cafecb1067cca82  fastentrypoints-0.10.tar.gz
+sha256	2da210da31c033faa270503884a3ac9058874543e6fdd0b094000720bf2ffb66  fastentrypoints.py
diff --git a/package/python-fastentrypoints/python-fastentrypoints.mk b/package/python-fastentrypoints/python-fastentrypoints.mk
new file mode 100644
index 0000000000..c4eb3e862f
--- /dev/null
+++ b/package/python-fastentrypoints/python-fastentrypoints.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-fastentrypoints
+#
+################################################################################
+
+PYTHON_FASTENTRYPOINTS_VERSION = 0.10
+PYTHON_FASTENTRYPOINTS_SOURCE = fastentrypoints-$(PYTHON_FASTENTRYPOINTS_VERSION).tar.gz
+PYTHON_FASTENTRYPOINTS_SITE = https://pypi.python.org/packages/e8/c8/c2902c9c9da43d8be8c75a730f15f0c51933c42c39b91d1d7b605a88e907
+PYTHON_FASTENTRYPOINTS_SETUP_TYPE = setuptools
+PYTHON_FASTENTRYPOINTS_LICENSE = BSD-2-Clause
+PYTHON_FASTENTRYPOINTS_LICENSE_FILES = fastentrypoints.py
+
+$(eval $(host-python-package))
