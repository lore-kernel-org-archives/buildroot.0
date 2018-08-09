From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Aug 2018 16:58:22 +0200
Subject: [Buildroot] [git commit branch/next] package: add python-semver
Message-ID: <20180809145213.376BF8B6F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa680e2903e8f9e8c2ed26c5f5ce7bb005c3be6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-semver/Config.in          |  6 ++++++
 package/python-semver/python-semver.hash |  3 +++
 package/python-semver/python-semver.mk   | 14 ++++++++++++++
 5 files changed, 25 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 215506c71c..67adc08b9a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1557,6 +1557,7 @@ F:	package/python-ipaddr/
 F:	package/python-pam/
 F:	package/python-psutil/
 F:	package/python-request-id/
+F:	package/python-semver/
 F:	package/python-texttable/
 F:	package/python-validators/
 F:	package/python-webob/
diff --git a/package/Config.in b/package/Config.in
index f5a17492c7..18813b3965 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -940,6 +940,7 @@ menu "External python modules"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-secretstorage/Config.in"
 	source "package/python-see/Config.in"
+	source "package/python-semver/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-service-identity/Config.in"
 	source "package/python-setproctitle/Config.in"
diff --git a/package/python-semver/Config.in b/package/python-semver/Config.in
new file mode 100644
index 0000000000..c66231a730
--- /dev/null
+++ b/package/python-semver/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_SEMVER
+	bool "python-semver"
+	help
+	  Python helper for Semantic Versioning (http://semver.org/).
+
+	  https://github.com/k-bx/python-semver
diff --git a/package/python-semver/python-semver.hash b/package/python-semver/python-semver.hash
new file mode 100644
index 0000000000..e18cc1c672
--- /dev/null
+++ b/package/python-semver/python-semver.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/semver/json
+md5	dc579ba9d0bb2137bad5324d4bdb7e40  semver-2.8.1.tar.gz
+sha256	5b09010a66d9a3837211bb7ae5a20d10ba88f8cb49e92cb139a69ef90d5060d8  semver-2.8.1.tar.gz
diff --git a/package/python-semver/python-semver.mk b/package/python-semver/python-semver.mk
new file mode 100644
index 0000000000..afdd34564e
--- /dev/null
+++ b/package/python-semver/python-semver.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-semver
+#
+################################################################################
+
+PYTHON_SEMVER_VERSION = 2.8.1
+PYTHON_SEMVER_SOURCE = semver-$(PYTHON_SEMVER_VERSION).tar.gz
+PYTHON_SEMVER_SITE = https://files.pythonhosted.org/packages/47/13/8ae74584d6dd33a1d640ea27cd656a9f718132e75d759c09377d10d64595
+PYTHON_SEMVER_SETUP_TYPE = setuptools
+# no license file in tarball, but available in git
+PYTHON_SEMVER_LICENSE = BSD-3-Clause
+
+$(eval $(python-package))
