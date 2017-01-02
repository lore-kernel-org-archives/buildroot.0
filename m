From: David Bachelart <david.bachelart@bbright.com>
Date: Mon,  2 Jan 2017 16:45:26 +0100
Subject: [Buildroot] [PATCH v2] python-whoosh: new package
In-Reply-To: <1483371929-13907-1-git-send-email-david.bachelart@bbright.com>
References: <1483371929-13907-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <1483371929-13907-5-git-send-email-david.bachelart@bbright.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: David Bachelart <david.bachelart@bbright.com>
---
Changes v1 -> v2:
  - change comment format in .hash file (suggested by Yegor Yefremov)
---
 package/Config.in                        |  1 +
 package/python-whoosh/Config.in          |  9 +++++++++
 package/python-whoosh/python-whoosh.hash |  3 +++
 package/python-whoosh/python-whoosh.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-whoosh/Config.in
 create mode 100644 package/python-whoosh/python-whoosh.hash
 create mode 100644 package/python-whoosh/python-whoosh.mk

diff --git a/package/Config.in b/package/Config.in
index 59fa851..0c3eb1c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -810,6 +810,7 @@ menu "External python modules"
 	source "package/python-web2py/Config.in"
 	source "package/python-webpy/Config.in"
 	source "package/python-werkzeug/Config.in"
+	source "package/python-whoosh/Config.in"
 	source "package/python-ws4py/Config.in"
 	source "package/python-wsaccel/Config.in"
 	source "package/python-xlrd/Config.in"
diff --git a/package/python-whoosh/Config.in b/package/python-whoosh/Config.in
new file mode 100644
index 0000000..3722704
--- /dev/null
+++ b/package/python-whoosh/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_WHOOSH
+	bool "python-whoosh"
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
+	help
+	  Whoosh is a fast, pure-Python full text indexing, search, and 
+	  spell checking library.
+
+	  https://pypi.python.org/pypi/Whoosh/
diff --git a/package/python-whoosh/python-whoosh.hash b/package/python-whoosh/python-whoosh.hash
new file mode 100644
index 0000000..b14dd0f
--- /dev/null
+++ b/package/python-whoosh/python-whoosh.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/Whoosh/json, sha256 locally computed
+md5	9a0fc2df9335e1d2e81dd84a2c4c416f  Whoosh-2.7.0.tar.gz
+sha256	cdfc0e1c5173207ac7b312afe78d83fb552cfed30427bf7b3dba8b1d26cea8f7  Whoosh-2.7.0.tar.gz
diff --git a/package/python-whoosh/python-whoosh.mk b/package/python-whoosh/python-whoosh.mk
new file mode 100644
index 0000000..64f3820
--- /dev/null
+++ b/package/python-whoosh/python-whoosh.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-whoosh
+#
+################################################################################
+
+PYTHON_WHOOSH_VERSION = 2.7.0
+PYTHON_WHOOSH_SOURCE = Whoosh-$(PYTHON_WHOOSH_VERSION).tar.gz
+PYTHON_WHOOSH_SITE = http://pypi.python.org/packages/source/W/Whoosh
+PYTHON_WHOOSH_SETUP_TYPE = setuptools
+PYTHON_WHOOSH_LICENSE = BSD-3c
+PYTHON_WHOOSH_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.1.4
