From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Thu,  2 May 2019 10:20:09 +0200
Subject: [Buildroot] [PATCH 6/7] package/python-traittypes: new package
In-Reply-To: <1556785210-18237-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1556785210-18237-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <1556785210-18237-7-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bcc requires this package which is used to add
custom trait types for scientific computing.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 package/Config.in                                |  1 +
 package/python-traittypes/Config.in              |  7 +++++++
 package/python-traittypes/python-traittypes.hash |  5 +++++
 package/python-traittypes/python-traittypes.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-traittypes/Config.in
 create mode 100644 package/python-traittypes/python-traittypes.hash
 create mode 100644 package/python-traittypes/python-traittypes.mk

diff --git a/package/Config.in b/package/Config.in
index 60986e6..8d16a09 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1074,6 +1074,7 @@ menu "External python modules"
 	source "package/python-toml/Config.in"
 	source "package/python-tornado/Config.in"
 	source "package/python-traitlets/Config.in"
+	source "package/python-traittypes/Config.in"
 	source "package/python-treq/Config.in"
 	source "package/python-twisted/Config.in"
 	source "package/python-txaio/Config.in"
diff --git a/package/python-traittypes/Config.in b/package/python-traittypes/Config.in
new file mode 100644
index 0000000..5eb6d07
--- /dev/null
+++ b/package/python-traittypes/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_TRAITTYPES
+	bool "python-traittypes"
+	select BR2_PACKAGE_PYTHON_TRAITLETS
+	help
+	  Custom trait types for scientific computing.
+
+	  https://pypi.org/project/traittypes/
diff --git a/package/python-traittypes/python-traittypes.hash b/package/python-traittypes/python-traittypes.hash
new file mode 100644
index 0000000..a94b256
--- /dev/null
+++ b/package/python-traittypes/python-traittypes.hash
@@ -0,0 +1,5 @@
+# sha256 from https://pypi.org/project/traittypes/#files
+sha256	be6fa26294733e7489822ded4ae25da5b4824a8a7a0e0c2dccfde596e3489bd6 traittypes-0.2.1.tar.gz
+
+# Locally calculated
+sha256	221976dfad5db283a2669efe8607e24c9c9aecca8453d6beba045e665c2f88a1 LICENSE
diff --git a/package/python-traittypes/python-traittypes.mk b/package/python-traittypes/python-traittypes.mk
new file mode 100644
index 0000000..9e4eb47
--- /dev/null
+++ b/package/python-traittypes/python-traittypes.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-traittypes
+#
+################################################################################
+
+PYTHON_TRAITTYPES_VERSION = 0.2.1
+PYTHON_TRAITTYPES_SOURCE = traittypes-$(PYTHON_TRAITTYPES_VERSION).tar.gz
+PYTHON_TRAITTYPES_SITE = https://files.pythonhosted.org/packages/8a/71/0578e44d2110f93c2136eb705f5b11e706e1e8ea3acaaaeac043bd40d8fd
+PYTHON_TRAITTYPES_LICENSE = BSD-like
+PYTHON_TRAITTYPES_LICENSE_FILES = LICENSE
+PYTHON_TRAITTYPES_SETUP_TYPE = distutils
+
+$(eval $(python-package))
-- 
2.7.4
