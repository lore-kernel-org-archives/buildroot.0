From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 10 Feb 2015 21:01:08 +0100
Subject: [Buildroot] [PATCH 01/10 v7] package/python-lxml: new host package
In-Reply-To: <cover.1423597914.git.yann.morin.1998@free.fr>
References: <cover.1423597914.git.yann.morin.1998@free.fr>
Message-ID: <aa80610ff6598a27c87a6058eb44fa827f467b29.1423597914.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The lxml XML toolkit is a Pythonic binding for the C libraries libxml2
and libxslt.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
This is a host-only package for now, because I only needed it to build
opengl-registry.
---
 package/python-lxml/python-lxml.hash |  2 ++
 package/python-lxml/python-lxml.mk   | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 package/python-lxml/python-lxml.hash
 create mode 100644 package/python-lxml/python-lxml.mk

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
new file mode 100644
index 0000000..470a245
--- /dev/null
+++ b/package/python-lxml/python-lxml.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  069594837d0376a1bacf5cc42aa9a1be2e1c1396dc62f7d07f7358afecd34adf  lxml-3.4.1.tgz
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
new file mode 100644
index 0000000..758ce87
--- /dev/null
+++ b/package/python-lxml/python-lxml.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# python-lxml
+#
+################################################################################
+
+PYTHON_LXML_VERSION = 3.4.1
+PYTHON_LXML_SITE = http://lxml.de/files
+PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tgz
+
+# Not including the GPL, because it is used only for the test scripts.
+PYTHON_LXML_LICENSE = BSD-3c, Others
+PYTHON_LXML_LICENSE_FILES = \
+	LICENSES.txt \
+	doc/licenses/BSD.txt \
+	doc/licenses/elementtree.txt \
+	src/lxml/isoschematron/resources/rng/iso-schematron.rng
+
+# python-lxml can use either setuptools, or distutils as a fallback.
+# So, we use setuptools.
+PYTHON_LXML_SETUP_TYPE = setuptools
+
+PYTHON_LXML_DEPENDENCIES = libxml2 libxslt
+
+$(eval $(host-python-package))
-- 
1.9.1
