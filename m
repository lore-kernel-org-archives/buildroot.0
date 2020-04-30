From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Thu, 30 Apr 2020 15:20:20 +0200
Subject: [Buildroot] [PATCH] package/python-xmodem: new package
Message-ID: <20200430132020.2476465-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-xmodem/Config.in          |  6 ++++++
 package/python-xmodem/python-xmodem.hash |  3 +++
 package/python-xmodem/python-xmodem.mk   | 13 +++++++++++++
 5 files changed, 24 insertions(+)
 create mode 100644 package/python-xmodem/Config.in
 create mode 100644 package/python-xmodem/python-xmodem.hash
 create mode 100644 package/python-xmodem/python-xmodem.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cc72b288be..8d4ad02a38 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1598,6 +1598,7 @@ F:	package/lua-stdlib/
 F:	package/luaossl/
 F:	package/murata-cyw-fw/
 F:	package/netdata/
+F:	package/python-xmodem/
 F:	package/rs485conf/
 F:	package/turbolua/
 F:	support/testing/tests/package/test_netdata.py
diff --git a/package/Config.in b/package/Config.in
index 53c8ce0e29..49671993ed 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1213,6 +1213,7 @@ menu "External python modules"
 	source "package/python-xlutils/Config.in"
 	source "package/python-xlwt/Config.in"
 	source "package/python-xmltodict/Config.in"
+	source "package/python-xmodem/Config.in"
 	source "package/python-yarl/Config.in"
 	source "package/python-yieldfrom/Config.in"
 	source "package/python-zc-lockfile/Config.in"
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
index 0000000000..268fe30bf7
--- /dev/null
+++ b/package/python-xmodem/python-xmodem.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/xmodem/json
+md5  f876cb35caf276b61990377710a3b4c4  xmodem-0.4.6.tar.gz
+sha256  089737298f5738eabc43f2519efdc80b402693768f16383f7013b9e6f8f279d7  xmodem-0.4.6.tar.gz
diff --git a/package/python-xmodem/python-xmodem.mk b/package/python-xmodem/python-xmodem.mk
new file mode 100644
index 0000000000..a6ca46f857
--- /dev/null
+++ b/package/python-xmodem/python-xmodem.mk
@@ -0,0 +1,13 @@
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
+
+$(eval $(python-package))
-- 
2.26.2
