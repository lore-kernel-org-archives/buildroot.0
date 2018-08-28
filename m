From: Grzegorz Blach <grzegorz@blach.pl>
Date: Tue, 28 Aug 2018 12:16:17 +0200
Subject: [Buildroot] [PATCH 1/2] python-mimeparse: new package
Message-ID: <20180828101618.4746-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This module provides basic functions for parsing mime-type names
and matching them against a list of media-ranges.

https://github.com/dbtsai/python-mimeparse

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 DEVELOPERS                                     |  3 +++
 package/Config.in                              |  1 +
 package/python-mimeparse/Config.in             |  7 +++++++
 package/python-mimeparse/python-mimeparse.hash |  5 +++++
 package/python-mimeparse/python-mimeparse.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/python-mimeparse/Config.in
 create mode 100644 package/python-mimeparse/python-mimeparse.hash
 create mode 100644 package/python-mimeparse/python-mimeparse.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a6d76dd9c4..a9d5942adb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -850,6 +850,9 @@ F:	package/libsrtp/
 F:	package/libwebsock/
 F:	package/sofia-sip/
 
+N:	Grzegorz Blach <grzegorz@blach.pl>
+F:	package/python-mimeparse
+
 N:	Guillaume Gardet <guillaume.gardet@oliseo.fr>
 F:	package/c-icap/
 F:	package/c-icap-modules/
diff --git a/package/Config.in b/package/Config.in
index f5a17492c7..0640a399bb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -850,6 +850,7 @@ menu "External python modules"
 	source "package/python-markupsafe/Config.in"
 	source "package/python-mbstrdecoder/Config.in"
 	source "package/python-meld3/Config.in"
+	source "package/python-mimeparse/Config.in"
 	source "package/python-mistune/Config.in"
 	source "package/python-more-itertools/Config.in"
 	source "package/python-msgpack/Config.in"
diff --git a/package/python-mimeparse/Config.in b/package/python-mimeparse/Config.in
new file mode 100644
index 0000000000..2437c3665b
--- /dev/null
+++ b/package/python-mimeparse/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MIMEPARSE
+	bool "python-mimeparse"
+	help
+	  A module provides basic functions for parsing mime-type
+	  names and matching them against a list of media-ranges.
+
+	  https://github.com/dbtsai/python-mimeparse
diff --git a/package/python-mimeparse/python-mimeparse.hash b/package/python-mimeparse/python-mimeparse.hash
new file mode 100644
index 0000000000..9721c5fa0c
--- /dev/null
+++ b/package/python-mimeparse/python-mimeparse.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/python-mimeparse/json
+md5	a32ae1df93be1ddb581d1c0fa124bab4  python-mimeparse-1.6.0.tar.gz
+sha256	76e4b03d700a641fd7761d3cd4fdbbdcd787eade1ebfac43f877016328334f78  python-mimeparse-1.6.0.tar.gz
+# Locally computed sha256 checksums
+sha256	89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-mimeparse/python-mimeparse.mk b/package/python-mimeparse/python-mimeparse.mk
new file mode 100644
index 0000000000..dc796988d2
--- /dev/null
+++ b/package/python-mimeparse/python-mimeparse.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-mimeparse
+#
+################################################################################
+
+PYTHON_MIMEPARSE_VERSION = 1.6.0
+PYTHON_MIMEPARSE_SOURCE = python-mimeparse-$(PYTHON_MIMEPARSE_VERSION).tar.gz
+PYTHON_MIMEPARSE_SITE = https://files.pythonhosted.org/packages/0f/40/ac5f9e44a55b678c3cd881b4c3376e5b002677dbeab6fb3a50bac5d50d29
+PYTHON_MIMEPARSE_SETUP_TYPE = setuptools
+PYTHON_MIMEPARSE_LICENSE = MIT
+PYTHON_MIMEPARSE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.17.1
