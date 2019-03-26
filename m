From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 27 Mar 2019 00:13:04 +0100
Subject: [Buildroot] [git commit] python-pyjwt: new package
Message-ID: <20190326234920.542EA811D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4454dec17f6b5e3ea43d665adf84a8db8f62814c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PyJWT is a Python library which allows you to encode and decode
JSON Web Tokens (JWT). JWT is an open, industry-standard (RFC 7519)
for representing claims securely between two parties.

https://github.com/jpadilla/pyjwt

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
[Arnout: bump to 1.7.1]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-pyjwt/Config.in         |  6 ++++++
 package/python-pyjwt/python-pyjwt.hash |  5 +++++
 package/python-pyjwt/python-pyjwt.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index eaf8250591..3dfdf894d7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -944,6 +944,7 @@ F:	package/python-aioblescan/
 F:	package/python-falcon/
 F:	package/python-mimeparse/
 F:	package/python-pigpio/
+F:	package/python-pyjwt/
 F:	package/python-wtforms/
 
 N:	Guillaume Gardet <guillaume.gardet@oliseo.fr>
diff --git a/package/Config.in b/package/Config.in
index a3ac229c77..09a2b80614 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -982,6 +982,7 @@ menu "External python modules"
 	source "package/python-pyhamcrest/Config.in"
 	source "package/python-pyicu/Config.in"
 	source "package/python-pyinotify/Config.in"
+	source "package/python-pyjwt/Config.in"
 	source "package/python-pylibftdi/Config.in"
 	source "package/python-pylru/Config.in"
 	source "package/python-pymodbus/Config.in"
diff --git a/package/python-pyjwt/Config.in b/package/python-pyjwt/Config.in
new file mode 100644
index 0000000000..510875ce2f
--- /dev/null
+++ b/package/python-pyjwt/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYJWT
+	bool "python-pyjwt"
+	help
+	  JSON Web Token implementation in Python.
+
+	  http://github.com/jpadilla/pyjwt
diff --git a/package/python-pyjwt/python-pyjwt.hash b/package/python-pyjwt/python-pyjwt.hash
new file mode 100644
index 0000000000..62ec3559af
--- /dev/null
+++ b/package/python-pyjwt/python-pyjwt.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/PyJWT/json
+md5	a4712f980c008696e13e09504120b2a0  PyJWT-1.7.1.tar.gz
+sha256	8d59a976fb773f3e6a39c85636357c4f0e242707394cadadd9814f5cbaa20e96  PyJWT-1.7.1.tar.gz
+# Locally computed sha256 checksums
+sha256	ec82af815b5f9da8685afb300cc5beb7949e1c22b79b6c1c054796cefdf6cac6  LICENSE
diff --git a/package/python-pyjwt/python-pyjwt.mk b/package/python-pyjwt/python-pyjwt.mk
new file mode 100644
index 0000000000..dfc66e5651
--- /dev/null
+++ b/package/python-pyjwt/python-pyjwt.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyjwt
+#
+################################################################################
+
+PYTHON_PYJWT_VERSION = 1.7.1
+PYTHON_PYJWT_SOURCE = PyJWT-$(PYTHON_PYJWT_VERSION).tar.gz
+PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/2f/38/ff37a24c0243c5f45f5798bd120c0f873eeed073994133c084e1cf13b95c
+PYTHON_PYJWT_SETUP_TYPE = setuptools
+PYTHON_PYJWT_LICENSE = MIT
+PYTHON_PYJWT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
