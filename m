From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 22:54:37 +1300
Subject: [Buildroot] [git commit] python-vcversioner: new package
Message-ID: <20170124095724.D694981EDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38a7c36c4d286610c1caa8df5e38e146f5db8051
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is needed only at the build stage, so make it
a host package.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-vcversioner/python-vcversioner.hash |  3 +++
 package/python-vcversioner/python-vcversioner.mk   | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/package/python-vcversioner/python-vcversioner.hash b/package/python-vcversioner/python-vcversioner.hash
new file mode 100644
index 0000000..58573a1
--- /dev/null
+++ b/package/python-vcversioner/python-vcversioner.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/vcversioner/json, sha256 locally computed
+md5	aab6ef5e0cf8614a1b1140ed5b7f107d  vcversioner-2.16.0.0.tar.gz
+sha256	dae60c17a479781f44a4010701833f1829140b1eeccd258762a74974aa06e19b  vcversioner-2.16.0.0.tar.gz
diff --git a/package/python-vcversioner/python-vcversioner.mk b/package/python-vcversioner/python-vcversioner.mk
new file mode 100644
index 0000000..e7a62f8
--- /dev/null
+++ b/package/python-vcversioner/python-vcversioner.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-vcversioner
+#
+################################################################################
+
+PYTHON_VCVERSIONER_VERSION = 2.16.0.0
+PYTHON_VCVERSIONER_SOURCE = vcversioner-$(PYTHON_VCVERSIONER_VERSION).tar.gz
+PYTHON_VCVERSIONER_SITE = https://pypi.python.org/packages/c5/cc/33162c0a7b28a4d8c83da07bc2b12cee58c120b4a9e8bba31c41c8d35a16
+PYTHON_VCVERSIONER_SETUP_TYPE = setuptools
+PYTHON_VCVERSIONER_LICENSE = ISC
+
+$(eval $(host-python-package))
