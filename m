From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Jan 2020 09:29:45 +0100
Subject: [Buildroot] [git commit] package/python-nested-dict: new package
Message-ID: <20200108082016.1163783BA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a084d7e2840e7cd1d63751211a79553edd54913
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python dictionary with automatic and arbitrary levels of nestedness.

Signed-off-by: Adam Duskett <aduskett@greenlots.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-nested-dict/Config.in               |  7 +++++++
 package/python-nested-dict/python-nested-dict.hash |  5 +++++
 package/python-nested-dict/python-nested-dict.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 00c4cdc1a9..5652fc3555 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -65,6 +65,7 @@ F:	package/python-flask-sqlalchemy/
 F:	package/python-gitdb2/
 F:	package/python-lockfile/
 F:	package/python-mutagen/
+F:	package/python-nested-dict/
 F:	package/python-pbr/
 F:	package/python-pip/
 F:	package/python-psycopg2/
diff --git a/package/Config.in b/package/Config.in
index 3a75561151..62faf42845 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1009,6 +1009,7 @@ menu "External python modules"
 	source "package/python-mwclient/Config.in"
 	source "package/python-mwscrape/Config.in"
 	source "package/python-mwscrape2slob/Config.in"
+	source "package/python-nested-dict/Config.in"
 	source "package/python-netaddr/Config.in"
 	source "package/python-netifaces/Config.in"
 	source "package/python-networkmanager/Config.in"
diff --git a/package/python-nested-dict/Config.in b/package/python-nested-dict/Config.in
new file mode 100644
index 0000000000..dc453fff77
--- /dev/null
+++ b/package/python-nested-dict/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_NESTED_DICT
+	bool "python-nested-dict"
+	help
+	  Python dictionary with automatic and arbitrary levels of
+	  nestedness.
+
+	  http://pypi.python.org/pypi/nested_dict
diff --git a/package/python-nested-dict/python-nested-dict.hash b/package/python-nested-dict/python-nested-dict.hash
new file mode 100644
index 0000000000..15f0ed8b5f
--- /dev/null
+++ b/package/python-nested-dict/python-nested-dict.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/nested-dict/json
+md5	e08e2e8de6d002f9ddda4eea5a4528c2  nested_dict-1.61.tar.gz
+sha256	de0fb5bac82ba7bcc23736f09373f18628ea57f92bbaa13480d23f261c41e771  nested_dict-1.61.tar.gz
+# Locally computed sha256 checksums
+sha256	c84eb6b667b91fd9b8991f500c168354eb51af5b2dd970d8ee51ce336d9aeed1  LICENSE.TXT
diff --git a/package/python-nested-dict/python-nested-dict.mk b/package/python-nested-dict/python-nested-dict.mk
new file mode 100644
index 0000000000..1a5b180e10
--- /dev/null
+++ b/package/python-nested-dict/python-nested-dict.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-nested-dict
+#
+################################################################################
+
+PYTHON_NESTED_DICT_VERSION = 1.61
+PYTHON_NESTED_DICT_SOURCE = nested_dict-$(PYTHON_NESTED_DICT_VERSION).tar.gz
+PYTHON_NESTED_DICT_SITE = https://files.pythonhosted.org/packages/42/d0/3b27fa65b16a2e44d793af59929fcdb3bb84b4664462ff2830105dfd9b7d
+PYTHON_NESTED_DICT_SETUP_TYPE = setuptools
+PYTHON_NESTED_DICT_LICENSE = MIT
+PYTHON_NESTED_DICT_LICENSE_FILES = LICENSE.TXT
+
+$(eval $(python-package))
