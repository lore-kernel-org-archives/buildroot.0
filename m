From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Thu, 12 Dec 2019 13:41:43 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/python-avro: new package
In-Reply-To: <20191212124143.220947-1-titouan.christophe@railnova.eu>
References: <20191212124143.220947-1-titouan.christophe@railnova.eu>
Message-ID: <20191212124143.220947-3-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/python-avro/Config.in        | 18 ++++++++++++++++++
 package/python-avro/python-avro.hash |  6 ++++++
 package/python-avro/python-avro.mk   | 14 ++++++++++++++
 5 files changed, 40 insertions(+)
 create mode 100644 package/python-avro/Config.in
 create mode 100644 package/python-avro/python-avro.hash
 create mode 100644 package/python-avro/python-avro.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 639bd21904..ea2ab2f645 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2401,6 +2401,7 @@ F:	package/fbgrab/
 N:	Titouan Christophe <titouan.christophe@railnova.eu>
 F:	package/avro-c/
 F:	package/mosquitto/
+F:	package/python-avro/
 F:	package/redis/
 
 N:	Trent Piepho <tpiepho@impinj.com>
diff --git a/package/Config.in b/package/Config.in
index 29eaf043cd..4df31645b3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -845,6 +845,7 @@ menu "External python modules"
 	source "package/python-attrs/Config.in"
 	source "package/python-autobahn/Config.in"
 	source "package/python-automat/Config.in"
+	source "package/python-avro/Config.in"
 	source "package/python-babel/Config.in"
 	source "package/python-backcall/Config.in"
 	source "package/python-backports-abc/Config.in"
diff --git a/package/python-avro/Config.in b/package/python-avro/Config.in
new file mode 100644
index 0000000000..90a921eb3f
--- /dev/null
+++ b/package/python-avro/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_PYTHON_AVRO
+	bool "python-avro"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Select this option to install the Avro Python3 language
+	  bindings, and the `avro` command line tool
+
+	  Apache Avro is a data serialization system.
+	  Avro provides:
+	  - Rich data structures.
+	  - A compact, fast, binary data format.
+	  - A container file, to store persistent data.
+	  - Remote procedure call (RPC).
+	  - Simple integration with dynamic languages.
+	  - Code generation is not required to read or write data
+	    files nor to use or implement RPC protocols.
+	  - Code generation as an optional optimization,
+	    only worth implementing for statically typed languages.
diff --git a/package/python-avro/python-avro.hash b/package/python-avro/python-avro.hash
new file mode 100644
index 0000000000..90ed9f2241
--- /dev/null
+++ b/package/python-avro/python-avro.hash
@@ -0,0 +1,6 @@
+# From https://www-eu.apache.org/dist/avro/avro-1.9.1/py3/avro-python3-1.9.1.tar.gz.sha512
+sha512 771ce6e5ca6315f5b9108cb4f5dd9488575cc3433ffdd744f96ce7989763728259c89475319fd9c411ed6b65c996b762548c50a697eb1fba9ab024112ca17daa  avro-python3-1.9.1.tar.gz
+
+# License files
+sha256 c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  avro/LICENSE
+sha256 984731deb198a9bb13b74feb165cb84c24b868602164de40df47451a17085afa  avro/NOTICE
diff --git a/package/python-avro/python-avro.mk b/package/python-avro/python-avro.mk
new file mode 100644
index 0000000000..08a25f0c84
--- /dev/null
+++ b/package/python-avro/python-avro.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-avro
+#
+################################################################################
+
+PYTHON_AVRO_VERSION = 1.9.1
+PYTHON_AVRO_SITE = https://www-eu.apache.org/dist/avro/avro-1.9.1/py3
+PYTHON_AVRO_SOURCE = avro-python3-$(PYTHON_AVRO_VERSION).tar.gz
+PYTHON_AVRO_LICENSE = Apache-2.0
+PYTHON_AVRO_LICENSE_FILES = avro/LICENSE avro/NOTICE
+PYTHON_AVRO_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.23.0
