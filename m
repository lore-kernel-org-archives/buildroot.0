From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 23 Nov 2018 05:31:10 +0100
Subject: [Buildroot] [PATCH/next v2 8/8] support/testing: add
 perl-xml-libxml test
In-Reply-To: <20181123043110.5353-1-francois.perrad@gadz.org>
References: <20181123043110.5353-1-francois.perrad@gadz.org>
Message-ID: <20181123043110.5353-9-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                                |  1 +
 .../tests/package/test_perl_xml_libxml.py     | 22 +++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 support/testing/tests/package/test_perl_xml_libxml.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index af643fa10..8ca50f045 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -318,6 +318,7 @@ tests.package.test_perl_gdgraph.TestPerlGDGraph: *runtime_test
 tests.package.test_perl_libwww_perl.TestPerllibwwwperl: *runtime_test
 tests.package.test_perl_mail_dkim.TestPerlMailDKIM: *runtime_test
 tests.package.test_perl_x10.TestPerlX10: *runtime_test
+tests.package.test_perl_xml_libxml.TestPerlXMLLibXML: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
 tests.package.test_python_autobahn.TestPythonPy2Autobahn: *runtime_test
diff --git a/support/testing/tests/package/test_perl_xml_libxml.py b/support/testing/tests/package/test_perl_xml_libxml.py
new file mode 100644
index 000000000..76eacfaea
--- /dev/null
+++ b/support/testing/tests/package/test_perl_xml_libxml.py
@@ -0,0 +1,22 @@
+from tests.package.test_perl import TestPerlBase
+
+
+class TestPerlXMLLibXML(TestPerlBase):
+    """
+    package:
+        XML-LibXML
+    direct dependencies:
+        XML-NamespaceSupport
+        XML-SAX
+        XML-SAX-Base
+    """
+
+    config = TestPerlBase.config + \
+        """
+        BR2_PACKAGE_PERL=y
+        BR2_PACKAGE_PERL_XML_LIBXML=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("XML::LibXML")
-- 
2.17.1
