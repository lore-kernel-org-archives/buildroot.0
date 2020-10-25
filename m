From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 16:03:16 +0100
Subject: [Buildroot] [git commit] package/python-xmodem: new package
Message-ID: <20201025145145.549A283621@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c3e33104372657c84d57d3ee920bf15af9824ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Source package of newest release does not contain license file, so
PKG-INFO is used for now. Missing LICENSE file was added to master
branch of xmodem repository ([1]), so hopefully it will replace PKG-INFO
check after new xmodem release.

[1] https://github.com/tehmaze/xmodem/pull/42

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-xmodem/Config.in          |  6 ++++++
 package/python-xmodem/python-xmodem.hash |  5 +++++
 package/python-xmodem/python-xmodem.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e1816ed260..be8cc88b52 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1597,6 +1597,7 @@ F:	package/python-iniconfig/
 F:	package/python-packaging/
 F:	package/python-pluggy/
 F:	package/python-pytest/
+F:	package/python-xmodem/
 F:	package/rs485conf/
 F:	package/turbolua/
 F:	support/testing/tests/package/sample_python_pytest.py
diff --git a/package/Config.in b/package/Config.in
index 504cfec98e..29d5715889 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1235,6 +1235,7 @@ menu "External python modules"
 	source "package/python-xlutils/Config.in"
 	source "package/python-xlwt/Config.in"
 	source "package/python-xmltodict/Config.in"
+	source "package/python-xmodem/Config.in"
 	source "package/python-yarl/Config.in"
 	source "package/python-yatl/Config.in"
 	source "package/python-yieldfrom/Config.in"
diff --git a/package/python-xmodem/Config.in b/package/python-xmodem/Config.in
new file mode 100644
index 0000000000..ef927f1337
--- /dev/null
+++ b/package/python-xmodem/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_XMODEM
+	bool "python-xmodem"
+	help
+	  XMODEM protocol implementation.
+
+	  https://github.com/tehmaze/xmodem
diff --git a/package/python-xmodem/python-xmodem.hash b/package/python-xmodem/python-xmodem.hash
new file mode 100644
index 0000000000..33ddfeb595
--- /dev/null
+++ b/package/python-xmodem/python-xmodem.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/xmodem/json
+md5  f876cb35caf276b61990377710a3b4c4  xmodem-0.4.6.tar.gz
+sha256  089737298f5738eabc43f2519efdc80b402693768f16383f7013b9e6f8f279d7  xmodem-0.4.6.tar.gz
+# locally calculated
+sha256  5ddb38acab95bb77e1e92e22830e358082d879d2dd59ba05577c47791edaa78e  PKG-INFO
diff --git a/package/python-xmodem/python-xmodem.mk b/package/python-xmodem/python-xmodem.mk
new file mode 100644
index 0000000000..739c6154d7
--- /dev/null
+++ b/package/python-xmodem/python-xmodem.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-xmodem
+#
+################################################################################
+
+PYTHON_XMODEM_VERSION = 0.4.6
+PYTHON_XMODEM_SOURCE = xmodem-$(PYTHON_XMODEM_VERSION).tar.gz
+PYTHON_XMODEM_SITE = https://files.pythonhosted.org/packages/29/5d/a20d7957f207fc4c4c143881ca7b9617ab7700c153012372ef0a934c7710
+PYTHON_XMODEM_SETUP_TYPE = setuptools
+PYTHON_XMODEM_LICENSE = MIT
+PYTHON_XMODEM_LICENSE_FILES = PKG-INFO
+
+$(eval $(python-package))
