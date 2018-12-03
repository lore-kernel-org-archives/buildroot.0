From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 20:52:15 +0100
Subject: [Buildroot] [git commit] support/testing: add perl-xml-libxml test
Message-ID: <20181203194907.97775889BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a03f66f43164a3bf77736fd5d0e597e819e1c9fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/124872335]
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  1 +
 .../testing/tests/package/test_perl_xml_libxml.py  | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9b2a55ebb5..412ef49b75 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -321,6 +321,7 @@ tests.package.test_perl_gdgraph.TestPerlGDGraph: *runtime_test
 tests.package.test_perl_libwww_perl.TestPerllibwwwperl: *runtime_test
 tests.package.test_perl_mail_dkim.TestPerlMailDKIM: *runtime_test
 tests.package.test_perl_x10.TestPerlX10: *runtime_test
+tests.package.test_perl_xml_libxml.TestPerlXMLLibXML: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
 tests.package.test_python_argh.TestPythonPy2Argh: *runtime_test
diff --git a/support/testing/tests/package/test_perl_xml_libxml.py b/support/testing/tests/package/test_perl_xml_libxml.py
new file mode 100644
index 0000000000..76eacfaea1
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
