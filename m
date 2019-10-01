From: heiko.thiery at gmail.com <heiko.thiery@gmail.com>
Date: Tue,  1 Oct 2019 16:30:16 +0200
Subject: [Buildroot] [PATCH 3/9] package/libredblack: add package
In-Reply-To: <20191001143023.698-1-heiko.thiery@gmail.com>
References: <20191001143023.698-1-heiko.thiery@gmail.com>
Message-ID: <20191001143023.698-3-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Thiery <heiko.thiery@kontron.com>

RedBlack Balanced Tree Searching and Sorting Library.

https://github.com/sysrepo/libredblack

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
---
 DEVELOPERS                           |  3 +++
 package/Config.in                    |  1 +
 package/libredblack/Config.in        |  4 ++++
 package/libredblack/libredblack.hash |  2 ++
 package/libredblack/libredblack.mk   | 16 ++++++++++++++++
 5 files changed, 26 insertions(+)
 create mode 100644 package/libredblack/Config.in
 create mode 100644 package/libredblack/libredblack.hash
 create mode 100644 package/libredblack/libredblack.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ac73c7daa5..a25fbb7a0d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1036,6 +1036,9 @@ F:	package/python-markdown/
 F:	package/python-remi/
 F:	package/python-sip/
 
+N:	Heiko Thiery <heiko.thiery@gmail.com>
+F:	package/libredblack/
+
 N:	Henrique Camargo <henrique@henriquecamargo.com>
 F:	package/json-glib/
 
diff --git a/package/Config.in b/package/Config.in
index 4d8fce21c0..abea9e2428 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1745,6 +1745,7 @@ menu "Other"
 	source "package/libpthread-stubs/Config.in"
 	source "package/libpthsem/Config.in"
 	source "package/libpwquality/Config.in"
+	source "package/libredblack/Config.in"
 	source "package/libseccomp/Config.in"
 	source "package/libsigc/Config.in"
 	source "package/libsigsegv/Config.in"
diff --git a/package/libredblack/Config.in b/package/libredblack/Config.in
new file mode 100644
index 0000000000..b18a9aecfc
--- /dev/null
+++ b/package/libredblack/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_LIBREDBLACK
+	bool "libredblack - red-black balanced tree algorithm"
+	help
+	  RedBlack Balanced Tree Searching and Sorting Library.
diff --git a/package/libredblack/libredblack.hash b/package/libredblack/libredblack.hash
new file mode 100644
index 0000000000..c5e6d04992
--- /dev/null
+++ b/package/libredblack/libredblack.hash
@@ -0,0 +1,2 @@
+sha256 85833e1549450e8cb06c0a94c3607d82ab2d46791acd14a5c6d35b4259ade853  libredblack-a399310d99b61eec4d3c0677573ab5dddcf9395d.tar.gz
+sha256 ede9298547948ae66509e61d6e2d41ff2a8b511578644fb7ec970239fbca07b4  COPYING
diff --git a/package/libredblack/libredblack.mk b/package/libredblack/libredblack.mk
new file mode 100644
index 0000000000..78d65c7e2b
--- /dev/null
+++ b/package/libredblack/libredblack.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libredblack
+#
+################################################################################
+
+LIBREDBLACK_VERSION = a399310d99b61eec4d3c0677573ab5dddcf9395d
+LIBREDBLACK_SITE = $(call github,sysrepo,libredblack,$(LIBREDBLACK_VERSION))
+LIBREDBLACK_LICENSE = LGPL-2.1
+LIBREDBLACK_LICENSE_FILES = COPYING
+LIBREDBLACK_INSTALL_STAGING = YES
+LIBREDBLACK_CONF_OPTS = --with-rbgen=no
+HOST_LIBREDBLACK_CONF_OPTS = --with-rbgen=no --without-python
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.20.1
