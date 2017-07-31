From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 21:31:35 +0200
Subject: [Buildroot] [git commit] python-priority: new package
Message-ID: <20170731192747.DD6C6800E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a98c4aea82314ef4c5b9aa9858dd86a121bdda0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                            |  1 +
 package/python-priority/Config.in            |  6 ++++++
 package/python-priority/python-priority.hash |  3 +++
 package/python-priority/python-priority.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d595e88..86d714d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -797,6 +797,7 @@ menu "External python modules"
 	source "package/python-pillow/Config.in"
 	source "package/python-portend/Config.in"
 	source "package/python-posix-ipc/Config.in"
+	source "package/python-priority/Config.in"
 	source "package/python-prompt-toolkit/Config.in"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
diff --git a/package/python-priority/Config.in b/package/python-priority/Config.in
new file mode 100644
index 0000000..b73b7e2
--- /dev/null
+++ b/package/python-priority/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PRIORITY
+	bool "python-priority"
+	help
+	  A pure-Python implementation of the HTTP/2 priority tree.
+
+	  http://python-hyper.org/priority/
diff --git a/package/python-priority/python-priority.hash b/package/python-priority/python-priority.hash
new file mode 100644
index 0000000..e115d6a
--- /dev/null
+++ b/package/python-priority/python-priority.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/priority/json, sha256 locally computed
+md5	4f1ff52f7fa448e9d9cb46337ae86d1e  priority-1.3.0.tar.gz
+sha256	6bc1961a6d7fcacbfc337769f1a382c8e746566aaa365e78047abe9f66b2ffbe  priority-1.3.0.tar.gz
diff --git a/package/python-priority/python-priority.mk b/package/python-priority/python-priority.mk
new file mode 100644
index 0000000..8b6dbc1
--- /dev/null
+++ b/package/python-priority/python-priority.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-priority
+#
+################################################################################
+
+PYTHON_PRIORITY_VERSION = 1.3.0
+PYTHON_PRIORITY_SOURCE = priority-$(PYTHON_PRIORITY_VERSION).tar.gz
+PYTHON_PRIORITY_SITE = https://pypi.python.org/packages/ba/96/7d0b024087062418dfe02a68cd6b195399266ac002fb517aad94cc93e076
+PYTHON_PRIORITY_SETUP_TYPE = setuptools
+PYTHON_PRIORITY_LICENSE = MIT
+PYTHON_PRIORITY_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
