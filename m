From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  7 Oct 2014 00:26:11 +0200
Subject: [Buildroot] [PATCH 1/4 v3] package/python-lxml: new package
In-Reply-To: <cover.1412633983.git.yann.morin.1998@free.fr>
References: <cover.1412633983.git.yann.morin.1998@free.fr>
Message-ID: <084657bae1bc1fa7d9c89f4bbd92fe327d7c7d9b.1412633983.git.yann.morin.1998@free.fr>
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
 package/python-lxml/python-lxml.mk | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/python-lxml/python-lxml.mk

diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
new file mode 100644
index 0000000..1880334
--- /dev/null
+++ b/package/python-lxml/python-lxml.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# python-lxml
+#
+################################################################################
+
+PYTHON_LXML_VERSION = 3.4.0
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
