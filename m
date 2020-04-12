From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 21:39:45 +0200
Subject: [Buildroot] [git commit] package/python-argon2-cffi: new package
Message-ID: <20200412193024.132118E80C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fab123422e45445231037583fdd791ba9a40a819
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The secure Argon2 password hashing algorithm.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-argon2-cffi/Config.in               |  9 +++++++++
 package/python-argon2-cffi/python-argon2-cffi.hash |  5 +++++
 package/python-argon2-cffi/python-argon2-cffi.mk   | 15 +++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index aae94314cf..c17d92ed4b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1189,6 +1189,7 @@ F:	package/python-aiojobs/
 F:	package/python-aiorwlock/
 F:	package/python-aiosignal/
 F:	package/python-aiozipkin/
+F:	package/python-argon2-cffi/
 F:	package/python-async-lru/
 F:	package/python-async-timeout/
 F:	package/python-brotli/
diff --git a/package/Config.in b/package/Config.in
index f7d70a1afd..7c9575c8b7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -868,6 +868,7 @@ menu "External python modules"
 	source "package/python-aiozipkin/Config.in"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-argh/Config.in"
+	source "package/python-argon2-cffi/Config.in"
 	source "package/python-arrow/Config.in"
 	source "package/python-asgiref/Config.in"
 	source "package/python-asn1crypto/Config.in"
diff --git a/package/python-argon2-cffi/Config.in b/package/python-argon2-cffi/Config.in
new file mode 100644
index 0000000000..c1adcbc77d
--- /dev/null
+++ b/package/python-argon2-cffi/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_ARGON2_CFFI
+	bool "python-argon2-cffi"
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  The secure Argon2 password hashing algorithm.
+
+	  https://argon2-cffi.readthedocs.io/
diff --git a/package/python-argon2-cffi/python-argon2-cffi.hash b/package/python-argon2-cffi/python-argon2-cffi.hash
new file mode 100644
index 0000000000..631c85ac7f
--- /dev/null
+++ b/package/python-argon2-cffi/python-argon2-cffi.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/argon2_cffi/json
+md5	3fb9154af6f7a113028a7a8bc7da715d  argon2-cffi-19.2.0.tar.gz
+sha256	ffaa623eea77b497ffbdd1a51e941b33d3bf552c60f14dbee274c4070677bda3  argon2-cffi-19.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256	bf659a28b49240602f56bbdf490cbe2ec509b15b98f99d7b19a52c740e327863  LICENSE
diff --git a/package/python-argon2-cffi/python-argon2-cffi.mk b/package/python-argon2-cffi/python-argon2-cffi.mk
new file mode 100644
index 0000000000..099574e9c3
--- /dev/null
+++ b/package/python-argon2-cffi/python-argon2-cffi.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-argon2-cffi
+#
+################################################################################
+
+PYTHON_ARGON2_CFFI_VERSION = 19.2.0
+PYTHON_ARGON2_CFFI_SOURCE = argon2-cffi-$(PYTHON_ARGON2_CFFI_VERSION).tar.gz
+PYTHON_ARGON2_CFFI_SITE = https://files.pythonhosted.org/packages/e4/96/f1bf2369f29794971f836b8eff5e3bdb653043f1b61d104eae21b1de3ccb
+PYTHON_ARGON2_CFFI_SETUP_TYPE = setuptools
+PYTHON_ARGON2_CFFI_LICENSE = MIT
+PYTHON_ARGON2_CFFI_LICENSE_FILES = LICENSE
+PYTHON_ARGON2_CFFI_DEPENDENCIES = host-python-cffi
+
+$(eval $(python-package))
