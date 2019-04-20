From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 16:42:19 +0200
Subject: [Buildroot] [git commit] package/python-parso: new package
Message-ID: <20190420195618.9430388274@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4baa7a76384e2da9d74811aadd63cdbe2968d05f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A Python Parser.

https://github.com/davidhalter/parso

python-parso is a runtime dependency of python-jedi

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: mention Python-2.0 and BSD-3-Clause in licenses]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-parso/Config.in         |  6 ++++++
 package/python-parso/python-parso.hash |  7 +++++++
 package/python-parso/python-parso.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 89c5f529ed..52b9f1fe56 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -834,6 +834,7 @@ F:	package/oniguruma/
 F:	package/oprofile/
 F:	package/pcmanfm/
 F:	package/python-backcall/
+F:	package/python-parso/
 F:	package/rygel/
 F:	package/safeclib/
 F:	package/tinycbor/
diff --git a/package/Config.in b/package/Config.in
index 7eb2376d57..0a7a058953 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -951,6 +951,7 @@ menu "External python modules"
 	source "package/python-paho-mqtt/Config.in"
 	source "package/python-pam/Config.in"
 	source "package/python-paramiko/Config.in"
+	source "package/python-parso/Config.in"
 	source "package/python-passlib/Config.in"
 	source "package/python-pathlib2/Config.in"
 	source "package/python-pathpy/Config.in"
diff --git a/package/python-parso/Config.in b/package/python-parso/Config.in
new file mode 100644
index 0000000000..ea1c5a4732
--- /dev/null
+++ b/package/python-parso/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PARSO
+	bool "python-parso"
+	help
+	  A Python Parser.
+
+	  https://github.com/davidhalter/parso
diff --git a/package/python-parso/python-parso.hash b/package/python-parso/python-parso.hash
new file mode 100644
index 0000000000..4a823c327d
--- /dev/null
+++ b/package/python-parso/python-parso.hash
@@ -0,0 +1,7 @@
+# md5, sha256 from https://pypi.org/pypi/parso/json
+md5	2ade6b152c194ab6a3d9bc7ef65b9266  parso-0.4.0.tar.gz
+sha256	2e9574cb12e7112a87253e14e2c380ce312060269d04bd018478a3c92ea9a376  parso-0.4.0.tar.gz
+# Locally computed sha256 checksums
+sha256	fa67973073753d17624caf8684d5ee816d70c89d912c5bca7ca0f08e7b150edb  LICENSE.txt
+sha256	9c1e620a5cf8e74fe81c1fd4c55e9cc0b189fc04e677cfc7ef915de746c3f59e  docs/_themes/flask/LICENSE
+sha256	368780dd953e09148834e8d8c6cc1b09b3d621e77dbd1c4f5e8873561acda873  test/normalizer_issue_files/LICENSE
diff --git a/package/python-parso/python-parso.mk b/package/python-parso/python-parso.mk
new file mode 100644
index 0000000000..b811d6f591
--- /dev/null
+++ b/package/python-parso/python-parso.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-parso
+#
+################################################################################
+
+PYTHON_PARSO_VERSION = 0.4.0
+PYTHON_PARSO_SOURCE = parso-$(PYTHON_PARSO_VERSION).tar.gz
+PYTHON_PARSO_SITE = https://files.pythonhosted.org/packages/79/52/70d0bb8a1f4b1475a603b4b1484bb351edda30846996fc93fe1976948fef
+PYTHON_PARSO_SETUP_TYPE = setuptools
+PYTHON_PARSO_LICENSE = MIT, Python-2.0, BSD-3-Clause (flask theme)
+PYTHON_PARSO_LICENSE_FILES = LICENSE.txt docs/_themes/flask/LICENSE test/normalizer_issue_files/LICENSE
+
+$(eval $(python-package))
